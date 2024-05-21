package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Dto.Admin;
import Dao.AdminDao;

public final class adminPannel_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

            String email = (String) session.getAttribute("email");
            AdminDao ad = new AdminDao();
            Admin a = ad.getAdDetails(email);

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <title>TODO supply a title</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\n");
      out.write("        integrity=\"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\"\n");
      out.write("        integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("            \n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"adminPannel.jsp\">Welcome <i>");
      out.print( a.getUsername());
      out.write("</i> to E-Commerce</a>\n");
      out.write("           \n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\"\n");
      out.write("                data-bs-target=\"#navbarNavDarkDropdown\" aria-controls=\"navbarNavDarkDropdown\" aria-expanded=\"false\"\n");
      out.write("                aria-label=\"Toggle navigation\">\n");
      out.write("                <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarNavDarkDropdown\">\n");
      out.write("                <ul class=\"navbar-nav\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link active text-right active\" href=\"adminPannel.jsp\">Dashboard</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("                        <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdownMenuLink\" role=\"button\"\n");
      out.write("                            data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n");
      out.write("                            View\n");
      out.write("                        </a>\n");
      out.write("                        <ul class=\"dropdown-menu dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\n");
      out.write("                            <li><a class=\"dropdown-item\" href=\"viewUser.jsp\"><i class=\"fa-solid fa-user-group\"></i> Customers</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li><a class=\"dropdown-item\" href=\"adminViewOrders.jsp\"><i class=\"fa-solid fa-bag-shopping\"></i> Orders</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li><a class=\"dropdown-item\" href=\"viewSupplier.jsp\"><i class=\"fa-solid fa-boxes-packing\"></i> Supplier</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li><a class=\"dropdown-item\" href=\"adminViewProd.jsp\"><i class=\"fa-solid fa-boxes-packing\"></i> Products</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"aPassUpdate.jsp\">Update-Password</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a class=\"nav-link\" href=\"adminLogout.jsp\">Log Out</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <br>\n");
      out.write("        <div class=\"row\">\n");
      out.write("        <div class=\"card col-lg-6\" >\n");
      out.write("            <img src=\"ecommerce/online-shopping.png\" class=\"card-img-top\">\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("              <p class=\"card-text\">We present to you the most up to date,it is in-season and on-incline; \n");
      out.write("                if it is on the racks, it is on the web. Also, it is nowest,have it conveyed ASAP to you, \n");
      out.write("                from a store close you, when you utilize our Phygital services.</p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"card col-lg-6\">\n");
      out.write("            <img src=\"ecommerce/online-shopping1.png\" class=\"card-img-top\">\n");
      out.write("            <div class=\"card-body\">\n");
      out.write("              <p class=\"card-text\">We are energetic about discovering things that transcend the commonplace; \n");
      out.write("                that we think will get your attention and capture it. In addition, to convey these to you wherever\n");
      out.write("                 you are and at whatever point you believe you have sufficient energy to enjoy a bit.</p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"card col-md-3 col-lg-3\">\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <img src=\"ecommerce/supplier1.png\" class=\"img-fluid \">\n");
      out.write("                        <br><br>\n");
      out.write("                        <h5 class=\"card-title text-center\">SUPPLIERS</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"card col-md-3 col-lg-3\" >\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <img src=\"ecommerce/product.webp\" class=\"img-fluid \">\n");
      out.write("                        <br><br>\n");
      out.write("                        <h5 class=\"card-title text-center\">PRODUCTS</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"card col-md-3 col-lg-3\" >\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <img src=\"ecommerce/user2.jpg\" class=\"img-fluid \">\n");
      out.write("                        <br><br>\n");
      out.write("                        <h5 class=\"card-title text-center\">USERS</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"card col-md-3 col-lg-3\" >\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <img src=\"ecommerce/order1.png\" class=\"img-fluid \">\n");
      out.write("                        <br><br>\n");
      out.write("                        <h5 class=\"card-title text-center\">ORDERS</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>");
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
