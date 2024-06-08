/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Blog;
import model.Category;
import model.Product;

/**
 *
 * @author kitai
 */
public class Action extends HttpServlet {

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
            out.println("<title>Servlet Action</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Action at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        ProductsDAO PdDAO = new ProductsDAO();
        BlogDAO bdDAO = new BlogDAO();
        String check = request.getParameter("check");
        switch (check) {
            case "introduction" ->
                request.setAttribute("introduction", "success");
            case "contact" ->
                request.setAttribute("contact", "success");
            case "store" -> {
                request.setAttribute("store", "success");

                List<Category> c = PdDAO.getAllCategory();
                session.setAttribute("data", c);

                List<Product> list = PdDAO.getproductByCid(0);

                request.setAttribute("Cid", 0);
                request.setAttribute("page", 1);
                int size = list.size();
                int numperpage = 12;
                int num = (size % numperpage == 0 ? (size / numperpage) : ((size / numperpage) + 1));
                request.setAttribute("num", num);
                List<Product> list1 = PdDAO.getListByPage(list, 0, numperpage);
                request.setAttribute("products", list1);

            }
            case "blog" -> {
                request.setAttribute("blog", "success");
                List<Blog> list = bdDAO.getAllBlog();
                request.setAttribute("blogList", list);
            }
            case "manage" -> {
                session.setAttribute("manage", "success");
                request.setAttribute("statistics", "success");
                List<Category> c = PdDAO.getAllCategory();
                session.setAttribute("data", c);
            }
            case "manageOrder" -> {
                request.setAttribute("manageOrder", "success");
            }
            case "main" -> {
                request.setAttribute("main", "success");
            }
            case "ListOrderLine" ->
                request.setAttribute("ListOrderLine", "success");

            default -> {
            }
        }
        if (!check.equals("manage")) {
            session.removeAttribute("manageOption");
            session.removeAttribute("manage");
            session.removeAttribute("productsManagement");
            session.removeAttribute("productAdd");
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
