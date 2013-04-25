<%@include file="master.jsp" %>

        <div class="container">
            
            <!-- Main hero unit for a primary marketing message or call to action -->
            <div class="hero-unit">
                <h1>MentorMatch</h1>
                <p>You've met your match.</p>
                <p></p>
                <div id="regButton">
                	
                </div>
             
            </div>
            
            <!-- Example row of columns -->
            <div class="row">
                <div class="span4">
                    <h2>What We Do</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
                <div class="span4">
                    <h2>Mentors</h2>
                    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
                <div class="span4">
                    <h2>Mentees</h2>
                    <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                    <p><a class="btn" href="#">View details &raquo;</a></p>
                </div>
            </div>
            
  <script>
  if (getCookie('email') == null)
  {
  	document.getElementById("regButton").innerHTML='<button type="button" id = "register" class="btn btn-large btn-primary" onclick="window.location = &#39;/register.jsp&#39;">Register</button>'; 
  }
  else
  {
	  document.getElementById("regButton").innerHTML="";
  }
  
  </script>          
            
<%@include file="footer.jsp" %>   
