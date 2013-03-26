// Right now this is literally nothing more than a list; but if we ever want to send stuff besides
//  a basic list back, this would be the way to do it.
package Entities;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;

public class SearchResult {
	
	@Index @Parent Key<Mentee> mentee;
	//@Index private ArrayList <String> Search_Parameters, Results; // Index params, results? Previous search functionality? Persist Seach objects?
	private List<Mentee> matches;
	
	public SearchResult setMatches( List<Mentee> matches ) {
		this.matches = matches;
		return this;
	}
	
	public SearchResult() {}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public static SearchResult fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, SearchResult.class);
		
	}

}

