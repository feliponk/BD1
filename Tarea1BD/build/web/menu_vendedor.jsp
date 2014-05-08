<%-- 
    Document   : menu_vendedor
    Created on : 18-abr-2014, 21:11:56
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/grid.css" type="text/css" media="screen">   
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script>
    <script src="js/Vegur_500.font.js" type="text/javascript"></script> 
    <script src="js/FF-cash.js" type="text/javascript"></script>      
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.equalheights.js" type="text/javascript"></script>
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
<body id="page1">
	<div class="main-bg">
        <div class="bg">
            <!--==============================header=================================-->
            <header>
                <div class="main">
                    <div class="wrapper">
                        <h1><a href="menu_vendedor.jsp">logo</a></h1>
                        <div class="fright">
                            <div class="indent">
                                <span class="address"><% out.println("Vendedor "+(String)session.getAttribute("name")); %></span>
                                <span class="phone">Bienvenido </span>
                                <a class ="address" href="index.jsp">[Cerrar sesion]</a>
                            </div>
                        </div>
                    </div>
                    <nav>
                        <ul class="menu">
                            <li><a class="active" href="menu_vendedor.jsp">Home</a></li>
                            <li><a href="ingresar_cliente.jsp">Ingresar Cliente</a></li>
                            <li><a href="ingresar_venta.jsp">Ingresar Venta</a></li>
                            <li><a href="mis_ventas.jsp">Mis Ventas</a></li>
                        
                        </ul>
                    </nav>
                    <div class="slider-wrapper">
                        <div class="slider">
                            <ul class="items">
                                <li>
                                    <img src="images/tornillos.jpg" alt="" />
                                </li>
                                <li>
                                    <img src="images/im2.jpg" alt="" />
                                </li>
                                <li>
                                    <img src="images/ladrillos.jpg" alt="" />
                                </li>
                            </ul>
                        </div>
                        <a class="prev" href="#">prev</a>
                        <a class="next" href="#">next</a>
                    </div>
                </div>
            </header>
            
            <!--==============================content================================-->
            
            
            <!--==============================footer=================================-->
            <footer>
                <div class="main">
                    <span>Pepe’s Works &copy; 2014</span>
                    Website Template by <a href="http://www.templatemonster.com/" target="_blank" rel="nofollow">www.templatemonster.com</a>
                </div>
            </footer>
        </div>
    </div>
	<script type="text/javascript"> Cufon.now(); </script>
    <script type="text/javascript">
		$(window).load(function() {
			$('.slider')._TMS({
				duration:1000,
				easing:'easeOutQuint',
				preset:'simpleFade',
				slideshow:7000,
				banners:false,
				pauseOnHover:true,
				pagination:false,
				pagNums:false,
				nextBu:'.next',
				prevBu:'.prev'
			});
		});
    </script>
</body>
</html>