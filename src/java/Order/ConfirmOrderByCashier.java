/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Order;

import dal.BestSellingDAO;
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
 * @author HP
 */
public class ConfirmOrderByCashier extends HttpServlet {
   
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
            out.println("<title>Servlet ConfirmOrderByCashier</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmOrderByCashier at " + request.getContextPath () + "</h1>");
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
        String id = request.getParameter("id");
        String pid = request.getParameter("pid");
        String quantity = request.getParameter("quantity");
        OrderDAO odDAO = new OrderDAO();
        ProductsDAO pdDAO = new ProductsDAO();
        BestSellingDAO bsDAO = new BestSellingDAO();
        odDAO.confirmOrder(id);
        pdDAO.updateQuantity(quantity, pid);
        List<OrderLine> list = odDAO.getAllListOrderLine();
        session.setAttribute("allListOrderLine", list);
        session.removeAttribute("tableStatus");
        try {
            int pid_int = Integer.parseInt(pid);
            int quantity_int = Integer.parseInt(quantity);
            bsDAO.addBestSelling(pid_int, quantity_int);
            pdDAO.updateProductWaitting(pid_int, quantity_int);
            Product p = pdDAO.getProductById(pid);
            int firstQuantity = odDAO.firstQuantity(pid_int);
            odDAO.autoUpdateQuantity(pid_int);
            int secondQuantity = odDAO.firstQuantity(pid_int);
            if(firstQuantity != secondQuantity) {
                session.setAttribute("changedQuantity", "Món " + p.getName() + " đã chuyển từ " +  firstQuantity + " -> " + secondQuantity);
            }else{
                session.removeAttribute("changedQuantity");
            }
        } catch (NumberFormatException e) {
        }
        response.sendRedirect("manageOrderAction?check=viewOrder");
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
