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
        <br>
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

            <a href=".jsp?ord_id=<%= ord_id%>" role="button" class="btn btn-success" style="width: 100%">Accept Request</a>

    </body>
</html>
