<%-- 
    Document   : navbar
    Created on : Jul 7, 2022, 5:52:37 PM
    Author     : Reza
--%>
<%@page import="Controller.BookController"%>
<%@page import="Controller.ReqTDController"%>
<%@page import="Controller.ReqBookController"%>
<%@page import="java.sql.ResultSet" %>

<%          BookController bc = new BookController();
            ReqBookController brq = new ReqBookController();
            ReqTDController btd = new ReqTDController();
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
            ResultSet td = btd.get();
            ResultSet rq = brq.get();
        %>
 <!-- START Takedown Request -->
  <div class="modal fade" id="readRT" tabindex="-1" role="dialog" aria-labelledby="readRT"
              aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content text-center justify-content-center">
                  <div class="modal-header ">
                    <h6 class="modal-title text-center justify-content-center" id="exampleModalLongTitle">Book Report</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body text-center justify-content-center" >
                  <div style="overflow: auto;">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Reporting book:</th>
                            <th scope="col">Action</th>
                          </tr>
                      </thead>
                      <tbody>
                      <% if (!td.isBeforeFirst()) { %>
		                          <tr>
			                        <td colspan="5" style="align: center;">No Book Report</td>
		                          </tr>
	               <% } %>
                      <% int i = 1;
                        while(td.next()) { 
                      %>
                          <tr>
                            <th scope="row"><%= i %></th>
                            <td><%= td.getString("name") %></td>
                            <td><%= td.getString("email") %></td>
                            <td><%= td.getString("booktdreq") %></td>
                            <td><form action="deleteRequestTDServlet?id=<%= td.getString("id") %>" method="POST" onsubmit='alert("Request Deleted!");'>
                                    <button class="btn btn-danger btn-sm" type="submit" onclick="return confirm('Sure?')"><i class="bi bi-trash3-fill"></i></button>
                                </form>
                            </td>
                          </tr>
                        <% i++;
                            } %>
                      </tbody>
                    </table>
                  </div>
                  </div>
                </div>
              </div>
            </div>
  <!-- END Takedown Request --> 
  <!-- START Read Request -->
    <div class="modal fade" id="readReq" tabindex="-1" role="dialog" aria-labelledby="readReq"
              aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content text-center justify-content-center">
                  <div class="modal-header ">
                    <h6 class="modal-title text-center justify-content-center" id="exampleModalLongTitle">Book Request</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body text-center justify-content-center" >
                  <div style="overflow: auto;">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Requesting Book</th>
                            <th scope="col">Action</th>
                          </tr>
                      </thead>
                      <tbody>
                          <% if (!rq.isBeforeFirst()) { %>
		                          <tr>
			                        <td colspan="5" style="align: center;">No Request</td>
		                          </tr>
                          <% } %>
                          <% int j = 1;
                            while(rq.next()) { 
                          %>
                          <tr>
                            <th scope="row"><%= j %></th>
                            <td><%= rq.getString("name") %></td>
                            <td><%= rq.getString("email") %></td>
                            <td><%= rq.getString("bookreq") %></td>
                            <td>
                                <form action="deleteRequestBookServlet?id=<%= rq.getString("id") %>" method="POST" onsubmit='alert("Request Deleted!");'>
                                <button class="btn btn-danger btn-sm" type="submit" onclick="return confirm('Sure?')"> <i class="bi bi-trash3-fill"></i></button>
                                </form>
                                </td>
                          </tr>
                        <% j++;
                            } %>
                      </tbody>
                    </table>
                  </div>
                  </div>
                </div>
              </div>
            </div>
  <!-- END Read Request -->
       
<!-- START NavigationBar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-secondary">
    <div class="container">
    <a class="navbar-brand disabled" href="dashboard.jsp">
      <img src="./img/libico.png" width="30" height="30" class="d-inline-block align-top"alt="">
      Dashboard
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="true" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse collapse show" id="navbarColor01" >
      <ul class="navbar-nav mr-auto">
          <li class="nav-item dropdown ml-1">
        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          Sort By
        </a>
        
        <ul class="dropdown-menu " aria-labelledby="navbarScrollingDropdown">
        <li><a class="dropdown-item" href="?sort=desc">Newest</a></li>
          <li><a class="dropdown-item" href="?sort=asc">Oldest</a></li>
          <li><a class="dropdown-item" href="?sort=Aa-Zz">Aa-Zz</a></li>
          <li><a class="dropdown-item" href="?sort=Zz-Aa">Zz-Aa</a></li>
        </ul>
      </li>
      <button type="button" class="btn btn-outline-primary btn-sm text-light   ml-3 mb-1 mt-1" data-toggle="modal" data-target="#addBook"><i class="bi bi-plus-square"></i> Book</button>
      <button type="button" class="btn btn-outline-success btn-sm text-light   ml-3 mb-1 mt-1" data-toggle="modal" data-target="#readReq"><i class="bi bi-inboxes-fill"></i> Request (<%= j-1 %>) </button>
      <button type="button" class="btn btn-outline-warning btn-sm text-light ml-3 mb-1 mt-1" data-toggle="modal" data-target="#readRT"><i class="bi bi-exclamation-triangle-fill"></i> Report (<%= i-1 %>) </button>
      </ul>
        <form class="form-inline" action="" method="GET">
        <input class="form-control mr-sm-2" type="text" name="search"  placeholder="Find a Book" autocomplete="off" value="<%= search%>" required>
        <button class="btn btn-success btn-sm ml-3 mb-1 mt-1"><i class="bi bi-search"></i> </button>
      </form>
      <form class="form-inline" action="logout" method="POST">
        <div><button class="btn btn-danger btn-sm ml-3 mb-1 mt-1"><i class="bi bi-arrow-left-square"></i> Logout</button></div>
      </form>
    </div>
  </div>
  </nav>
<!-- END NavigationBar -->
<!-- START Add Book -->
  <div class="modal fade" id="addBook" tabindex="-1" role="dialog" aria-labelledby="addBook"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addBook">Add / Publish New Book</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="addBook" method="POST">
            <div class="form-group">
              <label for="addjudul">Title of the Book or Journal</label>
              <input type="text" class="form-control" id="addjudul" name="addjudul"
                placeholder="Title of the Book or Journal" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="addpenulis">Writer of the Book</label>
              <input type="text" class="form-control" id="addpenulis" name="addpenulis"
                placeholder="Writer of the Book" required autocomplete="off">
            </div>
            <div class="form-group">
                  <label for="addgenre">Genre of the Book</label>
                  <select class="form-control" id="addgenre" name="addgenre" required>
                      <option value="" disabled selected hidden>Select Genre</option>
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
              <label for="addbooklink">PDF File Link (Google Drive)<i class="bi bi-filetype-pdf"></i><i class="bi bi-filetype-ppt"></i><i class="bi bi-filetype-pptx"></i></label>
              <input type="text" class="form-control" id="addbooklink" name="addbooklink"
                placeholder="PDF File Link (Google Drive)" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="addimglink">Cover/Image Link (Google Drive<i class="bi bi-filetype-png"></i><i class="bi bi-filetype-jpg"></i></label>
              <input type="text" class="form-control" id="addimglink" name="addimglink"
                placeholder="Cover/Image Link (Google Drive)" required autocomplete="off">
            </div>
              <div class="d-flex justify-content-end"><button type="submit" class="btn btn-success justify-content-end" name="addBook"><i class="bi bi-plus-square"></i> Book</button></div>
          </form>
        </div>
      </div>
    </div>
  </div>
 <!-- END Add Book -->