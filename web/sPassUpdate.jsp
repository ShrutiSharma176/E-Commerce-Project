<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*" %>
<%@page import="Dto.*" %>

<% 
    String email = (String)session.getAttribute("email");
    SupplierDao dao = new SupplierDao();
    Supplier s = dao.getSuppDetails(email);
%>

<!DOCTYPE html>
<html>
    <head>
        <head>
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><i class="fa-solid fa-cart-shopping fa-lg"></i> E-Commerce</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="supplierDash.html">
                                <i class="fa-solid fa-house"></i>
                                Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="updateSupplier.jsp">
                                <i class="fa-regular fa-user"></i>Update Profile</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="suppLogout.jsp">Log Out</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">
                            <i class="fa-solid fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    <div style="height: auto; width: 60%; padding: 20px; margin:auto;margin-top: 80px;border: 2px solid lightgrey;">
        <center><h3 style="background-color: lightgrey; padding: 10px;">Password Updation</h3></center>
        <form action="sPassUpdate2.jsp">
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" placeholder="Enter Old Password" value="<%= s.getPassword()%>" name="password" id="password">
        </div>
        <div class="mb-3">
          <label for="newPass" class="form-label">New Password</label>
          <input type="password" class="form-control" placeholder="Create New Password" name="newPass" id="newPass">
        </div>
        <div class="mb-3">
          <label for="newPass2" class="form-label">Confirm Password</label>
          <input type="password" class="form-control" placeholder="Confirm Password" name="newPass2" id="newPass2">
        </div>
          <input type="submit" role="button" class="btn btn-primary" style="width: 100%;" value="Update">
        </form>
    </div>

</body>
</html>
