<%-- 
    Document   : ingresar_venta2
    Created on : 21-abr-2014, 20:56:35
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
<html lang="en">
<head>
    <title>Ingresar Venta</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">
    <script>
        function validarSiNumero(numero){
        if (!/^([0-9])*$/.test(numero))
            alert("El valor <" + numero + "> no es un número");
        }
    </script>
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script>
	<script src="js/Vegur_500.font.js" type="text/javascript"></script> 
    <script src="js/FF-cash.js" type="text/javascript"></script>        
	<!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
        	<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
	<![endif]-->
    <!--[if lt IE 9]>
   		<script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	<![endif]-->
</head>
<body id="page5">
	<div class="main-bg">
        <div class="bg">
            <!--==============================header=================================-->
            <header>
                <div class="main">
                    <div class="wrapper">
                        <h1><a href="menu_1.jsp">logo</a></h1>
                        <div class="fright">
                            <div class="indent">
                                <span class="address"><% out.println("Administrador "+(String)session.getAttribute("name")); %></span>
                                <span class="phone">Bienvenido </span>
                                <a class ="address" href="index.jsp">[Cerrar sesion]</a>
                            </div>
                        </div>
                    </div>
                    <nav>
                        <ul class="menu">
                            <li><a href="menu_1.jsp">Home</a></li>
                            <li><a href="ingresar_vendedor.jsp">Ingresar Vendedor</a></li>
                            <li><a href="admipro2.jsp">Administrar Producto </a></li>
                            <li><a href="ingresar_compra.jsp">Ingresar compra</a></li>
                            <li><a href="ver_venta_cliente.jsp">Ver Ventas a Cliente</a></li>
                            <li><a class="active" href="ingresar_venta2.jsp">Ingresar Venta</a></li>
                        </ul>
                    </nav>
                </div>
            </header>
            
            <!--==============================content================================-->
            <section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - January 30, 2012!</div>
                <div class="main">
                    <div class="container_12">
                        <div class="wrapper p4">
                           
                            
                            
                        </div>
                        <div class="container-bot">
                            <div class="container-top">
                                <div class="container">
                                    <div class="wrapper">
                                        
                                        <article class="grid_8">
                                            <div class="indent-left2">
                                                <h3 class="p1">Ingresar Venta</h3>
        
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
                out.println("<form action= \"guardar_venta2.jsp\" method=\"POST\" >"+
                        "<table class=\"price-list\">"+
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
                                    "<td>Producto</td>"+
                                    "<td><input type=\"text\" name=\"f_producto\" value=\"\" /></td>"+
                                "</tr>"+
                                "<tr>"+
                                    "<td>Cantidad</td>"+
                                    "<td><input type=\"text\" name=\"f_cantidad\" value=\"\" /></td>"+
                                "</tr>"+
                                "<tr>"+
                                     "<td>&nbsp;</td>"+
                                    "<td><input class= \"button\" type=\"submit\" value=\"Finalizar\" /></td>"+
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
  </article>
                                        <article class="grid_4">
                                            <div class="indent-left2 indent-top">
                                                <div class="box p4">
                                                    <div class="padding">
                                                        <div class="wrapper">
                                                            <figure class="img-indent"><img src="images/page1-img4.png" alt=""></figure>
                                                            <div class="extra-wrap">
                                                                <h3 class="p0">Horario</h3>
                                                            </div>
                                                        </div>
                                                        <p class="p1"><strong>Atencion al publico</strong></p>
                                                        <p class="color-1 p0">Lunes a Viernes: 10:00 a 20:00</p>
                                                        <p class="color-1 p1">Sabados: 10:00 a 17:00 </p>
                                                        Horario continuado
                                                    </div>
                                                    
                                                </div>
                                                
                                                <figure class="indent-bot">
                                                    <iframe width="260" height="202" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.cl/maps?f=q&amp;source=s_q&amp;hl=es&amp;geocode=&amp;q=Universidad+T%C3%A9cnica+Federico+Santa+Maria,+Santiago&amp;aq=0&amp;oq=universidad+te&amp;sll=-33.668298,-70.363372&amp;sspn=1.499528,2.469177&amp;ie=UTF8&amp;hq=Universidad+T%C3%A9cnica+Federico+Santa+Maria,&amp;hnear=Santiago,+Regi%C3%B3n+Metropolitana+de+Santiago+de+Chile&amp;ll=-33.433095,-70.609714&amp;spn=0.133373,0.077479&amp;t=m&amp;output=embed"></iframe><br /><small><a href="https://maps.google.cl/maps?f=q&amp;source=embed&amp;hl=es&amp;geocode=&amp;q=Universidad+T%C3%A9cnica+Federico+Santa+Maria,+Santiago&amp;aq=0&amp;oq=universidad+te&amp;sll=-33.668298,-70.363372&amp;sspn=1.499528,2.469177&amp;ie=UTF8&amp;hq=Universidad+T%C3%A9cnica+Federico+Santa+Maria,&amp;hnear=Santiago,+Regi%C3%B3n+Metropolitana+de+Santiago+de+Chile&amp;ll=-33.433095,-70.609714&amp;spn=0.133373,0.077479&amp;t=m" style="color:#0000FF;text-align:left">Ver mapa más grande</a></small>
                                                </figure>
                                                <div class="indent-left">
                                                    <dl class="main-address">
                                                        <dt>Demolink.org 8901 Marmora Road,<br> Glasgow, D04 89GR.</dt>
                                                        <dd><span>Telephone:</span>  +1 959 552 5963;</dd>
                                                        <dd><span>FAX:</span>  +1 959 552 5963</dd>
                                                        <dd><span>E-mail:</span><a href="#">mail@demolink.org</a></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </article> 
       </div>
       </div>
       </div>
                            </div>
                        </div>
                    </div>
        </section>
    </body>
</html>
