/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import dal.AccountDAO;
import dal.BlogDAO;
import dal.OrderDAO;
import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Blog;
import model.Product;
import model.Table;

/**
 *
 * @author ADMIN
 */
public class manageOption extends HttpServlet {

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
            out.println("<title>Servlet manageOption</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manageOption at " + request.getContextPath() + "</h1>");
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
        String check = request.getParameter("check");
        OrderDAO odDAO = new OrderDAO();
        BlogDAO blDAO = new BlogDAO();
        AccountDAO acDAO =new AccountDAO();
        ProductsDAO PdDAO = new ProductsDAO();
        switch (check) {
            case "productsManagement" -> {
                session.setAttribute("productsManagement", "success");
                List<Product> list = PdDAO.getproductByCid(1);
                request.setAttribute("products", list);

            }
            case "accountManagement" ->{
                request.setAttribute("accountManagement", "success");
                List<Account> list = acDAO.getAllAccount();
                session.setAttribute("accountManage", list);
            }
                
                
            case "blogManagement" -> {
                request.setAttribute("blogManagement", "success");
                List<Blog> list = blDAO.getAllBlog();
                session.setAttribute("blogManage", list);
            }
            case "billManagement" ->
                request.setAttribute("billManagement", "success");
            case "tableManagement" ->{
                request.setAttribute("tableManagement", "success");
                List<Table> list = odDAO.getAllTable();
                session.setAttribute("tableManage", list);
            }
                
            default -> {
            }
        }
        if (!check.equals("productsManagement")) {
            session.removeAttribute("productsManagement");
        }
        session.setAttribute("manage", "success");
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
