<%@include file="master.jsp" %>
                                 <title>MentorMatch - Registration</title>
                                 
                                 <script>   
                                 js_cols.require('js_cols.Queue');  
								</script>
								
								<script type="text/javascript">
								
									function submitRegistration(){
										//validate data
										
										
										//build json
										var jsonObj = new Object();
										jsonObj.email = $('#emailReg').val();
										jsonObj.password = $('#passwordReg').val();
										jsonObj.firstName = $('#fname').val();
										jsonObj.lastName = $('#lname').val();
										jsonObj.zipcode = $('#zip').val();
										var jsonData = JSON.stringify(jsonObj);
										
									
										$.post("register", {json: jsonData}, function(data){
											
											if (data.Email === 'null')
											{
												alert("Sorry, we had issues creating your account. Please try again.");	
											}
											else
											{
												setCookie('email', obj.Email, 1);
												setCookie('firstName', obj.FirstName, 1);
												document.location = "dash.jsp";
											}
										
										}, 'json');
										
										
										return false;  // prevents the page from refreshing before JSON is read from server response
										
									}
									
									function removeChoice(item) {
										
										element = document.getElementById(item);
										element.parentNode.removeChild(element);
										
									} 
									
									function getMajors()
									{
										var majorArray = new Array();
										var index = 0;
										$('label.major').each(function(){
											//alert($(this).attr('value'));
											majorArray[index] = $(this).attr('value');
										});
									}
								
								 	function addMajor() {
										var major = $('#majors').val();
										$('#majors').val("")
										
										if ($("#" + major).get(0))
										{
											alert("You've already added this major.");
											return false;	
										}
										
										if (major.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="'+ major +'"class="well well-small" style="width:200px;">' +
										'<label class="major" value="' + major + '">' + major + 
										'<button class="close" onClick="removeChoice(&quot;' +
										major + 
										'&quot;);return false;">&times;</button></label></div>';
										
										//majorQueue.enqueue(major);
										document.getElementById("selectedMajors").innerHTML += listItem;
								 	}
								 	
									function addInterest() {
										var interest = $('#interests').val();
										$('#interests').val("")
										if ($("#" + interest).get(0))
										{
											alert("You've already added this interest.");
											return false;	
										}
										
										if (interest.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="'+ interest +'"class="well well-small" style="width:200px;">' +
										'<label class="interest" value="' + interest + '">' + interest + 
										'<button class="close" onClick="removeChoice(&quot;' +
										interest + 
										'&quot;);return false;">&times;</button></label></div>';
										
										document.getElementById("selectedInterests").innerHTML += listItem;
											
									}
									function addCurrentCourse() {
										var curcourse = $('#currentcourses').val();
										$('#currentcourses').val("")
										if ($("#" + curcourse).get(0))
										{
											alert("You've already added this course.");
											return false;	
										}
										
										if (curcourse.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="'+ curcourse +'"class="well well-small" style="width:200px;">' +
										'<label class="curcourse" value="' + curcourse + '">' + curcourse + 
										'<button class="close" onClick="removeChoice(&quot;' +
										curcourse + 
										'&quot;);return false;">&times;</button></label></div>';
										
										document.getElementById("selectedCurCourses").innerHTML += listItem;
											
									}
									function addPastCourse() {
										var pastcourse = $('#pastcourses').val();
										$('#pastcourses').val("")
										if ($("#" + pastcourse).get(0))
										{
											alert("You've already added this course.");
											return false;	
										}
										
										if (pastcourse.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="'+ pastcourse +'"class="well well-small" style="width:200px;">' +
										'<label class="pastcourse" value="' + pastcourse + '">' + pastcourse + 
										'<button class="close" onClick="removeChoice(&quot;' +
										pastcourse + 
										'&quot;);return false;">&times;</button></label></div>';
										
										document.getElementById("selectedPastCourses").innerHTML += listItem;
									}

									
								</script>                                     

                                 <div class="container">
                                 
                                     <div class="span11">
                                     	<div class="well">
                                                <form autocomplete="off">
 												<fieldset>
 												<legend><h3>Registration</h3></legend>
                                                 	<label>Email</label>
													 	<input id="emailReg" type="text" placeholder="Type something">
                                                     <br/>
                                                     <label>Password</label>
													 	<input id="passwordReg" type="password" placeholder="Password">
                                                     <br/>
 													<label>First Name</label>
													 	<input id="fname" type="text" placeholder="Type something">
                                                     <br/>
                                                     <label>Last Name</label>
													 	<input id="lname" type="text" placeholder="Type something">
                                                     <br/>
                                                     <label>ZipCode</label>
													 	<input id="zip" type="text" placeholder="Ex: 78705">
                                                     <br/>
                                                     <label>Major(s)</label>
                                                     <div class="input-append">
                                                       <input id="majors" type="text" data-provide="typeahead">
                                                       <button class="btn" type="button" onClick="addMajor()">Add</button>
                                                     </div>
                                                     
                                                     <div id="selectedMajors"></div>
                                                     
                                                     <label>Interests</label>
                                                     <div class="input-append">
                                                       <input id="interests" type="text" data-provide="typeahead">
                                                       <button class="btn" type="button" onClick="addInterest()">Add</button>
                                                     </div>
                                                     
                                                     <div id="selectedInterests"></div> 
                                                     
                                                     <label>Current Courses</label>
                                                     <div class="input-append">
                                                       <input id="currentcourses" type="text" data-provide="typeahead">
                                                       <button class="btn" type="button" onClick="addCurrentCourse()">Add</button>
                                                     </div> 
                                                     
                                                     <div id="selectedCurCourses"></div>
                                                     
                                                     <label>Past Courses</label>
                                                     <div class="input-append">
                                                       <input id="pastcourses" type="text" data-provide="typeahead">
                                                       <button class="btn" type="button" onClick="addPastCourse()">Add</button>
                                                     </div> 
                                                     
                                                     <div id="selectedPastCourses"></div>

                                                     <table class="table table-hover">
                                                      
                                                     </table>
                                                                                                         
 											<br/><button class="btn" onClick="submitRegistration(); return false;">Submit</button>
 													</fieldset>
 												</form>
                                         </div>
                                          
                                        
                                      	
                                         
                                     </div>
                                     
                                     
                                     
<%@include file="footer.jsp" %>   