package com.sithija.bizdrive.bean;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.Key;
import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

@Cache
@Entity
public class SithijaUser {
	@Id
	private String email;
	private String name;
	List<Key<Company>> companies = new ArrayList<Key<Company>>();

	
	public SithijaUser(String email, String name ) {
		super();
		this.email = email;
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	
	
	
	
}
