package org.sithija.google.drive.operations;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.extensions.appengine.auth.oauth2.AppIdentityCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.Drive.Files;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;


public class Upload extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		/*try {
			AppIdentityCredential credential =  new AppIdentityCredential(DriveScopes.all());
			JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
			HttpTransport httpTransport;
			httpTransport = GoogleNetHttpTransport.newTrustedTransport();
			Drive drive = new Drive.Builder(httpTransport, JSON_FACTORY, credential).build();
			resp.getWriter().println(drive.files().insert(new File().set("abc", "123")).buildHttpRequest().execute().getStatusCode());
			resp.setContentType("text/html");
			resp.getWriter().println(drive.about().get().buildHttpRequest().execute().getContent().toString());
			resp.getWriter().println(drive.about().get().execute().getName());
			resp.getWriter().println(drive.about().get().execute().getSelfLink());
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			resp.getWriter().println("####"+ e);
			e.printStackTrace();
		}*/	
		
		  HttpTransport httpTransport = new NetHttpTransport();
		  JacksonFactory jsonFactory = new JacksonFactory();
		  GoogleCredential credential;
		try {
			credential = new GoogleCredential.Builder()
			      .setTransport(httpTransport)
			      .setJsonFactory(jsonFactory)
			      .setServiceAccountId("44878765266-29n3c6f7fo45ch0brv8ncck197gvra06@developer.gserviceaccount.com")
			      .setServiceAccountScopes(DriveScopes.all())
			   //   .setServiceAccountId("hsbathiya@gmail.com")
			      .setServiceAccountPrivateKeyFromP12File(
			          new java.io.File("WEB-INF/gdrivesdk-a94b0ec2fd49.p12"))
			      .build();
			  		Drive service = new Drive.Builder(httpTransport, jsonFactory, credential).build();
			  		//.setHttpRequestInitializer(credential).build();
			  		
			  	resp.getWriter().println(service.about().get().execute().getName());
			  		
		} catch (GeneralSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	
}
