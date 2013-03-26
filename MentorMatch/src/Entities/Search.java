package Entities;
import java.util.ArrayList;
import java.util.List;

import static com.googlecode.objectify.ObjectifyService.ofy;
import com.googlecode.objectify.*;

import com.google.gson.Gson;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;
import com.googlecode.objectify.cmd.Query;


public class Search {	
	public static SearchResult performSearch( SearchRequest sr) {
		//TODO: alter order based on user input
		Query<Mentee> q = ofy().load().type(Mentee.class).filter("major in", sr.getMajors() );
		if ( sr.getActivities() != null ) {
			q = q.filter("activities in", sr.getActivities() );
		}		
		SearchResult result = new SearchResult();
		result.setMatches( q.list() );
		return result;
		
	}
	
	public Search() {}
	
	public String toJson() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	public static Search fromJson(String json) {
		Gson gson = new Gson();
		return gson.fromJson(json, Search.class);
		
	}
	
	
}