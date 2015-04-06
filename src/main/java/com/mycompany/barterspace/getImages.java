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
        String title2 = null;
        String title3 = null;
        String title4 = null;
        String desc = null;
        String desc2 = null;
        String desc3 = null;
        String desc4 = null;
        
            try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            Statement st = conn.createStatement();
 
            // constructs SQL statement
            
            ResultSet rs = st.executeQuery("SELECT title FROM item");
            rs.first();
            title = rs.getString("title");
            rs.next();
            title2 = rs.getString("title");
            rs.next();
            title3 = rs.getString("title");
            rs.next();
            title4 = rs.getString("title");
            
            
            ResultSet rsd = st.executeQuery("SELECT item_desc FROM item");
            rsd.first();
            Blob blob = rsd.getBlob("item_desc");
            byte[] bdata = blob.getBytes(1, (int) blob.length());
            desc = new String(bdata);
            
            rsd.next();
            Blob blob2 = rsd.getBlob("item_desc");
            byte[] bdata2 = blob.getBytes(1, (int) blob.length());
            desc2 = new String(bdata2);
            
            rsd.next();
            Blob blob3 = rsd.getBlob("item_desc");
            byte[] bdata3 = blob.getBytes(1, (int) blob.length());
            desc3 = new String(bdata3);
            
            rsd.next();
            Blob blob4 = rsd.getBlob("item_desc");
            byte[] bdata4 = blob.getBytes(1, (int) blob.length());
            desc4 = new String(bdata4);
                        
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
            request.setAttribute("title2", title2);
            request.setAttribute("title3", title3);
            request.setAttribute("title4", title4);
            request.setAttribute("desc", desc);
            request.setAttribute("desc2", desc2);
            request.setAttribute("desc3", desc3);
            request.setAttribute("desc4", desc4);
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
