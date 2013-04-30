package Servlets;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entities.Dashboard;
import Entities.SearchRequest;

import com.google.gson.Gson;

@SuppressWarnings("serial")
public class DashboardServlet extends HttpServlet {
	Gson gson = new Gson();
	
	boolean TEST = false;
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {		
					
		resp.setContentType("text/plain");
		
		Dashboard dash = new Dashboard(req.getParameter("email"));
		System.out.println("Input: " + req.getParameter("email"));
		dash.getMessages();	
		System.out.println( dash.toJson() );
		resp.getWriter().write( dash.toJson() );
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {			
		doPost( req, resp );
	}

}
