package com.wso2.sanka;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class AuthServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7039184349252759318L;

	@Override
	  public void doGet(HttpServletRequest req, HttpServletResponse resp)
	      throws IOException {
		
	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();
	    if (user != null) {
	    	//uesr logged in
	    	req.getSession().setAttribute("user", user);
	    	resp.sendRedirect("user/index.jsp");
	    }
	    else{
	    	//user not logged in
	    	resp.sendRedirect("/authentication.jsp");
	    }
	}
}
