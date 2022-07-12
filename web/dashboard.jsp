<%-- 
    Document   : index
    Created on : Jul 4, 2022, 2:34:33 PM
    Author     : Reza
--%>
<%@page import="Controller.BookController"%>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%          if (session.getAttribute("isLoggedIn") == null) {
            response.sendRedirect("index");
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
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="css/style.jsp"/>  
    </head>
    <body>
        <div style="background: url('./img/library.jpg')" class="page-holder bg-cover">    
           <jsp:include page="layout/navbard.jsp"/>  
            <!-- START Header -->
            <div class="header">
                <div class="container text-center pt-3 bg-success opacity-1 pb-1">
                    <h5 class="display-6 hammer text-light pt-3 mt-5 opacity-0">Hi, <i class="text-warning"> <%= request.getSession(true).getAttribute("name") %></i>. Welcome to the EzLibrary Dashboard! </h5>
                    <p class="lead text-light">You are logged in using username : <strong class="text-warning"><%= request.getSession().getAttribute("username") %></strong></p>
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
                                <h5 class="card-title">Sorry, Book Not Found :(</h5>
                                <p class="card-text">NOTHING BOOK LISTED, YOU CAN ADD BOOK <a href="#" data-toggle="modal" data-target="#addBook">HERE</a> </p>
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
                                <button class="btn btn-primary mt-1" type="submit" data-toggle="modal" data-target="#updBook<%= rs.getString("id")%>"><i class="bi bi-pencil-square"></i> Edit</button>
                                <form action="deleteBookServlet?id=<%= rs.getString("id") %>" method="POST">
                                <button class="btn btn-danger mt-1" onclick='return confirm(`ARE YOU SURE WANT TO DELETE BOOK \n<%= rs.getString("judul")%> || ID: <%= rs.getString("id") %>  \nFROM LIST?`);' type="submit"><i class="bi bi-trash3-fill"></i></button></form>
                            </div>
                        </div>
                    </div>
                    <!-- Update  Book -->
                    <div class="modal fade" id="updBook<%= rs.getString("id") %>" tabindex="-1" role="dialog" aria-labelledby="addBook"
                      aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h6 class="modal-title display-6" id="addBook">Update Book<div class="text-danger"><%= rs.getString("judul")%></div></h6>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form action="editBookServlet" method="POST">
                              <div class="form-group">
                                <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                                <label for="judul">Title of the Book or Journal</label>
                                <input type="text" class="form-control" id="judul" name="judul"
                                  placeholder="Title of the Book or Journal" required autocomplete="off" value="<%= rs.getString("judul")%>" required>
                              </div>
                              <div class="form-group">
                                <label for="penulis">Writer of the Book</label>
                                <input type="text" class="form-control" id="penulis" name="penulis"
                                  placeholder="Writer of the Book" required autocomplete="off" value="<%= rs.getString("penulis")%>" required>
                              </div>
                              <div class="form-group">
                                <label for="genre">Genre of the Book</label>
                                  <select class="form-control" id="genre" name="genre" required>
                                      <option value="<%= rs.getString("genre")%>" disabled selected hidden>Select Genre (Current Genre is <b><%= rs.getString("genre")%>)</b></option>
                                        <option>Science</option>
                                        <option>Social</option>
                                        <option>Fiction</option>
                                        <option>Comedy</option>
                                        <option>Technology</option>
                                        <option>Religion</option>
                                        <option>Romance</option>
                                        <option>Others</option>
                                  </select>
                              </div>
                              <div class="form-group">
                                <label for="booklink">PDF File Link (Google Drive) <i class="bi bi-filetype-pdf"></i>  <i class="bi bi-filetype-ppt"></i> <i class="bi bi-filetype-pptx"></i></label>
                                <input type="url" class="form-control" id="booklink" name="booklink"
                                  placeholder="New Link Required" required autocomplete="off" value="https://drive.google.com/file/d/<%= rs.getString("link")%>/view?usp=sharing" required>
                              </div>
                              <div class="form-group">
                                <label for="imglink">Image Cover Link (Google Drive) <i class="bi bi-filetype-png"></i><i class="bi bi-filetype-jpg"></i></label>
                                <input type="url" class="form-control" id="imglink" name="imglink"
                                  placeholder="New Link Required" required autocomplete="off" value="https://drive.google.com/file/d/<%= rs.getString("img")%>/view?usp=sharing" required>
                              </div>
                              <div class="d-flex justify-content-end"><button type="submit" class="btn btn-success" name="update"><i class="bi bi-pencil-square"></i> Edit Book</button></div> 
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Update  Book -->
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
            <jsp:include page='layout/footerd.jsp'/>
            <jsp:include page='js/script.jsp'/>
        </div>
        <!-- END Footer -->
    </body>
</html>
