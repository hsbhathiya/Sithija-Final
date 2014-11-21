package org.sithija.google.drive.user.operations;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.sithija.google.drive.auth.DrEditServlet;
import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Document;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.DocumentApi;
import org.sithija.google.drive.datastore.operations.ProfileApi;

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import com.googlecode.objectify.Key;

public class CreateDocServlet extends DrEditServlet {

	private static final long serialVersionUID = -5224086727818555608L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Profile currentUser = (Profile) req.getSession()
				.getAttribute("profile");
				
		if (currentUser != null) {

			String docName = req.getParameter("docName");
			String mimeType = req.getParameter("mimeType");

			Drive service = getDriveService(getCredential((Company)req.getSession().getAttribute("company")));
		
			File newDoc = new File().setMimeType(mimeType).setTitle(docName);
			
			File createdFile = service.files().insert(newDoc).execute();

			if (createdFile != null) {
				
			    Permission newPermission = new Permission();

			    newPermission.setValue(currentUser.getEmail());
			    newPermission.setType("user");
			    newPermission.setRole("writer");
			    
				service.permissions().insert(createdFile.getId(), newPermission).execute();
				Key<Profile> profileKey = Key.create(currentUser);
				Document document = new Document(createdFile.getId(), docName,
						createdFile.getSelfLink(), profileKey);
				currentUser.addCreated(createdFile.getId());
				ProfileApi.saveProfile(currentUser);
				DocumentApi.saveDocument(document);				
			}
		}
	}
}
