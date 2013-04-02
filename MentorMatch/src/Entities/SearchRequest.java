package Entities;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

public class SearchRequest {
	
	@Index @Parent Key<Mentee> mentee;
	//@Index private ArrayList <String> Search_Parameters, Results; // Index params, results? Previous search functionality? Persist Seach objects?
	private ArrayList<String> majors;
	private String hometown;
	private ArrayList<String> classifications;
	private ArrayList<String> activities;

	
	public SearchRequest() {}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public SearchRequest fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, SearchRequest.class);
		
	}

	public ArrayList<String> getActivities() {
		return activities;
	}

	public void setActivities(ArrayList<String> activities) {
		this.activities = activities;
	}

	public ArrayList<String> getMajors() {
		return majors;
	}

	public void setMajors(ArrayList<String> majors) {
		this.majors = majors;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

}
