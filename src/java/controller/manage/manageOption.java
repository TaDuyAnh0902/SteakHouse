/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import controller.Home;
import dal.AccountDAO;
import dal.BestSellingDAO;
import dal.BlogDAO;
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
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Blog;
import model.Category;
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
        ManageDAO mnDAO = new ManageDAO();
        BestSellingDAO bsDAO = new BestSellingDAO();
        switch (check) {
            case "productsManagement" -> {
                session.setAttribute("productsManagement", "success");
                List<Category> c = PdDAO.getAllCategory();
                session.setAttribute("data", c);
                List<Product> list = PdDAO.getproductByCid(1);
                request.setAttribute("products", list);

            }
            case "accountManagement" ->{
                session.setAttribute("accountManagement", "success");
                List<Account> list = acDAO.getAllAccount();
                session.setAttribute("accountManage", list);
            }
                
                
            case "blogManagement" -> {
                session.setAttribute("blogManagement", "success");
                List<Blog> list = blDAO.getAllBlog();
                session.setAttribute("blogManage", list);
            }
            
            case "tableManagement" ->{
                session.setAttribute("tableManagement", "success");
                List<Table> list = odDAO.getAllTable();
                session.setAttribute("tableManage", list);
            }
            
            case "statistics" -> {
                session.setAttribute("statistics", "success");
                String type = "cate";
                session.setAttribute("manage", "success");
                session.setAttribute("admin", "success");
                session.setAttribute("statistics", "success");
                Map<String, Integer> data = mnDAO.getDataProductsCategories();
                Map<String, Integer> dataOrder = mnDAO.getDataOrderManage();
                Map<String, Double> dataMoney = mnDAO.getDataRevenue();
                Map<String, Integer> dataBestSelling = bsDAO.getStatisticsBestSellings();
                
                String totalMoneyToDay = mnDAO.totalMoneyToday();
                String totalMoneyThisWeek = mnDAO.totalMoneyThisWeek();
                String totalMoneyThisMonth = mnDAO.totalMoneyThisMonth();
                try {
                    String compareTwoDates = mnDAO.CompareTwoDates();
                    if(compareTwoDates.startsWith("-"))
                    session.setAttribute("compareTwoDatesNegative", compareTwoDates);
                    else{
                        session.setAttribute("compareTwoDatesPositive", compareTwoDates);
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                    String compareTwoWeek = mnDAO.CompareTwoWeek();
                    if(compareTwoWeek.startsWith("-"))
                    session.setAttribute("compareTwoWeeksNegative", compareTwoWeek);
                    else{
                        session.setAttribute("compareTwoWeeksPositive", compareTwoWeek);
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                    String compareTwoMonth = mnDAO.CompareTwoMonth();
                    if(compareTwoMonth.startsWith("-"))
                    session.setAttribute("compareTwoMonthsNegative", compareTwoMonth);
                    else{
                        session.setAttribute("compareTwoMonthsPositive", compareTwoMonth);
                    }
                } catch (ParseException ex) {
                    Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                session.setAttribute("chart", data);
                session.setAttribute("graph", dataOrder);
                session.setAttribute("money", dataMoney);
                session.setAttribute("type", type);
                
                session.setAttribute("getStatisticsBestSellings", dataBestSelling);
                
                int totalCategory = mnDAO.totalCategory();
                session.setAttribute("totalCategory", totalCategory);
                int totalProduct = mnDAO.totalProduct();
                session.setAttribute("totalProduct", totalProduct);
                int totalUser = mnDAO.totalUser();
                session.setAttribute("totalUser", totalUser);
                int totalOrder = mnDAO.totalOrder();
                session.setAttribute("totalOrder", totalOrder);

                session.setAttribute("totalMoneyToDay", totalMoneyToDay);
                session.setAttribute("totalMoneyThisWeek", totalMoneyThisWeek);
                session.setAttribute("totalMoneyThisMonth", totalMoneyThisMonth);
            }
        }
        if (!check.equals("productsManagement")) {
            session.removeAttribute("productsManagement");
            session.removeAttribute("data");
        }
        if(!check.equals("accountManagement")) 
            session.removeAttribute("accountManagement");
        if(!check.equals("blogManagement")) 
            session.removeAttribute("blogManagement");
        if(!check.equals("statistics")) 
            session.removeAttribute("statistics");
        if(!check.equals("tableManagement")) 
            session.removeAttribute("tableManagement");
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
