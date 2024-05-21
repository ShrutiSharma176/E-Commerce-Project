<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.Supplier"%>
<%@page import="Dao.SupplierDao"%>
<%
    String email =request.getParameter("supp_email");
    String password =request.getParameter("password");
    
    SupplierDao dao=new SupplierDao();
    int i=dao.searchSupp(email, password);
    
    if(i>0){
         session = request.getSession();
         session.setAttribute("email", email);
         RequestDispatcher rd = request.getRequestDispatcher("supplierDash.html");
         rd.forward(request, response);
    }
    else{
        response.sendRedirect("supplierPannel.html");
    }
%>