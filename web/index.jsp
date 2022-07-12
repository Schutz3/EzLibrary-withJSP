<%-- 
    Document   : index
    Created on : Jul 4, 2022, 2:34:33 PM
    Author     : Reza
--%>
<%@page import="Controller.BookController"%>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%          if (session.getAttribute("isLoggedIn") != null) {
            response.sendRedirect("dashboard");
            return;
            }
            BookController bc = new BookController();
            String search = "";
            ResultSet rs;
            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 
            if (search.equals("")) {
                rs = bc.get();
            } else {
                rs = bc.getByName(search);
            }
%>
<html lang="en">
    <head>
        <jsp:include page="css/style.jsp"/>  
    </head>
    <body>
        <div style="background: url('./img/library.jpg')" class="page-holder bg-cover">    
           <jsp:include page="layout/navbar.jsp"/>  
            <jsp:include page="layout/loginmdl.jsp"/>  
            <!-- START Header -->
            <div class="header">
                <div class="container text-center pt-3 bg-success opacity-1 pb-1">
                    <h3 class="display-6 hammer text-light pt-3 mt-5 pb-3 mb-3 opacity-0">Online library for everyone</h3> 
                </div>
            </div>
            <!-- END Header -->
            <!-- START content -->
            <div class="container justify-content-center">
                <div class="row justify-content-center ">
                    <!--IF CONTENT EMPTY-->
                    <% if (!rs.isBeforeFirst()) { %>
                    <div class="col-md2 text-center mt-2 mb-2">
                        <div class="card opacity-1">
                            <div class="tenor-gif-embed" data-postid="22163955" data-share-method="host" data-aspect-ratio="1" data-width="100%"><a href="https://tenor.com/view/404-gif-22163955">404 GIF</a>from <a href="https://tenor.com/search/404-gifs">404 GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
                            <div class="card-body">
                                <h5 class="card-title">Nothing Found Here :(</h5>
                                <p class="card-text">Back to Main Page <a href="index">here</a> <br>Or<br> Request to our librarian <a href="#" data-toggle="modal" data-target="#requestB">here</a> </p>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="layout/reqempmdl.jsp"/>  
                    <% } %>
                    <% while (rs.next()) {%>      
                    <div class="col-md-4 text-center mt-2 mb-2">
                        <div class="card opacity-1">
                            <img class="card-img-top coverbook" width="100" src="https://drive.google.com/thumbnail?id=<%= rs.getString("img")%>" alt="Book <%= rs.getString("judul")%> W/ID:<%= rs.getString("id")%>">  
                            <div class="card-body">
                                <h5 class="card-title"><%= rs.getString("judul")%></h5>
                                <p class="card-text">
                                    <i class="bi bi-book-fill"></i> ID: <b><%= rs.getString("id")%></b><br>
                                    Writer: <b><%= rs.getString("penulis")%></b><br>
                                    Genre: <b><%= rs.getString("genre")%></b><br>
                                </p>
                                <button class="btn btn-secondary mt-1" type="submit" data-toggle="modal" data-target="#modalBaca<%= rs.getString("id")%>"><i class="bi bi-book-fill"></i> Read</button>
                                <a href="https://drive.google.com/uc?export=download&id=<%= rs.getString("link")%>" onclick="return confirm('Do You Want To Download This E-Book?');"><button class="btn btn-success mt-1" type="submit"><i class="bi bi-file-earmark-arrow-down-fill"></i>Get</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modalBaca<%= rs.getString("id")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                         aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                            <div class="modal-content text-center justify-content-center">
                                <div class="modal-header ">
                                    <h6 class="modal-title text-center justify-content-center" id="exampleModalLongTitle"><?= $row["judul"]; ?></h6>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center justify-content-center">
                                    <div class="bacabuku">
                                        <iframe id="myFrame" class="bacabuku" src="https://drive.google.com/file/d/<%= rs.getString("link")%>/preview" allow="autoplay" frameborder="0"></iframe>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
            <!--END content -->
            <jsp:include page='layout/footer.jsp'/>
            <jsp:include page='layout/rtd.jsp'/>
            <jsp:include page='js/script.jsp'/>
        </div>
        <!-- END Footer -->
    </body>
</html>
