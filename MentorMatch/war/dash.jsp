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
                                        <div class="span8">
                                        	<div class="well">
                                            	<h3><center>New Messages</center></h3>
                                            	<div class="tabbable tabs-right">
                                        		    <ul id="new-messages" class="nav nav-pills nav-stacked">
    												</ul>
                                               </div>
                                            </div>
                                           
                                         	<div id="current-thread" class="hero-unit">
                                            	 </div>   
                                        </div>
                                        
<div id="message-sender" class="modal hide fade in" style="display: none;">
	<div class="modal-header">
		<a class="close" data-dismiss="modal">x</a>
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
	
	$('#message-text').val('');
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
	
var result;
                                        
$(document).ready(function() {

	  var email = getCookie('email');   	
      var url = "/dashboard";
	  
	  var posting = $.post( url, { email: email, 
		 	//params: out
	  });
	 
	  /* You've got json coming back at you with two lists (read and unread) of UserMessage objects. Looks like this.
	  {"email":"brad@test","unread":[
	                          {"email":"test@testbrad@test","id":"10","Body":"Message Uno.","To":"brad@test","From":"test@test","Request":false,"TimeStamp":"Apr 30, 2013 4:11:53 PM","Unread":true},
	                          {"email":"test@testbrad@test","id":"11","Body":"Message Dos.","To":"brad@test","From":"test@test","Request":false,"TimeStamp":"Apr 30, 2013 4:11:59 PM","Unread":true},
	                          {"email":"test@testbrad@test","id":"12","Body":"And a third one.","To":"brad@ etc etc */
	  
	  	posting.done(function(data) {
	   	 result = jQuery.parseJSON(data);
	   	 if (result.unread.length < 1)
	   	 {
	   		$('#new-messages').html('You have no new messages.');
	   	 }
	   	 else
	   		 {
			   	 for ( var i=0; i<result.unread.length; i++) {
			   		 var insert = '<li><a  id="'+i+'" class="thread" href="#">'+result.unread[i].FromFirstName + ' ' + result.unread[i].FromLastName + ' has sent you a message</a></li>';
			   		document.getElementById("new-messages").innerHTML += insert;
			   	 }	   	
	   		 }
	  	});
});

/* Click handler for the message li things we created above. */
$("#new-messages").on("click", 'a.thread', function(e) {
	e.preventDefault();
	var id = e.target.id;

	var name = result.unread[id].FromFirstName;
	var message = result.unread[id].Body;
	
	$("#new-messages li").each(function(index){
		$(this).attr('class','');
	});
	var element = document.getElementById(id);
	$(element.parentNode).attr('class','active');
	
	
	$('#current-thread').html('<h3>Message from ' + name + '</h3>');
	$('#current-thread').append('<p>'+message+'</p><br/>');
	$('#current-thread').append('<a data-target="#message-sender" role="button" class="btn-large btn-primary" data-toggle="modal">Reply</a>');
	$('#current-thread').append('<button class="btn btn-large btn-danger" type="button" style="float:right;" onClick="removeChoice('+id+');"">Delete</button>');
	document.getElementById("message-recipient").innerHTML = '<h3>'+result.unread[id].FromFirstName+' '+result.unread[id].FromLastName+'</h3>'; 
    document.getElementById("recipient-email").value = result.unread[id].From;
});

function removeChoice(item) {
	var element = document.getElementById(item);
	element.parentNode.removeChild(element);
	
	$('#current-thread').html('Message Deleted');
	
	return false;
	
	
}

</script>                                        
                                        
<%@include file="footer.jsp" %>   