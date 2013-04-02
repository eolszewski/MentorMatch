<%@include file="master.jsp" %>
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
                                        
                                        <!-- Main hero unit for a primary marketing message or call to action -->
                                        <div class="span8">
                                        	<div class="well" style="height:100px;">
                                                <form class="navbar-search pull-left">
   							
   												 <label class="checkbox inline">
												  <input type="checkbox" id="optionsMajor" value="true" checked>
												  Major
												</label>
												<label class="checkbox inline">
												  <input type="checkbox" id="optionsHometown" value="true">
												  Hometown
												</label>
												<label class="checkbox inline">
												  <input type="checkbox" id="optionsActivities" value="true">
												  Activities
												</label>
    											<input type="submit" value="Go" class="btn btn-large btn-primary" onClick="findMentors()">

                                                </form>
                                             
                                            </div>
                                           
                                         	<div>
                                            	<h3>Search Results <small>for weed</small></h3>
                                                <div class="tabbable tabs-right">
                                        		<ul class="nav nav-tabs nav-stacked" style="width:100%;">
                                            		<li><a href="#">
                                                    <h4>Asad Malik</h4>
                                                    <img src="img/SampleProfileImage.jpeg" class="img-polaroid" style="height:inherit; width:150px;">                                                   
                                                    <br/> 
                                                    <br/><strong>Major(s): </strong>Electrical Engineering	
                                                    <br/><strong>Interests:</strong> smoking weed, playing raquetball
                                                    </a>
                                                    </li>
                                                    <li><a href="#">
                                                    <h4>Sunny Olszewski</h4>
                                                    <img src="img/SampleProfileImage2.jpg" class="img-polaroid" style="height:inherit; width:150px;">                                     
                                                    <br/> 
                                                    <br/><strong>Major(s): </strong>Electrical Engineering	
                                                    <br/><strong>Interests:</strong> smoking weed, robbing banks
                                                    </a></li>
                                                    <li><a href="#">
                                                    <h4>Adnan Aziz</h4>
                                                    	Computer Science
                                                    <br/>3rd Year
                                                    <br/>Interests: smoking weed, all things jewish</a></li>												</ul>
                                               </div>
                                            </div>   
                                            
                                        </div>
                                        
   <script>
   function findMentors(thisObj, thisEvent) {
	   
	    var email = $('#email').val();

		var major = $('#optionsMajor').val();
		var hometown = $('#optionsHometown').val();
		var activities = $('#optionsActivities').val();
		
		var jsonObj = new Object();
		jsonObj.email = email;
		jsonObj.major = major;
		jsonObj.hometown = hometown;
		jsonObj.activities = activities;
		var jsonData = JSON.stringify(jsonObj);
		

		$.post("search", {json: jsonData}, function(data){
			
			// Display the data as required.
		
		}, 'json');
		
		
		return false;  // prevents the page from refreshing before JSON is read from server response
	}
   </script>
                                        
                                        
                                        
<%@include file="footer.jsp" %>   
	