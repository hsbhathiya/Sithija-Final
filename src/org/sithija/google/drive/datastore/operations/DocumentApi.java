package org.sithija.google.drive.datastore.operations;

import static org.sithija.google.drive.datastore.service.OfyService.ofy;

import java.util.List;

import org.sithija.google.drive.datastore.domain.Document;

public class DocumentApi {
	
	public static Document findById(String id){
		return ofy().load().type(Document.class).id(id).now();
	}
	
	public static List<Document> findByUrl(String name){
		return ofy().load().type(Document.class).filter("name", name).list();
	}
	
	public static void saveDocument(Document document ) {
		ofy().save().entity(document).now();
	}
	
	public static void updateDocument(Document Document ) {
		ofy().save().entity(Document).now();
	}
	
	public static void deleteDocument(Document Document) {
		ofy().delete().type(Document.class).id(Document.getId()).now();
	}

	public static List<Document> getAllDocuments() {
			return ofy().load().type(Document.class).list();
	}	
}
