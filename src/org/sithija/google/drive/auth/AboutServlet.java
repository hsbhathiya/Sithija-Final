package org.sithija.google.drive.auth;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.operations.CompanyApi;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.About;

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
		Drive service = getDriveService(getCredential(req, resp));
		try {
			About about = service.about().get().execute();
			sendJson(resp, about);
		} catch (GoogleJsonResponseException e) {
			if (e.getStatusCode() == 401) {
				// The user has revoked our token or it is otherwise bad.
				// Delete the local copy so that their next page load will
				// recover.
				deleteCredential(req, resp);
				sendGoogleJsonResponseError(resp, e);
			}
		}
	}
}