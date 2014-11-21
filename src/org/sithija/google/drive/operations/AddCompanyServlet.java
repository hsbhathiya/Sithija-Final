package org.sithija.google.drive.operations;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.auth.DrEditServlet;
import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.CompanyApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.googlecode.objectify.Key;

public class AddCompanyServlet extends DrEditServlet {

	private static final long serialVersionUID = 6943628437785623929L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		try {
			resp.setContentType("application/json");
			
			String company = req.getParameter("companyName");
			String name = req.getParameter("name");
			String email = req.getParameter("emailAddress");

			Profile employee = new Profile(email, name, company);
			Company targetCompany = CompanyApi.getCompany(company);
			targetCompany.addEmployee(Key.create(employee));

			ProfileApi.saveProfile(employee);
			CompanyApi.saveCompany(targetCompany);
			resp.getWriter().write("{\"status\":\"success\"}");
		} catch (Exception e) {
			resp.getWriter().write(
					"{\"status\":\"error\",\"message\":\"" + e.getMessage()
							+ "\"}");
		}
	}
}
