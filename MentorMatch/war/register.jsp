<%@include file="master.jsp" %>
                                 <title>MentorMatch - Registration</title>

								
								<script type="text/javascript">
								
									function submitRegistration(){
										//validate data
										var email5 = $('#emailReg').val();
										if (email5.length <= 0)
										{
											document.getElementById("loginDiv").innerHTML="fuck";
										}
										
										var majorArray = [];
										var index = 0;
										$('label.major').each(function(){
											//alert($(this).attr('value'));
											majorArray[index] = $(this).attr('value');
											index++;
										});
										
										var interestArray = []; index = 0;
										$('label.interest').each(function(){
											//alert($(this).attr('value'));
											interestArray[index] = $(this).attr('value');
											index++;
										});
										
										var curcourseArray = []; index = 0;
										$('label.curcourse').each(function(){
											//alert($(this).attr('value'));
											curcourseArray[index] = $(this).attr('value');
											index++;
										});
										
										var pastcourseArray = []; index = 0;
										$('label.pastcourse').each(function(){
											//alert($(this).attr('value'));
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
										alert(jsonData);
									
										$.post("register", {json: jsonData}, function(data){
											
											if (data.Email === 'null')
											{
												alert("Sorry, we had issues creating your account. Please try again.");	
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
									      "Mechanical Engineering"
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
									      "Weight Lifting"
									    ];
									    $( "#interests" ).autocomplete({
									      source: availableTags
									    });
									  });
									
									$(function() {
									    var availableTags = [
									      "EE 123K",
									      "EE 461L",
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
                                     	<div class="span3">
 												<fieldset>
 												
                                                 	
                                                 	<label>Email</label>
													 	<input id="emailReg" type="text" placeholder="example@example.com">
                                                     <br/>

                                                     <label>Password</label>
													 	<input id="passwordReg" type="password" placeholder="Password">
                                                     <br/>
 													<label>First Name</label>
													 	<input id="fname" type="text" placeholder="Jane">
                                                     <br/>
                                                     <label>Last Name</label>
													 	<input id="lname" type="text" placeholder="Doe">
                                                     <br/>
                                                     <label>ZipCode</label>
													 	<input id="zip" type="text" placeholder="Ex: 78705">
                                                     <br/>

  
                                                                                                         
 											<br/><button class="btn" onClick="submitRegistration(); return false;">Submit</button>
 													</fieldset>
                                         </div>
                                          
                                          <div class="span3">
                                          
	                                          <label>Major(s)</label>
	                                          <div class="input-append">
	                                             <input id="majors" type="text" placeholder="Type to find majors">
	                                             <button class="btn" type="button" onClick="addMajor()">Add</button>
	                                           </div>
	                                          <div id="selectedMajors" ></div>
	                                          
	                                          <label>Interests</label>
	                                          <div class="input-append">
	                                                       <input id="interests" type="text" data-provide="typeahead" placeholder="Type to find interests">
	                                                       <button class="btn" type="button" onClick="addInterest()">Add</button>
	                                                     </div>
	                                          <div id="selectedInterests"></div> 
                                          </div>
                                          
                                          <div class="span3">
                                          
                                              <label>Current Courses</label>                               
                                              <div class="input-append">
                                                <input id="currentcourses" type="text" data-provide="typeahead" placeholder="Type to find courses">
                                                <button class="btn" type="button" onClick="addCurrentCourse()">Add</button>
                                              </div> 
                                              
                                              <div id="selectedCurCourses"></div>
                                              
                                              <label>Past Courses</label>
                                              <div class="input-append">
                                                <input id="pastcourses" type="text" data-provide="typeahead" placeholder="Type to find courses">
                                                <button class="btn" type="button" onClick="addPastCourse()">Add</button>
                                              </div>
                                              <div id="selectedPastCourses"></div> 
                                          </div>
                                        
                                      	
                                         
                                     </div>
                                     
                                     
                                     
<%@include file="footer.jsp" %>   