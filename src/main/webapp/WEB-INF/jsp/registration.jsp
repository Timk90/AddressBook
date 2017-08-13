<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 07.08.2017
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    span.error{
        color: red;
    }

</style>
<head>
<title>${user.message}</title>
</head>
<body>
<form:form modelAttribute="user" action="/checkForm" commandName="user">
    <%--Validation should be placed after form sending--%>
    <%--<c:choose >--%>
        <%--<c:when test="${message} == ''"><h2>Just user Info</h2></c:when>--%>
        <%--<c:otherwise ><h2>${message}</h2></c:otherwise>--%>
    <%--</c:choose>--%>
   <h2>${user.message}</h2>
 <table>
     <tr>
         <td>Username:</td>
         <td><form:input path="name"></form:input></td>
         <td><span class="error"><form:errors path="name"></form:errors></span></td>
     </tr>
     <tr>
         <td>Password:</td>
         <td><form:input path="password"></form:input></td>
         <td><span class="error"><form:errors path="password"></form:errors></span></td>
     </tr>
     <tr>
         <td>Confiramtion password:</td>
         <td><form:input path="confirmationPassword"></form:input></td>
         <td><span class="error"><form:errors path="confirmationPassword"></form:errors></span></td>
     </tr>
     <tr>
         <td>E-mail:</td>
         <td><form:input path="email"></form:input></td>
         <td><span class="error"><form:errors path="email"></form:errors></span></td>
     </tr>
     <tr>
         <td>Address:</td>
         <td><form:input path="address"></form:input></td>
         <td><span class="error"><form:errors path="address"></form:errors></span></td>
     </tr>
     <tr>
         <td>Phone number:</td>
         <td><form:input path="phone"></form:input></td>
         <td><span class="error"><form:errors path="phone"></form:errors></span></td>
     </tr>
     <tr>
         <td><input type="submit" value="Save"/></td>
     </tr>
 </table>
        <form:hidden path="id"></form:hidden>
        <form:hidden path="enabled"></form:hidden>
        <form:hidden path="message"></form:hidden>
</form:form>
</body>
</html>
