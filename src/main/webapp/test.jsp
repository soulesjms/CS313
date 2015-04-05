<%-- 
    Document   : test
    Created on : Apr 4, 2015, 11:39:52 PM
    Author     : Jonny
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    out.println("testing database connectivity...");
    String USER = "OPENSHIFT_MYSQL_DB_USERNAME";
    String PASS = "OPENSHIFT_MYSQL_DB_PASSWORD";
    
    String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");

    String DB_URL = "jdbc:mysql://" + host + ":" + port + "/" + "barter";
   
    String user = request.getParameter("user_name");
    String pwd = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement st = con.createStatement();

    ResultSet rs;
    rs = st.executeQuery("select * from user");
    out.print(rs.next());
    
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
