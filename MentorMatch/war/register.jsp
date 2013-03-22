<%@include file="master.jsp" %>
                                    <title>MentorMatch - Registration</title>
                                    
											<script type="text/javascript">
											 
											 	function addMajor() {
													var major = document.getElementById('majors').value;
													alert(major);
														
												}
											 	 /* 
												var subjects = ['PHP'];
												$(function(){
													  $('.majors').typeahead({
														 items:4,
														 source: subjects
													  });
												 });
												 
												 $(document).ready(function(){
													alert("fuck");
												});
												*/
											</script>                                     

                                    <div class="container">
                                    
                                   
                                    
                                        <div class="span11">
                                        	<div class="well">
                                                   <form name="registerForm" autocomplete="off" method="post" action"Register">
    												<fieldset>
    												<legend><h3>Registration</h3></legend>
                                                    	<label>Email</label>
   													 	<input name ="Email" type="text" placeholder="Type something…">
                                                        <br/>
                                                        <label>Password</label>
   													 	<input name="Password" type="password" placeholder="Password">
                                                        <br/>
    													<label>First Name</label>
   													 	<input Name="FirstName" type="text" placeholder="Type something…">
                                                        <br/>
                                                        <label>Last Name</label>
   													 	<input name="LastName" type="text" placeholder="Type something…">
                                                        <br/>
                                                        <label>Major(s)</label>
                                                        <div class="input-append">
                                                          <input id="majors" type="text" data-provide="typeahead">
                                                          <button class="btn" type="button" onClick="addMajor()">Add</button>
                                                        </div> 
                                                        <table class="table table-hover">
                                                         
                                                        </table>
                                                                                                            
    											<br/><button type="button" onClick="register();" class="btn">Submit</button>
                                                	<br/><br/>
                                                    <span 
                                                                    class="g-signin"
                                                                    id="g-signin"
                                                                    data-callback="signinCallback"
                                                                    data-clientid="996517486385.apps.googleusercontent.com"
                                                                    data-cookiepolicy="single_host_origin"
                                                                    data-requestvisibleactions="http://schemas.google.com/AddActivity"
                                                                    data-scope="https://www.googleapis.com/auth/plus.login">
                                                                 </span>
                                                   
    													</fieldset>
    												</form>
                                            </div>
                                             
                                           
                                         	
                                            
                                        </div>
                                        
                                        <script type="text/javascript">
										
										function register() {
												document.getElementById('registerForm').submit();
												
										}
										  
										 
										 function signinCallback(authResult) {
											  if (authResult['access_token']) {
												// Successfully authorized
												// Hide the sign-in button now that the user is authorized, for example:
												document.getElementById('g-signin').setAttribute('style', 'display: none');
												alert("woohoo shit works!");
												
												
											  } else if (authResult['error']) {
												// There was an error.
												// Possible error codes:
												//   "access_denied" - User denied access to your app
												//   "immediate_failed" - Could not automatially log in the user
												// console.log('There was an error: ' + authResult['error']);
												alert("fuck you, give me access");
												
											  }
											}
									</script>
                                        
                                        
                                        
<%@include file="footer.jsp" %>   