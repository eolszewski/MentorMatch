<%@include file="master.jsp" %>
                                    <title>MentorMatch - Registration</title>
                                    
											<script type="text/javascript">
											 
											 	function addMajor() {
													var major = document.getElementById('majors').value;
													alert(major + " added");
														
												}
												function addMajor() {
													var interest = document.getElementById('interests').value;
													alert(interest + " added");
														
												}
												function addMajor() {
													var currentcourse = document.getElementById('currentcourses').value;
													alert(currentcourse + " added");
														
												}
												function addMajor() {
													var pastcourse = document.getElementById('pastcourses').value;
													alert(pastcourse + " added");
														
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
                                                   <form autocomplete="off">
    												<fieldset>
    												<legend><h3>Registration</h3></legend>
                                                    	<label>Email</label>
   													 	<input type="text" placeholder="Type something">
                                                        <br/>
                                                        <label>Password</label>
   													 	<input type="password" placeholder="Password">
                                                        <br/>
    													<label>First Name</label>
   													 	<input type="text" placeholder="Type something">
                                                        <br/>
                                                        <label>Last Name</label>
   													 	<input type="text" placeholder="Type something">
                                                        <br/>
                                                        <label>ZipCode</label>
   													 	<input type="text" placeholder="Ex: 78705">
                                                        <br/>
                                                        <label>Major(s)</label>
                                                        <div class="input-append">
                                                          <input id="majors" type="text" data-provide="typeahead">
                                                          <button class="btn" type="button" onClick="addMajor()">Add</button>
                                                        </div> 
                                                        <label>Interests</label>
                                                        <div class="input-append">
                                                          <input id="interests" type="text" data-provide="typeahead">
                                                          <button class="btn" type="button" onClick="addInterest()">Add</button>
                                                        </div> 
                                                        <label>Current Courses</label>
                                                        <div class="input-append">
                                                          <input id="currentcourses" type="text" data-provide="typeahead">
                                                          <button class="btn" type="button" onClick="addCurrentCourse()">Add</button>
                                                        </div> 
                                                        <label>Past Courses</label>
                                                        <div class="input-append">
                                                          <input id="pastcourses" type="text" data-provide="typeahead">
                                                          <button class="btn" type="button" onClick="addPastCourse()">Add</button>
                                                        </div> 
                                                        <textarea id="alltext"></textarea>
														<ol onclick="addText(event)">
														<li>Hello</li>
														<li>World</li>
														<li>Earthlings</li>
														</ol>

														<script>
														function addText(event) {
													    var targ = event.target || event.srcElement;
													    document.getElementById("alltext").value += targ.textContent || targ.innerText;
														}
														</script>
                                                        <table class="table table-hover">
                                                         
                                                        </table>
                                                                                                            
    											<br/><button type="submit" class="btn">Submit</button>
    													</fieldset>
    												</form>
                                            </div>
                                             
                                           
                                         	
                                            
                                        </div>
                                        
                                        
                                        
<%@include file="footer.jsp" %>   