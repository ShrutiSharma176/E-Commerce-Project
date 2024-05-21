
    <script type=\"text/javascript\">function preventBack(){window.history.forward()}"
                + "setTimeout(\"preventBack()\",0)</script>;

<%    
        session.setAttribute("email", null);
        RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
        session.invalidate();
        rd.forward(request, response);
%>
