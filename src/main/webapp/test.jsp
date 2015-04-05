<%-- 
    Document   : test
    Created on : Apr 4, 2015, 11:39:52 PM
    Author     : Jonny
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");

    out.println("testing database connectivity...");
    String dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
    String dbPass = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
    String dbURL = "jdbc:mysql://" + host + ":" + port + "/" + "barter";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
    Statement st = con.createStatement();

    ResultSet rs;
    rs = st.executeQuery("SELECT title FROM item");
    out.println("printing out result from query: selecting title from item" + "<br>");
    out.println("moving cursor to last item in result set" + "<br>");
    rs.last();

    String title = rs.getString("title");
    out.println("title is:" + title + "<br>");
    
    rs = st.executeQuery("SELECT image FROM image");
    out.println("testing query on image" + "<br>");
    rs.last();
    
    Blob image = rs.getBlob("image");
    out.println("image blob is:" + image + "<br>");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
