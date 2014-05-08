package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<!--[if lt IE 7]> <html class=\"lt-ie9 lt-ie8 lt-ie7\" lang=\"en\"> <![endif]-->\n");
      out.write("<!--[if IE 7]> <html class=\"lt-ie9 lt-ie8\" lang=\"en\"> <![endif]-->\n");
      out.write("<!--[if IE 8]> <html class=\"lt-ie9\" lang=\"en\"> <![endif]-->\n");
      out.write("<!--[if gt IE 8]><!--> <html lang=\"en\"> <!--<![endif]-->\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\n");
      out.write("  <title>Login</title>\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/style2.css\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("  \n");
      out.write("  <!--[if lt IE 9]><script src=\"//html5shim.googlecode.com/svn/trunk/html5.js\"></script><![endif]-->\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <header>\n");
      out.write("                <div class=\"main\">\n");
      out.write("                    <div class=\"wrapper\">\n");
      out.write("                        \n");
      out.write("                        <div class=\"fright\">\n");
      out.write("                            <div class=\"indent\">\n");
      out.write("                                <span class=\"phone\">Bienvenido a Pepe's Works</span>\n");
      out.write("                                <span class=\"address\">Inicie sesion, para acceder a las opciones de venta y compra</span>\n");
      out.write("                                \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("    \n");
      out.write("  <form method=\"post\" action=\"validar.jsp\" class=\"login\">\n");
      out.write("    <p>\n");
      out.write("      <label for=\"login\">Usuario:</label>\n");
      out.write("      <input type=\"text\" name=\"f_usuario\" id=\"login\" value=\"12.345.678-k\">\n");
      out.write("    </p>\n");
      out.write("\n");
      out.write("    <p>\n");
      out.write("      <label for=\"password\">Contraseña:</label>\n");
      out.write("      <input type=\"password\" name=\"f_clave\" id=\"password\" value=\"\">\n");
      out.write("    </p>\n");
      out.write("\n");
      out.write("    <p class=\"login-submit\">\n");
      out.write("      <button type=\"submit\" class=\"login-button\">Login</button>\n");
      out.write("    </p>\n");
      out.write("\n");
      out.write("    \n");
      out.write("  </form>\n");
      out.write("\n");
      out.write("  \n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
