<!DOCTYPE jsp>
<html lang="en">
<script src="http://code.jquery.com/jquery-latest.pack.js"></script>
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
                                                   
                                                    
                                                    <div id="loginDiv">
                                                   
                                                    </div>
                                                                
                                                               
                                                </div><!--/.nav-collapse -->
                                            </div>
                                        </div>
                                    </div>
                                    
			
<script>
function setCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function getCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	setCookie(name,null,-1);
}

</script>

<script>
/*
$(document).ready(function(){
	eraseCookie('email');
	eraseCookie('firstName');
	
});
*/

function submitForm(thisObj, thisEvent) {

	var email = $('#email').val();
	var password = $('#password').val();
	var jsonObj = new Object();
	jsonObj.email = email;
	jsonObj.password = password;
	var jsonData = JSON.stringify(jsonObj);
	
	//setCookie('email', 'asshole', 1);
	//setCookie('firstName', 'Asshole', 1);
	
	$.post("login", {json:jsonData}, function(data){
		alert('fuck');
		var obj = $.parseJSON(data);
		if (obj.Email === null)
		{
			alert("email is fucking wrong");	
		}
		else if (obj.Password === null)
		{
			alert("password is fucking wrong");
		}
		else
		{
			setCookie('email', obj.Email, 1);
			setCookie('firstName', obj.FirstName, 1);
			return true;
		}
		
	}, 'json');
	
	return false;  // prevents the page from refreshing before JSON is read from server response
}

//displays login bar if not logged in
if (getCookie('email') == null)
{
	document.getElementById("loginDiv").innerHTML='<form name="login" class="navbar-form pull-right" method="post" action="/login">' +
    '<input id="email" class="span2" type="text" placeholder="Email"> ' +
	'<input id="password" class="span2" type="password" placeholder="Password">' +
    '<input type="submit" class="btn" name="submit" value="Login" onclick="return submitForm(this, event);">' +
    '</form>';
}
else
{
	var firstName = getCookie('firstName');
	document.getElementById("loginDiv").innerHTML='<h4>Welcome, ' + firstName + '</h4>';
}


</script>