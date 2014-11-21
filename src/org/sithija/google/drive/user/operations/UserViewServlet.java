package org.sithija.google.drive.user.operations;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.auth.DrEditServlet;
import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Document;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.CompanyApi;
import org.sithija.google.drive.datastore.operations.DocumentApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.Drive.Apps.List;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import com.google.apphosting.client.serviceapp.AuthService.UserPermissions;
import com.googlecode.objectify.Key;

public class UserViewServlet extends DrEditServlet {

	private static final long serialVersionUID = -5224086727818555608L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Profile currentUser = (Profile) req.getSession()
				.getAttribute("profile");
		Company company = (Company) req.getSession().getAttribute("company");
		
		
		if (currentUser != null && company != null) {
			
			java.util.List<Key<Document>> list = currentUser.getCreatedBy();//DocumentApi.findByProfile(Key.create(currentUser));
			
			resp.setContentType("text/html");
			for(Key<Document> d : list){
				resp.getWriter().println("<h1>"+DocumentApi.getProfileByKey(d).getId()+"</h1>");
			}
					
			String docName = req.getParameter("docName");
			String mimeType = req.getParameter("mimeType");

			Drive service = getDriveService(getCredential((Company)req.getSession().getAttribute("company")));
		
			service.files().list().execute();
			
			File newDoc = new File().setMimeType(mimeType).setTitle(docName);
			File createdFile = service.files().insert(newDoc).execute();

			if (createdFile != null) {
				
			    Permission newPermission = new Permission();

			    newPermission.setValue(currentUser.getEmail());
			    newPermission.setType("user");
			    newPermission.setRole("writrer");
			    
				service.permissions().insert(createdFile.getId(), newPermission).execute();
				Key<Profile> profileKey = Key.create(currentUser);
				Document document = new Document(createdFile.getId(), docName,
						createdFile.getSelfLink(), profileKey);
				DocumentApi.saveDocument(document);				
			}
		}
	}
}
