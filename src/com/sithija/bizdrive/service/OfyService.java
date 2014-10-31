package com.sithija.bizdrive.service;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;
import com.sithija.bizdrive.bean.Document;
import com.sithija.bizdrive.bean.SithijaUser;

public class OfyService {

	public static Objectify ofy() {
		return ObjectifyService.ofy();
	}

	public static ObjectifyFactory factory() {
		return ObjectifyService.factory();
	}
}
