<%@page import="Dto.Admin"%>
<%@page import="Dao.AdminDao"%>

<%
    String email = request.getParameter("email");
    
    AdminDao a=new AdminDao();
    int i=a.blockSupp(email);
    
    if(i>0){
        out.println("Supplier blocked successfully");
    }
    else{
        out.println("Supplier not blocked");
    }
%>