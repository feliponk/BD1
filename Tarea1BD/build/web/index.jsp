<%-- 
    Document   : index
    Created on : 17-oct-2013, 16:36:15
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
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login</title>
  <link rel="stylesheet" href="css/style2.css">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
  
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
    <header>
                <div class="main">
                    <div class="wrapper">
                        
                        <div class="fright">
                            <div class="indent">
                                <span class="phone">Bienvenido a Pepe's Works</span>
                                <span class="address">Inicie sesion, para acceder a las opciones de venta y compra</span>
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
            </header>
    
  <form method="post" action="validar.jsp" class="login">
    <p>
      <label for="login">Usuario:</label>
      <input type="text" name="f_usuario" id="login" value="12.345.678-k">
    </p>

    <p>
      <label for="password">Contraseña:</label>
      <input type="password" name="f_clave" id="password" value="">
    </p>

    <p class="login-submit">
      <button type="submit" class="login-button">Login</button>
    </p>

    
  </form>

  
</body>
</html>


