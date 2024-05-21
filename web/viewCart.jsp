<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    String email = (String) session.getAttribute("email");
    UserDao dao = new UserDao();
    User u = dao.getUserDetails(email);

    // System.out.println("id: " + u.getUser_id());
    CartDao cdao = new CartDao();
    ArrayList<Product> c = cdao.getProd(u.getUser_id());

    session.setAttribute("c", c);

    double price = 0;
    for (Product pd : c) {
        price = price + pd.getPrice();
    }
    session.setAttribute("price", price);
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
                        
                        <li class="nav-item">
                            <a class="nav-link" href="viewOrders.jsp">My Orders</a>
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

        <div style="height: auto;padding: 20px; margin:auto;">
            <center><h3 style="background-color: lightgrey; padding: 10px;">Cart</h3></center>

            <form action="checkout.jsp">
                <table class="table table-striped table-condensed table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>Product-Id</th>
                            <th>Product-Name</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Image</th>
                            <th>Quantity</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product pd : c) {%>
                        <tr>
                            <td>
                                <%= pd.getProd_id()%>
                            </td>
                            <td>
                                <%= pd.getProd_name()%>
                            </td>
                            <td>
                                <%=  pd.getPrice()%>
                            </td>
                            <td>
                                <%= pd.getP_desc()%>
                            </td>
                            <td>
                                <img src="images/<%= pd.getP_img()%>" width="100" height="100"/>
                            </td>
                            <td>
                                <input type="number" id="quantity" name="quantity" value="1" placeholder="1">
                            </td>
                            <td>
                                <a href="delete_cart_prod.jsp?prod_id=<%= pd.getProd_id()%>">Delete</a>
                            </td>

                        </tr>
                        <%}%>
                        <tr>
                            <td>
                                <label><b>Address</b></label>
                            </td>
                            <td>
                                <input type="text" class="form-control" placeholder="Enter Delivery Address" name="user_add" id="user_add">
                            </td>
                            <td></td>
                            <td>
                                <label><b>Payment Method</b> </label>

                                <select name="pay_meth" id="cat_name">
                                    <option value="Pay_on_Delivery">Pay on Delivery</option>
                                    <option value="Upi">UPI</option>
                                    <option value="Net_Banking">Net Banking</option>
                                </select>
                            </td>
                            <td></td>
                            <td>
                                <label><b>Total Price</b></label>
                            </td>
                            <td>
                                <%= price%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    <lable><b>Date</b></lable>
                    </td>
                    <td>
                        <input type="date" class="form-control" name="ord_date" id="ord_date">
                    </td>
                    <td></td>
                    <td>
                    <lable><b>Time</b> </lable>
                    </td>
                    <td>
                    <input type="text" class="form-control" name="ord_time" id="ord_time" placeholder="12:30 PM">
                    </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" role="button" class="btn btn-success" value="Proceed for Checkout">
                        </td>
                    </tr>
                    </tbody>

                </table>
            </form>

        </div>

    </body>
</html>

