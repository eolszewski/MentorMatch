<%@include file="master.jsp" %>
        
        <script>
		var theData = ${jsonString};
		</script>
		<body onload="init(theData);">
		
        <div class="container">
            
            <!-- Main hero unit for a primary marketing message or call to action -->
            <div class="hero-unit">
                <h1>MentorMatch</h1>
                <p>You've met your match.</p>
                <p>
                <button type="button" id = "register" class="btn btn-large btn-primary" onclick="window.location = '/register.jsp'">Register</button>
                
                <!--
                <span
                    class="g-signin"
                    id="g-signin"
                    data-callback="signinCallback"
                    data-clientid="996517486385.apps.googleusercontent.com"
                    data-cookiepolicy="single_host_origin"
                    data-requestvisibleactions="http://schemas.google.com/AddActivity"
                    data-scope="https://www.googleapis.com/auth/plus.login">
                  </span>
                  -->
                </p>
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
            
            
            
<%@include file="footer.jsp" %>   
