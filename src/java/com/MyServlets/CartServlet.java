package com.MyServlets;

import com.MyDb.AddToCart;
import com.MyDb.RetrievingProduct;
import com.MyJavaClass.CartBean;
import com.MyJavaClass.LoginDataBean;
import com.MyJavaClass.ProductDataBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
            int count = 0;
            int count1 = -1;
            
            if(id != null)
            {
                count = Integer.parseInt(id);
            }
            
            RetrievingProduct retrievingProduct = new RetrievingProduct();
            ProductDataBean productDataBean = retrievingProduct.retrievingProductList();

            ArrayList<ArrayList<ProductDataBean>> productList = productDataBean.getProductList();
            
            HttpSession session = request.getSession();
            LoginDataBean loginData = (LoginDataBean)session.getAttribute("loginDetails");
            
            for (ArrayList<ProductDataBean> productGroup : productList) 
            {
                for (ProductDataBean product : productGroup) 
                {
                    count1 += 1;
                    
                    if(count1 == count)
                    {
                        CartBean cartProductDetails = new CartBean();
                        
                        cartProductDetails.setBuyer_id(loginData.getId());
                        cartProductDetails.setProduct_id(count+1+100);
                        cartProductDetails.setQuantity(1);
                        cartProductDetails.setTotal_price(product.getDiscount_price());
                        
                        session.setAttribute("cartProductDetails", cartProductDetails);
                    }
                }
            }
            
            AddToCart addToCart = new AddToCart();
            
            if(addToCart.productAddedToCart(session))
            {
                response.sendRedirect("Pages/cart.jsp");
            }
            else
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
