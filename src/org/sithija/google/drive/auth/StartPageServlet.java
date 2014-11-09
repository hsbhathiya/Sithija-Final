package org.sithija.google.drive.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.auth.model.State;

/**
 * Servlet to check that the current user is authorized and to serve the start
 * page for DrEdit.
 * 
 * @author vicfryzel@google.com (Vic Fryzel)
 * @author nivco@google.com (Nicolas Garnier)
 * @author jbd@google.com (Burcu Dogan)
 */
@SuppressWarnings("serial")
public class StartPageServlet extends DrEditServlet {
	/**
	 * Ensure that the user is authorized, and setup the required values for
	 * index.jsp.
	 */
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		// handle OAuth2 callback
		handleCallbackIfRequired(req, resp);
		// Making sure that we have user credentials
		loginIfRequired(req, resp);
		// Deserialize the state in order to specify some values to the DrEdit
		// JavaScript client below.
		String stateParam = req.getParameter("state");
		if (stateParam != null) {
			State state = new State(stateParam);
			if (state.ids != null && state.ids.size() > 0) {
				resp.sendRedirect("/#/edit/" + state.ids.toArray()[0]);
				return;
			} else if (state.folderId != null) {
				resp.sendRedirect("/#/create/" + state.folderId);
				return;
			}
		}
		req.getRequestDispatcher("/public/index.html").forward(req, resp);
	}
}
