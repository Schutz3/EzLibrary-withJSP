/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.BookController;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
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
@WebServlet(name = "addBook", urlPatterns = {"/addBook"})
public class addBook extends HttpServlet {

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

            String imglink = request.getParameter("addimglink");
            String judul = request.getParameter("addjudul");
            String penulis = request.getParameter("addpenulis");
            String genre = request.getParameter("addgenre");
            String booklink = request.getParameter("addbooklink");
            ArrayList<String> errList = new ArrayList<>();
            
            if(!judul.matches("[^<>{}]+") 
            || !penulis.matches("[^<>{}]+")
            || !imglink.matches("https:\\/\\/drive\\.google\\.com\\/file\\/d\\/(.*?)\\/view\\?usp\\=sharing")        
            || !booklink.matches("https:\\/\\/drive\\.google\\.com\\/file\\/d\\/(.*?)\\/view\\?usp\\=sharing")){
            errList.add("ERROR");
            }
            if (!errList.isEmpty()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta http-equiv='refresh' content='5;URL=dashboard.jsp'>");
                out.println("<title>ADD BOOK ERROR</title>");            
                out.println("</head>");
                out.println("<body style='background-color: black;'>");
                out.println("<h1 style='color:red; text-align: center;'>!! ADD BOOK FAILED !!</h1>"
                            + "<br><h2 style='color:red; text-align: center;'>Your Request Cannot Be Proced due to Input Valid<br>!! Please Input Correctly !!</h2>"
                            + "<br><h3 style='color:red; text-align: center;'>You'll be Redirect to main home within 5 second</h3>");
                out.println("</body>");
                out.println("</html>");
            }else {
            String ilink = imglink.replaceAll("https://drive\\.google\\.com/file/d/(.*?)/.*?\\?usp=sharing", "$1");
            String blink = booklink.replaceAll("https://drive\\.google\\.com/file/d/(.*?)/.*?\\?usp=sharing", "$1");
            
            Book model = new Book();
            model.setImg(ilink);
            model.setJudul(judul);
            model.setPenulis(penulis);
            model.setGenre(genre);
            model.setLink(blink);

            BookController bc = new BookController();
            Boolean res = bc.create(model);
            if (res) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<meta http-equiv='refresh' content='5;URL=dashboard.jsp'>");
                    out.println("<title>ADD BOOK SUCCESS</title>");            
                    out.println("</head>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('NEW BOOK SUCCESSFULLY ADDED');");
                    out.println("location='dashboard.jsp';");
                    out.println("</script>");
                    out.println("</body>");
                    out.println("</html>");
            }   
            }
        } catch (Exception e) {
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
