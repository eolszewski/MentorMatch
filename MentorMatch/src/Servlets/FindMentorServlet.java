package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import com.google.gson.Gson;

import Entities.Mentee;
import Entities.OfyService;
import Entities.Search;
import Entities.SearchRequest;
import Entities.SearchResult;

	@SuppressWarnings("serial")
	public class FindMentorServlet extends HttpServlet {
		Gson gson = new Gson();
		public void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
			
//			Mentee temp = new Mentee(jo.get("email").toString().replace("\"", ""), jo.get("password").toString().replace("\"", ""));
//			Mentee fetched = OfyService.ofy().load().type(Mentee.class).id(temp.getEmail()).get();
//			
//			if(fetched != null && fetched.getEmail() != null) {
//				if(!fetched.getPassword().equals(temp.getPassword()))
//					fetched.setPassword("null"); }
//			else
//				fetched = new Mentee("null", "null");
//			
//			resp.setContentType("application/json");
//			resp.getWriter().write(gson.toJson(fetched).toString());
			
			resp.setContentType("text/plain");
			// TODO: Sanitize inputs
			SearchRequest sr = new SearchRequest();
			sr.fromJson( req.getParameter("findMentor") );
			SearchResult result = Search.performSearch( sr );			
			resp.getWriter().println( result.toJson() );
		}
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {			
			doPost( req, resp );
		}
	}

