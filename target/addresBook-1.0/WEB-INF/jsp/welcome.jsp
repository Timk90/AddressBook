<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 07.08.2017
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<style>
    h2{
      color: darkviolet;
    }
    .links{
        font-size: 14pt;
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
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

    <title>MySpringApp</title>
</head>
<body>
<div align="center">
<h2>Добро пожаловать в адресную книгу!</h2>
<h2>Для того, чтобы ознакомится с содержимым Вам необходимо авторизоваться в системе</h2>
    <h3>${messageInfo}</h3>
<a class="btn btn-lg btn-primary btn-block" href="/login">  Войти  </a>
<a class="btn btn-lg btn-primary btn-block" href="/registration">  Зарегистрироваться  </a>
</div>
<div id="description">
    <br>
    Для проверки работоспособности приложения введите логин: Timur (пароль: 1234timk) - доступ с правами администратора или
    введите логин: Mateo (пароль: 1234mateo) - доступ с правами обычного пользователя.
    Разница между "обычным пользователеи" и "администратором" заключается в возможности редактирования записей таблицы:
    админ может редактировать все записи, а пользователь только свою.
    Все вновь зарегистрированные пользователи имеют права доступа пользователя. Возможно в дальнейшем будет
    добавлена возможность администратору давать пользоваталю права администратора.

</div>
<div id="initInfo">
    <b>ВНИМАНИЕ</b>: перед тестированием демо необходимо создать БД с именем "AddressBook", а также пользователя Admin c паролем: root1234.
    Инициализация таблиц происходит автоматически.
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
