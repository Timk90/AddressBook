<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 07.08.2017
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<style>
    span.error{
        color: red;
    }

</style>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<title>${user.message}</title>
</head>
<body>
<div class="container">
<form:form modelAttribute="user" action="/checkForm" commandName="user" cssClass="">
    <%--Validation should be placed after form sending--%>
    <%--<c:choose >--%>
        <%--<c:when test="${message} == ''"><h2>Just user Info</h2></c:when>--%>
        <%--<c:otherwise ><h2>${message}</h2></c:otherwise>--%>
    <%--</c:choose>--%>
   <h2>${user.message}</h2>

     <div class="form-group row">
         <label for="inputLogin" class="col-sm-2 col-form-label">Логин</label>
         <div class="col-sm-10" >
                 <form:input path="name" id="inputLogin" cssClass="form-control"></form:input >
         </div>
         <div class="col-sm-10">
             <span class="error"><form:errors path="name" cssStyle="color: red; text-align: right;"></form:errors></span>
         </div >
     </div>

    <div class="form-group row">
        <label for="inputPassword" class="col-sm-2 col-form-label">Пароль</label>
        <div class="col-sm-10" >
                <form:input path="password" id="inputPassword" cssClass="form-control"></form:input>
        </div>
        <div class="col-sm-10">
             <span class="error"><form:errors path="password" cssStyle="color: red; text-align: right;"></form:errors></span>
        </div>
    </div>

    <div class="form-group row">
        <label for="inputPasswordConf" class="col-sm-2 col-form-label">Подтверждение пароля</label>
        <div class="col-sm-10" >
                <form:input path="confirmationPassword" id="inputPasswordConf" cssClass="form-control"></form:input>
        </div>
         <div class="col-sm-10">
             <span class="error"><form:errors path="confirmationPassword" cssStyle="color: red; text-align: right;"></form:errors></span>
         </div>
    </div>

    <div class="form-group row">
        <label for="inputEmail" class="col-sm-2 col-form-label">E-mail:</label>
        <div class="col-sm-10" >
                <form:input path="email" id="inputEmail" cssClass="form-control "></form:input>
        </div>
        <div class="col-sm-10">
            <span class="error"><form:errors path="email" cssStyle="color: red; text-align: right;" ></form:errors></span>
        </div>
    </div>

    <div class="form-group row">
        <label for="inputAddress" class="col-sm-2 col-form-label">Адрес</label>
        <div class="col-sm-10" >
                <form:textarea path="address" id="inputAddress" cssClass="form-control"></form:textarea>
        </div>
        <div class="col-sm-10">
         <span class="error"><form:errors path="address" cssStyle="color: red; text-align: right;" ></form:errors></span>
        </div>
    </div>

    <div class="form-group row">
        <label for="inputPhone" class="col-sm-2 col-form-label">Телефон</label>
        <div class="col-sm-10" >
                <form:input path="phone" id="inputPhone" cssClass="form-control"></form:input>
        </div>
        <div class="col-sm-10">
            <span class="error"><form:errors path="phone" cssStyle="color: red; text-align: right;"></form:errors></span>
        </div>
    </div>
    <div>
        <input class="btn btn-lg btn-primary btn-block"  type="submit" value="Сохранить"/>
    </div>

        <form:hidden path="id"></form:hidden>
        <form:hidden path="enabled"></form:hidden>
        <form:hidden path="message"></form:hidden>
</form:form>
    <button class="btn btn-lg btn-primary btn-block"  onclick="window.location='/AddressBookUser'" >Назад</button>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>
