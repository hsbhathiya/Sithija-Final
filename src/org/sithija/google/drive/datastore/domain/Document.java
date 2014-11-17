package org.sithija.google.drive.datastore.domain;

import java.net.URL;
import java.util.Date;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Cache
@Entity
public class Document {

	@Id
	private String id;
	private String docName;
	private String url;
	//private Date timeCreated;
	private Key<Profile> ownerProfile;

	private Document() {
	}

	public Document(String id, String docName, String url, Key<Profile> user) {
		this.id = id;
		this.docName = docName;
		this.url = url;
		//this.timeCreated = timeCreated;
		this.ownerProfile = user;
	}

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return docName;
	}

	public void setName(String name) {
		this.docName = name;
	}

	public Key<Profile> getOwner() {
		return ownerProfile;
	}

	public void setOWner(Profile profile) {
		this.ownerProfile = Key.create(profile.getProfileId());
	}
}
