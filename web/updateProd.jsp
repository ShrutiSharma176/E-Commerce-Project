<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.ProductDao" %>
<%@page import="Dto.Product" %>


<%
    int prod_id = Integer.parseInt(request.getParameter("prod_id"));
    System.out.println("prod_id : "+prod_id);
    ProductDao dao = new ProductDao();
    Product p = dao.getProdDetails(prod_id);
    System.out.println("prod_id : "+p.getProd_id());
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

        <jsp:include page="suppNav.jsp"></jsp:include>
            <div style="height: auto; width: 60%; padding: 20px; margin:auto;margin-top: 80px;border: 2px solid lightgrey;">
                <center><h3 style="background-color: lightgrey; padding: 10px;">Product Updation Form</h3></center>
                <form action="updateProd2.jsp" >
            <div class="mb-3">
                    <input type="hidden" class="form-control" id="prod_id" name="prod_id" value="<%= p.getProd_id()%>">
                </div>

            <div class="mb-3">
                    <label for="prod_name" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="prod_name" name="prod_name" value="<%= p.getProd_name()%>">
                </div>
                <div class="mb-3">
                    <label for="cat_id" class="form-label">Category Id</label>
                    <input type="text" class="form-control" id="cat_id" name="cat_id" value="<%= p.getCat_id()%>">
                </div>
                <div class="mb-3">
                    <label for="stock" class="form-label">Stock Quantity</label>
                    <input type="number" class="form-control" id="stock" name="stock" value="<%= p.getStock()%>">
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Product Price</label>
                    <input type="text" class="form-control" id="price" name="price" value="<%= p.getPrice()%>">
                </div>
                <div class="mb-3">
                    <label for="supp_id" class="form-label">Supplier Id</label>
                    <input type="text" class="form-control" id="supp_id" name="supp_id" value="<%= p.getSupp_id()%>">
                </div>
                <div class="mb-3">
                    <label for="p_desc" class="form-label">Description</label>
                    <input class="form-control" id="p_desc" name="p_desc" value="<%= p.getP_desc()%>" rows="3">
           
                </div>
                <div class="mb-3">
                    Do you want to update image?
                    <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">Update Image </a>
                    
                    <input type="submit" role="button" class="btn btn-primary" value="Update" style="width: 100%">
                </div>
            </form>
    </body>
</html>
