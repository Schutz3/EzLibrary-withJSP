<%-- 
    Document   : navbar
    Created on : Jul 7, 2022, 5:52:37 PM
    Author     : Farhan
--%>
<%@page import="Controller.BookController"%>
<%@page import="java.sql.ResultSet" %>
<%          BookController bc = new BookController();
            String search = "";
            ResultSet rs;
            String sort = "";
            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            }
            if (request.getParameter("sort") != null) {
                sort = request.getParameter("sort");
            }
                if (search.equals("")) {
                    if (sort.equals("Zz-Aa")) {
                    rs = bc.sortZa();
                    } 
                    else if (sort.equals("desc")) {
                    rs = bc.sortNl();
                    }
                    else if (sort.equals("asc")) {
                    rs = bc.sortLn();
                    }
                    else if (sort.equals("Aa-Zz")) {
                    rs = bc.sortAz();
                    }
                    else {
                    rs = bc.get();
                    }
                } else {
                rs = bc.getByName(search);
                }
        %>
<!-- START NavigationBar -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-secondary">
    <div class="container">
    <a class="navbar-brand disabled" href="./">
      <img src="./img/libico.png" width="30" height="30" class="d-inline-block align-top"alt="">
      EzLibrary
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
      </ul>
        <form class="form-inline" action="" method="GET">
        <input class="form-control mr-sm-2" type="text" name="search"  placeholder="Find a Book" autocomplete="off" value="<%= search%>" required>
        <button class="btn btn-success btn-sm ml-3 mb-1 mt-1"><i class="bi bi-search"></i> </button>
        </form>
        <div><button class="btn btn-danger btn-sm ml-3 mb-1 mt-1" data-toggle="modal" data-target="#Llogin"><i class="bi bi-person-badge"></i> Login</button></div>
    </div>
  </div>
  </nav>
<!-- END NavigationBar -->