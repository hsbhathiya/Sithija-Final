package org.sithija.google.drive.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Profile;

import com.googlecode.objectify.Key;

public class CompanyRegistrationServlet extends DrEditServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String companyName = req.getParameter("companyName");
		String admin = req.getParameter("admin");
		String email = req.getParameter("email");		
		
		Profile adminProfile = new Profile(email, admin,companyName);
		Company newCompany = new Company(companyName);
		newCompany.setManagerProfile(Key.create(adminProfile));
		
		req.getSession().setAttribute("newCompany", newCompany);	
		req.getSession().setAttribute("adminProfile", adminProfile);		
		
		loginIfRequired(req, resp);
		resp.sendRedirect("/auth");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		handleCallbackIfRequired(req, resp);
		resp.sendRedirect("/auth");
	}
}
