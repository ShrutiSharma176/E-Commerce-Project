<%@page import="Dto.Admin"%>
<%@page import="Dao.AdminDao"%>

<%
    String email = request.getParameter("email");
    
    AdminDao a=new AdminDao();
    int i=a.blockUser(email);
    
    if(i>0){
        out.println("user blocked successfully");
    }
    else{
        out.println("user not blocked");
    }
%>