<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    String email = (String) session.getAttribute("email");
    UserDao dao = new UserDao();
    User u = dao.getUserDetails(email);

    CartDao ct = new CartDao();
    int count = ct.countProd(u.getUser_id());
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
                            <a class="nav-link" href="viewCart.jsp?">
                                Cart<span class="badge bg-danger" style="margin-left: 2px;">
                                    <%= count%>
                                </span>
                            </a>
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
        <%
            CategoryDao cdao = new CategoryDao();
            ArrayList<Category> c = cdao.getCategory();
        %>

        <script>
            function getTable() {
                var cat_id = document.getElementById("cat_name").value;
                var url = "getTableEntries.jsp?cat_id=" + cat_id;
                var xhttp = new XMLHttpRequest();
                xhttp.open("get", url, true);
                xhttp.send();

                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState == 4 && xhttp.status == 200) {
                        document.getElementById("data").innerHTML = xhttp.responseText;
                        console.log(xhttp.responseText);
                    }
                }
            }
        </script>
        <br>
        <table>
            <tr>
                <td><h5><i class="fa-solid fa-filter"></i> Filter </h5></td>
                <td>
                    <select name="cat_name" id="cat_name" onchange="getTable()">
                        <option value="">Select Category</option>
                        <%for (Category ca : c) {%>
                        <option value="<%= ca.getCat_id()%>"><%= ca.getCat_name()%></option>
                        <%}%>
                    </select> 
                </td>
            </tr>
        </table>

        <div style="height: auto;padding: 20px; margin:auto;">
            <center><h3 style="background-color: lightgrey; padding: 10px;">Products</h3></center>
                <%
                    ProductDao pdao = new ProductDao();
                    ArrayList<Product> p = pdao.getProduct();

                %>
            
                <table id="data" class="table table-striped table-condensed table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Product-Id</th>
                        <th>Product-Name</th>
                        <th>Category-Id</th>
                        <th>Price</th>
                        <th>Supplier-Id</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Add to Cart</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product pd : p) {%>
                
                    <tr>
                        <td>
                            <%= pd.getProd_id()%>
                        </td>
                        <td>
                            <%= pd.getProd_name()%>
                        </td>
                        <td>
                            <%= pd.getCat_id()%>
                        </td>
                        <td>
                            <%=  pd.getPrice()%>
                        </td>
                        <td>
                            <%= pd.getSupp_id()%>
                        </td>
                        <td>
                            <%= pd.getP_desc()%>
                        </td>
                
                        <td>
                            <img src="images/<%= pd.getP_img()%>" width="100" height="100"/>
                        </td>
                        <td>
                            <a href="addCart.jsp?prod_id=<%= pd.getProd_id() %>">Add to Cart</a>
                        </td>
                
                    </tr>
                    
                    <%}%>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th>Product-Id</th>
                        <th>Product-Name</th>
                        <th>Category-Id</th>
                        <th>Price</th>
                        <th>Supplier-Id</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Add to Cart</th>
                    </tr>
                </tfoot>
            </table>
         
            
        </div>

    </body>
</html>

