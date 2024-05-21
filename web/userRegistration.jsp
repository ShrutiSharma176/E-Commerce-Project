<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.User"%>
<%@page import="Dao.UserDao"%>

<jsp:useBean id="obj" class="Dto.User"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>

<%
    UserDao dao = new UserDao();
    int i = dao.addUser(obj);

    if (i > 0) {
        out.println("Registration done successfuly");
    } else {
        out.println("Registration not done");
    }
%>
