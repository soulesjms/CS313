//STEP 1. Import required packages
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/FirstExample"})
public class FirstExample extends HttpServlet{
   private String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
   private String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   final String DB_URL = "jdbc:mysql://" + host + ":" + port + "/" + "barter";

   //  Database credentials
   static final String USER = "OPENSHIFT_MYSQL_DB_USERNAME";
   static final String PASS = "OPENSHIFT_MYSQL_DB_PASSWORD";

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   // JDBC driver name and database URL
   PrintWriter out = response.getWriter();
   Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql;
      sql = "SELECT * FROM user";
      ResultSet rs = stmt.executeQuery(sql);

      //STEP 5: Extract data from result set
      out.write("<html>");
      out.write("<body>");
      while(rs.next()){
         //Retrieve by column name

         String username = rs.getString("user_name");
         String password = rs.getString("password");
         
         //Display values
         out.write("<a href='nextExample'>");
         out.println("result is:" + username + " " + password);
         out.write("</a>");
      }//STEP 6: Clean-up environment
        out.println("Servlet at " + request.getContextPath());
        rs.close();
      stmt.close();
      conn.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
}//end main
   
      // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

