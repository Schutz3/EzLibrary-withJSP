/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.BookController;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Farhan
 */
@WebServlet(name = "deleteBookServlet", urlPatterns = {"/deleteBookServlet"})
public class deleteBookServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            response.sendRedirect("dashboard");
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
        processRequest(request, response);
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
<<<<<<< HEAD
       try(PrintWriter out = response.getWriter()) {
=======
       try {
>>>>>>> 6f94c1c740c7de2257b2da5b882b4ca6688395dd
            String id = request.getParameter("id");
            
            BookController bq = new BookController();
            Boolean delrq = bq.delete(id);

            if (delrq) {
<<<<<<< HEAD
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<meta http-equiv='refresh' content='5;URL=dashboard.jsp'>");
                    out.println("<title>ADD BOOK SUCCESS</title>");            
                    out.println("</head>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('BOOK DELETED SUCCESSFULLY');");
                    out.println("location='dashboard.jsp';");
                    out.println("</script>");
                    out.println("</body>");
                    out.println("</html>");
=======
                response.sendRedirect("dashboard");
>>>>>>> 6f94c1c740c7de2257b2da5b882b4ca6688395dd
            }
            } catch (IOException | ParseException e) {
            System.out.println(e.getMessage());
            }
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
