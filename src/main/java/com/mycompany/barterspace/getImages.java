/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.barterspace;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.*;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ronald
 */
@WebServlet(name = "getImages", urlPatterns = {"/getImages"})
public class getImages extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private String dbURL = "";
    private String dbUser = "";
    private String dbPass = "";
    private String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    private String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        dbURL = "jdbc:mysql://" + host + ":" + port + "/" + "barter";
        dbUser = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        dbPass = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
        
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        String title = null;
        
            try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            Statement st = conn.createStatement();
 
            // constructs SQL statement
            
            //String sql = "SELECT title FROM item WHERE item_id=1";
            //PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery("SELECT title FROM item");
            rs.first();
            title = rs.getString("title");
            //Blob image = rs.getBlob(1);
            //byte[] buf = new byte[4096];
            //OutputStream to = new ByteArrayOutputStream();
            
            /*try(InputStream is = image.getBinaryStream()){
                while(true){
                    int r = is.read(buf);
                    if (r == -1){
                        break;
                    }
                    to.write(buf, 0, r);
                }
            }
            PrintWriter out = response.getWriter();
            request.setAttribute("image", image);*/
            
            //ArrayList al = null;
            //ArrayList title = new ArrayList();
            
            //request.setAttribute("title", title);
            //getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
            
            // sends the statement to the database server
            

        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("title", title);
            getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
        }

    }

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
