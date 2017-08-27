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
    <title>MySpringApp</title>
</head>
<body>
<div align="center">
<h2>Добро пожаловать в адресную книгу!</h2>
<h2>Для того, чтобы ознакомится с содержимым Вам необходимо авторизоваться в системе</h2>
    <h3>${messageInfo}</h3>
<a class="links" href="/login">  Войти  </a>
<a class="links" href="/registration">  Зарегистрироваться  </a>
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

</body>
</html>
