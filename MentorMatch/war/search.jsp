<%@include file="master.jsp"%>

<link href="css/bootstrapSwitch.css" rel="stylesheet">
<script src="js/bootstrapSwitch.js"></script>
<script src="js/jqote2.js"></script>

<script>
//redirect if not logged in
if (getCookie('email') == null) { document.location = 'home.jsp';}
</script>


<title>MentorMatch - Search</title>

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
				Find Your Match <small>Select your search criteria</small>
			</h3>
			<form id="search-form" class="form" action="/search">
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
</div>
<!-- /container -->

<!-- TODO:
   		HTML TEMPLATES, PAGINATION, AUTOMATIC RESULT LOADING 
   -->

<div id="message-sender" class="modal hide fade in" style="display: none;">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">Ã</a>
		<div id="message-recipient"></div>
		
		
	</div>
	<div hidden="true" id="recipient-email"></div>
	<div class="modal-body">
			<textarea name="comments" id="message-text" rows="7" cols="30" ></textarea>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-primary" data-dismiss="modal">Send Message</a> <a href="#"
			class="btn" data-dismiss="modal">Cancel</a>
	</div>
</div>

<script>
   $('#message-sender').on('hidden', function () {
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
	})

/* attach a submit handler to the form */
$("#search-form").submit(function(event) {
 
  /* stop form from submitting normally */
  event.preventDefault();
 
  /* get some values from elements on the page: */
  var params = "";
  /*var $form = $( '#search-form' );  
	  past = $('#past-courses-sw').bootstrapSwitch('status'),
	  majors = $('#majors-courses-sw').bootstrapSwitch('status'),
	  classification = $('#classification-sw').bootstrapSwitch('status'),
	  interests = $('#interests-sw').bootstrapSwitch('status'),
	  hometown = $('#hometown-sw').bootstrapSwitch('status'),  	  
  	  majors = $form.find('input[name="search-options-majors"]').is(':checked')? "true":"false",
  	  home = $form.find('input[name="search-options-zipcode"]').is(':checked')? "true":"false",
  	  act = $form.find('input[name="search-options-interests"]').is(':checked')? "true":"false",
  	  current-courses = "hi", //, //$form.find('input[name="search-options-courses"]').is(':checked')? "true":"false", */
  
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
  
  if ( params.length == 0 ) {
	  var result = '<div class="alert alert-block">Please select search criteria.</div>';    	
		document.getElementById("search-results").innerHTML = result;
  } else {
   
	  var out = JSON.stringify(params);
  /* Send the data using post */
  	var posting = $.post( url, { email: email, 
	/*  majors: majors,
	 zipcode: hometown,
	 interests: interests,
	 currentcourses: current,
	 pastcourses: past,
	 classification: classification, */
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
    	var resultItem = '<li class=><div class="well row"><h4>'+result.matches[i].FirstName+' '+result.matches[i].LastName+'</h4>'+ '<a data-target="#message-sender" role="button" class="btn btn-primary" data-toggle="modal">Message</a>'+ 
    						'<br/><strong>Major(s): </strong>'+result.matches[i].Majors+
    						'<br/><strong>Current Courses: </strong>' +result.matches[i].Current_Courses+
    						'<br/><strong>Past Courses: </strong>' +result.matches[i].Past_Courses+
    						'<br/><strong>Interests: </strong>' +result.matches[i].Interests+
    						'<br/><strong>ZipCode: </strong>' +result.matches[i].ZipCode+
    						'</a></div></li>';
    						
    	 document.getElementById("search-results-item").innerHTML += resultItem;    
    	 document.getElementById("message-recipient").innerHTML += '<h3>'+result.matches[i].FirstName+' '+result.matches[i].LastName+'</h3>'; 
    	 document.getElementById("recipient-email").value = result.matches[i].Email;	
    }    
  });
  } // else
});
</script>

<script>
//$('#hometown').on('switch-change', doSearch());
</script>


<%@include file="footer.jsp"%>
