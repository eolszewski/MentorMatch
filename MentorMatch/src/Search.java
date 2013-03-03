import java.util.ArrayList;

public class Search {
	
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
