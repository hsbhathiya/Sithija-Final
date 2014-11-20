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

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import com.google.apphosting.client.serviceapp.AuthService.UserPermissions;
import com.googlecode.objectify.Key;

public class DeleteDoc extends DrEditServlet {

	private static final long serialVersionUID = -5224086727818555608L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Profile currentUser = (Profile) req.getSession()
				.getAttribute("profile");
				
		if (currentUser != null) {

			String docId= req.getParameter("fileId");

			Drive service = getDriveService(getCredential((Company)req.getSession().getAttribute("company")));
		
			service.files().delete(docId).execute();
			DocumentApi.deleteDocument(docId);
		}
	}
}
