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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

    <title>AddressBook</title>
  </head>
  <body>
  <div class="container">
  <h2 style="color: #27b533; text-align: center;">Добро пожаловать в приложение "Адресная книга"</h2>
  </br>
  <div id="message">${messageInfo}</div>
  <table class="table table-striped">
    <thead>
    <tr>
    <th >�?мя</th>
    <th>E-mail</th>
    <th>Адрес</th>
    <th>Телефон</th>
    <th colspan="2">Действия</th>
    </tr>
    </thead>
    <c:forEach items="${users}" var="person">
      <tr>
        <td><c:out value="${person.name}" /></td>
        <td><c:out value="${person.email}" /></td>
        <td><c:out value="${person.address}" /></td>
        <td><c:out value="${person.phone}" /></td>
        <td><form method="post" action="/updateUser"><input class="hiddens" size="0" type="hidden" name="id" value="${person.id}"><input class="btn btn-primary" type="submit" value="�?зменить"/></form></td>
        <td><form method="post" action="/deleteUser"><input class="hiddens" type="hidden" name="id" value="${person.id}"><input class="btn btn-primary" type="submit" value="Удалить"/></form></td>
      </tr>
    </c:forEach>
  </table>


  <button  class="btn btn-primary"  onclick="window.location='/addUser'">Добавить новую запись в книгу</button>
  <button class="btn btn-primary"  onclick="window.location='/AddressBookUser'" >Назад</button>
  <button  class="btn btn-primary"  onclick="window.location='j_spring_security_logout'">Выйти</button>

  </div>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

  </body>
</html>
