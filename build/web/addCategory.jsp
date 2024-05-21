<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.Category"%>
<%@page import="Dao.CategoryDao"%>

<jsp:useBean id="obj" class="Dto.Category"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>

<%
    CategoryDao dao = new CategoryDao();
    int i = dao.addCategory(obj);

    if (i > 0) {
%>

<script>alert("Category Added Successfuly");</script>
<jsp:include page="supplierDash.html"></jsp:include>

<%
} else {
%>

<script>alert("Category not Added");</script>
<jsp:include page="supplierDash.html"></jsp:include>

<%
    }
%>
