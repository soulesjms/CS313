<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="unified.css">

</head>
<body>
<div id="top">
    <div id="welcome">Welcome to BarterSpace!</div>
    <div id="login" style="float:right">
      <form action="login.jsp" method="post" name="loginform">
        Login:
        <input type="text" name="uname" placeholder="username" required />	
        <input type="password" name="pass" autocomplete="off" placeholder="password" required />
        <input type="submit" name="login" value="Log in" />
        <a href="SignIn"><img src="Pictures/FBloginbutton.png" width="108" height="34" /></a>
        <a href="reg.jsp">Register</a><br />
        <a href="test.jsp">test</a>
      </form>
    </div>
</div>
    <h2>Welcome to BarterSpace!</h2>
</body>
</html>