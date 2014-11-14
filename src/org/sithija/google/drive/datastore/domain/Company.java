package org.sithija.google.drive.datastore.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.google.appengine.api.datastore.Blob;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Cache
@Entity
public class Company implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String companyName;
	private String accessToken;
	private String refreshToken;
	private Blob image;//image may be a separate entity 
	private List<Key<Profile>> employee = new ArrayList<Key<Profile>>();
	private Key<Profile> managerProfile; // Generate Admin profile;
	//private GoogleCredential credential;

	protected Company() {
	}
	
	public Company(String companyName) {
		this.companyName = companyName;
	}

	public Company(String companyName, String token, String tokenSecret) {
		this.companyName = companyName;
		this.accessToken = token;
		this.refreshToken = tokenSecret;
	}
	

	public Company(String companyName, String token, String tokenSecret,Profile admin, Blob image) {
		Key<Profile> adminKey = Key.create(admin);
		
		this.companyName = companyName;
		this.accessToken = token;
		this.refreshToken = tokenSecret;
		this.image = image;
		this.managerProfile = adminKey;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String token) {
		this.accessToken = token;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String tokenSecret) {
		this.refreshToken = tokenSecret;
	}

	public void setImage(byte[] bytes) {
		this.image = new Blob(bytes);
	}

	public byte[] getImage() {
		if (image == null) {
			return null;
		}
		return image.getBytes();
	}
	
	public void setEmployee(List<Key<Profile>> employee) {
		this.employee = employee;
	}
	
	public List<Key<Profile>> getEmployee() {
		return employee;
	}
	
	public void addEmployee(Key<Profile> employee) {
		this.employee.add(employee);
	}	
	
	public void setManagerProfile(Key<Profile> managerProfile) {
		this.managerProfile = managerProfile;
	}
	
	public Key<Profile> getManagerProfile() {
		return managerProfile;
	}
	
	/*public void setCredential(GoogleCredential credential) {
		this.credential = credential;
	}
	
	public GoogleCredential getCredential() {
		return credential;
	}*/

}
