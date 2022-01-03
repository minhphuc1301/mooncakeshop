/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.MoonCakeDAO;
import dtos.ErrorMoonCakeDTO;
import dtos.MoonCakeDTO;
import dtos.UserDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.log4j.Logger;

/**
 *
 * @author 84909
 */
@WebServlet(name = "EditController", urlPatterns = {"/EditController"})
@MultipartConfig
public class EditController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(EditController.class);
    private static final String SUCCESS = "PagingController2";
    private static final String ERROR = "PagingController2";

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
        ErrorMoonCakeDTO error = new ErrorMoonCakeDTO();
        try {
                        request.setCharacterEncoding("UTF-8");

            boolean flag1 = true;
            boolean flag;
            boolean flag2 = true;
            Part part1 = request.getPart("file");
            String fileName1 = extractFileName(part1);
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            String[] item1 = fileName1.split("\\.");
            if (fileName1.equals("")) {
                flag2 = false;

            }
            if (flag2) {
                for (String x : item1) {
                    if (x.trim().equalsIgnoreCase("PNG") || x.trim().equalsIgnoreCase("JPG") || x.trim().equalsIgnoreCase("BMG")) {
                        flag1 = true;
                        error.setImgError("");

                    } else {
                        flag1 = false;
                        error.setImgError("Your file is not valid");
                    }
                }
            }
            String productID = request.getParameter("productID");

            Pattern p = Pattern.compile("^CAKE\\d{3}");
            Matcher match = p.matcher(productID);
            if (!match.find()) {
                error.setProductIDError("Product ID must be in form CAKEXXX, X is number");
                flag1 = false;
                request.setAttribute("ERROR", error);
            }

            String productName = request.getParameter("productName").trim();
            String description = request.getParameter("description").trim();
            String price = request.getParameter("price");
            try {
                Float.parseFloat(price);
                if (Float.parseFloat(price) < 0) {
                    flag1 = false;
                    error.setPriceError("Price must bigger than 0");
                }

            } catch (NumberFormatException e) {
                flag1 = false;
                error.setPriceError("Price must be number");
            }
            String unit = request.getParameter("unit");
            try {
                Integer.parseInt(unit);
                if (Integer.parseInt(unit) < 0) {
                    flag1 = false;
                    error.setUnitInStockError("Unit in stock must bigger than 0");
                }

            } catch (NumberFormatException e) {
                flag1 = false;
                error.setUnitInStockError("Unit in stock must be number");
                request.setAttribute("ERROR", error);
            }
            String category = request.getParameter("category");
            int categoryID = 0;
            if (category.equals("Golden Baked Mooncake")) {
                categoryID = 1;
            } else {
                categoryID = 2;
            }
            String status = request.getParameter("status");
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            MoonCakeDAO dao = new MoonCakeDAO();
            Date fromDate = new Date();
            Date toDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            fromDate = sdf.parse(from);
            toDate = sdf.parse(to);
            if (fromDate.compareTo(toDate) > 0) {
                flag1 = false;
                error.setFromDateError("From date must before to date");
                request.setAttribute("ERROR", error);
            }
            java.sql.Date fromsqlDate = new java.sql.Date(fromDate.getTime());
            java.sql.Date tosqlDate = new java.sql.Date(toDate.getTime());
            java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
            boolean check = false;
            if (flag1) {
                MoonCakeDTO dto = new MoonCakeDTO(productID, productName, description, fileName1, status, Float.parseFloat(price), Integer.parseInt(unit), categoryID, fromsqlDate, tosqlDate, today, user.getUserID());
                if (flag2) {
                    check = dao.update(dto);
                } else {
                    check = dao.updateWithNoImage(dto);

                }

                if (check) {
                    for (Part part : request.getParts()) {
                        String fileName = extractFileName(part);
                        String[] item = fileName.split("\\.");
                        for (String x : item) {
                            if (x.trim().equalsIgnoreCase("PNG") || x.trim().equalsIgnoreCase("JPG") || x.trim().equalsIgnoreCase("BMG")) {

                                error.setImgError("");
                                fileName = new File(fileName).getName();
                                part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
                            } else {

                                error.setImgError("Your file is not valid");
                            }
                        }

                    }
                    url = SUCCESS;
                    request.setAttribute("MESS", "Update your product success");
                }
            } else {
                request.setAttribute("ERROR", error);
                url = ERROR;

            }

        } catch (Exception e) {
            LOGGER.debug("Error at EditController" + e.getMessage());
            System.out.println("" + e.toString());
            if (e.toString().contains("duplicate")) {
                error.setProductIDError("Duplicated productID ! Please try a new productID");
                request.setAttribute("ERROR", error);
                url = ERROR;
            }
            if (e.toString().contains("out")) {
                error.setToDateError("You must select a valid day !");
                request.setAttribute("ERROR", error);
                url = ERROR;
            }
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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public String getPath() throws UnsupportedEncodingException {

        String path = this.getClass().getClassLoader().getResource("").getPath();
        String fullPath = URLDecoder.decode(path, "UTF-8");
        String pathArr[] = fullPath.split("build/web/WEB-INF/classes/");
        System.out.println(fullPath);
        System.out.println(pathArr[0]);
        fullPath = pathArr[0];

        return fullPath;

    }

    public File getFolderUpload() throws UnsupportedEncodingException {

        File folderUpload = new File(getPath() + "/web/img");
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

}
