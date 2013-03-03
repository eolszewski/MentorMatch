import java.util.ArrayList;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Parent;


public class Search {
	
	@Index @Parent Key<Mentee> mentee;
	private ArrayList <String> Search_Parameters, Results;

	public Search(ArrayList <String> arguments)
	{
		Search_Parameters = arguments;
	}
	
	public ArrayList<String> PerformSearch()
	{
		return Results;
	}
}
