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
	HashMap<String, List<UserMessage>> messageThreads;
	private List<Thread> threads;
	private List<UserMessage> unread;
	private Gson gson;
	
	public Dashboard() {}
	public Dashboard( String email) {
		this.email = email;
		this.gson = new Gson();
		this.threads = new ArrayList<Thread>();
		this.unread = new ArrayList<UserMessage>();
		this.messageThreads = new HashMap<String, List<UserMessage>>();
	}
	
	
	public void getMessages() {
		Query<UserMessage> q = OfyService.ofy().load().type(UserMessage.class).filter("From", this.email).order("To");
		setUnread(q.list());
		System.out.println(q.list());
		for (UserMessage um : q) {
			//threads.add( new Thread( um.getFrom(), um.getBody()) );
			//messageThreads.put(um.getFrom(), value)
		}
	}
	
	public Dashboard fromJson(String json) {
		return gson.fromJson(json, Dashboard.class);
	}
	
	public String toJson() {
		return gson.toJson(this);
	}
	
	public List<UserMessage> getUnread() {
		return unread;
	}
	public void setUnread(List<UserMessage> unread) {
		this.unread = unread;
	}

	public static class Thread {
		public Thread(String from, String body) {
			other = from;
			threadMessages = new ArrayList<String>();
			threadMessages.add(body);
		}
		public static void setThread(String from, String body) {
			
		}
		String other;
		List<String> threadMessages;
	}
}
