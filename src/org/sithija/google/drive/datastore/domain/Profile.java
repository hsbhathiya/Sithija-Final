package org.sithija.google.drive.datastore.domain;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Cache
@Entity
public class Profile {
	@Id
	private String profileId;
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
	
	public String getCompany() {
		return companyName;
	}
	public String getProfileId() {
		return profileId;
	}
}
