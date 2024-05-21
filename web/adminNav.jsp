<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <a style="color: black" class="navbar-brand" data-bs-toggle="offcanvas" href="#offcanvasExample" aria-controls="offcanvasExample">
                    <i class="fa-sharp fa-solid fa-bars"></i> E-commerce   
                </a>
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasExampleLabel"><i class="fa-sharp fa-solid fa-tags"></i> E-commerce</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <div>
                            <h5>
                                <a style="color: black; text-decoration: none;" href=""><i class="fa-regular fa-grid-horizontal"></i>

                                </a>
                            </h5>
                        </div>  

                        <div>
                            <h5>
                                <a style="color: black; text-decoration: none;" href=""><i class="fa-sharp fa-solid fa-tags"></i>Dashboard</a>
                            </h5>
                        </div>  

                        <div>
                            <h5>
                                <a style="color: black; text-decoration: none;" href="viewUser.jsp"><i class="fa-solid fa-user-group"></i> Customers</a>
                            </h5>
                        </div>

                        <div>
                            <h5>
                                <a style="color: black; text-decoration: none;" href="viewOrders.jsp"><i class="fa-solid fa-bag-shopping"></i> Orders</a>
                            </h5>
                        </div>

                        <div>
                            <h5>
                                <a style="color: black; text-decoration: none;" href="viewSupplier.jsp"><i class="fa-solid fa-boxes-packing"></i> Supplier</a>
                            </h5>
                        </div>
                        
                        <div>
                            <h5>
                                <a style="color: black; text-decoration: none;" href="adminViewProd.jsp"><i class="fa-solid fa-boxes-packing"></i> Products</a>
                            </h5>
                        </div>
         
                    </div>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="adminPannel.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="aPassUpdate.jsp">Update-Password</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="adminLogout.jsp">Log Out</a>
                        </li>
                </div>
                </ul>
            </div>
        </div>
    </nav>
    </body>
</html>
