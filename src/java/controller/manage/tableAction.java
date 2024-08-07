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
import model.Table;

/**
 *
 * @author HP
 */
public class tableAction extends HttpServlet {

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
            out.println("<title>Servlet tableAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tableAction at " + request.getContextPath() + "</h1>");
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
        OrderDAO db = new OrderDAO();
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (null != action) {
            switch (action) {
                case "restore" -> {
                    db.restoreTableById(id);
                    List<Table> list = db.getAllTable();
                    session.setAttribute("tableManage", list);
                }
                case "Add table" ->
                    request.setAttribute("tableAdd", "success");
                case "delete" -> {
                    db.deleteTableById(id);
                    response.sendRedirect("manageOption?check=tableManagement");
                    return;
                }
                case "edit" -> {
                    try {
                        int id_int = Integer.parseInt(id);
                        Table tableUpdate = db.getTableById(id_int);
                        request.setAttribute("tableUpdate", tableUpdate);
                    } catch (Exception e) {
                    }

                }
                default -> {
                }
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
        OrderDAO odDAO = new OrderDAO();
        String name = request.getParameter("name");
        String tableUpdate = request.getParameter("tableUpdate");
        String id = request.getParameter("id");
        if (name != null) {
            odDAO.addTable(name);
        } else {
            try {
                int id_int = Integer.parseInt(id);
                odDAO.updateTable(tableUpdate, id_int);

            } catch (NumberFormatException e) {
            }
        }

        response.sendRedirect("manageOption?check=tableManagement");
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
