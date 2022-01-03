/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.MoonCakeDAO;
import dtos.CartDTO;
import dtos.MoonCakeDTO;
import dtos.MoonCakeInCartDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author 84909
 */
public class UpdateCartController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddToCartController.class);
    private static final String SUCCESS = "listCart.jsp";
    private static final String ERROR = "error.jsp";

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
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("LIST_CART");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String productID = (String) request.getParameter("productID");
            String amount = (String) request.getParameter("amount");
            int amountInt = Integer.parseInt(amount);
            MoonCakeDTO dto = null;
            if (cart != null) {
                MoonCakeInCartDTO dto1=null;
                dto1=cart.getCart().get(productID);
                dto1.setQuantity(quantity);
                
                boolean check = cart.update(productID, dto1);
                if ( check) {
                    url = SUCCESS;
                    request.setAttribute("LIST_CART", cart);
                    request.setAttribute("MESS", "Update your cart success !");
                }

            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
