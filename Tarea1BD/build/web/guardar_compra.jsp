<%-- 
    Document   : guardar_compra
    Created on : 19-abr-2014, 18:43:31
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
    try{
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        String codigo = "";
        String cod_com = "";
        String producto = request.getParameter("f_producto");
        String cantidad = request.getParameter("f_cantidad");
        String precio = request.getParameter("f_precio");
        
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from \"PRODUCTO\" where \"PRODUCTO\".\"NOMBRE\" ='"+producto+"'");
        while (rs.next())
        {
             codigo = rs.getString("ID_PRODUCTO");
             
        }
        if ( producto.compareTo("")== 0 || cantidad.compareTo("")==0 || precio.compareTo("")==0 )
        {
            out.println("<script>alert('Hay espacios en blanco')</script>"); 
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else if (codigo.compareTo("") == 0)
        {
            out.println("<script>alert('El producto no existe')</script>"); 
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else
        {
            Calendar fecha = Calendar.getInstance();
            int dia = fecha.get(Calendar.DATE);
            int mes = fecha.get(Calendar.MONTH);
            int año = fecha.get(Calendar.YEAR);
            
            int hora = fecha.get(Calendar.HOUR);
            int minuto = fecha.get(Calendar.MINUTE);
            int seg = fecha.get(Calendar.SECOND);
            
            String dt = Integer.toString(dia)+"-"+Integer.toString(mes)+"-"+Integer.toString(año);
            String tm = Integer.toString(hora)+":"+Integer.toString(minuto)+":"+Integer.toString(seg);            
            int precio2 = Integer.parseInt(precio);
            int cantidad2 = Integer.parseInt(cantidad);
            int multi = precio2 * cantidad2;
            stmnt = cn.prepareStatement("insert into \"COMPRA\" values(?,?,?,?)");
            stmnt.setInt(1,1);
            stmnt.setInt(2,multi);
            stmnt.setString(3,dt);
            stmnt.setString(4, tm); 
    
            stmnt.executeUpdate();
            
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select * from \"COMPRA\" order by \"ID_COMPRA\" desc");
            while (rs2.next())
            {
             cod_com = rs2.getString("ID_COMPRA");
             break;
             
            }
            
            stmnt = cn.prepareStatement("insert into \"DETALLE_COMPRA\" values(?,?,?,?,?)");
            stmnt.setInt(1,1);
            stmnt.setInt(2,Integer.parseInt(cod_com));
            stmnt.setInt(3,Integer.parseInt(codigo));
            stmnt.setInt(4,Integer.parseInt(cantidad));
            stmnt.setInt(5, Integer.parseInt(precio));
             
    
            stmnt.executeUpdate();
            
            out.println("<script>alert('Compra realizada con exito Producto: "+producto+"   Precio: "+precio+"  Total: "+multi+"   Fecha: "+dt+"   Hora: "+tm+"')</script>");
            out.println("<meta http-equiv='refresh' content='0;url= ingresar_compra.jsp'>");
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
