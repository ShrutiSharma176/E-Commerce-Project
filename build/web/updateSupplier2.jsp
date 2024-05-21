<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dto.*"%>
<%@page import="Dao.*"%>

<%
    String supp_name = request.getParameter("supp_name");
    String supp_email = request.getParameter("supp_email");
    String supp_id = request.getParameter("supp_id");
    String supp_phone = request.getParameter("supp_phone");
    String company = request.getParameter("company");
    String address = request.getParameter("address");

    Supplier dto = new Supplier();
    dto.setSupp_name(supp_name);
    dto.setSupp_email(supp_email);
    dto.setSupp_id(supp_id);
    dto.setSupp_phone(supp_phone);
    dto.setCompany(company);
    dto.setAddress(address);

    SupplierDao dao = new SupplierDao();
    int i = dao.updateSupp(dto, (String) session.getAttribute("email"));

    if (i > 0) {
%>

<script>alert("Update successfuly");</script>
<jsp:include page="updateSupplier.jsp"></jsp:include>

<%
} else {
%>

<script>alert("Updation not done");</script>
<jsp:include page="updateSupplier.jsp"></jsp:include>

<%
    }
%>
