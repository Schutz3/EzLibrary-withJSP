<%-- 
    Document   : reqmdl
    Created on : Jul 7, 2022, 5:57:43 PM
    Author     : Reza
--%>
<%@page import="Controller.ReqBookController"%>
<%@page import="qModel.RequestBook"%>

<div class="modal fade" id="requestB" tabindex="-1" role="dialog" aria-labelledby="requestB"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="requestB">Request Book</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        <p class="card-text"><b>Please provide valid email so we can notify you when your book is published in our site</b></p>
          <form class="needs-validation" method="POST" action="addReqBook">
            <div class="form-group">
              <label for="namereqb">Name</label>
              <input type="Name" class="form-control" name="namereqb" id="namereqb" 
                placeholder="Your Name" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="emailreqb">Email:</label>
              <input type="email" class="form-control" name="emailreqb" id="emailreqb"
                placeholder="Your Email e.g admin@ezlibrary.com" required autocomplete="off">
            </div>
            <div class="form-group">
              <label for="bookreqb">Book you want to request</label>
              <input type="text" class="form-control" name="bookreqb" id="bookreqb"
                placeholder="Title or ISBN Number" required autocomplete="off">
            </div>
            <button type="submit" class="btn btn-secondary">Request</button>
          </form>
        </div>
      </div>
    </div>
  </div>

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
          <form method="post">
          <fieldset disabled>
            <div class="form-group">
              <label for="inpName" >Name</label>
              <input type="Name" class="form-control" name="namertd" id="disabledInput"
                placeholder="Book Not Found">
            </div>
            </fieldset>
            <fieldset disabled>
            <div class="form-group">
              <label for="inpEmail">Email:</label>
              <input id="disabledInput" type="email" class="form-control" name="emailrtd"
                placeholder="Return To Main Page First">
            </div>
            </fieldset>
            <fieldset disabled>
            <div class="form-group">
              <label for="exampleFormControlSelect2">Select A Book</label>
                <select class="form-control" name="bookrtde" id="bookrtde">
                    <option>404</option>
                </select>
            </div>
          </fieldset>
          <div class="container justify-content-center text-center">
            <button type="submit" class="btn btn-danger text-center" name="returnHome" >Back To Main Page</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
