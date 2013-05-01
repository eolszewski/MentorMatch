<%@include file="master.jsp"%>

<link href="css/bootstrapSwitch.css" rel="stylesheet">
<script src="js/bootstrapSwitch.js"></script>

<script>
//redirect if not logged in
if (getCookie('email') == null) { document.location = 'home.jsp';}

	//autocomplete stuff. later we can change this to pull from a datastore	
	$(function() {
	    var availableTags = [
	      "How to get an 'A' in 461L",
	      "Should I pledge a fraternity?",
	      "Who should I take for EE 360C?",
	      "Are there any engineers that play squash?",
	      "What is Professor Aziz's favorite company?",
	      "Why does ACA smell?"
	    ];
	    $( "#search" ).autocomplete({
	      source: availableTags
	    });
	  });
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
                                                    <li><a href="editProfile.jsp">Edit Profile</a></li>
			</ul>
		</div>
		<!--/.well -->
	</div>
	<!--/span-->

	<div class="span8">
		<div id="search-div" class="well">
			<h3>
				Find Your Match <small>Enter your search criteria</small>
			</h3>
            <div class="input-append">
               <input id="search" type="text" placeholder="Search">
             </div>
            <div id="selectedMajors" ></div>                        
			<form id="search-form" class="form" action="/search">
			<h3><small>Or use your profile</small></h3>
				<div class="row">
					<div id="majors-sw" class="control-group span2">
						<label class="control-label" for="majors"><strong>Majors</strong></label>
						<div class="controls">
							<div class="switch" tabindex="0" style="height: 30px;">
								<input id="majors" type="checkbox" />
							</div>
						</div>
					</div>
					<div id="current-courses-sw" class="control-group span2">
						<label class="control-label" for="current-courses"><strong>Current
								Courses</strong></label>
						<div class="controls">
							<div class="switch" tabindex="0" style="height: 30px;">
								<input name="current-courses" id="current-courses"
									type="checkbox" />
							</div>
						</div>
					</div>
					<div id="past-courses-sw" class="control-group span2">
						<label class="control-label" for="past-courses"><strong>Past
								Courses</strong></label>
						<div class="controls">
							<div class="switch" tabindex="0" style="height: 30px;">
								<input id="past-courses" type="checkbox" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div id="hometown-sw" class="control-group span2">
						<label class="control-label" for="hometown"><strong>Hometown</strong></label>
						<div class="controls">
							<div class="switch" tabindex="0" style="height: 30px;">
								<input id="hometown" type="checkbox" />
							</div>
						</div>
					</div>
					<div id="interests-sw" class="control-group span2">
						<label class="control-label" for="interests"><strong>Interests</strong></label>
						<div class="controls">
							<div class="switch" tabindex="0" style="height: 30px;">
								<input id="interests" type="checkbox" />
							</div>
						</div>
					</div>
					<div id="classification-sw" class="control-group span2">
						<label class="control-label" for="classification"><strong>Classification</strong></label>
						<div class="controls">
							<div class="switch" tabindex="0" style="height: 30px;">
								<input id="classification" type="checkbox" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">


					
					<div class="span2 pull-right">

						<input type="submit" value="Go"
							class="btn btn-large btn-block btn-primary span" />

					</div>

				</div>


			</form>

		</div>

		<div id="search-results"></div>

	</div>
	<%@include file="footer.jsp"%>
</div><!-- /container -->

<!-- TODO:
   		HTML TEMPLATES, PAGINATION, AUTOMATIC RESULT LOADING 
   -->

<div id="message-sender" class="modal hide fade in" style="display: none;">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">x</a>
		<div id="message-recipient"></div>
		
		
	</div>
	<div hidden="true" id="recipient-email"></div>
	<div class="modal-body">
			<textarea name="comments" id="message-text" rows="8" style="width:100%" ></textarea>
	</div>
	<div class="modal-footer">
		<input type="submit" onClick="sendMessage(); return false;" class="btn btn-primary" data-dismiss="modal" value="Send Message"/><a href="#"
			class="btn" data-dismiss="modal">Cancel</a>
	</div>

</div>

