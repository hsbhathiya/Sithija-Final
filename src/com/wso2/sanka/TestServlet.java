package com.wso2.sanka;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.Key;
import com.sithija.bizdrive.bean.Document;
import com.sithija.bizdrive.bean.SithijaUser;
import com.sithija.bizdrive.dao.DocumentDAO;
import com.sithija.bizdrive.dao.UserDAO;
import static com.sithija.bizdrive.service.OfyService.factory;;

public class TestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	static {
        factory().register(SithijaUser.class);
        factory().register(Document.class);        
    }

	@Override
	  public void doGet(HttpServletRequest req, HttpServletResponse resp)
	      throws IOException {
		

		SithijaUser user1 = new SithijaUser("hsbthaiya@gmail.com", "Bhathiya");
		SithijaUser user2 = new SithijaUser("sanka.ras@gmail.com", "Sanka");
		SithijaUser user3 = new SithijaUser("tharindum@gmail.com", "Muridhu");

		Key<SithijaUser> userKey1 = Key.create(user1);
		Key<SithijaUser> userKey2 = Key.create(user2);

		Document document1 = new Document(
				"a.txt",
				"https://docs.google.com/document/d/1gtNOaaDa64rLgrpD8fLmGvkzgdf9J41zhm2Y3A-ExGk/edit",
				Calendar.getInstance().getTime(), userKey1);
		
		Document document2 = new Document(
				"b.txt",
				"https://docs.google.com/document/d/1laZ2uRozlRQ72pY_RxylWIpKn3HaB6DHe6rJXAg2He8/edit",
				Calendar.getInstance().getTime(), userKey2);
		
		Document document3 = new Document(
				"c.txt",
				"https://docs.google.com/document/d/1gtNOaaDa64rLgrpD8fLmGvkzgdf9J41zhm2Y3A-ExGk/edit",
				Calendar.getInstance().getTime(), userKey2);	
		
		
		UserDAO.addUser(user1);
		UserDAO.addUser(user2);
		UserDAO.addUser(user3);
		
		resp.setContentType("text/plain");
	    resp.getWriter().println("user1" + user1.getEmail()+ " = "+ UserDAO.findByEmail(user1.getEmail()).getEmail());
	    resp.getWriter().println("user2" + user2.getName()+ "="+ UserDAO.getAllUsers().get(1).getName());
	    //resp.getWriter().println("user3" + user3.+ "-"+ user1.getName());
		
	    DocumentDAO.addDocument(document1);
		DocumentDAO.addDocument(document2);
		DocumentDAO.addDocument(document3);		
    
	  }
	}
	
	
	


