<%@page import="Dto.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.*"%>

<%
    ArrayList<Product> c = (ArrayList<Product>) session.getAttribute("c");
    String[] quantity = request.getParameterValues("quantity");

    // System.out.println(quantity[0]);
    String email = (String) session.getAttribute("email");
    UserDao dao = new UserDao();
    User u = dao.getUserDetails(email);

    String user_add = request.getParameter("user_add");
    String pay_meth = request.getParameter("pay_meth");
    double price = (double) session.getAttribute("price");
    String date = request.getParameter("ord_date");
    String time = request.getParameter("ord_time");

    Orders od = new Orders();
    Orders od1 = new Orders();
    OrdersDao odao = new OrdersDao();
    Ord_prod op = new Ord_prod();
    Ord_prodDao opd = new Ord_prodDao();
    int i = 0,k=0;

    od.setOrd_date(date);
    od.setPay_meth(pay_meth);
    od.setStatus("not delivered");
    od.setT_price(price);
    od.setUser_add(user_add);
    od.setUser_id(u.getUser_id());
    od.setOrd_time(time);

    int j = odao.addOrders(od);
    if (j > 0) {

        od1 = odao.getOrdDetails(u.getUser_id(), date, time);

        for (Product p : c) {
            op.setOrd_id(od1.getOrd_id());
            op.setProd_name(p.getProd_name());
            int quant = Integer.parseInt(quantity[i]);
            op.setPrice(p.getPrice());
            op.setQuantity(quant);
            i++;

            k = opd.addOrd_prod(op);
            }
            if (k > 0) {
%>
<script>alert("order Placed");</script>
<jsp:include page="viewOrders.jsp"></jsp:include>
<%
    CartDao cdao=new CartDao();
    cdao.deleteCart(u.getUser_id());
} else {
%>
<script>alert("Order not Placed");</script>
<jsp:include page="viewCart.jsp"></jsp:include>
<%
        }
    
} else {
%>
<script>alert("Error Occured");</script>
<jsp:include page="viewCart.jsp"></jsp:include>
<%
    }
%>