// Right now this is literally nothing more than a list; but if we ever want to send stuff besides
//  a basic list back, this would be the way to do it.
package Entities;

import java.util.List;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

@Cache @Entity
public class SearchResult {
	
	@Index @Parent Key<Mentee> mentee; //Index this so we can recall and display past results
	//@Index private ArrayList <String> Search_Parameters, Results; // Index params, results? Previous search functionality? Persist Seach objects?
	private List<Mentor> matches;
	
	public SearchResult setMatches( List<Mentor> list ) {
		this.matches = list;
		return this;
	}
	
	public SearchResult() {}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
		//TODO: This returns the mentee's password too.
	}
	
	public static SearchResult fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, SearchResult.class);
		
	}

	public List<Mentor> getMatches() {
		return matches;
	}

}

