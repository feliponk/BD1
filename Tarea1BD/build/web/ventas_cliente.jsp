<%-- 
    Document   : ventas_cliente
    Created on : 21-abr-2014, 20:17:32
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
        <title>Ventas a cliente</title>
    </head>
    <body>
        <p style="background-color: #CCFFFF">
            <%out.println("autentificado como "+(String)session.getAttribute("name")); %></p>
        <h1 style="background-color: #CCFFFF">
    
        Ventas a cliente</h1>
        <p style="background-color: #FF9966">
            Seleccione cliente &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="menu_adm.jsp"><span class="auto-style2">menu principal</span></a></p>
        <%
            Connection cn = null;
            PreparedStatement stmnt = null;
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String login = "HR";
            String password = "dantecry";
            String rut;
            String nombre;
            
            
            try
            {
                Class.forName(driver);
                cn = DriverManager.getConnection(url, login, password);
                Statement st = cn.createStatement();
                out.println("<form action= \"ver_venta_cliente.jsp\" method=\"POST\" >"+
                        "<table border=\"0\" align=\"\">"+
                            "<tbody>"+
                                "<tr>"+
                                    "<td>Cliente</td>"+
                                    "<td><select name=\"f_cliente\">");
                ResultSet rs = st.executeQuery("select * from \"CLIENTE\" ");
                while (rs.next())
                {
                    rut = rs.getString("RUT");
                    nombre = rs.getString("NOMBRE");
                
                    out.println("<option>"+nombre+"</option>");
                }
                out.println(        "</select></td>"+
                                "</tr>"+
                                
                                "<tr>"+
                                    "<td><input type=\"submit\" value=\"Ver\" /></td>"+
                                "</tr>"+
                            "</tbody>"+
                        "</table>"+
                        "</form>");
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
