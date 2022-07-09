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
import qModel.Book;

/**
 *
 * @author Farhan
 */
@WebServlet(name = "editBookServlet", urlPatterns = {"/editBookServlet"})
public class editBookServlet extends HttpServlet {

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
            response.sendRedirect("dashboard.jsp");
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
        try {
            String id = request.getParameter("id");
            String imglink = request.getParameter("imglink");
            String judul = request.getParameter("judul");
            String penulis = request.getParameter("penulis");
            String genre = request.getParameter("genre");
            String booklink = request.getParameter("booklink");
            
            String blink = booklink.replaceAll("https://drive\\.google\\.com/file/d/(.*?)/.*?\\?usp=sharing", "$1");
            String ilink = imglink.replaceAll("https://drive\\.google\\.com/file/d/(.*?)/.*?\\?usp=sharing", "$1");
            
            Book model = new Book();
            model.setImg(ilink);
            model.setJudul(judul);
            model.setPenulis(penulis);
            model.setGenre(genre);
            model.setLink(blink);

            BookController BC = new BookController();
            Boolean res = BC.update(id, model);
            if (res) {
                response.sendRedirect("dashboard.jsp");
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
