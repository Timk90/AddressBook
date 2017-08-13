<%@ page import="main.java.ru.addressbook.service.AddressBookServiceImp" %>
<%@ page import="main.java.ru.addressbook.mapper.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 09.08.2017
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
  #tableContent{
    color: blue;
    font-size: 14pt;
    alignment: left;
  }
  #message{
    color: #ff75e5;
    background: #9cf3ff;
    font-size: 14pt;
  }
  #head{
    color: blue;
    font-size: 16pt;
    align-content: center;
    font-weight: bold;
  }
  #welcome{
    color: red;
    font-size: 16pt;
    font-weight: bold;
  }

</style>

<html>
  <head>
    <title>AddressBook</title>
  </head>
  <body>
  <h2 id="welcome">Welcome to addressBook</h2>
  </br>
  <div id="message">${messageInfo}</div>
  <table id="tableContent" border="3">
    <tr id="head">
    <td >Username</td>
    <td>E-mail</td>
    <td>Address</td>
    <td>Phone</td>
    <td colspan="2">Actions</td>
    </tr>

    <c:forEach items="${users}" var="person">
      <tr>
        <td><c:out value="${person.name}" /></td>
        <td><c:out value="${person.email}" /></td>
        <td><c:out value="${person.address}" /></td>
        <td><c:out value="${person.phone}" /></td>
        <td><form method="post" action="/updateUser"><input type="hidden" name="id" value="${person.id}"><input type="submit" value="EDIT"/></form></td>
        <td><form method="post" action="/deleteUser"><input type="hidden" name="id" value="${person.id}"><input type="submit" value="DELETE"/></form></td>
      </tr>
    </c:forEach>
  </table>

  <button onclick="window.location='j_spring_security_logout'">Logout</button></a>
  <button onclick="window.location='/addUser'">Add note</button></a>
  </body>
</html>
