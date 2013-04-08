<%@include file="master.jsp" %>

<link href="css/bootstrapSwitch.css" rel="stylesheet">
<script src="js/bootstrapSwitch.js"></script>
<script src="js/jqote2.js"></script>

<script>
//redirect if not logged in
if (getCookie('email') == null) { document.location = 'home.jsp';}
</script>


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
                                        	<div id="search-div" class="well" >
                                        	<h3>Find Your Match <small>Select your search criteria</small></h3>
                                                <form id="search-form" class="form" action="/search">
                                                <div class="row">
	                                                <div class="control-group span2">
												        <label id="majors-sw" class="control-label" for="majors"><strong>Majors</strong></label>
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
											    </div>
											    <div class="row">
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
											   </div>		
													<div class="row">
													
														<div class="span2 pull-right">
														
	    													<input type="submit" value="Go" class="btn btn-large btn-block btn-primary span" />
	    												
	    												</div>
	    											
	    											</div>
    											

                                                </form>
                                             
                                            </div>
                                           
                                         	<div id="search-results">
                                            	
                                            </div>   
                                            
                                        </div>
                                     </div> <!-- /container -->
   <!-- TODO:
   		HTML TEMPLATES, PAGINATION, AUTOMATIC RESULT LOADING 
   -->
                                     
   <script>
   
/* attach a submit handler to the form */
$("#search-form").submit(function(event) {
 
  /* stop form from submitting normally */
  event.preventDefault();
//function doSearch() { 
  /* get some values from elements on the page: */
  var $form = $( '#search-form' ),
  	  email = getCookie('email'), 
  	  current = $('#current-classes-sw').bootstrapSwitch('status'),
  	  past = $('#past-classes-sw').bootstrapSwitch('status'),
  	  majors = $('#majors-classes-sw').bootstrapSwitch('status'),
  	  classification = $('#classification-sw').bootstrapSwitch('status'),
  	  interests = $('#interests-sw').bootstrapSwitch('status'),
  	  hometown = $('#hometown-sw').bootstrapSwitch('status')
  	  /*//
  	  
      majors = $form.find('input[name="search-options-majors"]').is(':checked')? "true":"false",
      home = $form.find('input[name="search-options-zipcode"]').is(':checked')? "true":"false",
      act = $form.find('input[name="search-options-interests"]').is(':checked')? "true":"false",
      current-classes = "hi", //, //$form.find('input[name="search-options-classes"]').is(':checked')? "true":"false", */
      url = $form.attr( 'action' );
   
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
    var result = jQuery.parseJSON(data);
    if (result.matches.length != "0") {
    	var resultTitle = '<h3>Search Results</h3><div class="tabbable tabs-right">'+
							'<ul class="nav nav-tabs nav-stacked" id="search-results-item" style="width:100%;">'+
    						'</ul></div>';    	
    	document.getElementById("search-results").innerHTML = resultTitle; 
    }
    for (var i=0; i<result.matches.length; i++) {
    	var resultItem = '<li><a href="#"><h4>'+result.matches[i].FirstName+' '+result.matches[i].LastName+'</h4><br/>'+ 
    						'<br/><strong>Major(s): </strong>'+result.matches[i].Majors+	
    						'<br/><strong>ZipCode:</strong>' +result.matches[i].ZipCode+'</a></li>';

    	   document.getElementById("search-results-item").innerHTML += resultItem;    	
    }    
  });
});
</script> 


<script>
//$('#majors').change( alert("majors changed") );
</script>
<script>
//$('#hometown').on('switch-change', doSearch());
</script>                      
                                      
                                        
<%@include file="footer.jsp" %>   
	