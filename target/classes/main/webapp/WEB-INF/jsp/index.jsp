<%@ page import="main.java.ru.addressbook.bean.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 09.08.2017
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
  #tableContent{
    color: blue;
    font-size: 14pt;
    align-content: center;
    border-color: #27b533;
    vertical-align: middle;

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
  #logout{
    background: green;
    color: yellow;
    font-size: 14pt;
  }
  #addButon{
    background: green;
    color: yellow;
    font-size: 14pt;
  }
  .buttons{
    font-size: 14pt;
    color: green;
    font-weight: bold;
    background: yellow;
  }
  .hiddens{
    width: 0;
    margin: 0;
    height: 0;
  }

</style>

<html>
  <head>
    <title>AddressBook</title>
  </head>
  <body>
  <h2 id="welcome">Добро пожаловать в приложение "Адресная книга"</h2>
  </br>
  <div id="message">${messageInfo}</div>
  <table id="tableContent" border="3">
    <tr id="head">
    <td >Имя</td>
    <td>E-mail</td>
    <td>Адрес</td>
    <td>Телефон</td>
    <td colspan="2">Действия</td>
    </tr>

    <c:forEach items="${users}" var="person">
      <tr>
        <td><c:out value="${person.name}" /></td>
        <td><c:out value="${person.email}" /></td>
        <td><c:out value="${person.address}" /></td>
        <td><c:out value="${person.phone}" /></td>
        <td><form method="post" action="/updateUser"><input class="hiddens" size="0" type="hidden" name="id" value="${person.id}"><input class="buttons" type="submit" value="Изменить"/></form></td>
        <td><form method="post" action="/deleteUser"><input class="hiddens" type="hidden" name="id" value="${person.id}"><input class="buttons" type="submit" value="Удалить"/></form></td>
      </tr>
    </c:forEach>
  </table>


  <button id="addButon"onclick="window.location='/addUser'">Добавить новую запись в книгу</button></a>
  <button id="logout" onclick="window.location='j_spring_security_logout'">Выйти</button></a>
  </body>
</html>
