<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 07.08.2017
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    h2{
      color: darkviolet;
    }
    .links{
        font-size: 12pt;
    }

</style>
<head>
    <title>MySpringApp</title>
</head>
<body>
<div align="center">
<h2>Welcome to the AddresBook</h2>
<h2>In orger to view address book recordes you have to sign in</h2>
    <h3>${messageInfo}</h3>
<a class="links" href="/login">Sign-in</a>
<a class="links" href="/registration">Register</a>
</div>

</body>
</html>
