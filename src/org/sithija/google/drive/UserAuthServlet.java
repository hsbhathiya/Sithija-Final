package org.sithija.google.drive;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class UserAuthServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		if (user != null) {
			// user logged in
			req.getSession().setAttribute("user", user);
			resp.sendRedirect("/accounts");
		} else {
			// user not logged in
			resp.sendRedirect("/authentication.jsp");
		}
	}
}