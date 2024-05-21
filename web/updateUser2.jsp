<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.*"%>
<%@page import="Dao.*"%>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone_no = request.getParameter("phone_no");

    User dto = new User();
    dto.setName(name);
    dto.setEmail(email);
    dto.setPhone_no(phone_no);

    UserDao dao = new UserDao();
    int i = dao.updateUser(dto, (String) session.getAttribute("email"));

     if (i > 0) {
%>

<script>alert("Update successfuly");</script>
<jsp:include page="updateUser.jsp"></jsp:include>

<%
} else {
%>

<script>alert("Updation not done");</script>
<jsp:include page="updateUser.jsp"></jsp:include>

<%
    }
%>
