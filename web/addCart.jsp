<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.*" %>
<%@page import="Dao.*" %>

<%
    String email=(String)session.getAttribute("email");
    UserDao dao=new UserDao();
    User u=dao.getUserDetails(email);
    
    //int quantity = Integer.parseInt(request.getParameter("quantity"));
    
    int prod_id = Integer.parseInt(request.getParameter("prod_id"));
    ProductDao pdao=new ProductDao();
    Product p=pdao.getProdDetails(prod_id);
    
    int user_id=u.getUser_id();
    double price=p.getPrice();
  
    Cart dto = new Cart();
    dto.setProd_id(prod_id);
   // dto.setQuantity(quantity);
    dto.setUser_id(user_id);
    dto.setPrice(price);
    
    CartDao c = new CartDao();
    int i = c.addtoCart(dto);

     if (i > 0) {
%>

<script>alert("added successfuly");</script>
<jsp:include page="viewProduct.jsp"></jsp:include>

<%
} else {
%>

<script>alert("not added");</script>
<jsp:include page="viewProduct.jsp"></jsp:include>

<%
    }
%>
