/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.MoonCakeDAO;
import dtos.MoonCakeDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class PagingController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(PagingController.class);
    private static final String SUCCESS = "home.jsp";

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
            String index = request.getParameter("index");
            int in = 1;
            if (index != null) {
                in = Integer.parseInt(index);
            }
            String search = request.getParameter("search");
            String cate = request.getParameter("cate");
            String cate2 = request.getParameter("cate2");
            String cate3 = request.getParameter("search3");
            int search3 = 0;
            if (cate3 != null) {
                search3 = Integer.parseInt(cate3);
            }
            if (cate2 == null) {
                cate2 = "";
            }

            int a = 0;

            MoonCakeDAO moonDao = new MoonCakeDAO();
            if (search3 == 30) {
                List<MoonCakeDTO> list = moonDao.pageingProductByLessPrice1(in, search3);
                request.setAttribute("check1", "30");

                request.setAttribute("cate2", "Golden Baked");
                request.setAttribute("MESS2", "1");
                request.setAttribute("ERROR", "Nothing here");
                request.setAttribute("save", search);

                request.setAttribute("index1", index);
                request.setAttribute("LIST2", list);
            } else if (search3 == 60) {
                List<MoonCakeDTO> list = moonDao.pageingProductByPrice2(in, search3);
                request.setAttribute("check2", "45");

                request.setAttribute("cate2", "Golden Baked");
                request.setAttribute("MESS2", "1");
                request.setAttribute("ERROR", "Nothing here");
                request.setAttribute("save", search);

                request.setAttribute("index1", index);
                request.setAttribute("LIST2", list);
            } else if (search3 == 90) {
                List<MoonCakeDTO> list = moonDao.pageingProductByBiggerPrice1(in, 60);
                request.setAttribute("check3", "60");

                request.setAttribute("cate2", "Golden Baked");
                request.setAttribute("MESS2", "1");
                request.setAttribute("ERROR", "Nothing here");
                request.setAttribute("save", search);

                request.setAttribute("index1", index);
                request.setAttribute("LIST2", list);
            } else if (!cate.equals("null")) {
                if (!cate.equals("")) {
                    if (cate.contains("Golden Baked") || cate2.contains("Golden Baked")) {
                        a = 1;
                        List<MoonCakeDTO> list = moonDao.pageingProductByCategory(search, in, a);
                        request.setAttribute("cate", "1");
                        request.setAttribute("cate2", "Golden Baked");
                        request.setAttribute("MESS2", "1");
                        request.setAttribute("ERROR", "Nothing here");
                        request.setAttribute("save", search);
                        request.setAttribute("LIST2", list);
                        request.setAttribute("index1", index);
                    } else {
                        a = 2;
                        List<MoonCakeDTO> list = moonDao.pageingProductByCategory(search, in, a);
                        request.setAttribute("save", search);
                        request.setAttribute("cate", "2");
                        request.setAttribute("MESS2", "1");
                        request.setAttribute("ERROR", "Nothing here");
                        request.setAttribute("cate2", "Sticky Soft");
                        request.setAttribute("LIST2", list);
                        request.setAttribute("index1", index);
                    }
                } else {

                    if (search != null) {

                        List<MoonCakeDTO> list = moonDao.pageingProductByname(search, in);
                        request.setAttribute("tag", "3");
                        request.setAttribute("MESS1", "1");
                        request.setAttribute("save", search);
                        request.setAttribute("LIST1", list);
                        request.setAttribute("index1", index);
                    } else {
                        List<MoonCakeDTO> list = moonDao.pageingProduct(in);
                        request.setAttribute("tag", "3");
                        request.setAttribute("save", search);
                        request.setAttribute("LIST", list);
                        request.setAttribute("index1", index);

                    }
                }

            } else {
                if (search != null) {

                    List<MoonCakeDTO> list = moonDao.pageingProductByname(search, in);

                    request.setAttribute("save", search);
                    request.setAttribute("LIST", list);
                    request.setAttribute("index1", index);
                } else {
                    List<MoonCakeDTO> list = moonDao.pageingProduct(in);

                    request.setAttribute("save", search);
                    request.setAttribute("LIST", list);
                    request.setAttribute("index1", index);

                }

            }
        } catch (Exception e) {
            LOGGER.debug("Errort at PagingController" + e.getMessage());
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
