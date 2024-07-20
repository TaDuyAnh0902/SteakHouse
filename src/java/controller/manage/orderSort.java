/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manage;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.OrderLine;

/**
 *
 * @author HP
 */
public class orderSort extends HttpServlet {
   
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
            out.println("<title>Servlet orderSort</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderSort at " + request.getContextPath () + "</h1>");
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
        session.removeAttribute("changedQuantity");
        String check = request.getParameter("check");
        String action = request.getParameter("action");
        OrderDAO odDAO = new OrderDAO();
        if(null != check)switch (check) {
            case "name":
                if("NameASC".equals(action)){
                    List<OrderLine> list = odDAO.sortNameOrdersASC();
                    session.setAttribute("allListOrderLine", list);
                }else{
                    List<OrderLine> list = odDAO.sortNameOrdersDESC();
                    session.setAttribute("allListOrderLine", list);
                }   break;
            case "quantity":
                if("QuantityASC".equals(action)){
                    List<OrderLine> list = odDAO.sortQuantityOrdersASC();
                    session.setAttribute("allListOrderLine", list);
                }else{
                    List<OrderLine> list = odDAO.sortQuantityOrdersDESC();
                    session.setAttribute("allListOrderLine", list);
                }   break;
            case "time":
                if("TimeASC".equals(action)){
                    List<OrderLine> list = odDAO.sortTimeOrdersASC();
                    session.setAttribute("allListOrderLine", list);
                }else{
                    List<OrderLine> list = odDAO.sortTimeOrdersDESC();
                    session.setAttribute("allListOrderLine", list);
                }   break;
            case "table":
                if("TableASC".equals(action)){
                    List<OrderLine> list = odDAO.sortTableOrdersASC();
                    session.setAttribute("allListOrderLine", list);
                }else{
                    List<OrderLine> list = odDAO.sortTableOrdersDESC();
                    session.setAttribute("allListOrderLine", list);
                }   break;
            case "status":
                if("StatusASC".equals(action)){
                    List<OrderLine> list = odDAO.sortStatusOrdersASC();
                    session.setAttribute("allListOrderLine", list);
                }else{
                    List<OrderLine> list = odDAO.sortStatusOrdersDESC();
                    session.setAttribute("allListOrderLine", list);
                }   break;
            default:
                break;
                
        }
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
