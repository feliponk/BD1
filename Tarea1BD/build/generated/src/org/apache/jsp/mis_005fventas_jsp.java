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

public final class mis_005fventas_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Mis ventas</title>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/reset.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/grid.css\" type=\"text/css\" media=\"screen\">\n");
      out.write("    <script>\n");
      out.write("        function validarSiNumero(numero){\n");
      out.write("        if (!/^([0-9])*$/.test(numero))\n");
      out.write("            alert(\"El valor <\" + numero + \"> no es un número\");\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("    <script src=\"js/jquery-1.7.1.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/cufon-yui.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"js/cufon-replace.js\" type=\"text/javascript\"></script>\n");
      out.write("\t<script src=\"js/Vegur_500.font.js\" type=\"text/javascript\"></script> \n");
      out.write("    <script src=\"js/FF-cash.js\" type=\"text/javascript\"></script>        \n");
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
      out.write("<body id=\"page5\">\n");
      out.write("\t<div class=\"main-bg\">\n");
      out.write("        <div class=\"bg\">\n");
      out.write("            <!--==============================header=================================-->\n");
      out.write("            <header>\n");
      out.write("                <div class=\"main\">\n");
      out.write("                    <div class=\"wrapper\">\n");
      out.write("                        <h1><a href=\"index.html\">logo</a></h1>\n");
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
      out.write("                            <li><a href=\"menu_vendedor.jsp\">Home</a></li>\n");
      out.write("                            <li><a href=\"ingresar_cliente.jsp\">Ingresar Cliente</a></li>\n");
      out.write("                            <li><a href=\"ingresar_venta.jsp\">Ingresar Venta</a></li>\n");
      out.write("                            <li><a class=\"active\" href=\"mis_ventas.jsp\">Mis Ventas</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("            \n");
      out.write("            <!--==============================content================================-->\n");
      out.write("            <section id=\"content\"><div class=\"ic\">More Website Templates @ TemplateMonster.com - January 30, 2012!</div>\n");
      out.write("                <div class=\"main\">\n");
      out.write("                    <div class=\"container_12\">\n");
      out.write("                        <div class=\"wrapper p4\">\n");
      out.write("                           \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"container-bot\">\n");
      out.write("                            <div class=\"container-top\">\n");
      out.write("                                <div class=\"container\">\n");
      out.write("                                    <div class=\"wrapper\">\n");
      out.write("                                        \n");
      out.write("                                        <article class=\"grid_8\">\n");
      out.write("                                            <div class=\"indent-left2\">\n");
      out.write("                                                <h3 class=\"p1\">Mis ventas</h3>\n");
      out.write("        ");

            Connection cn = null;
            PreparedStatement stmnt = null;
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String login = "HR";
            String password = "dantecry";
            String rut = "";
            String nombre = "";
            String categoria ="";
            String descripcion = "";
            String codigo = "";
            String yo = (String)session.getAttribute("idrut");
            
            try
            {
                Class.forName(driver);
                cn = DriverManager.getConnection(url, login, password);
                
                Statement st2 = cn.createStatement();
                ResultSet rs2 = st2.executeQuery("select * from \"view_VentasVendedor\" where \"ID_USUARIO\" = '"+yo+"'");
                out.println("<form action= \"menu_vendedor.jsp\" method=\"POST\" >"+
                               " <table class=\"price-list\">"+
                        "<thead>"+
                           "<tr>"+
                              "<td>Codigo</td>"+
                              "<td>Nombre</td>"+
                              "<td>Categoria</td>"+
                              "<td>Descripcion</td>"+
                              
                           "</tr>"+
                     "</thead>"+
                     "<tbody>");
                while (rs2.next())
                {
                    codigo = rs2.getString("ID_PRODUCTO");
                nombre = rs2.getString("NOMBRE");
                categoria = rs2.getString("CATEGORIA");
                descripcion = rs2.getString("DESCRIPCION");
                out.println(
                                        "<tr>"+
                        
                                            "<td>" +codigo+ "</td>"+
                                            "<td>" +nombre+ "</td>"+
                                            "<td>"+categoria+"</td>"+
                                            "<td>"+descripcion+"</td>"+
                                            
                                        "</tr>"
                                   );
                }
                out.println(
                         "</tbody>"+
                       "</table>"+
                        "</form>");
                if (codigo.compareTo("") == 0)
                {
                    out.println("<script>alert('No tiene ninguna venta asociada')</script>");
                    out.println("<meta http-equiv='refresh' content='0;url= menu_vendedor.jsp'>");
                }
            }
            
            
            catch (Exception e) {
                out.print("<br>Error en la conexión: " + e);
                } finally 
                    {
                     if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    out.print("<br>error cerrando conexión: "+e);
                }
            }
        }    
        
      out.write("\n");
      out.write(" </div>\n");
      out.write("                                        </article>\n");
      out.write("                                        <article class=\"grid_4\">\n");
      out.write("                                            <div class=\"indent-left2 indent-top\">\n");
      out.write("                                                <div class=\"box p4\">\n");
      out.write("                                                    <div class=\"padding\">\n");
      out.write("                                                        <div class=\"wrapper\">\n");
      out.write("                                                            <figure class=\"img-indent\"><img src=\"images/page1-img4.png\" alt=\"\"></figure>\n");
      out.write("                                                            <div class=\"extra-wrap\">\n");
      out.write("                                                                <h3 class=\"p0\">Horario</h3>\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                        <p class=\"p1\"><strong>Atencion al publico</strong></p>\n");
      out.write("                                                        <p class=\"color-1 p0\">Lunes a Viernes: 10:00 a 20:00</p>\n");
      out.write("                                                        <p class=\"color-1 p1\">Sabados: 10:00 a 17:00</p>\n");
      out.write("                                                        Horario continuado\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <figure class=\"indent-bot\">\n");
      out.write("                                                    <iframe width=\"260\" height=\"202\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"https://maps.google.cl/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=Universidad+T%C3%A9cnica+Federico+Santa+Maria,+Santiago&amp;aq=0&amp;oq=universidad+te&amp;sll=-33.668298,-70.363372&amp;sspn=1.499528,2.469177&amp;ie=UTF8&amp;hq=Universidad+T%C3%A9cnica+Federico+Santa+Maria,&amp;hnear=Santiago,+Regi%C3%B3n+Metropolitana+de+Santiago+de+Chile&amp;ll=-33.433095,-70.609714&amp;spn=0.133373,0.077479&amp;t=m&amp;output=embed\"></iframe><br /><small><a href=\"https://maps.google.cl/maps?f=q&amp;source=embed&amp;hl=es&amp;geocode=&amp;q=Universidad+T%C3%A9cnica+Federico+Santa+Maria,+Santiago&amp;aq=0&amp;oq=universidad+te&amp;sll=-33.668298,-70.363372&amp;sspn=1.499528,2.469177&amp;ie=UTF8&amp;hq=Universidad+T%C3%A9cnica+Federico+Santa+Maria,&amp;hnear=Santiago,+Regi%C3%B3n+Metropolitana+de+Santiago+de+Chile&amp;ll=-33.433095,-70.609714&amp;spn=0.133373,0.077479&amp;t=m\" style=\"color:#0000FF;text-align:left\">Ver mapa más grande</a></small>\n");
      out.write("                                                </figure>\n");
      out.write("                                                <div class=\"indent-left\">\n");
      out.write("                                                    <dl class=\"main-address\">\n");
      out.write("                                                        <dt>Demolink.org 8901 Marmora Road,<br> Glasgow, D04 89GR.</dt>\n");
      out.write("                                                        <dd><span>Telephone:</span>  +1 959 552 5963;</dd>\n");
      out.write("                                                        <dd><span>FAX:</span>  +1 959 552 5963</dd>\n");
      out.write("                                                        <dd><span>E-mail:</span><a href=\"#\">mail@demolink.org</a></dd>\n");
      out.write("                                                    </dl>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </article>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
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
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
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
