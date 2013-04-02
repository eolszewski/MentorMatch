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
						
			resp.setContentType("text/plain");			
			SearchRequest sr = new SearchRequest( req.getParameter("email") );
			
			if ( req.getParameter("major") == "true" ){
				sr.majors = true;
			} if ( req.getParameter("zipcode") == "true" ) {
				sr.zipcode = true;
			} if ( req.getParameter("interests") == "true" ) {
				sr.interests = true;
			} if ( req.getParameter("classes") == "true" ) {
				sr.classes = true;
			}
			
			System.out.println("Email: " + req.getParameter( "email"));

			// TODO: Sanitize inputs
			SearchResult result = Search.performSearch( sr );	
			System.out.println("Resp: " + result.toJson() );
			resp.getWriter().write( result.toJson() );
		}
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {			
			doPost( req, resp );
		}
	}

