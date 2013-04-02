package Entities;
import static com.googlecode.objectify.ObjectifyService.ofy;

import com.google.gson.Gson;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.cmd.Query;

@Entity
public class Search {	
	@Id String email;
	public static SearchResult performSearch( SearchRequest sr) {
		//TODO: alter order based on user input
		Query<Mentee> q = ofy().load().type(Mentee.class).filter("major in", sr.getMajors() );
		
		if ( sr.getHometown() != null ) {
			q = q.filter("hometown in", sr.getHometown() );
		}
		
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