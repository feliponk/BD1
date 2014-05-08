<%-- 
    Document   : administrar_producto
    Created on : 19-abr-2014, 0:39:24
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
        <title>Administrar Producto</title>
    </head>
    <body>
        <p style="background-color: #CCFFFF">
            <%out.println("autentificado como "+(String)session.getAttribute("name")); %></p>
        <h1 style="background-color: #CCFFFF">
            
        Administracion de productos</h1>
        <p style="background-color: #FF9966">
            Lista de productos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="menu_adm.jsp"><span class="auto-style2">menu principal</span></a></p>
        <table border="0" align="">
                 
                <tbody>
                    <tr>
                        <td>CODIGO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>NOMBRE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>CANTIDAD</td>
                    </tr>
                </tbody>
        </table>
        <%
            Connection cn = null;
            PreparedStatement stmnt = null;
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String login = "HR";
            String password = "dantecry";
            String codigo;
            String nombre;
            String cantidad;
            
            try
            {
                Class.forName(driver);
                cn = DriverManager.getConnection(url, login, password);
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from \"PRODUCTO\" ");
                while (rs.next())
                {
                codigo = rs.getString("ID_PRODUCTO");
                nombre = rs.getString("NOMBRE");
                cantidad = rs.getString("STOCK");
                out.println("<form action= \"editar_producto.jsp\" method=\"POST\" >"+
                               " <table border=\"1\" align=\"\">"+
                                    "<tbody>"+
                                        "<tr>"+
                                            "<td><input type=\"hidden\" name=\"f_cod\" value="+codigo+" /></td>"+
                                            "<td><input type=\"text\" name=\"f_codigos\" value="+codigo+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"text\" name=\"f_nombre\" value=\""+nombre+"\" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"text\" name=\"f_cantidad\" value="+cantidad+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"submit\" value=\"Editar\" /></td>"+
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
        <p style="background-color: #FF9966">
            Buscador por nombre o categoria</p>
        <form action="buscador.jsp" method="POST" >
             <table border="0" align="">
                 
                <tbody>
                    <tr>
                        
                        <td><input type="text" name="f_buscador" value="" /></td>
                        <td><input type="submit" value="Buscar" /></td>
                
                    </tr>
                </tbody>
            </table>
        </form>
        <p style="background-color: #FF9966">
            Agregar producto</p>
        <form action="guardar_producto.jsp" method="POST" >
             <table border="0" align="">
                 
                <tbody>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="f_nombre" value="" /></td>
                        
                
                    </tr>
                    <tr>
                        <td>Descripcion</td>
                        <td><input type="text" name="f_descripcion" value="" /></td>
                        
                
                    </tr>
                    <tr>
                        <td>Categoria</td>
                        <td><input type="text" name="f_categoria" value="" /></td>
                        
                
                    </tr>
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="f_cantidad" value="" /></td>
                        
                
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="f_precio" value="" /></td>
                        
                
                    </tr>
                    <tr>
                        
        
                        <td><input type="submit" value="Finalizar" /></td>
                
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
