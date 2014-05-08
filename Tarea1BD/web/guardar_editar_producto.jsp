<%-- 
    Document   : guardar_editar_producto
    Created on : 19-abr-2014, 15:48:51
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.PreparedStatement"
        import="java.sql.Statement"
        import="java.sql.SQLException"
%>
<html><link rel="stylesheet" href="css/style.css" type="text/css" media="screen"></html>
<%
    Connection cn = null;
    PreparedStatement stmnt = null;
    
    String driver = "oracle.jdbc.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String login = "HR";
    String password = "dantecry";
    try{
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        
        String codigo = request.getParameter("f_cod");
        String categoria = request.getParameter("f_categoria");
        String precio = request.getParameter("f_precio");
        String descripcion = request.getParameter("f_descripcion");
        
        
        
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        
        
        if ( descripcion.compareTo("")==0 ||categoria.compareTo("")==0  || precio.compareTo("")==0 )
        {
            out.println("<script>alert('Hay espacios en blanco')</script>");
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else{
            stmnt = cn.prepareStatement("update \"PRODUCTO\" set \"CATEGORIA\" ='"+categoria+"' where \"ID_PRODUCTO\" ="+codigo);
            stmnt.executeUpdate();
            stmnt = cn.prepareStatement("update \"PRODUCTO\" set \"PRECIO\" ="+precio+" where \"ID_PRODUCTO\" ="+codigo);
            stmnt.executeUpdate();
            stmnt = cn.prepareStatement("update \"PRODUCTO\" set \"DESCRIPCION\" ='"+descripcion+"' where \"ID_PRODUCTO\" ="+codigo);
            stmnt.executeUpdate();
            out.println("<script>alert('Producto editado correctamente')</script>");
            out.println("<meta http-equiv='refresh' content='0;url=admipro2.jsp'>");
       
        
        }
    }
    catch (Exception e) {
        out.println("<br>Error en la conexión: " + e);
    } 
    finally {
        if (cn != null) {
            try {
                cn.close();
            }
            catch (SQLException e) {
                out.println("<br>Error cerrando conexión: "+e);
            }
        }
    }
%>
