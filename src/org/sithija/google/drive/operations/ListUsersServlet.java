package org.sithija.google.drive.operations;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.ProfileApi;

public class ListUsersServlet extends HttpServlet {

	private static final long serialVersionUID = 6943628437785623929L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			resp.setContentType("application/json");

			String companyName = req.getParameter("companyName");
			List<Profile> users = ProfileApi
					.getProfilesByCompanyName(companyName);

			StringBuilder output = new StringBuilder();
			output.append("[");
			for (Profile p : users) {
				ProfileApi.appendAsJson(p, output);
				output.append(",");
			}
			if (users.size() == 0) {
				output.append("]");
			} else {
				output.setCharAt(output.length() - 1, ']');
			}

			resp.getWriter().write(output.toString());
		} catch (Exception e) {
			resp.getWriter().write(
					"{\"status\":\"error\",\"message\":\"" + e.getMessage()
							+ "\"}");
		}
	}
}