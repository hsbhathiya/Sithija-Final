package com.sithija.bizdrive.bean;

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
	private String name;
	private String url;
	private Date timeCreated;
	private Key<SithijaUser> user;
	
	
	public Document(String docName, String url, Date timeCreated,
			Key<SithijaUser> user) {
		super();
		this.id = docName +  user;
		this.name = docName;
		this.url = url;
		this.timeCreated = timeCreated;
		this.user = user;
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
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getTimeCreated() {
		return timeCreated;
	}

	public void setTimeCreated(Date timeCreated) {
		this.timeCreated = timeCreated;
	}

	public Key<SithijaUser> getUser() {
		return user;
	}

	public void setUser(Key<SithijaUser> user) {
		this.user = user;
	}	
}
