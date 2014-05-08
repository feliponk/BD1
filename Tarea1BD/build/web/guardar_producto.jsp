<%-- 
    Document   : guardar_producto
    Created on : 19-abr-2014, 17:45:25
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
        String aux ="";
        String nombre = request.getParameter("f_nombre");
        String descripcion = request.getParameter("f_descripcion");
        String categoria = request.getParameter("f_categoria");
        String cantidad = request.getParameter("f_cantidad");
        String precio = request.getParameter("f_precio");
        
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from \"PRODUCTO\" where \"NOMBRE\" = '"+nombre+"'");
        while(rs.next())
        {
            
            aux = rs.getString("DESCRIPCION");
            
        }
        
        if (nombre.compareTo("")==0 || descripcion.compareTo("")==0 ||categoria.compareTo("")==0 || cantidad.compareTo("")==0 || precio.compareTo("")==0 )
        {
            out.println("<script>alert('Hay espacios en blanco')</script>");
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        int cantidad2 = Integer.parseInt(cantidad);
        int precio2 = Integer.parseInt(precio);
        if (cantidad2 < 0  )
        {
            out.println("<script>alert('Ingreso un valor invalido en el campo CANTIDAD')</script>");
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else if (precio2  <= 0 )
        {
            out.println("<script>alert('Ingreso un valor invalido en el campo PRECIO')</script>");
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else if (aux.compareTo("") != 0)
        {
            out.println("<script>alert('Producto ya esta en la base de datos')</script>");
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else{
            
            stmnt = cn.prepareStatement("insert into \"PRODUCTO\" values (?,?,?,?,?,?)");
            stmnt.setInt(1, 1);
            stmnt.setInt(2, cantidad2);
            stmnt.setString(3, descripcion);
            stmnt.setString(4, categoria);
            stmnt.setInt(5, precio2);
            stmnt.setString(6, nombre);
       
            stmnt.executeUpdate();
            out.println("<script>alert('Producto agregado con exito')</script>");
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
    }
    catch (Exception e) {
        out.println("<br>Hubo un error de tipo: " + e);
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
