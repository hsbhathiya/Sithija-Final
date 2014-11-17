package org.sithija.google.drive;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class AdminAuthServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User admin = userService.getCurrentUser();
		if (admin != null) {
			// admin logged in
			req.getSession().setAttribute("user", admin);
			resp.sendRedirect("admin/index.jsp");
		} else {
			// user not logged in
			resp.sendRedirect("/authentication.jsp");
		}
	}
}