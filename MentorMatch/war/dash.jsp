<%@include file="master.jsp" %>

<script>
//redirect if not logged in
if (getCookie('email') == null) { document.location = 'home.jsp';}
</script>
                                    <title>Matched Up - Dashboard</title>
                                    <div class="container">
                                        
                                        <div class="span2">
                                            <div class="tabbable tabs-left">
                                                <ul class="nav nav-tabs">
                                                    <li class="nav-header">Sidebar</li>
                                                    <li class="active"><a href="dash.jsp">Dashboard</a></li>
                                                    <li><a href="search.jsp">Find Mentors</a></li>
                                                    <li><a href="relationships.jsp">Relationships</a></li>
                                                    <li><a href="editProfile.jsp">Edit Profile</a></li>
                                                </ul>
                                            </div><!--/.well -->
                                        </div><!--/span-->
                                        
                                        <!-- Main hero unit for a primary marketing message or call to action -->
                                        <div class="span6">
                                        	<div class="well">
                                            	<h3><center>New Messages</center></h3>
                                            	<div id="new-messages" class="tabbable tabs-right">
                                        		    <ul class="nav nav-pills nav-stacked">
                                                    	<li class="active"><a href="#">Brad Stewart has sent you a message</a></li>
                                                        <li><a href="#">Andrew Liu has replied to your message</a></li>
                                                        <li><a href="#"></a></li>

    												</ul>
                                               </div>
                                            </div>
                                           
                                         	<div id="current-thread" class="hero-unit">
                                            	<h3>Message from Brad Stewart</h3>
                                                I LUBZ CHIKIN.
                                                <br/><br/>
                                            	<button class="btn btn-large btn-primary" type="button">Reply</button>
                                            </div>                                              
                                        </div>

                                        
                                        <div class="span3">
                                        	<div class="tabbable tabs-right">
                                            	<h4>Messages</h4>
                                        		<ul id="message-threads" class="nav nav-tabs nav-stacked" style="width:100%;">                                            		    
												</ul>
                                               </div>
                                        </div>
<script>
var result;

$(document).ready(function() {

	  var email = getCookie('email');   	
      var url = "/dashboard";
	  
	  //var out = JSON.stringify(params);
	  /* Send the data using post */
	  var posting = $.post( url, { email: email, 
		 	//params: out,
	  });
	 
	  /* Put the results in a div
	  		You've got json coming back at you with
	  		all the fields from a mentor in the matches
	  		field, so process and insert into HTML as you wish */
	  	posting.done(function(data) {
	   	 result = jQuery.parseJSON(data);
	   	 
	   	 for ( var i=0; i<result.unread.length; i++) {
	   		 var insert = '<li><a id="'+result.unread[i].email +'"class="thread" href="#">'+result.unread[i].To+'</a></li>';
	   		document.getElementById("message-threads").innerHTML += insert;
	   	 }	   	
	   	 
	  	});
});


	$("#message-threads").on("click", 'a.thread', function(e) {
		e.preventDefault();
		var id = e.target.id;
		alert(i);
		$('#current-thread').append('<h3'+e.value+'</h3>');
	});

</script>                                        
                                        
<%@include file="footer.jsp" %>   