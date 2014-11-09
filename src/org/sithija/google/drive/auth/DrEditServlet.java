package org.sithija.google.drive.auth;

import static org.sithija.google.drive.datastore.service.OfyService.factory;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Document;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.CompanyApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.server.spi.response.UnauthorizedException;
import com.google.api.services.drive.Drive;
import com.google.api.services.oauth2.Oauth2;
import com.google.api.services.oauth2.model.Userinfoplus;
import com.google.gson.Gson;

/**
 * Abstract servlet that sets up credentials and provides some convenience
 * methods.
 * 
 * @author vicfryzel@google.com (Vic Fryzel)
 * @author jbd@google.com (Burcu Dogan)
 */
@SuppressWarnings("serial")
public abstract class DrEditServlet extends HttpServlet {
	static {
        factory().register(Profile.class);
        factory().register(Document.class);    
        factory().register(Company.class);
    }
	
	/**
	 * Default transportation layer for Google Apis Java client.
	 */
	protected static final HttpTransport TRANSPORT = new NetHttpTransport();
	/**
	 * Default JSON factory for Google Apis Java client.
	 */
	protected static final JsonFactory JSON_FACTORY = new JacksonFactory();
	/**
	 * Key to get/set userId from and to the session.
	 */
	public static final String KEY_SESSION_USERID = "user_id";
	/**
	 * Default MIME type of files created or handled by DrEdit. This is also set
	 * in the Google APIs Console under the Drive SDK tab.
	 */
	public static final String DEFAULT_MIMETYPE = "text/plain";
	/**
	 * Path component under war/ to locate client_secrets.json file.
	 */
	public static final String CLIENT_SECRETS_FILE_PATH = "/WEB-INF/client_secrets.json";
	/**
	 * A credential manager to get, set, delete credential objects.
	 */
	private CredentialManager credentialManager = null;

	/**
	 * Initializes the Servlet.
	 */
	@Override
	public void init() throws ServletException {
		super.init();
		// init credential manager
		credentialManager = new CredentialManager(getClientSecrets(),
				TRANSPORT, JSON_FACTORY);
	}

