package org.sithija.google.drive.datastore.domain;

import java.io.Serializable;

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
	private String name;
	private String companyName;

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
}
