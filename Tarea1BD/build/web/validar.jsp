<%-- 
    Document   : validar
    Created on : 17-oct-2013, 16:38:00
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.PreparedStatement"
        import="java.sql.Statement"
        import="java.sql.SQLException"
        import="java.util.*"
%>
<html><link rel="stylesheet" href="css/style.css" type="text/css" media="screen"></html>
<%
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
%>
