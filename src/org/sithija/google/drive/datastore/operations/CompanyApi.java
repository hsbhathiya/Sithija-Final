package org.sithija.google.drive.datastore.operations;

import static org.sithija.google.drive.datastore.service.OfyService.ofy;

import java.util.List;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Profile;

import com.googlecode.objectify.Key;

public class CompanyApi {
	
	public static void saveCompany(Company company ) {
		ofy().save().entity(company).now();
	}
	
	public static Company getCompany(String companyName) {
		return ofy().load().type(Company.class).id(companyName).now();
	}
			
	public static Company getCompanyByEmail(String email) {
		List<Profile> managers = ProfileApi.getProfilesByEmail(email);
		if(managers.size() == 1) {
			Key<Profile> manager = Key.create(Profile.class, managers.get(0).getProfileId());
			List<Company> results = ofy().load().type(Company.class).
					filter("managerProfile", manager).list();
			
			if(results.size() == 1) {	// must be unique
				return results.get(0);
			}
		}
		return null;
	}
}
