<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*" %>
<%@page import="Dto.*" %>

<% 
    String email = (String)session.getAttribute("email");
    AdminDao dao=new AdminDao();
    Admin a=dao.getAdDetails(email);
%>

<!DOCTYPE html>
<html>
    <head>
        <head>
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    </head>
    <body>
        <jsp:include page="adminNav.jsp"></jsp:include>
    <div style="height: auto; width: 60%; padding: 20px; margin:auto;margin-top: 80px;border: 2px solid lightgrey;">
        <center><h3 style="background-color: lightgrey; padding: 10px;">Password Updation</h3></center>
        <form action="aPassUpdate2.jsp">
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" placeholder="<%= a.getPassword()%>" name="password" id="password">
        </div>
        <div class="mb-3">
          <label for="newPass" class="form-label">New Password</label>
          <input type="password" class="form-control" placeholder="Create New Password" name="newPass" id="newPass">
        </div>
        <div class="mb-3">
          <label for="newPass2" class="form-label">Confirm Password</label>
          <input type="password" class="form-control" placeholder="Confirm Password" name="newPass2" id="newPass2">
        </div>
          <input type="submit" role="button" class="btn btn-primary" style="width: 100%;" value="Update">
        </form>
    </div>

</body>
</html>
