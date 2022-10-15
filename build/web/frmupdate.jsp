<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>

        <sql:setDataSource var = "fuenteDatos" driver = "org.mariadb.jdbc.Driver"
                           url = "jdbc:mariadb://localhost:3306/grupo03"
                           user = "root"  password = ""/>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE id = ?;
            <sql:param value="${param.id}"/>
        </sql:query>

        <h1>Editar Libro</h1>
        <form  method="post" action="update.jsp">

            <c:forEach var="row" items="${result.rows}">
                <input type="hidden" value="${param.id}" name="id"/>
                <input type="text" placeholder="isbn" name="isbn" value="${row.isbn}" ><br>
                <input type="text" placeholder="titulo" name="titulo" value="${row.titulo}" ><br>
                <input type="text" placeholder="autor" name="autor" value="${row.autor}" ><br>
                <input type="text" placeholder="editorial" name="editorial" value="${row.editorial}" ><br>
            </c:forEach>

            <input type="submit" value="Actualizar" >
            <a href="index.jsp" >Cancelar</a>

        </form>




    </body>
</html>
