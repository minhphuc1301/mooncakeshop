/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.MoonCakeDAO;
import daos.OrderDAO;
import daos.OrderDetailsDAO;
import dtos.CartDTO;
import dtos.ErrorUserDTO;
import dtos.MoonCakeDTO;
import dtos.MoonCakeInCartDTO;
import dtos.OrderDTO;
import dtos.OrderDetailsDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
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
public class OrderController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(OrderController.class);
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
        String url = "checkout.jsp";
        try {
            HttpSession session = request.getSession();
            CartDTO cart = (CartDTO) session.getAttribute("LIST_CART");
            String productName = request.getParameter("productName");
            UserDTO dto = (UserDTO) session.getAttribute("USER");
            String total = request.getParameter("total");
            String phone = request.getParameter("phone").trim();
            String address=request.getParameter("address");
            ErrorUserDTO error = new ErrorUserDTO();
            boolean check2 = true;
            try {

                int a = Integer.parseInt(phone);
                if (phone.length() <= 8 || phone.length() >= 12) {
                    error.setPhoneError("Phone number must from 9 to 10 num");
                    check2 = false;

                    url = "checkout.jsp";
                    request.setAttribute("ERROR1", error);
                    request.setAttribute("PHONE", phone);
                }

            } catch (NumberFormatException e) {
                error.setPhoneError("Phone must be number !");
                url = "checkout.jsp";
                check2 = false;
                request.setAttribute("ERROR1", error);
                request.setAttribute("PHONE", phone);
            }
            request.setAttribute("PHONE", phone);
            float a = Float.parseFloat(total);
            MoonCakeDTO dto1 = new MoonCakeDTO();
            MoonCakeDAO dao = new MoonCakeDAO();
            OrderDAO orderDAO1 = new OrderDAO();
            String orderID = request.getParameter("orderID");
            OrderDTO orderDTO = new OrderDTO(orderID, dto.getUserID(), "In Progress",address, a);
            boolean flag = true;
            if (cart != null && check2) {
                for (MoonCakeInCartDTO m : cart.getCart().values()) {
                    if (m.getQuantity() > m.getCake().getUnitInStock()) {
                        request.setAttribute("ERROR", m.getCake().getProductName() + " only has " + m.getCake().getUnitInStock() + " products left");

                        flag = false;
                    }
                }
                if (flag) {
                    boolean check1 = orderDAO1.insertOrder(orderDTO);
                    for (MoonCakeInCartDTO m : cart.getCart().values()) {
                        cart.getCart().remove(m);
                        OrderDetailsDTO orderDetail = new OrderDetailsDTO(orderID, m.getCake().getProductID(), m.getQuantity(), m.getQuantity() * m.getCake().getPrice());
                        OrderDetailsDAO orderDAO = new OrderDetailsDAO();

                        boolean check = orderDAO.insert(orderDetail);
                        if (check1 && check) {
                            boolean checkUpdate = dao.updateUnitInStock(m.getCake().getProductID(), m.getCake().getUnitInStock() - m.getQuantity());
                            if (checkUpdate) {

                                request.setAttribute("SUCCESS", "Order success !");
                                url = "listOrder.jsp";
                            }
                        }

                    }
                    cart.getCart().clear();
                }
            }
        } catch (Exception e) {
            LOGGER.debug("Errot at OrderController" + e.getMessage());
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
