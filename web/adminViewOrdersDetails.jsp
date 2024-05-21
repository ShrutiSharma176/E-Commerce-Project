<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    int ord_id = Integer.parseInt(request.getParameter("ord_id"));
    Ord_prodDao ord = new Ord_prodDao();

    OrdersDao o = new OrdersDao();
    Orders or = o.getOrdDetail(ord_id);

    ArrayList<Ord_prod> a = ord.getOrd_prods(ord_id);
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
                <a class="navbar-brand" href="adminPannel.jsp">E-Commerce</a>

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
                                <li><a class="dropdown-item" href="adminViewProd.jsp"><i class="fa-solid fa-boxes-packing"></i> Products</a>
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
    <br><br>
    <div style="height: auto; width: 80%;border: 2px solid lightgrey;padding: 20px; margin:auto;">
        <center><h3 style="background-color: lightgrey; padding: 10px;">Orders</h3></center>
        <table class="table table-striped table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Ord_prod op : a) {
                %>
                <tr>
                    <td>
                        <%= op.getProd_name()%>
                    </td>
                    <td>
                        <%= op.getQuantity()%>
                    </td>
                    <td>
                        <%= op.getPrice()%>
                    </td>
                </tr>

                <%  }%>
                <tr> 
                    <td></td>
                    <td>
                        <label><b>Total Price</b></label>
                    </td>

                    <td>
                        <%= or.getT_price()%>
                    </td>

                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <label><b>Address : </b></label>
                        <%= or.getUser_add()%>
                    </td>
                    <td>
                        <label><b>Payment Method : </b> </label>
                        <%= or.getPay_meth()%>
                    </td>
                    <td>
            <lable><b>Date : </b></lable>
                <%= or.getOrd_date()%>
            </td>
            </tr>
            <tr>
                <td>
            <lable><b>Time : </b> </lable>
                <%= or.getOrd_time()%>
            </td>
            <td>
            <lable><b>Status : </b> </lable>
                <%= or.getStatus()%>
            </td>
            </tr>
            </tbody>
        </table>
        <center>
            <a href="changeStatus.jsp?ord_id=<%= ord_id%>&status=<%= "delivered"%>" role="button" class="btn btn-success" >Delivered</a>
        
            <a href="changeStatus1.jsp?ord_id=<%= ord_id%>&status=<%= "shipped"%>" data-bs-toggle="modal" data-bs-target="#exampleModal1" role="button" class="btn btn-success" >Shipped</a>
        </center>

        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sign Up</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="userRegistration.jsp">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" placeholder="Enter Name " id="name" name="name">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email address</label>
                                <input type="email" class="form-control" placeholder="Enter Email " id="email" name="email"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" placeholder="Create Password"
                                       id="password"name="password">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone number</label>
                                <input type="text" class="form-control" placeholder="Enter Phone number " id="phone" name="phone">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
