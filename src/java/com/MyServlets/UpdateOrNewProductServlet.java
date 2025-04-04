package com.MyServlets;

import com.MyDb.RetrievingProduct;
import com.MyJavaClass.UpdateProductBean;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateOrNewProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String saveDir = getServletContext().getRealPath("").replaceAll("build", "");
            String folderName = "Product_images";
            String folderPath = saveDir + File.separator + folderName;
            
            File f = new File(folderPath);
            if(!f.exists())
            {
                f.mkdir();
            }
            
            MultipartRequest mpr = new MultipartRequest(request, folderPath, 20 * 1024 * 1024);
            
            String msg1 = mpr.getParameter("msg1");
            
            String product_id = mpr.getParameter("productId1");
            int id = 0;
            if(product_id != null && !product_id.equals(""))
            {
                id = Integer.parseInt(product_id);
            }
            
            String oldImagePath = mpr.getParameter("old_image");
            
            String productName = mpr.getParameter("update_product_name");
            String productDescription = mpr.getParameter("update_product_description");
            double productPrice = Double.parseDouble(mpr.getParameter("update_product_price"));
            double productDiscountPrice = Double.parseDouble(mpr.getParameter("update_product_discount_price"));
            double productRating = Double.parseDouble(mpr.getParameter("update_product_rating"));
            int productQuantity = Integer.parseInt(mpr.getParameter("update_product_quantity"));
            String productCategory = mpr.getParameter("update_product_category");
            
            String uploadedFileName = mpr.getFilesystemName("update_product_img");
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
                String fileExtension = uploadedFileName.substring(index);
                newFileName = productName+fileExtension;
                newFilePath = folderPath + File.separator + newFileName;
            }
            
            File f1 = new File(existingFilePath);
            
            File f2 = new File(newFilePath);
            f1.renameTo(f2);
            
            UpdateProductBean upb = new UpdateProductBean();
            upb.setProduct_id(id);
            upb.setMessage(msg1);
            upb.setProduct_name(productName);
            upb.setProduct_image(newFileName);
            upb.setProduct_description(productDescription);
            upb.setProduct_price(productPrice);
            upb.setProduct_discount_price(productDiscountPrice);
            upb.setProduct_rating(productRating);
            upb.setProduct_quantity(productQuantity);
            upb.setProduct_category(productCategory);
            
            HttpSession session = request.getSession();
            session.setAttribute("UpdatedProductDetails", upb);
            
            RetrievingProduct rp = new RetrievingProduct();
            
            if(rp.updateOrAddProduct(session))
            {
                response.sendRedirect("Pages/product.jsp");
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
