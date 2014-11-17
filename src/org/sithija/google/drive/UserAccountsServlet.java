package org.sithija.google.drive;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.CompanyApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.google.appengine.api.users.User;

@SuppressWarnings("serial")
public class UserAccountsServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (user != null) {
//			ProfileApi.saveProfile(new Profile("test@example.com", "test1", "noname1"));
//			ProfileApi.saveProfile(new Profile("test@example.com", "test2", "noname2"));
//			ProfileApi.saveProfile(new Profile("fishytuna1991@gmail.com", "fishytuna", "fishy"));
//			ProfileApi.saveProfile(new Profile("codeheart1991@gmail.com", "codeheart", "codeheart"));

			// decide which company to log in to
			List<Profile> choices = ProfileApi.getProfilesByEmail(user.getEmail());
			switch(choices.size()) {
				case 0:	// none; direct to site TODO with message
					resp.sendRedirect("/");
					break;
				case 1:	// direct to profile view; setAttr profile, company
					Profile profile = choices.get(0);
					req.getSession().setAttribute("profile", profile);
					req.getSession().setAttribute("company", 
							CompanyApi.getCompany(profile.getCompanyName()));
					resp.sendRedirect("/user/index.jsp");
					break;
				default:	// show account list
					req.getSession().setAttribute("accounts", choices);
					resp.sendRedirect("/user/pickaccount.jsp");
					break;
			}
		} else {
			// user not logged in
			resp.sendRedirect("/authentication.jsp");
		}
	}
}