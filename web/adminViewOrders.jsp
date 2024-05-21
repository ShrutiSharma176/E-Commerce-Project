<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    Orders o = new Orders();
    OrdersDao o_dao = new OrdersDao();

    ArrayList<Orders> arr = o_dao.getOrdDetails();

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
                    <%                        for (Orders or : arr) {
                    %>
                    <tr>
                        <td>
                            <%= or.getOrd_id()%>
                        </td>
                        <td>
                            <%= or.getT_price()%>
                        </td>
                        <td>
                            <%= or.getOrd_date()%>
                        </td>
                        <td>
                            <%= or.getPay_meth()%>
                        </td>
                        <td>
                            <%= or.getStatus()%>
                        </td>
                        <td><a href="adminViewOrdersDetails.jsp?ord_id=<%=or.getOrd_id()%>">veiw details</a></td>
                    </tr>

                    <%  }%>

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
