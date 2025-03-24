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

public class LoginServlet extends HttpServlet {
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String user_email = request.getParameter("user_email").toLowerCase();
            String user_pwd = request.getParameter("user_pwd");
            String user_type = request.getParameter("user_type");
            
            LoginDataBean loginDataBean = new LoginDataBean();
            loginDataBean.setUserType(user_type);
            loginDataBean.setEmail(user_email);
            loginDataBean.setPassword(user_pwd);
            
            HttpSession session = request.getSession();
            session.setAttribute("loginCredential", loginDataBean);
            
            RetrievingData rd = new RetrievingData();
            
            if(rd.login(session))
            {
                response.sendRedirect("Pages/home.jsp");
            }
            else
            {
                response.sendRedirect("Pages/login.jsp?login="+user_type+"&errorMsg=false");
            }
        }
        catch(Exception e)
        {
            System.out.println("Error");
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
    public void doGet(HttpServletRequest request, HttpServletResponse response)
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
    public void doPost(HttpServletRequest request, HttpServletResponse response)
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
