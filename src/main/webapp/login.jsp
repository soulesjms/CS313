<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
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
    rs = st.executeQuery("select * from user where user_name='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("welcome.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>