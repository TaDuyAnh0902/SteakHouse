/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manage;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;

/**
 *
 * @author HP
 */
public class accountSort extends HttpServlet {
   
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
            out.println("<title>Servlet accountSort</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet accountSort at " + request.getContextPath () + "</h1>");
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
        String check = request.getParameter("check");
        String action = request.getParameter("action");
        AccountDAO acDAO = new AccountDAO();
        List<Account> list = null;
        if (null != check) {
            switch (check) {
                case "username" -> {
                    if (null != action) {
                        switch (action) {
                            case "UsernameASC" ->  {
                                list = acDAO.getAllAccountByUsernameASC();
                                session.setAttribute("accountManage", list);
                            }
                            case "UsernameDESC" ->  {
                                list = acDAO.getAllAccountByUsernameDESC();
                                session.setAttribute("accountManage", list);
                            }
                            default -> {
                            }
                        }
                    }
                }
                case "name" -> {
                    if (null != action) {
                        switch (action) {
                            case "NameASC" ->  {
                                list = acDAO.getAllAccountByNameASC();
                                session.setAttribute("accountManage", list);
                            }
                            case "NameDESC" ->  {
                                list = acDAO.getAllAccountByNameDESC();
                                session.setAttribute("accountManage", list);
                            }
                            default -> {
                            }
                        }
                    }
                }
                case "status" -> {
                    if (null != action) {
                        switch (action) {
                            case "StatusASC" ->  {
                                list = acDAO.getAllAccountByStatusASC();
                                session.setAttribute("accountManage", list);
                            }
                            case "StatusDESC" ->  {
                                list = acDAO.getAllAccountByStatusDESC();
                                session.setAttribute("accountManage", list);
                            }
                            default -> {
                            }
                        }
                    }
                }

                default -> {
                }
            }
        }
        request.setAttribute("accountSize", list.size());
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
