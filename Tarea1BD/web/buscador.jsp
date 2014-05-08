<%-- 
    Document   : buscador
    Created on : 19-abr-2014, 16:36:51
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
        <title>Buscador</title>
    </head>
    <body>
        <p style="background-color: #CCFFFF">
            <%out.println("autentificado como "+(String)session.getAttribute("name")); %></p>
        <h1 style="background-color: #CCFFFF">
    
        Resultado de busqueda</h1>
        <p style="background-color: #FF9966">
            Escoja un campo para editar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="menu_adm.jsp"><span class="auto-style2">menu principal</span></a></p>
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
            String nombre = request.getParameter("f_buscador");
            String codigo;
            String cantidad;
            try
            {
                Class.forName(driver);
                cn = DriverManager.getConnection(url, login, password);
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from \"PRODUCTO\" where \"PRODUCTO\".\"NOMBRE\" = '"+nombre+"'");
                while (rs.next())
                {
                codigo = rs.getString("ID_PRODUCTO");
                cantidad = rs.getString("STOCK");
                out.println("<form action= \"editar_producto.jsp\" method=\"POST\" >"+
                               " <table border=\"1\" align=\"\">"+
                                    "<tbody>"+
                                        "<tr>"+
                                            "<td><input type=\"hidden\" name=\"f_cod\" value="+codigo+" /></td>"+
                                            "<td><input type=\"text\" name=\"f_codigos\" value="+codigo+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"text\" name=\"f_nombre\" value="+nombre+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"text\" name=\"f_cantidad\" value="+cantidad+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"submit\" value=\"Editar\" /></td>"+
                                        "</tr>"+
                                    "</tbody>"+
                                 "</table>"+
                             "</form>");
                }
               
                Statement st2 = cn.createStatement();
                ResultSet rs2 = st2.executeQuery("select * from \"PRODUCTO\" where \"PRODUCTO\".\"CATEGORIA\" = '"+nombre+"'");
                while (rs2.next())
                {
                codigo = rs2.getString("ID_PRODUCTO");
                cantidad = rs2.getString("STOCK");
                nombre = rs2.getString("NOMBRE");
                out.println("<form action= \"editar_producto.jsp\" method=\"POST\" >"+
                               " <table border=\"1\" align=\"\">"+
                                    "<tbody>"+
                                        "<tr>"+
                                            "<td><input type=\"hidden\" name=\"f_cod\" value="+codigo+" /></td>"+
                                            "<td><input type=\"text\" name=\"f_codigos\" value="+codigo+" disabled=\"disabled\" /></td>"+
                                            "<td><input type=\"text\" name=\"f_nombre\" value="+nombre+" disabled=\"disabled\" /></td>"+
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
    </body>
</html>
