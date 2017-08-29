<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 11.08.2017
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

    <title>Address Book</title>
</head>

<style>
    #tableContent{
        color: blue;
        font-size: 14pt;
        alignment: left;
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
    #administration{
        background: green;
        color: #f7d94d;
        font-size: 14pt;
        font-weight: bold;
    }
    .buttonInfo{
        background: green;
        color: yellow;
        font-size: 14pt;
        font-weight: bold;
    }


</style>
<body>
<div class="container">

<h2 style="color: #27b533; text-align: center">Добро пожаловать а адресную книгу, ${AuthorizedUser}</h2>
<h3 style="text-align: center;">У Вас есть следующие роли доступа:
<c:forEach items="${roles}" var="role">
    <c:out value="${role.authority.toString()}" />,
</c:forEach><br>
    ${admin}
</h3>
</br>
<div id="message">${messageInfo}</div>
<table class="table table-striped" >

    <thead>
    <tr >
        <th >�?мя</th>
        <th>E-mail</th>
        <th>Адрес</th>
        <th>Телефон</th>
    </tr>
    </thead>
    <c:forEach items="${users}" var="person">
        <tr>
            <td><c:out value="${person.name}" /></td>
            <td><c:out value="${person.email}" /></td>
            <td><c:out value="${person.address}" /></td>
            <td><c:out value="${person.phone}" /></td>

            <%--<td>--%>
                <%--<c:choose>--%>
                    <%--<c:when test="${person.id == AuthorizedUserID}">--%>
                    <%--<form method="post" action="/updateUser"><input type="hidden" name="id" value="${person.id}">--%>
                    <%--<input type="submit" value="EDIT"/>--%>
                    <%--</form>--%>
                    <%--</c:when>--%>
                <%--</c:choose>--%>
            <%--</td>--%>
        </tr>
    </c:forEach>
</table>
<c:forEach items="${users}" var="person">
    <c:choose>
    <c:when test="${person.id == AuthorizedUserID}">
    <form  method="post" action="/updateUser"><input type="hidden" name="id" value="${person.id}">
        <input class="btn btn-secondary" type="submit" value="Редактировать информацию о себе"/>
    </form>
    </c:when>
    </c:choose>
</c:forEach>
    <c:choose>
    <c:when test="${authority.equals('admin')}" >
        <button class="btn btn-secondary" onclick="window.location='/AddressBook'">Редактировать данные таблицы (Права администратора)</button>
    </c:when>
    </c:choose>
<button class="btn btn-primary" onclick="window.location='j_spring_security_logout'">Выйти</button></a>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
