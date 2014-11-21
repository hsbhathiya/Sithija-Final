package org.sithija.google.drive.datastore.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Cache
@Entity
public class Profile implements Serializable{

	private static final long serialVersionUID = -7294123939099061604L;

	@Id
	private String profileId;
	@Index
	private String emailAddress;
	@Index
	private String name;
	@Index
	private String companyName;
	
	private List<Key<Document>> sharedWithMe = new ArrayList<Key<Document>>();
	private List<Key<Document>> createdByMe  =  new ArrayList<Key<Document>>();
	
	
	public Profile() {		
	}
	
	public Profile(String emailAddress, String name, String companyName) {
		this.profileId = emailAddress+ companyName;
		this.emailAddress = emailAddress;
		this.name = name;
		this.companyName = companyName;
	}
	
	public String getEmail() {
		return emailAddress;
	}
	public void setEmail(String email) {
		this.emailAddress = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCompanyName() {
		return companyName;
	}
	public String getProfileId() {
		return profileId;
	}
	
	public List<Key<Document>> getSharedWith() {
		return sharedWithMe;
	}
	
	public void addAllShared(List<Key<Document>> sharedWith) {
		this.sharedWithMe.addAll(sharedWith);
	}
	
	public void addShared(Document shared) {
		Key<Document> profileKey = Key.create(shared);
		this.sharedWithMe.add(profileKey);
	}	
	
	public List<Key<Document>> getCreatedBy() {
		return sharedWithMe;
	}
	
	public void addAllCreated(List<Key<Document>> createdBy) {
		this.createdByMe.addAll(createdBy);
	}
	
	public void addCreated(String fileId) {
		Key<Document> profileKey = Key.create(Document.class, fileId);
		this.createdByMe.add(profileKey);
	}	
}
