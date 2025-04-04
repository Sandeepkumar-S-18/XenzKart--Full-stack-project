package com.MyServlets;

import com.MyDb.AddToCart;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlaceOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String[] orderIdsStr = request.getParameterValues("orderIds"); 
            int[] orderIds = new int[orderIdsStr.length]; 
            for(int i = 0; i < orderIdsStr.length; i++) 
            {
                orderIds[i] = Integer.parseInt(orderIdsStr[i]);
            }
            
            String[] quantityStrArr = request.getParameterValues("quantity");
            int[] quantityArr = new int[quantityStrArr.length];
            for(int i = 0; i < quantityStrArr.length; i++) 
            {
                quantityArr[i] = Integer.parseInt(quantityStrArr[i]);
            }
            
            String[] totalProductPriceStr = request.getParameterValues("totalProductPrice");
            double[] totalProductPrice = new double[totalProductPriceStr.length];
            for(int i = 0; i < totalProductPriceStr.length; i++)
            {
                totalProductPrice[i] = Double.parseDouble(totalProductPriceStr[i]);
            }
            
            String action = request.getParameter("action");
            AddToCart placeOrder = new AddToCart();
            
            if(placeOrder.placeOrder(orderIds, quantityArr, totalProductPrice, action))
            {
                response.sendRedirect("Pages/yourOrder.jsp");
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
