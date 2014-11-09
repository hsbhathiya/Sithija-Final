package org.sithija.google.drive.datastore.operations;

import static org.sithija.google.drive.datastore.service.OfyService.ofy;

import org.sithija.google.drive.datastore.domain.Company;

public class CompanyApi {
	
	public static void saveCompany(Company company ) {
		ofy().save().entity(company).now();
	}
	
	public static Company getComapany(String companyName) {
		return ofy().load().type(Company.class).id(companyName).now();
	}
		
}
