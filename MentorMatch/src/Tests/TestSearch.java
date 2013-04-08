package Tests;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;

import org.apache.tools.ant.util.FileUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import Entities.Mentee;
import Entities.Mentor;
import Entities.OfyService;
import Entities.Search;
import Entities.SearchRequest;
import Entities.SearchResult;

import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalMemcacheServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.googlecode.objectify.Objectify;

public class TestSearch {
	
	private final LocalServiceTestHelper helper =
	        new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig(),
	        		new LocalMemcacheServiceTestConfig());
	

	@Before
	public void setUp() throws Exception {
		helper.setUp();		
	}

	@After
	public void tearDown() throws Exception {
		helper.tearDown();
	}

	public SearchResult testBasicSearch( SearchRequest sr) {
		
		Mentee bob = new Mentee("testEasy@test.com", "password");
		bob.setFirstName("Bob").setLastName("Smith").setMajor("ECE").setZipCode(78705);
		OfyService.ofy().save().entity(bob).now();
		
		Mentee joe = new Mentee("testEasyMentor@test.com", "password");
		joe.setFirstName("Joe").setLastName("Smith").setMajor("ECE").setZipCode(78705);
		OfyService.ofy().save().entity(joe).now();
		
		Mentee steve = new Mentee("testEasyMentor2@test.com", "password");
		steve.setFirstName("Steve").setLastName("Smith").setMajor("ECE").setZipCode(70000);
		OfyService.ofy().save().entity(steve).now();
		
		SearchResult result = Search.performSearch( sr );
		
		return result;

	}
	//TODO: Multiple majors, lists of classes, etc.
	@Test
	public void testNoResults() {
		SearchResult result = testBasicSearch( new SearchRequest("testEasy@test.com") );
		assertEquals(0, result.getMatches().size() );
	}
	
	@Test
	public void testMajorMatch() {
		SearchRequest sr = new SearchRequest("testEasy@test.com");
		sr.majors = true;
		SearchResult result = testBasicSearch( sr );
		assertEquals(2, result.getMatches().size() );
		
	}
	
	@Test
	public void testMajorZipMatch() {
		SearchRequest sr = new SearchRequest("testEasy@test.com");
		sr.majors = true;
		sr.zipcode = true;
		SearchResult result = testBasicSearch( sr );
		assertEquals(1, result.getMatches().size() );
		assertEquals(78705, result.getMatches().get(0).getZipCode() );
	}

}
