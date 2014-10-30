package com.wso2.sanka;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class SithijaRun2Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("<h1>Welcome to Sithija Enterprice Cloud Share.</h1>");
	}
}
