package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_005fvendedor_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <title>Home</title>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/reset.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/grid.css\" type=\"text/css\" media=\"screen\">   \n");
      out.write("    <script src=\"js/jquery-1.7.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/cufon-yui.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/cufon-replace.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/Vegur_500.font.js\" type=\"text/javascript\"></script> \n");
      out.write("    <script src=\"js/FF-cash.js\" type=\"text/javascript\"></script>      \n");
      out.write("    <script src=\"js/tms-0.3.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/tms_presets.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/jquery.easing.1.3.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/jquery.equalheights.js\" type=\"text/javascript\"></script>\n");
      out.write("\t<!--[if lt IE 8]>\n");
      out.write("    <div style=' clear: both; text-align:center; position: relative;'>\n");
      out.write("        <a href=\"http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode\">\n");
      out.write("        \t<img src=\"http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg\" border=\"0\" height=\"42\" width=\"820\" alt=\"You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today.\" />\n");
      out.write("        </a>\n");
      out.write("    </div>\n");
      out.write("\t<![endif]-->\n");
      out.write("    <!--[if lt IE 9]>\n");
      out.write("   \t\t<script type=\"text/javascript\" src=\"js/html5.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/ie.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("\t<![endif]-->\n");
      out.write("</head>\n");
      out.write("<body id=\"page1\">\n");
      out.write("\t<div class=\"main-bg\">\n");
      out.write("        <div class=\"bg\">\n");
      out.write("            <!--==============================header=================================-->\n");
      out.write("            <header>\n");
      out.write("                <div class=\"main\">\n");
      out.write("                    <div class=\"wrapper\">\n");
      out.write("                        <h1><a href=\"index.html\">logo2</a></h1>\n");
      out.write("                        <div class=\"fright\">\n");
      out.write("                            <div class=\"indent\">\n");
      out.write("                                <span class=\"address\">");
 out.println("Vendedor "+(String)session.getAttribute("name")); 
      out.write("</span>\n");
      out.write("                                <span class=\"phone\">Bienvenido </span>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <nav>\n");
      out.write("                        <ul class=\"menu\">\n");
      out.write("                            <li><a class=\"active\" href=\"menu_vendedor.jsp\">Home</a></li>\n");
      out.write("                            <li><a href=\"ingresar_cliente.jsp\">Ingresar Cliente</a></li>\n");
      out.write("                            <li><a href=\"ingresar_venta.jsp\">Ingresar Venta</a></li>\n");
      out.write("                            <li><a href=\"mis_ventas.jsp\">Mis Ventas</a></li>\n");
      out.write("                        \n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("                    <div class=\"slider-wrapper\">\n");
      out.write("                        <div class=\"slider\">\n");
      out.write("                            <ul class=\"items\">\n");
      out.write("                                <li>\n");
      out.write("                                    <img src=\"images/tornillos.jpg\" alt=\"\" />\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <img src=\"images/im2.jpg\" alt=\"\" />\n");
      out.write("                                </li>\n");
      out.write("                                <li>\n");
      out.write("                                    <img src=\"images/ladrillos.jpg\" alt=\"\" />\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                        <a class=\"prev\" href=\"#\">prev</a>\n");
      out.write("                        <a class=\"next\" href=\"#\">next</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("            \n");
      out.write("            <!--==============================content================================-->\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <!--==============================footer=================================-->\n");
      out.write("            <footer>\n");
      out.write("                <div class=\"main\">\n");
      out.write("                    <span>Pepe’s Works &copy; 2014</span>\n");
      out.write("                    Website Template by <a href=\"http://www.templatemonster.com/\" target=\"_blank\" rel=\"nofollow\">www.templatemonster.com</a>\n");
      out.write("                </div>\n");
      out.write("            </footer>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\t<script type=\"text/javascript\"> Cufon.now(); </script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("\t\t$(window).load(function() {\n");
      out.write("\t\t\t$('.slider')._TMS({\n");
      out.write("\t\t\t\tduration:1000,\n");
      out.write("\t\t\t\teasing:'easeOutQuint',\n");
      out.write("\t\t\t\tpreset:'simpleFade',\n");
      out.write("\t\t\t\tslideshow:7000,\n");
      out.write("\t\t\t\tbanners:false,\n");
      out.write("\t\t\t\tpauseOnHover:true,\n");
      out.write("\t\t\t\tpagination:false,\n");
      out.write("\t\t\t\tpagNums:false,\n");
      out.write("\t\t\t\tnextBu:'.next',\n");
      out.write("\t\t\t\tprevBu:'.prev'\n");
      out.write("\t\t\t});\n");
      out.write("\t\t});\n");
      out.write("    </script>\n");
      out.write("</body>\n");
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
