<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Dto.User"%>
<%@page import="Dao.UserDao"%>
<%
    String email =request.getParameter("email");
    String password =request.getParameter("password");
    
    UserDao dao=new UserDao();
    int i=dao.searchUser(email, password);
    
    if(i>0){
         session = request.getSession();
         session.setAttribute("email", email);
         RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
         rd.forward(request, response);
    }
    else{
        response.sendRedirect("userPannel.html");
    }
%>