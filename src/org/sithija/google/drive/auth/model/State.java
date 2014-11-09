package org.sithija.google.drive.auth.model;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.Collection;

/**
 * An object representing the state parameter passed into this application from
 * the Drive UI integration (i.e. Open With or Create New). Required for Gson to
 * deserialize the JSON into POJO form.
 * 
 * @author vicfryzel@google.com (Vic Fryzel)
 */
public class State {
	/**
	 * Action intended by the state.
	 */
	public String action;
	/**
	 * IDs of files on which to take action.
	 */
	public Collection<String> ids;
	/**
	 * Folder ID related to the given action.
	 */
	public String folderId;

	/**
	 * Empty constructor required by Gson.
	 */
	public State() {
	}

	/**
	 * Create a new State given its JSON representation.
	 * 
	 * @param json
	 *            Serialized representation of a State.
	 */
	public State(String json) {
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		State other = gson.fromJson(json, State.class);
		this.action = other.action;
		this.ids = other.ids;
		this.folderId = other.folderId;
	}
}
