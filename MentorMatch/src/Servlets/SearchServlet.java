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
	public class SearchServlet extends HttpServlet {
		Gson gson = new Gson();
		public void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
						
			resp.setContentType("text/plain");
			System.out.println(req.getParameter("currentClasses"));
			SearchRequest sr = new SearchRequest( req.getParameter("email") );
			sr.empty = true;
			
			if ( req.getParameter("majors") == "true" ){
				sr.majors = true;
				sr.empty = false;
			} if ( req.getParameter("zipcode") == "true" ) {
				sr.zipcode = true;
				sr.empty = false;
			} if ( req.getParameter("interests") == "true" ) {
				sr.interests = true;
				sr.empty = false;
			} if ( req.getParameter("currentClasses") == "true" ) {
				sr.classes = true;
				sr.empty = false;				
			} if ( req.getParameter("pastClasses") == "true" ){
				sr.majors = true;
				sr.empty = false;
			} if ( req.getParameter("classification") == "true" ){
				sr.majors = true;
				sr.empty = false;
			}
			
			SearchResult result = Search.performSearch( sr );	
			System.out.println("Resp: " + result.toJson() );
			resp.getWriter().write( result.toJson() );
		}
		
		public void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {			
			doPost( req, resp );
		}
	}

