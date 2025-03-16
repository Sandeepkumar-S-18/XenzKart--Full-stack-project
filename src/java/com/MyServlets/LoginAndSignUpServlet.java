package com.MyServlets;

import com.MyDb.RetrievingData;
import com.MyJavaClass.LoginDataBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAndSignUpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String user_email = request.getParameter("user_email").toLowerCase();
            String user_pwd = request.getParameter("user_pwd");
            String user_type = request.getParameter("user_type");
            
            LoginDataBean loginDataBean = new LoginDataBean();
            loginDataBean.setEmail(user_email);
            loginDataBean.setPassword(user_pwd);
            
            HttpSession session = request.getSession();
            session.setAttribute("loginCredential", loginDataBean);
            
            RetrievingData rd = new RetrievingData();
            
            if(user_type.equalsIgnoreCase("admin"))
            {
                if(rd.adminLogin(session))
                {
                    LoginDataBean profile = (LoginDataBean)session.getAttribute("userDetails");
                }
                else
                {
                     
                }
            }
            else if(user_type.equalsIgnoreCase("user"))
            {
                rd.userLogin(session);
            }
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
