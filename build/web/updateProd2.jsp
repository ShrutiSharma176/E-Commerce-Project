<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.Product" %>
<%@page import="Dao.ProductDao" %>

<jsp:useBean id="obj1" class="Dto.Product"></jsp:useBean>
<jsp:setProperty name="obj1" property="*"></jsp:setProperty>

<%
    ProductDao dao = new ProductDao();
    int i = dao.updateProduct(obj1);

    if (i > 0){
%>

<script>alert("Update successfuly");</script>
<jsp:include page="viewProd.jsp"></jsp:include>

<%
} else {
%>

<script>alert("Updation not done");</script>
<jsp:include page="viewProd.jsp"></jsp:include>

<%
    }
%>


