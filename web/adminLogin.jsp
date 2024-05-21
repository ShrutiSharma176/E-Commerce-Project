<%@page import="jdk.nashorn.internal.runtime.regexp.joni.SearchAlgorithm"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.Admin"%>
<%@page import="Dao.AdminDao"%>


<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    
    AdminDao dao=new AdminDao();
    int i=dao.searchAdmin(email,password);
    
    if(i>0){
            session = request.getSession();
            session.setAttribute("email", email);
            RequestDispatcher rd = request.getRequestDispatcher("adminPannel.jsp");
            rd.forward(request, response);
    }
    else{
        response.sendRedirect("adminLogin.html");
    }
    
%>