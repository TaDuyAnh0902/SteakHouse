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
public class productAction extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet productAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productAction at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id = request.getParameter("id");
        String cid = request.getParameter("cid");
        String action = request.getParameter("action");
        ProductsDAO db = new ProductsDAO();
        if ("delete".equals(action)) {
            db.deleteProductById(id);
            int cid_int;
            try {
                cid_int = Integer.parseInt(cid);
                List<Product> list = db.getproductByCid(cid_int);
                request.setAttribute("products", list);
            } catch (NumberFormatException e) {
            }
        } else if ("edit".equals(action)) {
            Product productUpdate = db.getProductById(id);
            request.setAttribute("productUpdate", productUpdate);
        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String describe = request.getParameter("describe");
        String image = request.getParameter("image");
        String cid = request.getParameter("cid");

        int cid_int, quantity_int;
        float price_float;
        try {
            cid_int = Integer.parseInt(cid);
            quantity_int = Integer.parseInt(quantity);
            price_float = Float.parseFloat(price);
            ProductsDAO db = new ProductsDAO();

            db.updateProductById(name, quantity_int, price_float, describe, image, cid_int, id);
            List<Product> list = db.getproductByCid(cid_int);
            request.setAttribute("products", list);
        } catch (NumberFormatException e) {

        }
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
