<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuenteDatos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BSV</title>
        <link rel="stylesheet" type="text/css" href="stilo.css">
        <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/3389/3389081.png" type="image/x-icon">

        <c:if test="${sessionScope.nivel eq 1}">
            <script>
                function insertar() {
                    alert("A continuación debe ingresar los datos del libro.");
                    var isbn = prompt("Ingrese el isbn:")
                    var titulo = prompt("Ingrese el nombre del libro: ");
                    var autor = prompt("Ingrese el autor");
                    var editorial = prompt("Ingrese la editorial: ");
                    location.href = "insert.jsp?isbn=" + isbn + "&titulo=" + titulo + "&autor=" + autor + "&editorial=" + editorial;
                }

            </script>
        </c:if>
        <c:if test="${sessionScope.nivel eq 2}">
            <script>

                function eliminar(id)
                {
                    confirm("A continuación se eliminará el registro #" + id);
                    location.href = "delete.jsp?id=" + id;
                }

                function editar(id)
                {
                    location.href = "frmupdate.jsp?id=" + id;
                }
            </script>
        </c:if>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>

        <c:if test="${sessionScope.nivel eq 1}">
                    <h1 style="text-align: center">Registrar Libro</h1>
                    <form  method="post" action="insert.jsp" class="agregar">
                        <input type="text" placeholder="isbn" name="isbn"><br>
                        <input type="text" placeholder="titulo" name="titulo"><br>
                        <input type="text" placeholder="autor" name="autor"><br>
                        Editorial
                        <select name="editorial" id="editorialA">   
                            <option value="Planeta">Espasa</option> 
                            <option value="Ediciones Akal">Booket</option>
                            <option value="Read & Co. Classics">Austral</option>
                            <option value="La galera SAU">La galera SAU</option>
                            <option value="Santillana">Santillana</option> 
                            <option value="Algani">Novela</option>   
                            <option value="Arcibel">Ediciones Martinez Roca</option> 
                            <option value="Avenauta">Avenauta</option> 
                            <option value=" Males Herbes">Males Herbes</option>
                            <option value="Debolsillo">Debolsillo</option>
                            <option value="Calambur">Alienta Editorial</option>] 
                            <option value="Renacimiento">Renacimiento</option>]
                        </select><br>
                        <input type="submit" value="Guardar" id="boton" >
                    </form>

                </c:if>
       

        <p style="color: red;">
            <c:if test="${not empty param.error}">
                <c:out value="${param.error}"/>
            </c:if>     
        </p>
        <p style="color: green;">
            <c:if test="${not empty param.success}">
                <c:out value="${param.success}"/>
            </c:if>     
        </p>

        <table border = "1" width = "100%">
            <tr class="base">
                <th>ID</th>
                <th>ISBN</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Editorial</th>
               <c:if test="${sessionScope.nivel eq 2}">
                <th>Acciones;</th>
               </c:if>

            </tr>

            <c:forEach var="row" items = "${result.rows}">
                <tr>
                    <th> <c:out  value="${row.id}" />  </th>
                    <th> <c:out  value="${row.isbn}" />  </th>
                    <th> <c:out  value="${row.titulo}" />  </th>
                    <th> <c:out  value="${row.autor}" />  </th>
                    <th> <c:out  value="${row.editorial}" />  </th>
                   <c:if test="${sessionScope.nivel eq 2}">
                    <th> <button onclick="editar('${row.id}');">Editar</button> 
                        <button onclick="eliminar('${row.id}');">Eliminar</button></th>
                    </c:if>
                </tr>

            </c:forEach>

        </table>    
    </body>
</html>
