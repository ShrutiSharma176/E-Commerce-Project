package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.jasper.tagplugins.jstl.core.Import;
import Dao.*;
import Dto.*;
import java.util.ArrayList;

public final class viewCart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String email = (String) session.getAttribute("email");
    UserDao dao = new UserDao();
    User u = dao.getUserDetails(email);

    // System.out.println("id: " + u.getUser_id());
    CartDao cdao = new CartDao();
    ArrayList<Product> c = cdao.getProd(u.getUser_id());

    session.setAttribute("c", c);

    double price = 0;
    for (Product pd : c) {
        price = price + pd.getPrice();
    }
    session.setAttribute("price", price);

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>TODO supply a title</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n");
      out.write("              integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\"\n");
      out.write("                integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <a class=\"navbar-brand\" href=\"#\"><i class=\"fa-solid fa-cart-shopping fa-lg\"></i> E-Commerce</a>\n");
      out.write("                <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarSupportedContent\"\n");
      out.write("                        aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                </button>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("                    <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link active\" aria-current=\"page\" href=\"userHome.jsp\">\n");
      out.write("                                <i class=\"fa-solid fa-house\"></i>\n");
      out.write("                                Home</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"viewProduct.jsp\">Products</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"updateUser.jsp\">\n");
      out.write("                                <i class=\"fa-regular fa-user\"></i>Update Profile</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"uPassUpdate.jsp\">Update Password</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        <li class=\"nav-item\">\n");
      out.write("                            <a class=\"nav-link\" href=\"userLogout.jsp\">Log Out</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                    <form class=\"d-flex\">\n");
      out.write("                        <input class=\"form-control me-2\" type=\"search\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("                        <button class=\"btn btn-outline-success\" type=\"submit\">\n");
      out.write("                            <i class=\"fa-solid fa-search\"></i>\n");
      out.write("                        </button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div style=\"height: auto;padding: 20px; margin:auto;\">\n");
      out.write("            <center><h3 style=\"background-color: lightgrey; padding: 10px;\">Cart</h3></center>\n");
      out.write("\n");
      out.write("            <form action=\"checkout.jsp\">\n");
      out.write("                <table class=\"table table-striped table-condensed table-hover table-bordered\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Product-Id</th>\n");
      out.write("                            <th>Product-Name</th>\n");
      out.write("                            <th>Price</th>\n");
      out.write("                            <th>Description</th>\n");
      out.write("                            <th>Image</th>\n");
      out.write("                            <th>Quantity</th>\n");
      out.write("                            <th>Delete</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");
 for (Product pd : c) {
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print( pd.getProd_id());
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print( pd.getProd_name());
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print(  pd.getPrice());
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print( pd.getP_desc());
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <img src=\"images/");
      out.print( pd.getP_img());
      out.write("\" width=\"100\" height=\"100\"/>\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <input type=\"number\" id=\"quantity\" name=\"quantity\" value=\"1\" placeholder=\"1\">\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <a href=\"delete_cart_prod.jsp?prod_id=");
      out.print( pd.getProd_id());
      out.write("\">Delete</a>\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                <label><b>Address</b></label>\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" placeholder=\"Enter Delivery Address\" name=\"user_add\" id=\"user_add\">\n");
      out.write("                            </td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td>\n");
      out.write("                                <label><b>Payment Method</b> </label>\n");
      out.write("\n");
      out.write("                                <select name=\"pay_meth\" id=\"cat_name\">\n");
      out.write("                                    <option value=\"Pay_on_Delivery\">Pay on Delivery</option>\n");
      out.write("                                    <option value=\"Upi\">UPI</option>\n");
      out.write("                                    <option value=\"Net_Banking\">Net Banking</option>\n");
      out.write("                                </select>\n");
      out.write("                            </td>\n");
      out.write("                            <td></td>\n");
      out.write("                            <td>\n");
      out.write("                                <label><b>Total Price</b></label>\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                ");
      out.print( price);
      out.write("\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                    <lable><b>Date</b></lable>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"date\" class=\"form-control\" name=\"ord_date\" id=\"ord_date\">\n");
      out.write("                    </td>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td>\n");
      out.write("                    <lable><b>Time</b> </lable>\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                    <input type=\"text\" class=\"form-control\" name=\"ord_time\" id=\"ord_time\" placeholder=\"12:30 PM\">\n");
      out.write("                    </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"submit\" role=\"button\" class=\"btn btn-success\" value=\"Proceed for Checkout\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    </tbody>\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
