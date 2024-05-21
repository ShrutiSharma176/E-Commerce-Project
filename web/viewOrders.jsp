<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    String email = (String) session.getAttribute("email");
    UserDao dao = new UserDao();
    User u = dao.getUserDetails(email);

    Ord_prod ord = new Ord_prod();
    Orders o = new Orders();
    Ord_prodDao ord_dao = new Ord_prodDao();
    OrdersDao o_dao = new OrdersDao();
    
    ArrayList<Orders> arr = o_dao.getOrdDetails(u.getUser_id());
    ArrayList<Ord_prod> a = ord_dao.getOrd_prods(o.getOrd_id());
    
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
                            <a class="nav-link" href="updateUser.jsp">
                                <i class="fa-regular fa-user"></i>Update Profile</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="uPassUpdate.jsp">Update Password</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="userLogout.jsp">Log Out</a>
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
        <br><br>
        <div style="height: auto;width:80%;padding: 20px; margin:auto;">
            <center><h3 style="background-color: lightgrey; padding: 10px;">Orders</h3></center>
            <table class="table table-striped table-condensed table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Order-Id</th>
                        <th>Total Price</th>
                        <th>Order-Date</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(Orders or: arr){
                    %>
                    <tr>
                        <td>
                            <%= or.getOrd_id() %>
                        </td>
                        <td>
                            <%= or.getT_price() %>
                        </td>
                        <td>
                            <%= or.getOrd_date() %>
                        </td>
                        <td>
                            <%= or.getPay_meth() %>
                        </td>
                        <td>
                            <%= or.getStatus() %>
                        </td>
                        <td><a href="viewOrdersDetail.jsp?ord_id=<%=or.getOrd_id() %>">veiw details</a></td>
                        
                    </tr>
                            
                      <%  } %>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th>Order-Id</th>
                        <th>Total Price</th>
                        <th>Order-Date</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Action</th>
                </tfoot>
            </table>
    </body>
</html>
