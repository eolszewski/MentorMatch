<!DOCTYPE jsp>
<html lang="en">

    <head>
        <meta charset="utf-8">
            
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="">
                    <meta name="author" content="">
                        
                        <!-- Le styles -->
                        <link href="css/bootstrap.css" rel="stylesheet">
                            <style type="text/css">
                                body {
                                    padding-top: 60px;
                                    padding-bottom: 40px;
                                }
                                </style>
                            <link href="css/bootstrap-responsive.css" rel="stylesheet">  
                                <body>
                                    
                                    <div class="navbar navbar-inverse navbar-fixed-top">
                                        <div class="navbar-inner">
                                            <div class="container">
                                                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                                    <span class="icon-bar"></span>
                                                    <span class="icon-bar"></span>
                                                    <span class="icon-bar"></span>
                                                </button>
                                                <a class="brand" href="home.jsp">MentorMatch</a>
                                                <div class="nav-collapse collapse">
                                                    <ul class="nav">
                                                        <li class="active"><a href="#">Home</a></li>
                                                        <li><a href="#about">About</a></li>
                                                        <li><a href="#contact">Contact</a></li>
                                                        <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                                                            <ul class="dropdown-menu">
                                                                <li><a href="#">Action</a></li>
                                                                <li><a href="#">Another action</a></li>
                                                                <li><a href="#">Something else here</a></li>
                                                                <li class="divider"></li>
                                                                <li class="nav-header">Nav header</li>
                                                                <li><a href="#">Separated link</a></li>
                                                                <li><a href="#">One more separated link</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                    <form class="navbar-form pull-right" method="post" action="mentormatch">
                                                        <input name="email" class="span2" type="text" placeholder="Email">
                                                            <input name="password" class="span2" type="password" placeholder="Password">
                                                                <button type="submit" class="btn">Sign in</button>
                                                                </form>
                                                                <span 
                                                                    class="g-signin"
                                                                    id="g-signin"
                                                                    data-callback="signinCallback"
                                                                    data-clientid="996517486385.apps.googleusercontent.com"
                                                                    data-cookiepolicy="single_host_origin"
                                                                    data-requestvisibleactions="http://schemas.google.com/AddActivity"
                                                                    data-scope="https://www.googleapis.com/auth/plus.login">
                                                                  </span>
                                                                  
                                                </div><!--/.nav-collapse -->
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <script type="text/javascript">
			  (function() {
			   var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			   po.src = 'https://apis.google.com/js/client:plusone.js';
			   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			 })();
			 
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