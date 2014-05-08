<%-- 
    Document   : guardar_venta2
    Created on : 21-abr-2014, 20:57:48
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
        String precio="";
        String rut = "";
        String cliente = request.getParameter("f_cliente");
        String producto = request.getParameter("f_producto");
        String cantidad = request.getParameter("f_cantidad");
        String nombrevendedor="";
        String idrut =  (String)session.getAttribute("idrut");
        String stock = "";
        
        Class.forName(driver);
        cn = DriverManager.getConnection(url, login, password);
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from \"PRODUCTO\" where \"PRODUCTO\".\"NOMBRE\" ='"+producto+"'");
        while (rs.next())
        {
             codigo = rs.getString("ID_PRODUCTO");
             precio = rs.getString("PRECIO");
             stock = rs.getString("STOCK");
             
        }
        Statement st3 = cn.createStatement();
        ResultSet rs3 = st3.executeQuery("select * from \"CLIENTE\" where \"CLIENTE\".\"NOMBRE\" ='"+cliente+"'");
        while (rs3.next())
        {
             rut = rs3.getString("RUT");
             
             
        }
        
        if ( producto.compareTo("")== 0 || cantidad.compareTo("")==0 || cliente.compareTo("")==0 )
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
        
        int stock2 = Integer.parseInt(stock);
        int cant2 = Integer.parseInt(cantidad);
        if ((stock2) ==  0)
        {
            out.println("<script>alert('No hay stock intente mas tarde')</script>"); 
            
            out.println("<meta http-equiv='refresh' content='0;url= ingresar_venta.jsp'>");
        }
        else if (cant2 <= 0)
        {
            out.println("<script>alert('Ingrese una cantidad valida')</script>"); 
            out.println("<script type=\"text/javascript\">"+
                            "history.back();"+
                     "</script>");
        }
        else if ((stock2-cant2)< 0)
        {
            out.println("<script>alert('No hay suficientes productos, intente con otro monto')</script>"); 
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
            stmnt = cn.prepareStatement("insert into \"VENTAS\" values(?,?,?,?,?,?)");
            stmnt.setInt(1,1);
            stmnt.setString(2,rut);
            stmnt.setString(3,idrut);
            stmnt.setInt(4,multi);
            stmnt.setString(5,dt);
            stmnt.setString(6, tm);
            
    
            stmnt.executeUpdate();
            
            Statement st4 = cn.createStatement();
            ResultSet rs4 = st4.executeQuery("select * from \"USUARIOS\" where \"RUT\"= '"+idrut+"'");
            while (rs4.next())
            {
             nombrevendedor = rs4.getString("NOMBRE");
             
             
            }
            
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select * from \"VENTAS\" order by \"ID_VENTA\" desc");
            while (rs2.next())
            {
             cod_com = rs2.getString("ID_VENTA");
             break;
             
            }
            
            stmnt = cn.prepareStatement("insert into \"DETALLE_VENTA\" values(?,?,?,?)");
            stmnt.setInt(1,1);
            stmnt.setInt(2,Integer.parseInt(cod_com));
            stmnt.setInt(3,Integer.parseInt(codigo));
            stmnt.setInt(4,Integer.parseInt(cantidad));
            
             
    
            stmnt.executeUpdate();
            
            out.println("<script>alert('Venta realizada con exito Cliente: "+cliente+"  Rut: "+rut+"   Vendedor: "+nombrevendedor+"   Rut: "+idrut+"   Producto: "+producto+"   Precio: "+precio+"  Total: "+multi+"   Fecha: "+dt+"   Hora: "+tm+"')</script>");
            out.println("<meta http-equiv='refresh' content='0;url= ingresar_venta2.jsp'>");
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