package org.sithija.google.drive.datastore.test;

import static org.sithija.google.drive.datastore.service.OfyService.factory;

import java.io.IOException;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Document;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.CompanyApi;
import org.sithija.google.drive.datastore.operations.DocumentApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.googlecode.objectify.Key;

public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	static {
		factory().register(Profile.class);
		factory().register(Document.class);
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		Company WSO2 = new Company("WSO2");
		CompanyApi.saveCompany(WSO2);

		Profile user1 = new Profile("hsbathiya@gmail.com", "Bhathiya", "WSO2");
		Profile user2 = new Profile("sanka.ras@gmail.com", "Sanka", "WSO2");
		Profile user3 = new Profile("tharindum@gmail.com", "Muridhu", "WSO2");

		Key<Profile> userKey1 = Key.create(user1);
		Key<Profile> userKey2 = Key.create(user2);

		Document document1 = new Document(
				"abc",
				"a.txt",
				new URL(
						"https://docs.google.com/document/d/1gtNOaaDa64rLgrpD8fLmGvkzgdf9J41zhm2Y3A-ExGk/edit").getPath(),
				userKey1);

		Document document2 = new Document(
				"def",
				"b.txt",
				new URL(
						"https://docs.google.com/document/d/1laZ2uRozlRQ72pY_RxylWIpKn3HaB6DHe6rJXAg2He8/edit").getPath(),
				userKey2);

		Document document3 = new Document(
				"xyz",
				"c.txt",
				new URL(
						"https://docs.google.com/document/d/1gtNOaaDa64rLgrpD8fLmGvkzgdf9J41zhm2Y3A-ExGk/edit").getPath(),
				userKey2);

		ProfileApi.saveProfile(user1);
		ProfileApi.saveProfile(user2);
		ProfileApi.saveProfile(user3);

		resp.setContentType("text/plain");
		resp.getWriter().println(
				"user1"
						+ user1.getEmail()
						+ " = "
						+ ProfileApi.getProfile(user1.getEmail(),
								WSO2.getCompanyName()).getEmail());
		resp.getWriter().println(
				"user2" + user2.getName() + "="
						+ ProfileApi.getAllUsers().get(1).getName());

		DocumentApi.saveDocument(document1);
		DocumentApi.saveDocument(document2);
		DocumentApi.saveDocument(document3);
	}
}
