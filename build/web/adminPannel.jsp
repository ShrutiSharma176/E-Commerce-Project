<%@page import="Dto.Admin"%>
<%@page import="Dao.AdminDao"%>
<%
            String email = (String) session.getAttribute("email");
            AdminDao ad = new AdminDao();
            Admin a = ad.getAdDetails(email);
%>
<!DOCTYPE html>
<html>

<head>
    <title>TODO supply a title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
            
        <div class="container-fluid">
            <a class="navbar-brand" href="adminPannel.jsp">Welcome <i><%= a.getUsername()%></i> to E-Commerce</a>
           
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active text-right active" href="adminPannel.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            View
                        </a>
                        <ul class="dropdown-menu dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="viewUser.jsp"><i class="fa-solid fa-user-group"></i> Customers</a>
                            </li>
                            <li><a class="dropdown-item" href="adminViewOrders.jsp"><i class="fa-solid fa-bag-shopping"></i> Orders</a>
                            </li>
                            <li><a class="dropdown-item" href="viewSupplier.jsp"><i class="fa-solid fa-boxes-packing"></i> Supplier</a>
                            </li>
                            <li><a class="dropdown-item" href="adminViewProd.jsp"><i class="fa-solid fa-shop"></i> Products</a>
                            </li>
                            <li><a class="dropdown-item" href="viewReplacement.jsp"><i class="fa-solid fa-pen-to-square"></i> Replacement</a>
                            </li>
                            
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aPassUpdate.jsp">Update-Password</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogout.jsp">Log Out</a>
                    </li>
                </ul>
                    
                </div>
            </div>
        </div>
    </nav>
    <div class="container">
        <br>
        <div class="row">
        <div class="card col-lg-6" >
            <img src="ecommerce/online-shopping.png" class="card-img-top">
            <div class="card-body">
              <p class="card-text">We present to you the most up to date,it is in-season and on-incline; 
                if it is on the racks, it is on the web. Also, it is nowest,have it conveyed ASAP to you, 
                from a store close you, when you utilize our Phygital services.</p>
            </div>
          </div>
          <div class="card col-lg-6">
            <img src="ecommerce/online-shopping1.png" class="card-img-top">
            <div class="card-body">
              <p class="card-text">We are energetic about discovering things that transcend the commonplace; 
                that we think will get your attention and capture it. In addition, to convey these to you wherever
                 you are and at whatever point you believe you have sufficient energy to enjoy a bit.</p>
            </div>
          </div>
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="card col-md-3 col-lg-3">
                    <div class="card-body">
                        <img src="ecommerce/supplier1.png" class="img-fluid ">
                        <br><br>
                        <h5 class="card-title text-center">SUPPLIERS</h5>
                    </div>
                </div>

                <div class="card col-md-3 col-lg-3" >
                    <div class="card-body">
                        <img src="ecommerce/product.webp" class="img-fluid ">
                        <br><br>
                        <h5 class="card-title text-center">PRODUCTS</h5>
                    </div>
                </div>

                <div class="card col-md-3 col-lg-3" >
                    <div class="card-body">
                        <img src="ecommerce/user2.jpg" class="img-fluid ">
                        <br><br>
                        <h5 class="card-title text-center">USERS</h5>
                    </div>
                </div>

                <div class="card col-md-3 col-lg-3" >
                    <div class="card-body">
                        <img src="ecommerce/order1.png" class="img-fluid ">
                        <br><br>
                        <h5 class="card-title text-center">ORDERS</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>