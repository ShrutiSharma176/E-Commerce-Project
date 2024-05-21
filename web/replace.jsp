<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*"%>
<%@page import="Dto.*"%>
<%@page import="java.util.ArrayList"%>

<%
    int ord_id = Integer.parseInt(request.getParameter("ord_id"));
    int pay_id = Integer.parseInt(request.getParameter("pay_id"));
    
    String rep_date=request.getParameter("rep_date");
    String time=request.getParameter("time");

    Replacement r=new Replacement();
    r.setOrd_id(ord_id);
    r.setPay_id(pay_id);
    r.setTime(time);
    r.setRep_date(rep_date);
    
    ReplacementDao dao=new ReplacementDao();
    int i=dao.addReplacement(r);
    
    if(i>0){
        out.println("your orders will be replaced!!");
    }
    else{
        out.println("Error occured while processsing your request");
    }
%>
