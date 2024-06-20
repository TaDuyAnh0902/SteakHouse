/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
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
import java.util.Map;
import java.util.Random;
import model.Category;
import model.OrderLine;
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
        String idTable = request.getParameter("idTable");
        if (session.getAttribute("role") == null) {
            session.setAttribute("role", 3);
        }
        if (idTable != null) {
            try {
                int idTable_int = Integer.parseInt(idTable);
                session.setAttribute("tableNumber", idTable_int);

//                String randomString = generateRandomString(10);
//                session.setAttribute("userByMobile", randomString);
//                acDAO.addUserPhone(randomString, 4);
                request.setAttribute("homeMobile", "success");
                int totalProductByTable = odDAO.totalProductByTable(idTable_int);
                session.setAttribute("totalProductByTable", totalProductByTable);
            } catch (NumberFormatException e) {
            }
        }
        switch ((int) session.getAttribute("role")) {
            case 1 -> {
                String type = "cate";
                session.setAttribute("manage", "success");
                request.setAttribute("admin", "success");
                session.setAttribute("statistics", "success");
                Map<String, Integer> data = mnDAO.getDataProductsCategories();
                Map<String, Integer> dataOrder = mnDAO.getDataOrderManage();
                Map<String, Double> dataMoney = mnDAO.getDataRevenue();

                request.setAttribute("chart", data);
                request.setAttribute("graph", dataOrder);
                request.setAttribute("money", dataMoney);
                request.setAttribute("type", type);

                int totalCategory = mnDAO.totalCategory();
                request.setAttribute("totalCategory", totalCategory);

                int totalProduct = mnDAO.totalProduct();
                request.setAttribute("totalProduct", totalProduct);

                int totalUser = mnDAO.totalUser();
                request.setAttribute("totalUser", totalUser);

                int totalOrder = mnDAO.totalOrder();
                request.setAttribute("totalOrder", totalOrder);

            }
            case 2 -> {
                session.setAttribute("manageOrder", "success");
                List<OrderLine> list = odDAO.getAllListOrderLine();
                session.setAttribute("allListOrderLine", list);
            }

            default -> {
                request.setAttribute("main", "success");
                List<Product> list = PdDAO.getNewProduct();
                session.setAttribute("getNewProduct", list);
            }
        }

        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

//    public static String generateRandomString(int length) {
//        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
//        Random random = new Random();
//        StringBuilder sb = new StringBuilder(length);
//
//        for (int i = 0; i < length; i++) {
//            int index = random.nextInt(characters.length());
//            sb.append(characters.charAt(index));
//        }
//
//        return sb.toString();
//    }
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
