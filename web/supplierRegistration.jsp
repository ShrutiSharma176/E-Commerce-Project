<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.Supplier"%>
<%@page import="Dao.SupplierDao"%>

<jsp:useBean id="obj" class="Dto.Supplier"></jsp:useBean>
<jsp:setProperty name="obj" property="*"></jsp:setProperty>
<%
    
    SupplierDao dao = new SupplierDao();
    int i = dao.addSupp(obj);

    if (i > 0) {
        out.println("Registration done successfuly");
    } 
    else {
        out.println("Registration not done");
    }
%>
