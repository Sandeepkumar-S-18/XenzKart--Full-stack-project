package com.MyServlets;

import com.MyDb.UpdateRecord;
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

public class UpdateRecordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginDetails");
            int id = loginData.getId();
            String oldImagePath = loginData.getProfileImage();
            String oldEmail = loginData.getEmail();
            String oldPwd = loginData.getPassword();
            String userType = loginData.getUserType();
            
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
            
            String existingFilePath = "", newFileName = "", newFilePath = "";
            if (uploadedFileName == null || uploadedFileName.equals("")) 
            {
                existingFilePath = folderPath + File.separator + oldImagePath;
                newFileName = oldImagePath;
                newFilePath = existingFilePath;
            }
            else
            {
                existingFilePath = folderPath + File.separator + uploadedFileName;
                
                int index = uploadedFileName.lastIndexOf(".");
                String onlyFileName = uploadedFileName.substring(0,index);
                String fileExtension = uploadedFileName.substring(index);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
                String upload_time = sdf.format(new Date());

                newFileName = onlyFileName + "_" + upload_time +fileExtension;
                newFilePath = folderPath + File.separator + newFileName;
            }
            
            File f1 = new File(existingFilePath);
            
            File f2 = new File(newFilePath);
            f1.renameTo(f2);
            
            LoginDataBean loginDetails = new LoginDataBean();
            loginDetails.setUserType(userType);
            loginDetails.setId(id);
            loginDetails.setName(mpr.getParameter("user_name"));
            loginDetails.setProfileImage(newFileName);
            loginDetails.setEmail(oldEmail);
            loginDetails.setMobile(Long.parseLong(mpr.getParameter("user_mobile")));
            loginDetails.setAddress(mpr.getParameter("user_address"));
            if(mpr.getParameter("user_upd_pwd").equals(""))
            {
                loginDetails.setPassword(oldPwd);
            }
            else
            {
                loginDetails.setPassword(mpr.getParameter("user_upd_pwd"));
            }
            
            session.setAttribute("loginDetails", loginDetails);
            
            UpdateRecord updRecord = new UpdateRecord();
            
            if(updRecord.updateProfile(session))
            {
                response.sendRedirect("Pages/home.jsp");
            }
            else
            {
                response.sendRedirect("Pages/profile.jsp?errorMsg=false");
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
