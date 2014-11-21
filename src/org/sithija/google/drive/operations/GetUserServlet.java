package org.sithija.google.drive.operations;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.ProfileApi;

public class GetUserServlet extends HttpServlet {

	private static final long serialVersionUID = 6943628437785623929L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			resp.setContentType("application/json");
			
			String companyName = req.getParameter("companyName");
			String email = req.getParameter("email");

			Profile profile = ProfileApi.getProfile(email, companyName);
			if (profile != null) {
				StringBuilder output = new StringBuilder();
				ProfileApi.appendAsJson(profile, output);
				resp.getWriter().write(output.toString());
			} else {
				resp.getWriter().write(
						"{\"status\":\"error\",\"message\":\"No user found\"}");
			}
		} catch (Exception e) {
			resp.getWriter().write(
					"{\"status\":\"error\",\"message\":\"" + e.getMessage()
							+ "\"}");
		}
	}
}