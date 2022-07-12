<%-- 
    Document   : loginmdl
    Created on : Jul 7, 2022, 5:54:27 PM
    Author     : Reza
--%>

<div class="modal fade" id="Llogin" tabindex="-1" role="dialog" aria-labelledby="Llogin"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="Llogin">Librarian / Staff Login</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            
          <form action="login" method="POST">
            <div class="form-group">
              <label for="username">Librarian Username</label>
              <input type="username" class="form-control" id="username" name="username"
                placeholder="Your Librarian Username" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="password">Librarian Password:</label>
              <input type="password" class="form-control" id="password" name="password"
                placeholder="Your Librarian Password" required autocomplete="off">
            </div>
              <% if (request.getSession(true).getAttribute("errors") != null) {%>
              <div class="d-flex justify-content-center">
                        <div class="alert alert-warning alert-dismissible fade show pb-3 text-center" role="alert"><i class="bi bi-exclamation-triangle-fill"></i><br>
                        <strong>ERROR!!</strong><br><%= request.getSession(true).getAttribute("errors")%><br>If Forgot Username/Password Contact The Administrator
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
              </div>
            <% }%>
            <div class='d-flex justify-content-end'>
                <button type="submit" class=" btn btn-secondary " name="login">Login <i class="bi bi-box-arrow-right"></i></button></div>
          </form>
            
        </div>
      </div>
    </div>
  </div>
