<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.*"%>
<%@page import="Dao.*"%>

<%
    String newPass = request.getParameter("newPass");
    String newPass2 = request.getParameter("newPass2");

    if (newPass.equals(newPass2)) {
        Admin dto = new Admin();
        dto.setPassword(newPass);

        AdminDao dao = new AdminDao();
        int i = dao.updatePass(dto, (String) session.getAttribute("email"));

         if (i > 0) {
%>
            
            <script>alert("Password Updated successfuly");</script>
            <jsp:include page="aPassUpdate.jsp"></jsp:include>

<%
        } else {
%>
            
            <script>alert("Password not Updated");</script>
            <jsp:include page="aPassUpdate.jsp"></jsp:include>

<%
        }
    }
    else{
%>
            
            <script>alert("password not matched");</script>
            <jsp:include page="aPassUpdate.jsp"></jsp:include>

<%
    }
%>
