<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    int ord_id = Integer.parseInt(request.getParameter("ord_id"));
    String status=request.getParameter("status");
    Ord_prodDao ord = new Ord_prodDao();
    
    PaymentDao pay=new PaymentDao();
    int i=pay.addPay(ord_id);
    if(i>0){
        OrdersDao o = new OrdersDao();
        int k=o.changeStatus(ord_id, status);
        if (k > 0) {
%>
<script>alert("Status Changed");</script>
<jsp:include page="adminViewOrders.jsp"></jsp:include>
<%
 } else {
%>
<script>alert("Status Not Changed");</script>
<jsp:include page="adminViewOrders.jsp"></jsp:include>
<%
    }
}else{
%>
<script>alert("Error Occured in Changing the Status");</script>
<jsp:include page="adminViewOrders.jsp"></jsp:include>
<%
    }
%>