package com.MyServlets;

import com.MyDb.NewRecords;
import com.MyJavaClass.LoginDataBean;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String saveDir = getServletContext().getRealPath("").replaceAll("build", "");
            String folderName = "Uploads";
            String folderPath = saveDir + File.separator + folderName;
            
            File f = new File(folderPath);
            if(!f.exists())
            {
                f.mkdir();
            }
            
            MultipartRequest mpr = new MultipartRequest(request, folderPath, 2 * 1024 * 1024);
            
            String uploadedFileName = mpr.getFilesystemName("user_profile_photo");
            String existingFilePath = folderPath + File.separator + uploadedFileName;
            
            File f1 = new File(existingFilePath);
            
            int index = uploadedFileName.lastIndexOf(".");
            
            String onlyFileName = uploadedFileName.substring(0,index);
            String fileExtension = uploadedFileName.substring(index);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
            String upload_time = sdf.format(new Date());
            
            String newFileName = onlyFileName + "_" + upload_time +fileExtension;
            String newFilePath = folderPath + File.separator + newFileName;
            
            File f2 = new File(newFilePath);
            f1.renameTo(f2);
            
            LoginDataBean userDetails = new LoginDataBean();
            userDetails.setName(mpr.getParameter("user_name"));
            userDetails.setProfileImage(newFileName);
            userDetails.setEmail(mpr.getParameter("user_email").toLowerCase());
            userDetails.setMobile(Long.parseLong(mpr.getParameter("user_mobile")));
            userDetails.setAddress(mpr.getParameter("user_address"));
            userDetails.setPassword(mpr.getParameter("user_pwd"));
            
            HttpSession session = request.getSession();
            session.setAttribute("userDetails", userDetails);
            
            NewRecords nr = new NewRecords();
            
            if(nr.createAccount(session))
            {
                response.sendRedirect("Pages/home.jsp?user_type=user");
            }
            else
            {
                response.sendRedirect("Pages/signup.jsp?errorMsg=false");
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
