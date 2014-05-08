<%-- 
    Document   : guardar_cliente
    Created on : 19-abr-2014, 0:30:50
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
    String coencidencia = "";
    try{
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        
        String rut = request.getParameter("f_rut");
        String nombre = request.getParameter("f_nombre");
        
        
        
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from \"CLIENTE\" where \"RUT\" = '"+rut+"'");
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
        else if (coencidencia.compareTo("") == 0)
        {
            stmnt = cn.prepareStatement("insert into \"CLIENTE\" values(?,?)");
            stmnt.setString(1, rut);
            
            stmnt.setString(2, nombre);
    
            stmnt.executeUpdate();
            out.println("<script>alert('Cliente ingresado correctamente')</script>");
            out.println("<meta http-equiv='refresh' content='0;url=ingresar_cliente.jsp'>");
        }
        else
        {
            out.println("<script>alert('Rut ya registrado en la base de datos')</script>"); 
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

