<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pass = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    
    String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");

    out.println("Connecting to database...");
    String dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
    String dbPass = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
    String dbURL = "jdbc:mysql://" + host + ":" + port + "/" + "barter";
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(dbURL, dbUser, dbPass);
    Statement st = con.createStatement();

    ResultSet rs;
    int i = st.executeUpdate("insert into user (user_name, password) values ('" + user + "','" + pass + "')");
    if (i > 0) {
        session.setAttribute("userid", user);
        //response.sendRedirect("welcome.jsp");
        out.print("Registration Successfull!"+"<a href='home.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("home.jsp");
    }
%>