	/**
	 * Dumps the given object as JSON and responds with given HTTP status code.
	 * 
	 * @param resp
	 *            Response object.
	 * @param code
	 *            HTTP status code to respond with.
	 * @param obj
	 *            An object to be dumped as JSON.
	 */
	protected void sendJson(HttpServletResponse resp, int code, Object obj) {
		try {
			// TODO(burcud): Initialize Gson instance for once.
			resp.setContentType("application/json");
			resp.getWriter().print(new Gson().toJson(obj).toString());
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Dumps the given object to JSON and responds with HTTP 200.
	 * 
	 * @param resp
	 *            Response object.
	 * @param obj
	 *            An object to be dumped as JSON.
	 */
	protected void sendJson(HttpServletResponse resp, Object obj) {
		sendJson(resp, 200, obj);
	}

	/**
	 * Responds with the given HTTP status code and message.
	 * 
	 * @param resp
	 *            Response object.
	 * @param code
	 *            HTTP status code to respond with.
	 * @param message
	 *            Message body.
	 */
	protected void sendError(HttpServletResponse resp, int code, String message) {
		try {
			resp.sendError(code, message);
		} catch (IOException e) {
			throw new RuntimeException(message);
		}
	}

	/**
	 * Transforms a GoogleJsonResponseException to an HTTP response.
	 * 
	 * @param resp
	 *            Response object.
	 * @param e
	 *            Exception object to transform.
	 */
	protected void sendGoogleJsonResponseError(HttpServletResponse resp,
			GoogleJsonResponseException e) {
		sendError(resp, e.getStatusCode(), e.getLocalizedMessage());
	}

	/**
	 * Redirects to OAuth2 consent page if user is not logged in.
	 * 
	 * @param req
	 *            Request object.
	 * @param resp
	 *            Response object.
	 */
	protected void loginIfRequired(HttpServletRequest req,
			HttpServletResponse resp) {
		Credential credential = getCredential(req, resp);
		if (credential == null) {
			// redirect to authorization url
			try {
				resp.sendRedirect(credentialManager.getAuthorizationUrl());
			} catch (IOException e) {
				throw new RuntimeException("Can't redirect to auth page");
			}
		}
	}

	/**
	 * If OAuth2 redirect callback is invoked and there is a code query param,
	 * retrieve user credentials and profile. Then, redirect to the home page.
	 * 
	 * @param req
	 *            Request object.
	 * @param resp
	 *            Response object.
	 * @throws IOException
	 */
	protected void handleCallbackIfRequired(HttpServletRequest req,
			HttpServletResponse resp) throws IOException {
		String code = req.getParameter("code");
		if (code != null) {
			// retrieve new credentials with code
			Credential credential = credentialManager.retrieve(code);
			// request userinfo
			Oauth2 service = getOauth2Service(credential);
			try {
				Userinfoplus about = service.userinfo().get().execute();
				String email= about.getEmail();
				req.getSession().setAttribute(KEY_SESSION_USERID, about.getId());
			//	List<Profile> profiles = ProfileApi.getProfilesByEmail(email);//User should be prompted to select 
			//	if(!profiles.isEmpty()){
					Profile profile = ProfileApi.getProfile(email, "WSO2");
					Company company = CompanyApi.getComapany(profile.getCompany());
					credentialManager.save(company, credential);					
					req.getSession().setAttribute("profileId", profile.getProfileId());
					req.getSession().setAttribute("company", company);
					resp.sendRedirect("/about");					
			//	}
			} catch (IOException e) {
				throw new RuntimeException("Can't handle the OAuth2 callback, "
						+ "make sure that code is valid.");
			}
			resp.sendRedirect("/public/index");
		}
	}

	/**
	 * Returns the credentials of the user in the session. If user is not in the
	 * session, returns null.
	 * 
	 * @param req
	 *            Request object.
	 * @param resp
	 *            Response object.
	 * @return Credential object of the user in session or null.
	 */
	protected Credential getCredential(HttpServletRequest req,
			HttpServletResponse resp) {
		Company company = (Company) req.getSession().getAttribute(
				"company");
		if (company != null) {
			return credentialManager.get(company);
		}
		return null;
	}

	/**
	 * Deletes the credentials of the user in the session permanently and
	 * removes the user from the session.
	 * 
	 * @param req
	 *            Request object.
	 * @param resp
	 *            Response object.
	 */
	protected void deleteCredential(HttpServletRequest req,
			HttpServletResponse resp) {
		Company company = (Company) req.getSession().getAttribute(
				"company");
		if (company != null) {
			credentialManager.delete(company);
			req.getSession().removeAttribute("company");
		}
	}

	/**
	 * Build and return a Drive service object based on given request
	 * parameters.
	 * 
	 * @param credential
	 *            User credentials.
	 * @return Drive service object that is ready to make requests, or null if
	 *         there was a problem.
	 */
	protected Drive getDriveService(Credential credential) {
		return new Drive.Builder(TRANSPORT, JSON_FACTORY, credential).build();
	}

	/**
	 * Build and return an Oauth2 service object based on given request
	 * parameters.
	 * 
	 * @param credential
	 *            User credentials.
	 * @return Drive service object that is ready to make requests, or null if
	 *         there was a problem.
	 */
	protected Oauth2 getOauth2Service(Credential credential) {
		return new Oauth2.Builder(TRANSPORT, JSON_FACTORY, credential).build();
	}

	/**
	 * Reads client_secrets.json and creates a GoogleClientSecrets object.
	 * 
	 * @return A GoogleClientsSecrets object.
	 */
	private GoogleClientSecrets getClientSecrets() {
		// TODO: do not read on each request
		InputStream stream = getServletContext().getResourceAsStream(
				CLIENT_SECRETS_FILE_PATH);
		try {
			return GoogleClientSecrets.load(JSON_FACTORY,
					new InputStreamReader(stream));
		} catch (IOException e) {
			throw new RuntimeException("No client_secrets.json found");
		}
	}
}