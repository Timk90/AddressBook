<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 07.08.2017
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

</style>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
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
                Username:
            </td>
            <td>
                <input type="text" name="username" />
            </td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                <input type="password" name="password" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td align="left">
                <input type=submit value="Login">
                <a href="/welcome">Home page</a>
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
</body>
</html>