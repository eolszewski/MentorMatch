<%@include file="master.jsp" %>
                                 <title>MentorMatch - Registration</title>

								
								<script type="text/javascript">
									function submitRegistration(){

										var majorArray = [];
										var index = 0;
										$('label.major').each(function(){
											majorArray[index] = $(this).attr('value');
											index++;
										});
										
										var interestArray = []; index = 0;
										$('label.interest').each(function(){
											interestArray[index] = $(this).attr('value');
											index++;
										});
										
										var curcourseArray = []; index = 0;
										$('label.curcourse').each(function(){
											curcourseArray[index] = $(this).attr('value');
											index++;
										});
										
										var pastcourseArray = []; index = 0;
										$('label.pastcourse').each(function(){
											pastcourseArray[index] = $(this).attr('value');
											index++;
										});
										
										//build json
										var jsonObj = new Object();
										jsonObj.email = $('#emailReg').val();
										jsonObj.password = $('#passwordReg').val();
										jsonObj.firstName = $('#fname').val();
										jsonObj.lastName = $('#lname').val();
										jsonObj.zipcode = $('#zip').val();
										jsonObj.majors = majorArray;
										jsonObj.interests = interestArray;
										jsonObj.currentCourses = curcourseArray;
										jsonObj.pastCourses = pastcourseArray;
										var jsonData = JSON.stringify(jsonObj);
										//alert(jsonData);
									
										$.post("register", {json: jsonData}, function(data){
											
											if (data.Error != null)
											{
												alert(data.Error);	
											}
											else
											{
												setCookie('email', data.Email, 1);
												setCookie('firstName', data.FirstName, 1);
												document.location = "dash.jsp";
											}
										
										}, 'json');
										
										
										return false;  // prevents the page from refreshing before JSON is read from server response
										
									}
									
									function removeChoice(item) {
										
										var element = document.getElementById(item);
										element.parentNode.removeChild(element);
										return false;
									}
								
								 	function addMajor() {
										var major = $('#majors').val();
										$('#majors').val("");
										$('#majors').focus();
										
										if ($("#m" + major).get(0))
										{
											alert("You've already added this major.");
											return false;	
										}
										
										if (major.length <= 0)
										{
											return false;	
										}
										
										
										var listItem = '<div id="m'+ major +'" class="well well-tiny" style="width:200px;">' +
										'<label class="major" value="' + major + '">' + major + 
										'<button class="close" onClick="return removeChoice(&quot;m' +
										major + 
										'&quot;);">&times;</button></label></div>';

										document.getElementById("selectedMajors").innerHTML += listItem;
								 	}
								 	
									function addInterest() {
										var interest = $('#interests').val();
										$('#interests').val("");
										$('#interests').focus();
										if ($("#i" + interest).get(0))
										{
											alert("You've already added this interest.");
											return false;	
										}
										
										if (interest.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="i'+ interest +'"class="well well-tiny" style="width:200px;">' +
										'<label class="interest" value="' + interest + '">' + interest + 
										'<button class="close" onClick="return removeChoice(&quot;i' +
										interest + 
										'&quot;);">&times;</button></label></div>';
										
										document.getElementById("selectedInterests").innerHTML += listItem;
									}
									function addCurrentCourse() {
										var curcourse = $('#currentcourses').val();
										$('#currentcourses').val("");
										$('#currentcourses').focus();
										if ($("#cc" + curcourse).get(0))
										{
											alert("You've already added this course.");
											return false;	
										}
										
										if (curcourse.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="cc'+ curcourse +'"class="well well-tiny" style="width:200px;">' +
										'<label class="curcourse" value="' + curcourse + '">' + curcourse + 
										'<button class="close" onClick="return removeChoice(&quot;cc' +
										curcourse + 
										'&quot;)">&times;</button></label></div>';
										
										document.getElementById("selectedCurCourses").innerHTML += listItem;
									}
									function addPastCourse() {
										var pastcourse = $('#pastcourses').val();
										$('#pastcourses').val("");
										$('#pastcourses').focus();
										if ($("#pc" + pastcourse).get(0))
										{
											alert("You've already added this course.");
											return false;	
										}
										
										if (pastcourse.length <= 0)
										{
											return false;	
										}
										
										var listItem = '<div id="pc'+ pastcourse +'"class="well well-tiny" style="width:200px;">' +
										'<label class="pastcourse" value="' + pastcourse + '">' + pastcourse + 
										'<button class="close" onClick="return removeChoice(&quot;pc' +
										pastcourse + 
										'&quot;)">&times;</button></label></div>';
										
										document.getElementById("selectedPastCourses").innerHTML += listItem;
									}
									
									//autocomplete stuff. later we can change this to pull from a datastore	
									$(function() {
									    var availableTags = [
									      "Aerospace Engineering",
									      "Electrical Engineering",
									      "Chemical Engineering",
									      "Civil Engineering",
									      "Petroleum Engineering",
									      "Computer Science",
									      "Management",
									      "Management Information Systems",
									      "Economics",
									      "Business Honors Program",
									      "Plan II",
									      "Computer Science",
									      "Software Engineering",
									      "Art",
									      "Woman Studies",
									      "English",
									      "Business",
									      "Hebrew",
									      "Biomedical Engineering",
									      "Math",
									      "Physics",
									      "Physical Education"
									    ];
									    $( "#majors" ).autocomplete({
									      source: availableTags
									    });
									  });
									
									$(function() {
									    var availableTags = [
									      "Football",
									      "Basketball",
									      "Baseball",
									      "Hockey",
									      "Greek Life",
									      "Computers",
									      "Weight Lifting",
									      "Gardening",
									      "Cooking",
									      "Eating",
									      "Golfing",
									      "Partying",
									      "Swimming",
									      "Biking"
									    ];
									    $( "#interests" ).autocomplete({
									      source: availableTags
									    });
									  });
									
									$(function() {
									    var availableTags = [
									      "EE 123K",
									      "EE 461L",
									      "EE 360P",
									      "EE 360C",									      
									      "EE 361M",
									      "EE 360T",									      
									      "EE 361M",
									      "EE 306",									      
									      "EE 316",
									      "EE 302",
									      "EE 319K",
									      "M 408D",
									      "EE 312",
									      "EE 313",									      
									      "M 427K",
									      "M 427L",									      
									      "PHY 301",
									      "ASE 201",
									      "TD 303",
									      "MIS 301",
									      "UGS 301"
									    ];
									    $( "#currentcourses" ).autocomplete({
									      source: availableTags
									    });
									  });
									
									$(function() {
									    var availableTags = [
									      "EE 123K",
									      "EE 461L",
									      "EE 360P",
									      "EE 360C",									      
									      "EE 361M",
									      "EE 360T",									      
									      "EE 361M",
									      "EE 306",									      
									      "EE 316",
									      "EE 302",
									      "EE 319K",
									      "M 408D",
									      "EE 312",
									      "EE 313",									      
									      "M 427K",
									      "M 427L",									      
									      "PHY 301",
									      "ASE 201",
									      "TD 303",
									      "MIS 301",
									      "UGS 301"
									    ];
									    $( "#pastcourses" ).autocomplete({
									      source: availableTags
									    });
									  });

									
								</script>                                     

                                 <div class="container">
                                 
                                     <div class="well span11">
                                     
                                     <legend><h3>Registration</h3></legend>
                                     <div id="errorDiv"></div>
                                     	<div class="span5">
 												
												<form id="infoForm">
												 <div class="control-group">
                                                 	<label class="control-label">Email</label>
													<div class="controls">
													 	<input id="emailReg" type="text" placeholder="example@example.com">
													</div></div>
													
													<div class="control-group">
                                                     <label class="control-label">Password</label>
                                                     <div class="controls">
													 	<input id="passwordReg" type="password" placeholder="Password">
                                                    </div></div>
													
													<div class="control-group">
                                                     <label class="control-label">First Name</label>
                                                     <div class="controls">
													 	<input id="fname" type="text" placeholder="Jane">
                                                     </div></div>
                                                     
                                                     <div class="control-group">
                                                     <label class="control-label">Last Name</label>
                                                     <div class="controls">
													 	<input id="lname" type="text" placeholder="Doe">
                                                     </div></div>
                                                     
                                                     <div class="control-group">
                                                     <label class="control-label">Zipcode</label>
                                                     <div class="controls">
													 	<input id="zip" type="text" placeholder="Ex: 78705">
                                                    </div></div>
													
													<div class="controls">
													<button id="submitb" class="btn" type="submit" onClick="submitRegistration(); return false;">Submit</button>
													</div>
  												</form>
  												<script>
  												var metrics = [
  												               [ '#emailReg', 'presence', 'Cannot be empty' ],
  												               [ '#passwordReg', 'min-length:6', 'Must be at least 6 characters long' ],
  												            	[ '#fname', 'presence', 'Cannot be empty' ],
  												          		[ '#lname', 'presence', 'Cannot be empty' ],
  												         		[ '#zip', 'integer', 'Must be a number' ],
  												         		[ '#zip', 'exact-length:5', 'Must be 5 digits' ],
  												         		
  												             ];
  															              
  												             $("#infoForm").nod( metrics );	
  												</script>
                                         </div>
                                          
                                          <div class="span3">
                                          
	                                          <label>Major(s)</label>
	                                          <div class="input-append">
	                                             <input id="majors" type="text" placeholder="Type to find majors">
	                                             <button id="majorb" class="btn" type="button" onClick="addMajor()">Add</button>
	                                           </div>
	                                          <div id="selectedMajors" ></div>
	                                          
	                                          <label>Interests</label>
	                                          <div class="input-append">
	                                                       <input id="interests" type="text" data-provide="typeahead" placeholder="Type to find interests">
	                                                       <button id="interestb" class="btn" type="button" onClick="addInterest()">Add</button>
	                                                     </div>
	                                          <div id="selectedInterests"></div> 
                                          </div>
                                          
                                          <div class="span3">
                                          
                                              <label>Current Courses</label>                               
                                              <div class="input-append">
                                                <input id="currentcourses" type="text" data-provide="typeahead" placeholder="Type to find courses">
                                                <button id="ccourseb" class="btn" type="button" onClick="addCurrentCourse()">Add</button>
                                              </div> 
                                              
                                              <div id="selectedCurCourses"></div>
                                              
                                              <label>Past Courses</label>
                                              <div class="input-append">
                                                <input id="pastcourses" type="text" data-provide="typeahead" placeholder="Type to find courses">
                                                <button id="pcourseb" class="btn" type="button" onClick="addPastCourse()">Add</button>
                                              </div>
                                              <div id="selectedPastCourses"></div> 
                                          </div>
                                        
                                      	
                                         
                                     </div>
                                     
                                     
                                     
<%@include file="footer.jsp" %>   