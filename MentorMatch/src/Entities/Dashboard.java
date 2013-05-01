package Entities;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.gson.Gson;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.cmd.Query;

@Cache @Index @Entity
public class Dashboard {
	private String email;
	private List<UserMessage> unread;
	private List<UserMessage> read;
	
	public Dashboard() {}
	public Dashboard( String email) {
		this.email = email;
	}	
	
	public void getMessages() {
		Query<UserMessage> q = OfyService.ofy().load().type(UserMessage.class).filter("To", this.email).filter("Unread", true);
		unread = q.list();
		
		Query<Mentee> mentees = OfyService.ofy().load().type(Mentee.class);
		
		for (UserMessage um : q) {
			for (Mentee mentee : mentees) {
				if (um.getFrom().equals(mentee.getEmail())) {
					um.setFromFirstName( mentee.getFirstName() );
					um.setFromLastName( mentee.getLastName() );
				}
			}
		}
		
		Query<UserMessage> p = OfyService.ofy().load().type(UserMessage.class).filter("To", this.email).filter("Unread", false);
		read = p.list();
	}
	
	public Dashboard fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, Dashboard.class);
	}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public List<UserMessage> getUnread() {
		return unread;
	}
	public void setUnread(List<UserMessage> unread) {
		this.unread = unread;
	}
	public List<UserMessage> getRead() {
		return read;
	}
	public void setRead(List<UserMessage> read) {
		this.read = read;
	}
}
