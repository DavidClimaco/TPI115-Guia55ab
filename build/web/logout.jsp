<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CERRAR SESION</title>
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/3389/3389081.png" type="image/x-icon">
        
    </head>
    <body>
        <h1>Gracias por su trabajo, cerrando seción</h1>
        <c:set var="user" value="" scope="session" />
        <c:set var="nombre" value="" scope="session" />
        <c:set var="nivel" value="-1" scope="session" />
        <p style="color:red;">
                            <br>Dentro de unos segundos sera redirigido a la pagina de INICIO</p>
        <script>
                setTimeout(function () {
                    location.href = "index.jsp";
                }, 1000);
            </script>
    </body>
</html>
