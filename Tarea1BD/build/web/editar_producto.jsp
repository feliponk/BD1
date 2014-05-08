<%-- 
    Document   : editar_producto
    Created on : 19-abr-2014, 0:58:17
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.PreparedStatement"
        import="java.sql.SQLException"
        import="java.sql.Statement"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Producto</title>
    </head>
    <body>
        <p style="background-color: #CCFFFF">
            <%out.println("autentificado como "+(String)session.getAttribute("name")); %></p>
        <h1 style="background-color: #CCFFFF">
    
        Editar Producto</h1>
        <p style="background-color: #FF9966">
            Escoja un campo para editar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="menu_adm.jsp"><span class="auto-style2">menu principal</span></a></p>
        <%
            Connection cn = null;
            PreparedStatement stmnt = null;
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String login = "HR";
            String password = "dantecry";
            String s_codigo = request.getParameter("f_cod");
            String nombre; //editar desde aqui//
            String cantidad;
            String descripcion;
            String categoria;
            String precio;
            try
            {
                Class.forName(driver);
                cn = DriverManager.getConnection(url, login, password);
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from \"PRODUCTO\" where \"PRODUCTO\".\"ID_PRODUCTO\" = "+s_codigo+"");
                while (rs.next())
                {
                categoria = rs.getString("CATEGORIA");
                descripcion = rs.getString("DESCRIPCION");
                nombre = rs.getString("NOMBRE");
                cantidad = rs.getString("STOCK");
                precio = rs.getString("PRECIO");
                out.println("<form action=\"guardar_editar_producto.jsp\" method=\"POST\" >"+
                               " <table border=\"0\" align=\"\">"+
                                    "<tbody>"+
                                        "<tr>"+
                                         
                                            "<td>Codigo</td>"+
                                            "<td><input type=\"text\" name=\"f_codigo\" value="+s_codigo+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"hidden\" name=\"f_cod\" value="+s_codigo+" /></td>"+
                                        "</tr>"+
                                        "<tr>"+
                                            "<td>Nombre</td>"+
                                            "<td><input type=\"text\" name=\"f_nombre\" value=\""+nombre+"\" disabled=\"disabled\" /></td>"+
                  
                                        "</tr>"+
                                        "<tr>"+
                                            "<td>Categoria</td>"+
                                            "<td><input type=\"text\" name=\"f_categoria\" value=\""+categoria+"\" /></td>"+
                  
                                        "</tr>"+
                                        "<tr>"+
                                            "<td>Descripcion</td>"+
                                            "<td><input type=\"text\" name=\"f_descripcion\" value=\""+descripcion+"\" /></td>"+
                  
                                        "</tr>"+
                                        "<tr>"+
                                            "<td>Precio</td>"+
                                            "<td><input type=\"text\" name=\"f_precio\" value="+precio+" /></td>"+
                  
                                        "</tr>"+
                                        "<tr>"+
                                            "<td>Cantidad</td>"+
                                            "<td><input type=\"text\" name=\"f_cantidad\" value="+cantidad+" disabled=\"disabled\" /></td>"+
                  
                                        "</tr>"+
                                        "<tr>"+
                                            "<td><input type=\"submit\" value=\"Guardar cambios\" /></td>"+
                                        "</tr>"+
                                    "</tbody>"+
                                 "</table>"+
                             "</form>");
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
        %>
    </body>
</html>
