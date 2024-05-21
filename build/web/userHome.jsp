<%@page import="Dao.*" %>
<%@page import="Dto.*" %>

<%
    String email=(String)session.getAttribute("email");
    UserDao dao=new UserDao();
    User u=dao.getUserDetails(email);
    
    CartDao c=new CartDao();
    int count=c.countProd(u.getUser_id());
%>

<!DOCTYPE html>
<html>

    <head>
        <title>Document</title>
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
                <a class="navbar-brand" href="#"><i class="fa-solid fa-cart-shopping fa-lg"></i> E-Commerce</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="userHome.jsp">
                                <i class="fa-solid fa-house"></i>
                                Home</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="viewProduct.jsp">Products</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="viewCart.jsp?">
                                Cart<span class="badge bg-danger" style="margin-left: 2px;">
                                <%= count%>
                            </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="viewOrders.jsp">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="updateUser.jsp">
                                <i class="fa-regular fa-user"></i>Update Profile</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="uPassUpdate.jsp">Update Password</a>
                        </li><li class="nav-item">
                            <a class="nav-link" href="userLogout.jsp">Log Out</a>
                        </li>
                    </ul>

                    <form class="d-flex">
                        <!-- <h5>
                                <i class="fa-solid fa-cart-shopping fa-lg mt-4 me-3">
                                </i> 
                            </h5>-->
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">
                            <i class="fa-solid fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="ecommerce/woman1.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="ecommerce/grocery3.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="ecommerce/AirPods1.jpg" class="d-block w-100">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

       <br><br>
    <center>
        <h1>Products</h1>
    </center>
    <br><br>
    <div class="row" style="margin-right:40px;margin-left:40px;">
        <div class="card col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/apparel4.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">GERUA</h5>
                <p class="card-text">
                    Grey Floral Keyhole Neck Maxi Dress Straight shape Regular style Mandarin collar
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card  col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/electronic2.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Apple iPhone 13 (128GB)</h5>
                <p class="card-text">Dual-camera system,Photographic Styles,Night mode
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card  col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/electronic3.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Lenovo Head-phones</h5>
                <p class="card-text">180° Rotatable Boom Microphone with adjustable headband
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card  col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/n4.png" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">KALINI</h5>
                <p class="card-text">
                    Women Pink Geometric Printed Kurta,Round neck, Sleeveless, Straight shape with regular style,
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/shoe4.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Provogue</h5>
                <p class="card-text">Men Woven Design Sneakers, Synthetic upper, Cushioned footbed
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
    </div>
    <br><br>
    <center>
        <h1>New Arrivals</h1>
    </center>
    <br><br>
    <div class="row" style="margin-right:40px;margin-left:40px;">
        <div class="card col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/n5.png" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Anouk</h5>
                <p class="card-text">Colourblocked Straight Kurta Calf length with straight hem 
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card  col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/n3.png" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Roadster</h5>
                <p class="card-text">Men Black Twill Sustainable Casual Shirt with spread collar
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card  col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/n2.png" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Roadster</h5>
                <p class="card-text">
                    Lifestyle Men Rust Brown & Navy Blue Casual Shirt curved hem
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card  col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/shoe5.jpg" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">ZEBX</h5>
                <p class="card-text">
                    Men Black Colourblocked Sneakers,Cushioned footbed, upper
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <div class="card col-md-2" style="margin-left:40px;">
            <img style="height:40vh" src="ecommerce/dress1.png" class="card-img-top">
            <div class="card-body">
                <h5 class="card-title">Sangria</h5>
                <p class="card-text">Women Black Pure Cotton Kurta with Trousers
                </p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
    </div>


</body>

</html>