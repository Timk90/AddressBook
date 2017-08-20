<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 07.08.2017
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    #message{
        color: red;
        font-size: 14pt;
    }
    a{
        color: green;
    }
    #description{
        font-size: 12pt;
        color: #92dcb1;
    }
    #initInfo{
        font-size: 12pt;
        color: #f76565
    }
    b{
        color: red;
    }
</style>
<html>
<head>
    <title>Login</title>
</head>
<body>
<%--Информация о пользователе--%>
<%--${logged.authenticated}<br>--%>
<%--${logged.name}<br>--%>
<%--${logged.authorities}<br>--%>
<%--${logged.details}<br>--%>
<%--${logged.principal}<br>--%>
<%--${logged.toString()}<br>--%>
<form action="<c:url value='j_spring_security_check' />" method="post">
    <table align="center">
        <tr>
            <td colspan="2" id="message">
            ${logout}
            ${error}
            </td>
        </tr>
        <tr>
            <td>
                Логин:
            </td>
            <td>
                <input type="text" name="username" />
            </td>
        </tr>
        <tr>
            <td>
                Пароль:
            </td>
            <td>
                <input type="password" name="password" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <input type=submit value="Login">
                <a href="/welcome">Домашня страница</a>
            </td>
        </tr>
        <%--<tr ><td rowspan="2" align="center" id="message">${error}</td></tr>--%>
        <tr>
            <td colspan="2">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </td>
            <%--<td>--%>
                <%--<a href="/welcome">Home page</a>--%>
            <%--</td>--%>
        </tr>
    </table>


</form>
<table align="center">
    <tr>
        <%--<td style="font-style: italic; color: red;">${message}</td>--%>
    </tr>
</table>
<br>
<div id="description">
    Для проверки работоспособности приложения введите логин: Timur (пароль: 1234timk) - доступ с правами администратора или
    введите логин: Mateo (пароль: 1234mateo) - доступ с правами обычного пользователя.
    Разница между "обычным пользователеи" и "администратором" заключается в возможности редактирования записей таблицы:
    админ может редактировать все записи, а пользователь только свою.
    Все вновь зарегистрированные пользователи имеют права доступа пользователя. Возможно в дальнейшем будет
    добавлена возможность администратору давать пользоваталю права администратора.
</div>
<div id="initInfo">
    <b id="caution">ВНИМАНИЕ</b>: перед тестированием демо необходимо создать БД с именем "AddressBook", а также пользователя Admin c паролем: root1234.
    Инициализация таблиц происходит автоматически.
</div>
</body>
</html>