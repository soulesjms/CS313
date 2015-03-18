/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import facebook4j.Facebook;
import facebook4j.FacebookFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jonny
 */
@WebServlet(urlPatterns = {"/SignIn"})
public class SignIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Facebook facebook = new FacebookFactory().getInstance();
        
        request.getSession().setAttribute("facebook", facebook);
        
        String Id = "868292349876914";
        String secret = "473f3e315c5d27e90dbe0ea5f4e887b1";

        //get something like: http://localhost:8080/FacebookClassDemo/Signin
        StringBuffer requestUrl = request.getRequestURL();
        int lastSlashIndex = requestUrl.lastIndexOf("/");
        String callBackUrl = requestUrl.substring(0, lastSlashIndex) + "/CallBack";
        
        //response.getWriter().write("The callBack url is: " + callBackUrl);
        
        String facebookUrl = facebook.getOAuthAuthorizationURL(callBackUrl);
        
        //response.getWriter().write("The callBack url is: " + facebookUrl);
        
        response.sendRedirect(facebookUrl);
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
