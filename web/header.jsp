<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border="5" width="100%" style="text-align: center;">
    <tr>
        <td>
            <span style="font-weight: bolder; color: red; font-size: 20px; margin: 20px">BSV</span>
        </td>
        <td>
            Biblioteca Nacional de El Salvador<br>
            <b style="color:green;">${sessionScope.nombre}</b>
        </td>
        <td>
            <image src="./img/bandera-de-el-salvador.jpg" style="height: 30px;width: 50px;" alt="bandera de El Salvador"/>
        </td>
        <td>
    
          <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">
              <span style="color:blue;font-size:5mm;">
                  Usuario: ${sessionScope.user}</span><br>
                  <a href="logout.jsp">Logout</a>
              </c:if>
          </c:if>
        
   
    <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
          <span style="color:brown;font-size:5mm;">
              <a href="frmlogin.jsp">LOGEATE</a>
        </span>
    </c:if>
</td>
</tr>    
</table>
