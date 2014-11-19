package org.sithija.google.drive.auth;

import static org.sithija.google.drive.datastore.service.OfyService.factory;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.sithija.google.drive.datastore.domain.Company;
import org.sithija.google.drive.datastore.domain.Document;
import org.sithija.google.drive.datastore.domain.Profile;
import org.sithija.google.drive.datastore.operations.CompanyApi;

import com.google.api.client.auth.oauth2.Credential;

import com.google.api.client.extensions.appengine.datastore.AppEngineDataStoreFactory;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.DataStoreFactory;

/**
 * Credential manager to get, save, delete user credentials.
 */
public class CredentialManager {
	/**
	 * Client secrets object.
	 */
	private GoogleClientSecrets clientSecrets;

	/**
	 * Global instance of the {@link DataStoreFactory}. The best practice is to
	 * make it a single globally shared instance across your application.
	 */
	/**
	 * Transport layer for OAuth2 client.
	 */
	private HttpTransport transport;
	/**
	 * JSON factory for OAuth2 client.
	 */
	private JsonFactory jsonFactory;
	/**
	 * Scopes for which to request access from the user.
	 */
	public static final List<String> SCOPES = Arrays.asList(
			// Required to access and manipulate files.
			"https://www.googleapis.com/auth/drive.file",
			// Required to identify the user in our data store.
			"https://www.googleapis.com/auth/userinfo.email",
			"https://www.googleapis.com/auth/userinfo.profile");

	/**
	 * Credential store to get, save, delete user credentials.
	 */
	// private static AppEngineCredentialStore credentialStore = new
	// AppEngineCredentialStore();

	/**
	 * Credential Manager constructor.
	 * 
	 * @param clientSecrets
	 *            App client secrets to be used during OAuth2 exchanges.
	 * @param transport
	 *            Transportation layer for OAuth2 client.
	 * @param factory
	 *            JSON factory for OAuth2 client.
	 */
	public CredentialManager(GoogleClientSecrets clientSecrets,
			HttpTransport transport, JsonFactory factory) {
		this.clientSecrets = clientSecrets;
		this.transport = transport;
		this.jsonFactory = factory;
	}

	/**
	 * Builds an empty credential object.
	 * 
	 * @return An empty credential object.
	 */
	public GoogleCredential buildEmpty() {
		return new GoogleCredential.Builder()
				.setClientSecrets(this.clientSecrets).setTransport(transport)
				.setJsonFactory(jsonFactory).build();
	}

	/**
	 * Returns credentials of the given user, returns null if there are none.
	 * 
	 * @param userId
	 *            The id of the user.
	 * @return A credential object or null.
	 * @throws IOException
	 */
	public GoogleCredential get(Company company) throws IOException {

		Company datastoreCompany = CompanyApi.getCompany(company
				.getCompanyName());
		if (datastoreCompany != null) {
			return buildEmpty()
					.setAccessToken(datastoreCompany.getAccessToken())
					.setRefreshToken(datastoreCompany.getRefreshToken())
					.setExpirationTimeMilliseconds(datastoreCompany.getExpirationTime());
		}
		return null;
	}

	/**
	 * Saves credentials of a given company.
	 * 
	 * @param comapny
	 * 
	 * @param credential
	 *            A GoogleCredential object to save.
	 */
	public void save(Company company, String accessToken, String refreshToekn) {
		// dataStoreFactory.getDataStore(company.getCompanyName()).set(key,
		// value)
		company.setAccessToken(accessToken);
		if (refreshToekn != null) {
			company.setRefreshToken(refreshToekn);
		}
		CompanyApi.saveCompany(company);
	}

	/**
	 * Deletes GoogleCredential of the given company.
	 * 
	 * @param company
	 *            The id of the user.
	 */
	public void delete(Company company) {
		company.setAccessToken(null);
		company.setRefreshToken(null);
		CompanyApi.saveCompany(company);
	}

	/**
	 * Generates a consent page url.
	 * 
	 * @return A consent page url string for user redirection.
	 */
	public String getAuthorizationUrl() {
		GoogleAuthorizationCodeRequestUrl urlBuilder = new GoogleAuthorizationCodeRequestUrl(
				clientSecrets.getWeb().getClientId(),
				clientSecrets.getWeb().getRedirectUris().get(0), SCOPES)
		.setAccessType("offline").setApprovalPrompt("force");
		return urlBuilder.build();
	}

	/**
	 * Retrieves a new access token by exchanging the given code with OAuth2
	 * end-points.
	 * 
	 * @param code
	 *            Exchange code.
	 * @return A credential object.
	 */
	public Credential retrieve(String code) {
		try {
			GoogleTokenResponse response = new GoogleAuthorizationCodeTokenRequest(
					transport, jsonFactory, clientSecrets.getWeb()
							.getClientId(), clientSecrets.getWeb()
							.getClientSecret(), code, clientSecrets.getWeb()
							.getRedirectUris().get(0)).execute();
			Credential credential = buildEmpty().setAccessToken(
					response.getAccessToken()).setRefreshToken(
					response.getRefreshToken());

			// GoogleCredential GoogleCredential = new
			// GoogleCredential(credential);
			// return GoogleCredential;
			return credential;
		} catch (IOException e) {
			throw new RuntimeException(
					"An unknown problem occured while retrieving token");
		}
	}

	/*
	 * public GoogleAuthorizationCodeFlow getFlow() throws IOException { if
	 * (flow == null) { HttpTransport httpTransport = new NetHttpTransport();
	 * JacksonFactory jsonFactory = new JacksonFactory(); flow = new
	 * GoogleAuthorizationCodeFlow.Builder(httpTransport, jsonFactory,
	 * clientSecrets, SCOPES)
	 * .setAccessType("offline").setApprovalPrompt("force").build(); } return
	 * flow; }
	 */

	/*
	 * public Credential exchangeCode(String authorizationCode) throws Exception
	 * { try { GoogleAuthorizationCodeFlow flow = this.getFlow();
	 * GoogleTokenResponse response =
	 * flow.newTokenRequest(authorizationCode).setRedirectUri(
	 * clientSecrets.getWeb() .getRedirectUris().get(0)).execute(); return
	 * flow.createAndStoreCredential(response, null); } catch (IOException e) {
	 * System.err.println("An error occurred: " + e); throw new Exception(); }
	 */

}
