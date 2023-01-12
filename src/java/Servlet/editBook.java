/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.BookController;
import Helper.StringHelper;
import java.io.*;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import qModel.Book;

/**
 *
 * @author Farhan
 */
@WebServlet(name = "editBook", urlPatterns = {"/editBook"})
public class editBook extends HttpServlet {

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
        try(PrintWriter out = response.getWriter()) {
            StringHelper h = new StringHelper();
            
            String id = request.getParameter("id");
            String imglink = request.getParameter("imglink");
            String genre = request.getParameter("genre");
            String booklink = request.getParameter("booklink");
            String judul = request.getParameter("judul");
            String penulis = request.getParameter("penulis");
            String validation = h.validateEditB(imglink, judul, penulis, booklink);
            
            if (!validation.isEmpty()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta http-equiv='refresh' content='5;URL=dashboard.jsp'>");
                out.println("<title>EDIT BOOK ERROR</title>");            
                out.println("</head>");
                out.println("<body style='background-color: black; color:red; text-align: center; color:red; text-align: center;'>");
                out.println("   <h1>!! EDIT BOOK FAILED !!</h1>"
                            + "<h2>Your Request Cannot Be Proced due to Input Valid</h2>"
                            + validation
                            + "<h2> !! Please Input Correctly !!</h2>"
                            + "<h3>You'll be Redirect to main home within 5 second</h3>");
                out.println("</body>");
                out.println("</html>");
            }else {
            String blink = booklink.replaceAll("https://drive\\.google\\.com/file/d/(.*?)/.*?\\?usp=sharing", "$1");
            String ilink = imglink.replaceAll("https://drive\\.google\\.com/file/d/(.*?)/.*?\\?usp=sharing", "$1");
            
            Book model = new Book();
            model.setImg(ilink);
            model.setJudul(judul);
            model.setPenulis(penulis);
            model.setGenre(genre);
            model.setLink(blink);

            BookController bc = new BookController();
            Boolean res = bc.update(id, model);
            if (res) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<meta http-equiv='refresh' content='5;URL=dashboard.jsp'>");
                    out.println("<title>EDIT BOOK SUCCESS</title>");            
                    out.println("</head>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('BOOK " +judul+ " SUCCESSFULLY EDITED');");
                    out.println("location='dashboard.jsp';");
                    out.println("</script>");
                    out.println("</body>");
                    out.println("</html>");;
            
            }
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
