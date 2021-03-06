package org.sithija.google.drive.auth;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Company;

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.About;
import com.google.api.services.drive.model.File;

/**
 * Servlet that simply return the JSON of Drive's user About feed.
 */
@SuppressWarnings("serial")
public class AboutServlet extends DrEditServlet {
	/**
	 * Returns a JSON representation of Drive's user's About feed.
	 */
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		Company company = (Company) req.getSession().getAttribute("company");
		// req.getSession().setAttribute("company", company);

		if (company != null) {
			Drive service = getDriveService(getCredential(req, resp));
			if (service != null) {
				About about = service.about().get().execute();
				resp.setContentType("text/html");
				resp.getWriter().println(about.getName());
				service.files()
						.insert(new File().setDescription("abc").setTitle(
								about.getName())).execute();
			}
			/*
			 * try { About about = service.about().get().execute();
			 * sendJson(resp, about); } catch (GoogleJsonResponseException e) {
			 * if (e.getStatusCode() == 401) { // The user has revoked our token
			 * or it is otherwise bad. // Delete the local copy so that their
			 * next page load will // recover. deleteCredential(req, resp);
			 * sendGoogleJsonResponseError(resp, e); } }
			 */
		}
	}
}