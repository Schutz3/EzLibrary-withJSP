/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.ReqBookController;
import Helper.StringHelper;
import java.io.*;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import qModel.RequestBook;

/**
 *
 * @author Farhan
 */
@WebServlet(name = "addReqBook", urlPatterns = {"/addReqBook"})
public class addReqBook extends HttpServlet {

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
            response.sendRedirect("index");
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
        try (PrintWriter out = response.getWriter()) {
            StringHelper h = new StringHelper();
            String name = request.getParameter("namereqb");
            String email = request.getParameter("emailreqb");
            String bookreq = request.getParameter("bookreqb");
            String validation = h.validateReqB(name, email, bookreq);
            
            if (!validation.isEmpty()) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta http-equiv='refresh' content='5;URL=index.jsp'>");
                out.println("<title>REQUEST ERROR !!!!</title>");            
                out.println("</head>");
                out.println("<body style='background-color: black; color:red; text-align: center;'>");
                out.println("<h1 style=''>!! REQUEST FAILED !!</h1>"
                            + "<br><h2>Your Request Cannot Be Proced due to:</h2> "
                            + validation
                            + "<h2>!! Please Input Correctly !!</h2>"
                            + "<br><h3>You'll be Redirect to main page within 5 second</h3>");
                out.println("</body>");
                out.println("</html>");
            }else {
                RequestBook model = new RequestBook();
                model.setName(name);
                model.setEmail(email);
                model.setBookReq(bookreq);

                ReqBookController RBC = new ReqBookController();
                Boolean res = RBC.create(model);

                if (res) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<meta http-equiv='refresh' content='5;URL=index.jsp'>");
                    out.println("<title>REQUEST SUCCESS</title>");            
                    out.println("</head>");
                    out.println("<body style='background-color: black; color:green; text-align: center;'>");
                    out.println("<h1'>REQUEST SUCCESS</h1>"
                            + "<br><h2>Your Request Has Been Submited To Our Librarian</h2>"
                            + "<br><h3>You'll be Redirect to main page within 5 second</h3>");
                    out.println("</body>");
                    out.println("</html>");  
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
