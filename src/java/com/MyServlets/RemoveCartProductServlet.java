package com.MyServlets;

import com.MyDb.AddToCart;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RemoveCartProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String orderStr = request.getParameter("orderId");
            String productStr = request.getParameter("productId");
            String qtyStr = request.getParameter("quantity");

            int order = 0, product_id = 0, quantity = 0;

            if (orderStr != null && !orderStr.equals("")) 
            {
                order = Integer.parseInt(orderStr);
            }

            if (productStr != null && !productStr.equals("")) 
            {
                product_id = Integer.parseInt(productStr);
            }

            if (qtyStr != null && !qtyStr.equals("")) 
            {
                quantity = Integer.parseInt(qtyStr);
            }

            String action = request.getParameter("action");
            
            AddToCart removeCartProduct = new AddToCart();
            
            if(action.equals("removeFromCart"))
            {
                if(removeCartProduct.removeCartProduct(order, action))
                {
                    response.sendRedirect("Pages/cart.jsp");
                }
                else
                {
                    response.sendRedirect("Pages/cart.jsp");
                }
            }
            else if(action.equals("cancelOrder"))
            {
                if(removeCartProduct.removeCartProduct(order, action))
                {
                    response.sendRedirect("Pages/yourOrder.jsp");
                }
                else
                {
                    response.sendRedirect("Pages/yourOrder.jsp");
                }
            }
            else if(action.equals("confirm"))
            {
                if(removeCartProduct.confirmOrderByAdmin(order, product_id, quantity))
                {
                    response.sendRedirect("Pages/manageOrders.jsp");
                }
                else
                {
                    out.println("not done");
                }
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
