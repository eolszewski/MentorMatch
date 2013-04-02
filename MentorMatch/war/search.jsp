<%@include file="master.jsp" %>
                                    <title>MentorMatch - Search</title>
                                    <div class="container">
                                        
                                        <div class="span2">
                                            <div class="tabbable tabs-left">
                                                <ul class="nav nav-tabs">
                                                    <li class="nav-header">Sidebar</li>
                                                    <li><a href="dash.jsp">Dashboard</a></li>
                                                    <li class="active"><a href="search.jsp">Find Mentors</a></li>
                                                    <li><a href="relationships.jsp">Relationships</a></li>
                                                    <li><a href="profile.jsp">My Profile</a></li>
                                                </ul>
                                            </div><!--/.well -->
                                        </div><!--/span-->
                                        
                                        <!-- Main hero unit for a primary marketing message or call to action -->
                                        <div class="span8">
                                        	<div id="search-div" class="well" style="height:100px;">
                                                <form id="search-form" class="navbar-search pull-left" action="/search">
   													
   												 <label class="checkbox inline">
												  <input type="checkbox" name="search-options-majors" value="majors" >
												  Major
												</label>
												<label class="checkbox inline">
												  <input type="checkbox" id="search-options-zipcode" value="zipcode" >
												  Zipcode
												</label>
												<label class="checkbox inline">
												  <input type="checkbox" name="search-options-interests" value="interests" >
												  Interests
												</label>
												<label class="checkbox inline">
												  <input type="checkbox" name="search-options-classes" value="classes" >
												  Classes
												</label>
												<p>
												<br/>
    											<input type="submit" value="Go" class="btn btn-large btn-primary" />
    											</p>

                                                </form>
                                             
                                            </div>
                                           
                                         	<div>
                                            	<h3>Search Results <small>for weed</small></h3>
                                                <div class="tabbable tabs-right">
                                        		<ul class="nav nav-tabs nav-stacked" id="search-result" style="width:100%;">
                                            		<li><a href="#">
                                                    	<h4>Asad Malik</h4>
                                                    	<img src="img/SampleProfileImage.jpeg" class="img-polaroid" style="height:inherit; width:150px;">                                                   
                                                    	<br/> 
                                                    	<br/><strong>Major(s): </strong>Electrical Engineering	
                                                    	<br/><strong>Interests:</strong> smoking weed, playing raquetball
                                                    	</a>
                                                    </li>
                                                    </ul>
                                               </div>
                                            </div>   
                                            
                                        </div>
                                        
   <script>
/* attach a submit handler to the form */
$("#search-form").submit(function(event) {
 
  /* stop form from submitting normally */
  event.preventDefault();
 
  /* get some values from elements on the page: */
  var $form = $( this ),
  	  email = "test@test.com",
      majors = $form.find('input[name="search-options-majors"]').is(':checked')? "true":"false",
      home = $form.find('input[name="search-options-zipcode"]').is(':checked')? "true":"false",
      act = $form.find('input[name="search-options-interests"]').is(':checked')? "true":"false",
      classes = $form.find('input[name="search-options-classes"]').is(':checked')? "true":"false",
      url = $form.attr( 'action' );
  
  var json = {}
 
  /* Send the data using post */
  var posting = $.post( url, { email: email, 
	  majors: majors,
	  zipcode: home,
	  interests: act,
	  classes: classes,
	  } );
 
  /* Put the results in a div
  		You've got json coming back at you with
  		all the fields from a mentor in the matches
  		field, so process and insert into HTML as you wish */
  posting.done(function( data ) {
    var matches = $( data ).find( '#matches' );
    $( "#search-result" ).empty().append( matches );
  });
});
</script>                                  
                                        
                                        
<%@include file="footer.jsp" %>   
	