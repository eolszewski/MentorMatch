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
function getCookie(c_name)
{
var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
  {
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  if (x==c_name)
    {
    return unescape(y);
    }
  }
}

function setCookie(c_name,value,exdays)
{
var exdate=new Date();
exdate.setDate(exdate.getDate() + exdays);
var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
document.cookie=c_name + "=" + c_value;
}

function checkCookie()
{
var username=getCookie("username");
if (username!=null && username!="")
  {
  alert("Welcome again " + username);
  }
else 
  {
  username=prompt("Please enter your name:","");
  if (username!=null && username!="")
    {
    setCookie("username",username,365);
    }
  }
}
</script>

<script>


function submitForm(thisObj, thisEvent) {

	var email = $('#email').val();
	var password = $('#password').val();
	var jsonObj = new Object();
	var jsonData = JSON.stringify(jsonObj);
	
	$.post('/login', jsonData, function(data){
		alert("success");
	});
	
	   return false;  // prevents the page from refreshing before JSON is read from server response
}


if (1)
{
	document.getElementById("loginDiv").innerHTML='<form name="login" class="navbar-form pull-right" method="post" action="/login">' +
    '<input id="email" class="span2" type="text" placeholder="Email"> ' +
	'<input id="password" class="span2" type="password" placeholder="Password">' +
    '<input type="submit" class="btn" name="submit" value="Login" onclick="return submitForm(this, event);">' +
    '</form>';
}
else
{
	document.getElementById("loginDiv").innerHTML='<h4>Welcome, Asshole</h4>';
}


</script>