package org.sithija.google.drive;

import static org.sithija.google.drive.datastore.service.OfyService.factory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.domain.Document;
 
public class StartupListener implements ServletContextListener{
 
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}
 
    //Run this before web application is started
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		factory().register(Profile.class);
		factory().register(Document.class);
		factory().register(Company.class);
	}
}