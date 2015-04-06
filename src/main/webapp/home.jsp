<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
@charset "utf-8";
/* CSS Document */

#top {
	width:100%;
	height:150px;
	background-color:#9FF;
}
#logo {
	font-size:24px;
	float:left;
	width:60%;
	padding-left:30px;
}
#welcome {
	font-size:36px;
	background-color:#999;
	opacity:50%;
	padding:20px;
}
#login {
	width:40%;
	padding-top:40px;
}
#recentSearches
{
	padding:10px;
	font-size:18px;
}
.recent {
	border: black solid 2px;
	width: 22%;
	position: relative;
	float: left;
	margin: 10px;
	padding: 20px;
}

.block p {
	font: 12px/18px Arial, sans-serif;
	color: #333;
	margin: 0;
}

body {
	font-family: "Cambo", serif;
	font-size: 13px;
	line-height: 18px;
	background-color: #F6F6F6;
}

.block {
	position: absolute;
	background: #fff;
	padding: 20px;
	width: 300px;
	border: 1px solid #ddd;
}
</style>
</head>
<body>
    <div id="top">
        <div id="logo"><a href="home.jsp"><img src="Pictures/Logo.png" width="214" height="131" /></a></div>
        <div id="login" style="float:right">
            <form role="form" action="login.jsp" method="post" name="loginform">
                <p>Login:
                    <input type="text" name="uname" placeholder="username" required />	
                    <input type="password" name="pass" autocomplete="off" placeholder="password" required />
                    <input type="submit" name="login" value="Log in" />
                    <a href="SignIn"><img src="Pictures/FBloginbutton.png" width="108" height="34" /></a>        
                </p>
                <p>-OR-</p>
                <p><a href="reg.jsp">Create New Account</a><br /></p>
            </form>
        </div>   
    </div>
	<div class="container">
    <h1>Welcome to BarterSpace!</h1>
    <p>Simple posts. Simple Searching.</p>
    </div>
</body>
</html>