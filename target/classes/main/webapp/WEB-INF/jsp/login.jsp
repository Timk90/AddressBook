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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

    <title>Login</title>
</head>
<body>
<div class="container" style="alignment: center; text-align: center">
<%--�?нформация о пользователе--%>
<%--${logged.authenticated}<br>--%>
<%--${logged.name}<br>--%>
<%--${logged.authorities}<br>--%>
<%--${logged.details}<br>--%>
<%--${logged.principal}<br>--%>
<%--${logged.toString()}<br>--%>
<form action="<c:url value='j_spring_security_check' />" class="form-signin" method="post">
    <div style="alignment: center"><h2>Пожалуйста, авторизуйтесь в системе</h2></div>
    <table align="center">

        <tr>
            <td>
                Логин:
            </td>
            <td>
                <input class="form-control" type="text" name="username" placeholder="Введите логин"/>
            </td>
        </tr>
        <tr>
            <td>
                Пароль:
            </td>
            <td>
                <input  class="form-control"  type="password" name="password" placeholder="Введите пароль" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
                <%--<input type=submit value="Login">--%>
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

    <div style="color: #f76565; alignment: center; font-size: 13pt; font-weight: bold; text-align: center;">
        ${logout}
        ${error}
    </div>

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
    <b id="caution">ВН�?МАН�?Е</b>: перед тестированием демо необходимо создать БД с именем "AddressBook", а также пользователя Admin c паролем: root1234.
    �?нициализация таблиц происходит автоматически.
</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>