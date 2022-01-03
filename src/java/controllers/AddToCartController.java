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
public class AddToCartController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(AddToCartController.class);
    private static final String SUCCESS = "PagingController";

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
        String url = SUCCESS;
        try {
                        request.setCharacterEncoding("UTF-8");

            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String price = request.getParameter("price");
            String unitInStock = request.getParameter("unitInstock");
            String amount = (String) request.getParameter("amount");
            String image = request.getParameter("image");
            int amountInt = Integer.parseInt(amount);
            int quantity = 1;

            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("LIST_CART");
            MoonCakeDTO dto = new MoonCakeDTO(productID, productName, image,Float.parseFloat(price), Integer.parseInt(unitInStock), 1);
            MoonCakeInCartDTO dto1=new MoonCakeInCartDTO(dto, quantity);
            MoonCakeInCartDTO dto2=new MoonCakeInCartDTO(dto, dto1.getQuantity());
            
            if (cart == null) {
                cart = new CartDTO();
            }
            boolean check = cart.addToCart(dto2);
            if (check) {
                
           
                
                    session.setAttribute("LIST_CART", cart);
                    request.setAttribute("MESS", "Add " + productName + " to your cart success !");
                    url = SUCCESS;
                
            }

        } catch (Exception e) {
            LOGGER.debug("Error at AddToCartController" + e.getMessage());
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
