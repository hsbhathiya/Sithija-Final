package org.sithija.google.drive.operations;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.auth.DrEditServlet;
import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Profile;

import com.googlecode.objectify.Key;

public class AddUserServlet extends DrEditServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6943628437785623929L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String username = req.getParameter("username");
		String email = req.getParameter("email");		
		
		Profile adminProfile = new Profile(email, username, username);
		Company newCompany = new Company(username);
		newCompany.setManagerProfile(Key.create(adminProfile));
		
		req.getSession().setAttribute("newCompany", newCompany);	
		req.getSession().setAttribute("adminProfile", adminProfile);		
		
		loginIfRequired(req, resp);
	}
}
