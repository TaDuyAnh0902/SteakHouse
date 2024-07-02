/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;

/**
 *
 * @author kitai
 */
public class blogAction extends HttpServlet {

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
            out.println("<title>Servlet blogAction</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet blogAction at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");

        if ("Add new blog".equals(action)) {
            request.setAttribute("blogAdd", "success");
        } else {
            String id = request.getParameter("id");
            BlogDAO db = new BlogDAO();
            int id_int;
            try {
                id_int = Integer.parseInt(id);
                if ("delete".equals(action)) {
                    db.deleteBlogById(id_int);
                    response.sendRedirect("manageOption?check=blogManagement");
                    return;
                } else if ("edit".equals(action)) {
                    Blog blogUpdate = db.getBlogById(id_int);
                    request.setAttribute("blogUpdate", blogUpdate);

                }
            } catch (NumberFormatException e) {
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
        BlogDAO blDAO = new BlogDAO();
        String title = request.getParameter("title");

        if (title != null) {
            String image = request.getParameter("image");
            String source = request.getParameter("source");
            blDAO.addBlog(title, "blogImages/" + image, "blogList/" + source);
        } else {
            String newTitle = request.getParameter("newTitle");
            String newImage = request.getParameter("newImage");
            String newSource = request.getParameter("newSource");
            String id = request.getParameter("id");
            try {
                int id_int = Integer.parseInt(id);
                blDAO.updateBlog(newTitle, newImage, newSource, id_int);
            } catch (NumberFormatException e) {
            }

        }

        response.sendRedirect("manageOption?check=blogManagement");
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
