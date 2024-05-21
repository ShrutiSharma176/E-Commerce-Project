<%@page import="Dao.*" %>
<%@page import="Dto.*" %>

<%
    int prod_id =Integer.parseInt(request.getParameter("prod_id"));
    
    CartDao dao=new CartDao();
    int i=dao.deleteProd(prod_id);
    
    
    if (i > 0) {
%>

<script>alert("Removed from cart");</script>
<jsp:include page="viewCart.jsp"></jsp:include>

<%
} else {
%>

<script>alert("Not Removed");</script>
<jsp:include page="viewCart.jsp"></jsp:include>

<%
    }
%>
