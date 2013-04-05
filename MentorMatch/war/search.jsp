<%@include file="master.jsp" %>
<link href="css/bootstrapSwitch.css" rel="stylesheet">
<script src="js/bootstrapSwitch.js"></script>

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
                                        
                                        <div class="span8">
                                        	<div id="search-div" class="well" style="height:250px;" >
                                        	<h3>Find Your Match</h3>
                                                <form id="search-form" class="form row" action="/search">
                                                <div class="control-group span2">
											        <label id="majors-sw"class="control-label" for="majors"><strong>Majors</strong></label>
											        <div class="controls">
											            <div class="switch" tabindex="0" style="height:30px;">
											                <input id="majors" type="checkbox" />
											            </div>
											        </div>
											    </div>
											    <div id="current-classes-sw" class="control-group span2">
											        <label class="control-label" for="current-classes"><strong>Current Classes</strong></label>
											        <div class="controls">
											            <div  class="switch" tabindex="0" style="height:30px;">
											                <input name="current-classes" id="current-classes" type="checkbox" />
											            </div>
											        </div>
											    </div>
											    <div id="past-classes-sw" class="control-group span2">
											        <label class="control-label" for="past-classes"><strong>Past Classes</strong></label>
											        <div class="controls">
											            <div class="switch" tabindex="0" style="height:30px;">
											                <input id="past-classes" type="checkbox" />
											            </div>
											        </div>
											    </div>
											    <div id="hometown-sw" class="control-group span2">
											        <label class="control-label" for="hometown"><strong>Hometown</strong></label>
											        <div class="controls">
											            <div class="switch" tabindex="0" style="height:30px;">
											                <input id="hometown" type="checkbox" />
											            </div>
											        </div>
											    </div>
											    <div id="interests-sw" class="control-group span2">
											        <label class="control-label" for="interests"><strong>Interests</strong></label>
											        <div class="controls">
											            <div class="switch" tabindex="0" style="height:30px;">
											                <input id="interests" type="checkbox" />
											            </div>
											        </div>
											    </div>
											    <div id="classification-sw" class="control-group span2">
											        <label class="control-label" for="classification"><strong>Classification</strong></label>
											        <div class="controls">
											            <div class="switch" tabindex="0" style="height:30px;">
											                <input id="classification" type="checkbox" />
											            </div>
											        </div>
											    </div>   													
   												 
												<label class="checkbox inline">
												  <input type="checkbox" name="search-options-zipcode" value="zipcode" >
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
                                            	<h3>Search Results</h3>
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
  	  current = $('#current-classes-sw').bootstrapSwitch('status'),
  	  past = $('#past-classes-sw').bootstrapSwitch('status'),
  	  majors = $('#majors-classes-sw').bootstrapSwitch('status'),
  	  classification = $('#classification-sw').bootstrapSwitch('status'),
  	  interests = $('#interests-sw').bootstrapSwitch('status'),
  	  hometown = $('#hometown-sw').bootstrapSwitch('status')
  	  /*//getCookie('email'),
  	  
      majors = $form.find('input[name="search-options-majors"]').is(':checked')? "true":"false",
      home = $form.find('input[name="search-options-zipcode"]').is(':checked')? "true":"false",
      act = $form.find('input[name="search-options-interests"]').is(':checked')? "true":"false",
      current-classes = "hi", //, //$form.find('input[name="search-options-classes"]').is(':checked')? "true":"false", */
      url = $form.attr( 'action' );
  
  var json = {}
 
  /* Send the data using post */
  var posting = $.post( url, { email: email, 
	  majors: majors,
	 zipcode: hometown,
	 interests: interests,
	 currentClasses: current,
	 pastClasses: past,
	 classification: classification
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
	