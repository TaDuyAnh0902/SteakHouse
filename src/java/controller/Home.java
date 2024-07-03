/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.HomeMobileRequestDAO;
import dal.ManageDAO;
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
import model.OrderLine;
import model.PaymentRequest;
import model.Product;

/**
 *
 * @author Admin
 */
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        AccountDAO acDAO = new AccountDAO();
        OrderDAO odDAO = new OrderDAO();
        ManageDAO mnDAO = new ManageDAO();
        HomeMobileRequestDAO hmDAO = new HomeMobileRequestDAO();
        String idTable = request.getParameter("idTable");
        if (session.getAttribute("role") == null) {
            session.setAttribute("role", 3);
        }
        if (idTable != null) {
            try {
                int idTable_int = Integer.parseInt(idTable);
                session.setAttribute("tableNumber", idTable_int);
                request.setAttribute("homeMobile", "success");
                int totalProductByTable = odDAO.totalProductByTable(idTable_int);
                session.setAttribute("totalProductByTable", totalProductByTable);
            } catch (NumberFormatException e) {
            }
        }
        switch ((int) session.getAttribute("role")) {
            case 1 -> {
                response.sendRedirect("manageOption?check=statistics");
                return;
            }
            case 2 -> {
               session.setAttribute("manageOrder", "success");
                List<OrderLine> list = odDAO.getAllListOrderLine();
                session.setAttribute("allListOrderLine", list);
                List<PaymentRequest> list2 = hmDAO.getAllPaymentRequest();
                session.setAttribute("listPaymentRequest", list2);
                response.sendRedirect("manageOrderAction?check=viewOrder");
                return;
            }

            default -> {
                request.setAttribute("main", "success");
                List<Product> list = PdDAO.getNewProduct();
                session.setAttribute("getNewProduct", list);
            }
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
