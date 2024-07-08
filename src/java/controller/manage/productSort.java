/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manage;

import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class productSort extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productSort</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productSort at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductsDAO pdDAO = new ProductsDAO();
        String check = request.getParameter("check");
        String cid = request.getParameter("cid");
        String action = request.getParameter("action");
        List<Product> list = null;
        if(null != check)
            switch (check) {
            case "name" -> {
                if("NameASC".equals(action)){
                    list = pdDAO.sortNameProductsASC(cid);
                }else{
                    list = pdDAO.sortNameProductsDESC(cid);
                }
            }
            case "quantity" -> {
                if("QuantityASC".equals(action)){
                    list = pdDAO.sortQuantityProductsASC(cid);
                }else{
                    list = pdDAO.sortQuantityProductsDESC(cid);
                }
            }
            case "price" -> {
                if("PriceASC".equals(action)){
                    list = pdDAO.sortPriceProductsASC(cid);
                }else{
                    list = pdDAO.sortPriceProductsDESC(cid);
                }
            }
            default -> {
            }
        }
        request.setAttribute("products", list);
        request.setAttribute("productSize", list.size());
        request.getRequestDispatcher("home.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
