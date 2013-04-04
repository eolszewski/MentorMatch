package Entities;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

public class SearchRequest {
	
	public String mentee;
	public boolean majors;
	public boolean zipcode;
	public boolean interests;
	public boolean classes;
	public boolean empty;

	
	
//	private String mentee;
//	//@Index private ArrayList <String> Search_Parameters, Results; // Index params, results? Previous search functionality? Persist Seach objects?
//	private boolean majors;
//	private boolean hometown;
//	private boolean activities;
//	private boolean classes;
//
//	
	public SearchRequest( String mentee ) {
		this.mentee = mentee;
		majors = false;
		zipcode = false;
		interests = false;
		classes = false;
	}
	
	private SearchRequest() { }
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public SearchRequest fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, SearchRequest.class);
		
	}
//
//	public boolean getActivities() {
//		return activities;
//	}
//
//	public SearchRequest setActivities(boolean activities) {
//		this.activities = activities;
//		return this;
//	}
//
//	public boolean getMajors() {
//		return majors;
//	}
//
//	public SearchRequest setMajors(boolean majors) {
//		this.majors = majors;
//		return this;
//	}
//
//	public boolean getHometown() {
//		return hometown;
//	}
//
//	public SearchRequest setHometown(boolean hometown) {
//		this.hometown = hometown;
//		return this;
//	}
//
//	public String getMentee() {
//		return mentee;
//	}
//
//	public SearchRequest setMentee(String mentee) {
//		this.mentee = mentee;
//		return this;
//	}
//
//	public boolean isClasses() {
//		return classes;
//	}
//
//	public SearchRequest setClasses(boolean classes) {
//		this.classes = classes;
//		return this;
//	}

}
