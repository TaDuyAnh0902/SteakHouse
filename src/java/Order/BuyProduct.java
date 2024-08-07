/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Order;

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
import model.Product;

/**
 *
 * @author ADMIN
 */
public class BuyProduct extends HttpServlet {
   
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
            out.println("<title>Servlet BuyProduct</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyProduct at " + request.getContextPath () + "</h1>");
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
       HttpSession session = request.getSession();
        ProductsDAO PdDAO = new ProductsDAO();
        OrderDAO od = new OrderDAO();
        String idProduct = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        var tableNumber = (int) session.getAttribute("tableNumber");
        Product p = PdDAO.getProductById(idProduct);
        
        int idProduct_int, quantity_int;
        try {
            idProduct_int = Integer.parseInt(idProduct);
            quantity_int = Integer.parseInt(quantity);
            if(quantity_int > p.getQuantity()){
                response.sendRedirect("productInfo?id=" + idProduct + "&cid=1");
                return;
            }else{
                od.addOrderLine(idProduct_int, quantity_int, tableNumber);
            }
            List<OrderLine> list = od.getListOrderLine(tableNumber);
            session.setAttribute("OrderLine", list);
            String totalMoney = od.totalMoney(tableNumber);
            session.setAttribute("totalMoney", totalMoney);
            int totalProductByTable = od.totalProductByTable(tableNumber);
            session.setAttribute("totalProductByTable", totalProductByTable);
        } catch (NumberFormatException e) {
        }
        
        request.setAttribute("store", "success");
        List<Product> listProduct = PdDAO.getproductByCid(0);
        request.setAttribute("products", listProduct);
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
