package org.sithija.google.drive;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.operations.CompanyApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class AdminAuthServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String email = (String) req.getSession().getAttribute("email"); 

		Company company;
		company = CompanyApi.getCompanyByEmail(email);
		if(company == null) {
			resp.sendRedirect("/admin/adminlogin.jsp");
			return;
		}
		
		req.getSession().setAttribute("company", company);
		req.getSession().setAttribute("admin", ProfileApi.getProfileByKey(company.getManagerProfile()));
		resp.sendRedirect("/admin/index.jsp");
	}
	
	/*
	 * forces a user (supposedly admin) to repeat login (to verify account ownership)
	 */
	public void reloginIfRequired(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		if (user != null) {	// logout and login
			resp.sendRedirect(userService.createLogoutURL(userService.createLoginURL("/adminauth")));
		}
		else {				// login
			resp.sendRedirect(userService.createLoginURL("/adminauth"));
			user = userService.getCurrentUser();
		}
		req.getSession().setAttribute("user", user);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		String email = req.getParameter("email"); 
		String password = req.getParameter("password");

		req.getSession().setAttribute("email", email);
		req.getSession().setAttribute("password", password);

		reloginIfRequired(req, resp);
	}
}