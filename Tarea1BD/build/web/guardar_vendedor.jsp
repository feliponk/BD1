<%-- 
    Document   : guardar_vendedor
    Created on : 18-abr-2014, 22:09:48
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
<html><html><link rel="stylesheet" href="css/style.css" type="text/css" media="screen"></html></html>
<%
    Connection cn = null;
    PreparedStatement stmnt = null;
    
    String driver = "oracle.jdbc.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String login = "HR";
    String password = "dantecry";
    String coencidencia="";
    try{
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        
        String rut = request.getParameter("f_rut");
        String clave = request.getParameter("f_clave");
        String clave2 = request.getParameter("f_clave2");
        String nombre = request.getParameter("f_nombre");
        
        
        
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from \"USUARIOS\" where \"RUT\" = '"+rut+"'");
        while (rs.next())
        {
            coencidencia = rs.getString("NOMBRE");
        }
        
        if ( rut.compareTo("")== 0 || nombre.compareTo("")==0 )
        {
            out.println("<script>alert('Hay espacios en blanco')</script>"); 
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else if (clave.compareTo(clave2) == 0 && coencidencia.compareTo("") == 0)
        {
            stmnt = cn.prepareStatement("insert into \"USUARIOS\" values(?,?,?,?,?)");
            stmnt.setString(1, rut);
            stmnt.setString(2, clave);
            stmnt.setString(3, nombre);
            stmnt.setString(4, "Vendedor");
            stmnt.setInt(5, 0);
            stmnt.executeUpdate();
            out.println("<script>alert('Vendedor ingresado correctamente')</script>");
            out.println("<meta http-equiv='refresh' content='0;url=ingresar_vendedor.jsp'>");
        }
        else if (coencidencia.compareTo("") != 0)
        {
            out.println("<script>alert('Rut ya registrado en la base de datos')</script>"); 
        out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else
        {
           out.println("<script>alert('No hay coencidencia en las contraseñas')</script>"); 
           out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
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
