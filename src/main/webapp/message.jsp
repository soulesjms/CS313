<%-- 
    Document   : message
    Created on : Mar 21, 2015, 12:59:52 PM
    Author     : ronald
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Message</title>
    </head>
    <body>
        <h3><%=request.getAttribute("message")%></h3>
        <h3><%=request.getAttribute("variable")%></h3>
    </body>
</html>
