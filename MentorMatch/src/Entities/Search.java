package Entities;

import com.google.gson.Gson;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.cmd.Query;

@Entity
public class Search {	
	@Id String email;
	public static SearchResult performSearch( SearchRequest sr) {
		//TODO: alter order based on user input
		
		Mentee mentee = OfyService.ofy().load().type(Mentee.class).id( sr.mentee ).get();
		System.out.println( mentee.getEmail() );
		Query<Mentor> q = OfyService.ofy().load().type(Mentor.class); //TODO: Decide what happens when the user does not select anything.
		
		if ( sr.majors ) {
			q = q.filter("Majors in", mentee.getMajors());
			System.out.println(q.count());
		}		
		if ( sr.zipcode ) {
			q = q.filter("ZipCode", mentee.getZipCode() );
		}		
		if ( sr.interests ) {
			q = q.filter("Interests in", mentee.getInterests() );
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