package Entities;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

public class SearchRequest {
	
	public String mentee;
	private List<String> parameters;
	public boolean majors;
	public boolean zipcode;
	public boolean interests;
	public boolean classes;
	public boolean empty;

	public SearchRequest( String mentee ) {
		this.mentee = mentee;
		this.parameters = new ArrayList<String>();
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

	public List<String> getParameters() {
		return parameters;
	}

	public void addParameters(List<String> parameters) {
		this.parameters.addAll(parameters);
	}
	
	public void addParameters(String parameter) {
		this.parameters.add(parameter);
	}

}
