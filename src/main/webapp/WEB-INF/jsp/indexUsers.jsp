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
<h2 id="welcome">Добро пожаловать а адресную книгу, ${AuthorizedUser}</h2>
<h3>У Вас есть следующие роли доступа:
<c:forEach items="${roles}" var="role">
    <c:out value="${role.authority.toString()}" />,
</c:forEach><br>
    ${admin}
</h3>
</br>
<div id="message">${messageInfo}</div>
<table id="tableContent" border="3">
    <tr id="head">
        <td >Имя</td>
        <td>E-mail</td>
        <td>Адрес</td>
        <td>Телефон</td>
    </tr>

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
    <input class="buttonInfo" type="submit" value="Редактировать информацию о себе"/>
    </form>
    </c:when>
    </c:choose>
</c:forEach>

<c:choose>
    <c:when test="${authority.equals('admin')}" >
       <button class="buttonInfo" id=administration onclick="window.location='/AddressBook'">Редактировать данные таблицы (Права администратора)</button>
    </c:when>
</c:choose>
<br>
<button class="buttonInfo" onclick="window.location='j_spring_security_logout'">Выйти</button></a>
</body>
</html>
