<%@page import="Dto.*"%>
<%@page import="Dao.*"%>

<%
    String prod_id = request.getParameter("prod_id");

    ProductDao p = new ProductDao();
    int i = p.deleteProduct(prod_id);

    if (i > 0) {
%>

<script>alert("Product deleted successfuly");</script>
<jsp:include page="viewProd.jsp"></jsp:include>

<%
} else {
%>

<script>alert("Password not deleted");</script>
<jsp:include page="viewProd.jsp"></jsp:include>

<%
    }

%>


