<%-- 
    Document   : rtd
    Created on : Jul 7, 2022, 6:08:16 PM
    Author     : Reza
--%>
<%@page import="Controller.BookController"%>
<%@page import="Controller.ReqTDController"%>
<%@page import="qModel.RequestTD"%>
<%@page import="java.sql.ResultSet" %>
<%  BookController bc = new BookController();       
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
<div class="modal fade" id="requestRTD" tabindex="-1" role="dialog" aria-labelledby="requestRTD"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="requestRTD">Request Book Take Down</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        <p class="card-text"><b>Please provide valid email so we can contact you</b></p>
          <form method="post" action="addReqTD">
            <div class="form-group">
              <label for="namereqtd">Name</label>
              <input type="Name" class="form-control" name="namereqtd" id="namereqtd"
                placeholder="Your Name" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="emailreqtd">Email:</label>
              <input type="email" class="form-control" name="emailreqtd" id="emailreqtd"
                placeholder="Your Email e.g admin@ezlibrary.com" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="bookreqtd">Select A Book</label>
                <select class="form-control" name="bookreqtd" id="bookreqtd" required>
                <option value="" disabled selected hidden>Select Book You Want To Report</option>
                 <% while(rs.next()) { %>
                    <option><%= rs.getString("id") %> || <%= rs.getString("judul") %></option>
                 <% } %>
                </select>
            </div>
            <button type="submit" class="btn btn-secondary" name="submit">Request Take Down</button>
          </form>
        </div>
      </div>
    </div>
  </div>
