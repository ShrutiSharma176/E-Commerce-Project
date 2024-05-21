<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    int ord_id = Integer.parseInt(request.getParameter("ord_id"));
    OrdersDao ord =new OrdersDao();
    
    int i=ord.cancelOrd(ord_id);
    if (i > 0) {
%>
<script>alert("Order Canceled");</script>
<jsp:include page="viewOrders.jsp"></jsp:include>
<%
 } else {
%>
<script>alert("Order Already Canceled");</script>
<jsp:include page="viewOrders.jsp"></jsp:include>
<%
    }
%>


