<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    String cat_id = request.getParameter("cat_id");
    ProductDao dao = new ProductDao();
    ArrayList<Product> a = dao.getProdDetailsByCat(cat_id);
    System.out.println(a);
%>
<table>
    <thead>
        <tr>
            <th>Product-Id</th>
            <th>Product-Name</th>
            <th>Category-Id</th>
            <th>Price</th>
            <th>Supplier-Id</th>
            <th>Description</th>
            <th>Image</th>
            <th>Quantity</th>
            <th>Add to Cart</th>
        </tr>
    </thead>
    <tbody>

        <% for (Product pd : a) {%>
        <tr>
            <td>
                <% System.out.println(pd.getProd_id());%>
                <%= pd.getProd_id()%>
            </td>
            <td>
                <%= pd.getProd_name()%>
            </td>
            <td>
                <%= pd.getCat_id()%>
            </td>
            <td>
                <%= pd.getStock()%>
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
                            <input type="number" id="quantity" name="quantity" placeholder="1" value="">

                        </td>
                        
            <td>
                <a href="addCart.jsp?prod_id=<%= pd.getProd_id()%>">Add to Cart</a>
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
            <th>Quantity/th>
            <th>Add to Cart</th>
        </tr>
    </tfoot>

</table>

