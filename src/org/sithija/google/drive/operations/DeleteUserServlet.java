package org.sithija.google.drive.operations;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.ProfileApi;

public class DeleteUserServlet extends HttpServlet {

	private static final long serialVersionUID = 6943628437785623929L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			resp.setContentType("application/json");
			
			String id = req.getParameter("profileId");
			Profile profile = ProfileApi.getProfile(id);
			ProfileApi.deleteProfile(profile);
			
			resp.getWriter().write("{\"status\":\"success\"}");
		} catch (Exception e) {
			resp.getWriter().write(
					"{\"status\":\"error\",\"message\":\"" + e.getMessage()
							+ "\"}");
		}
	}
}
