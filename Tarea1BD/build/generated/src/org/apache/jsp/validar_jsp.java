package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.*;

public final class validar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html><link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"screen\"></html>\n");

Connection cn = null;
PreparedStatement stmnt = null;
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String login = "HR";
String password = "dantecry";
String s_nombre;
String s_clave;
String name="";
String pass="";
String tipo="";

s_nombre = request.getParameter("f_usuario");
s_clave = request.getParameter("f_clave");

session.setAttribute("idrut", s_nombre);

try {
    if (s_nombre.compareTo("")==0 || s_clave.compareTo("")==0)
    {
        out.println("<script>alert('Hay espacios en blanco')</script>"); 
        out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
    }
    
    Class.forName(driver);
    cn = DriverManager.getConnection(url, login, password);
    
    
    Statement st = cn.createStatement();
    ResultSet rs = st.executeQuery("select * from \"USUARIOS\" where \"USUARIOS\".\"RUT\"='"+s_nombre+"'");
    while(rs.next())
    {
        name = rs.getString("NOMBRE");
        pass = rs.getString("PASSWORD");
        tipo = rs.getString("TIPO");
    }
    session.setAttribute("name", name);
    session.setAttribute("id", s_nombre);
    
    if (name.compareTo("") == 0)
    {
        out.println("<script>alert('Contraseña o Usuario invalido')</script>"); 
        out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
    }
    
    if (pass.compareTo(s_clave) == 0)
    {
        if (tipo.compareTo("Administrador") == 0)
        {
         
             
            out.println("<meta http-equiv='refresh' content='0;url= menu_1.jsp'>");
        }
        else
        {
           
      
            out.println("<meta http-equiv='refresh' content='0;url= menu_vendedor.jsp'>");
        }
    }
    else
    {
        
        out.println("<script>alert('Contraseña o Usuario invalido')</script>"); 
        out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
    }
    
    
}
catch (Exception e) {
        out.print("<br>Error en la conexión: " + e);
    } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    out.println("<br>error cerrando conexión: "+e);
                }
            }
        }

      out.write('\n');
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
