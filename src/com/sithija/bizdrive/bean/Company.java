package com.sithija.bizdrive.bean;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Cache
@Entity
public class Company {
	
	@Id
	private String companyName;
	private String accessToken;
	private String refreshToken;
	public Company(String companyName, String token, String tokenSecret) {
		super();
		this.companyName = companyName;
		this.accessToken = token;
		this.refreshToken = tokenSecret;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getToken() {
		return accessToken;
	}
	public void setToken(String token) {
		this.accessToken = token;
	}
	public String getTokenSecret() {
		return refreshToken;
	}
	public void setTokenSecret(String tokenSecret) {
		this.refreshToken = tokenSecret;
	}
}
