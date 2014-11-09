package org.sithija.google.drive.datastore.operations;

import static org.sithija.google.drive.datastore.service.OfyService.ofy;

import java.util.List;

import org.sithija.google.drive.datastore.domain.Profile;
import com.google.appengine.api.users.User;

public class ProfileApi {

	public static Profile getProfile(String email, String company) {
		String id = email+ company;
		return ofy().load().type(Profile.class).id(id).now();
	}
	
	public static List<Profile> getProfilesByEmail(String email) {
		return ofy().load().type(Profile.class).filter("emailAddress",email).list();
	}

	public static List<Profile> getProfilesWithName(final User user, String name) {
		return ofy().load().type(Profile.class).filter("name", name).list();
	}
	
	public static void saveProfile(Profile profile) {
			ofy().save().entity(profile).now();
	}

	public static void updateUser(Profile profile) {
		ofy().save().entity(profile).now();
	}

	public static void deleteProfile(Profile profile) {
		ofy().delete().type(Profile.class).id(profile.getProfileId()).now();
	}

	public static void deleteProfile(String email, String company) {
		ofy().delete().type(Profile.class).id(email+company).now();
	}

	public static List<Profile> getAllUsers() {
		return ofy().load().type(Profile.class).list();
	}
	
	public static Profile getProfile(final User user) {
		return ofy().load().type(Profile.class).id(user.getEmail()).now();
	}
}
