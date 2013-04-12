<%@include file="master.jsp" %>
<script>
//redirect if not logged in
if (getCookie('email') == null) { document.location = 'home.jsp';}
</script>
                                    <title>MentorMatch - Inbox</title>
                                    <div class="container">
                                        
                                        <div class="span2">
                                            <div class="tabbable tabs-left">
                                                <ul class="nav nav-tabs">
                                                    <li class="nav-header">Sidebar</li>
                                                    <li><a href="dash.jsp">Dashboard</a></li>
                                                    <li><a href="search.jsp">Find Mentors</a></li>
                                                    <li class="active"><a href="relationships.jsp">Relationships</a></li>
                                                    <li><a href="profile.jsp">My Profile</a></li>
                                                </ul>
                                            </div><!--/.well -->
                                        </div><!--/span-->
                                        
                                        <!-- Main hero unit for a primary marketing message or call to action -->
                                        <div class="span8">
                                           
                                         	<div>
                                            	<h3>Relationships</h3>
                                                <div class="tabbable tabs-right">
                                        		<ul class="nav nav-tabs nav-stacked" style="width:100%;">
                                            		<li><a href="#">
                                                    <h4>Asad Malik</h4>
                                                    <img src="img/SampleProfileImage.jpeg" class="img-polaroid" style="height:inherit; width:150px;">                                                   
                                                    <br/> 
                                                    <br/><strong>Major(s): </strong>Electrical Engineering	
                                                    <br/><strong>Interests:</strong> Football, Weight Lifting
                                                    </a>
                                                    </li>
                                                    <li><a href="#">
                                                    <h4>Sunny Olszewski</h4>
                                                    <img src="img/SampleProfileImage2.jpg" class="img-polaroid" style="height:inherit; width:150px;">                                     
                                                    <br/> 
                                                    <br/><strong>Major(s): </strong>Electrical Engineering	
                                                    <br/><strong>Interests:</strong> Knitting, Underwater Basket Weaving
                                                    </a></li>
                                                    <li><a href="#">
                                                    <h4>Adnan Aziz</h4>
                                                    	Computer Science
                                                    <br/>3rd Year
                                                    <br/>Interests: Food, Raquetball</a></li>
												</ul>
                                               </div>
                                            </div>   
                                            
                                        </div>
                                        
                                        
                                        
<%@include file="footer.jsp" %>   
	