<script>
   function sendMessage(){
  	var recipient = document.getElementById("recipient-email").value;
  	var message = document.getElementById("message-text").value;
  	var sender = getCookie('email');
  	var jsonObj = new Object();
	jsonObj.recipient = recipient;
	jsonObj.sender = sender;
	jsonObj.message = message;
	var jsonData = JSON.stringify(jsonObj);
	

	$.post("message", {json: jsonData}, function(data){
		
		if (data.Email === 'null')
		{
			alert("Sorry, we don't have an account associated with the email address you entered.");	
		}
		else if (data.Password === 0)
		{
			alert("The password you entered is incorrect.");
		}
		else
		{
			setCookie('email', data.Email, 1);
			setCookie('firstName', data.FirstName, 1);
			//return true;
			document.location = "dash.jsp";
		}
	
	}, 'json');
	
	
	return false;  // prevents the page from refreshing before JSON is read from server response
	}
									  
/* attach a submit handler to the form */
$("#search-form").submit(function(event) {
 
  /* stop form from submitting normally */
  event.preventDefault();
 
  /* get some values from elements on the page: */
  var params = "";
  
  /* get some values from elements on the page: */
  var params = new Array(),  	
  	  email = getCookie('email'),   	
      url = $('#search-form').attr( 'action' );
  
  if ( $('#majors-sw').bootstrapSwitch('status') ) { params.push('Majors')};
  if ( $('#current-courses-sw').bootstrapSwitch('status') ) { params.push('Current_Courses')};
  if ( $('#classification-sw').bootstrapSwitch('status') ) { params.push('Classification')};
  if ( $('#hometown-sw').bootstrapSwitch('status') ) { params.push('ZipCode')};
  if ( $('#interests-sw').bootstrapSwitch('status') ) { params.push('Interests')};
  if ( $('#past-courses-sw').bootstrapSwitch('status') ) { params.push('Past_Courses')};
  var searchQuery = document.getElementById("search").value;
  params.push(searchQuery);
  
  if ( params.length == 0 ) {
	  var result = '<div class="alert alert-block">Please select search criteria.</div>';    	
		document.getElementById("search-results").innerHTML = result;
  } else {
   
	  var out = JSON.stringify(params);
  /* Send the data using post */
  	var posting = $.post( url, { email: email, 
	 	params: out,
	 });
 
  /* Put the results in a div
  		You've got json coming back at you with
  		all the fields from a mentor in the matches
  		field, so process and insert into HTML as you wish */
  	posting.done(function( data ) {
   	 var result = jQuery.parseJSON(data);
    	if (result.matches.length != "0") {
    		var resultTitle = '<h3>Search Results</h3><div class="tabbable tabs-right">'+
							'<ul class="thumbnails" id="search-results-item" style="width:100%;">'+
    						'</ul></div>';    	
    		document.getElementById("search-results").innerHTML = resultTitle; 
    	} else {
    		var resultTitle = '<h3>No Results Found</h3><div class="tabbable tabs-right">'+
							'<ul class="nav nav-tabs nav-stacked" id="search-results-item" style="width:100%;">'+
							'</ul></div>';    	
			document.getElementById("search-results").innerHTML = resultTitle;
    	}
    for (var i=0; i<result.matches.length; i++) {
    	var resultItem = '<li class=><div class="well"><h4>'+result.matches[i].FirstName+' '+result.matches[i].LastName+'</h4>'+ 
    						'<strong>Major(s): </strong>'+result.matches[i].Majors+
    						'<br/><strong>Current Courses: </strong>' +result.matches[i].Current_Courses+
    						'<br/><strong>Past Courses: </strong>' +result.matches[i].Past_Courses+
    						'<br/><strong>Interests: </strong>' +result.matches[i].Interests+
    						'<br/><strong>ZipCode: </strong>' +result.matches[i].ZipCode+
    						'<br/><a data-target="#message-sender" role="button" class="btn btn-primary" data-toggle="modal">Message</a>'+
    						'</a></div></li>';
    						
    	 document.getElementById("search-results-item").innerHTML += resultItem;    
    	 document.getElementById("message-recipient").innerHTML = '<h3>'+result.matches[i].FirstName+' '+result.matches[i].LastName+'</h3>'; 
    	 document.getElementById("recipient-email").value = result.matches[i].Email;	
    }    
  });
  } // else
});
</script>

<script>
//$('#hometown').on('switch-change', doSearch());
</script>



