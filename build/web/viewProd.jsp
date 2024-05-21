<%@page import="Dto.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.*"%>
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
                            <a class="nav-link active" aria-current="page" href="supplierDash.html">
                                <i class="fa-solid fa-house"></i>
                                Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Product</a>
                        </li>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="./AddProduct" enctype="multipart/form-data" method="post">
                                            <div class="mb-3">
                                                <label for="prod_name" class="form-label">Product Name</label>
                                                <input type="text" class="form-control" id="prod_name" name="prod_name" placeholder="Enter Product Name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="cat_id" class="form-label">Category Id</label>
                                                <input type="text" class="form-control" id="cat_id" name="cat_id" placeholder="Enter Category Id">
                                            </div>
                                            <div class="mb-3">
                                                <label for="stock" class="form-label">Stock Quantity</label>
                                                <input type="number" class="form-control" id="stock" name="stock" placeholder="Enter Product's Stock Quantity">
                                            </div>
                                            <div class="mb-3">
                                                <label for="price" class="form-label">Product Price</label>
                                                <input type="text" class="form-control" id="price" name="price" placeholder="Enter Product Price">
                                            </div>
                                            <div class="mb-3">
                                                <label for="supp_id" class="form-label">Supplier Id</label>
                                                <input type="text" class="form-control" id="supp_id" name="supp_id" placeholder="Enter Supplier Id">
                                            </div>
                                            <div class="mb-3">
                                                <label for="p_desc" class="form-label">Description</label>
                                                <textarea class="form-control" id="p_desc" name="p_desc" placeholder="Enter description" rows="3"></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <lable for="p_img" class="form-lable">Select Image</lable>
                                                <input  type="file" id="p_img" name="p_img" required>
                                            </div>
                                            <input type="submit" role="button" class="btn btn-primary" value="Add">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <li class="nav-item">
                            <a class="nav-link" href="#"  data-bs-toggle="modal" data-bs-target="#exampleModal1">Add Category</a>
                        </li>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="addCategory.jsp">
                                            <div class="mb-3">
                                                <label for="catId" class="form-label">Category Id</label>
                                                <input type="text" class="form-control" id="cat_id" name="cat_id" placeholder="Enter Category Id">
                                            </div>
                                            <div class="mb-3">
                                                <label for="catName" class="form-label">Category Name</label>
                                                <input type="text" class="form-control" id="cat_name" name="cat_name" placeholder="Enter Category Name">
                                            </div>
                                            <div class="mb-3">
                                                <label for="gst" class="form-label">GST</label>
                                                <input type="number" class="form-control" id="gst" name="gst" placeholder="1%">
                                            </div>
                                            <input type="submit" role="button" class="btn btn-primary" value="Add">
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <li class="nav-item">
                            <a class="nav-link" href="updateSupplier.jsp">
                                <i class="fa-regular fa-user"></i>Update Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="sPassUpdate.jsp">Update Password</a>
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
                        
                        </div>
                    </form>
                </div>
            </div>
        </nav>
    <div style="height: auto;padding: 20px; margin:auto;">
        <center><h3 style="background-color: lightgrey; padding: 10px;">Product Details</h3></center>

        <%
            String email=(String)session.getAttribute("email");
            ProductDao dao = new ProductDao();
            ArrayList<Product> p = dao.searchProduct(email);

        %>

        <table class="table table-striped table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Product-Id</th>
                    <th>Product-Name</th>
                    <th>Category-Id</th>
                    <th>Stock</th>
                    <th>Price</th>
                    <th>Supplier-Id</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% for (Product pd : p) {%>
                <tr>
                    <td>
                        <%= pd.getProd_id()%>
                    </td>
                    <td>
                        <%= pd.getProd_name() %>
                    </td>
                    <td>
                        <%= pd.getCat_id() %>
                    </td>
                    <td>
                        <%= pd.getStock() %>
                    </td>
                    <td>
                        <%=  pd.getPrice()%>
                    </td>
                    <td>
                        <%= pd.getSupp_id()%>
                    </td>
                    <td>
                        <%= pd.getP_desc() %>
                    </td>
                    <td>
                        <img src="images/<%= pd.getP_img() %>" width="100" height="100"/>
                    </td>
                     <td>
                        <a href="updateProd.jsp?prod_id=<%=pd.getProd_id()%>">Update</a>
                    </td>
                    <td>
                        <a href="suppDeleteProd.jsp?prod_id=<%=pd.getProd_id()%>">Delete</a>
                    </td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <th>Product-Id</th>
                    <th>Product-Name</th>
                    <th>Category-Id</th>
                    <th>Stock</th>
                    <th>Price</th>
                    <th>Supplier-Id</th>
                    <th>Description</th>
                    <th>Image</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </tfoot>
        </table>
    </div>

</body>
</html>
