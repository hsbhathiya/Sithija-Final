package com.sithija.bizdrive.dao;

import static com.sithija.bizdrive.service.OfyService.ofy;

import java.util.List;

import com.sithija.bizdrive.bean.SithijaUser;


public class UserDAO {
	
/*	private UserDAO() {		
	}	
	
	public static UserDAO getInstance(){
		return  new UserDAO();
	}*/
	
	public static SithijaUser findByEmail(String email){
		return ofy().load().type(SithijaUser.class).id(email).now();
	}
	
	public static List<SithijaUser> findByName(String name){
		return ofy().load().type(SithijaUser.class).filter("name", name).list();
	}
	
	public static void addUser(SithijaUser user ) {
		ofy().save().entity(user).now();
	}
	
	public static void updateUser(SithijaUser user ) {
		ofy().save().entity(user).now();
	}	

	public static void deleteUser(SithijaUser user) {
		ofy().delete().type(SithijaUser.class).id(user.getEmail()).now();
	}

	public static List<SithijaUser> getAllUsers() {
			return ofy().load().type(SithijaUser.class).list();
	}	
}
