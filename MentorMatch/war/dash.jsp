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
                                            	<h3 align="center">Recent Conversationsr</h3>
                                            	<div class="tabbable tabs-right">
                                        		    <ul class="nav nav-pills nav-stacked">
                                                    	<li class="active"><a href="#">Brad Stewart has sent you a message</a></li>
                                                        <li><a href="#">Andrew Liu has replied to your message</a></li>
                                                        <li><a href="#"></a></li>

    												</ul>
                                               </div>
                                            </div>
                                           
                                         	<div class="hero-unit">
                                            	<h3>Message from Brad Stewart</h3>
                                                I LUBZ CHIKIN.
                                                <br/><br/>
                                            	<button class="btn btn-large btn-primary" type="button">Reply</button>
                                            </div>   
                                            
                                        </div>
                                        
                                        <div class="span3">
                                        	<div class="tabbable tabs-right">
                                            	<h4>Suggested Matches</h4>
                                        		<ul class="nav nav-tabs nav-stacked" style="width:100%;">
                                            		<li><a href="#">
                                                    <h4>Asad Malik</h4>
                                                    Electrical Engineering
                                                    <br/>4th Year</a></li>
                                                    <li><a href="#">
                                                    <h4>Sunny Olszewski</h4>
                                                    	Electrical Engineering
                                                    <br/>3rd Year</a></li>
                                                    <li><a href="#">
                                                    <h4>Adnan Aziz</h4>
                                                    	Computer Science
                                                    <br/>3rd Year</a></li>
                                                    <li><a href="#">
                                                    <h4>Andrew Liu</h4>
                                                    	Fine Arts
                                                    <br/>12th Year</a></li>
												</ul>
                                               </div>
                                        </div>
                                        
<%@include file="footer.jsp" %>   