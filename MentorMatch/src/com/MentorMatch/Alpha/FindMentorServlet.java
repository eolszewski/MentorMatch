package com.MentorMatch.Alpha;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import com.google.gson.Gson;

import Entities.Mentee;
import Entities.Search;
import Entities.SearchRequest;
import Entities.SearchResult;

	@SuppressWarnings("serial")
	public class FindMentorServlet extends HttpServlet {
		Gson gson = new Gson();
		public void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws IOException {
			
			resp.setContentType("text/plain");
			// TODO: Sanitize inputs
			SearchRequest sr = new SearchRequest().fromJson( req.getParameter("findMentor") );
			SearchResult result = Search.performSearch( sr );			
			resp.getWriter().println(req.getParameter( result.toJson() ));
		}
	}

