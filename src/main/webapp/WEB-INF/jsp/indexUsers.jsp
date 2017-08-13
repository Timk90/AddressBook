<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 11.08.2017
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Address Book</title>
</head>

<style>
    #tableContent{
        color: blue;
        font-size: 14pt;
        alignment: left;
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
    }

</style>

<body>
<h2 id="welcome">Welcome to addressBook, ${AuthorizedUser}</h2>
<h3>roles which you have are
<c:forEach items="${roles}" var="role">
    <c:out value="${role.authority.toString()}" />,
</c:forEach>
</h3>
</br>
<div id="message">${messageInfo}</div>
<table id="tableContent" border="3">
    <tr id="head">
        <td >Username</td>
        <td>E-mail</td>
        <td>Address</td>
        <td>Phone</td>
        <td colspan="1">Actions</td>
    </tr>

    <c:forEach items="${users}" var="person">
        <tr>
            <td><c:out value="${person.name}" /></td>
            <td><c:out value="${person.email}" /></td>
            <td><c:out value="${person.address}" /></td>
            <td><c:out value="${person.phone}" /></td>

            <td>
                <c:choose>
                    <c:when test="${person.id == AuthorizedUserID}">
                    <form method="post" action="/updateUser"><input type="hidden" name="id" value="${person.id}">
                    <input type="submit" value="EDIT"/>
                    </form>
                    </c:when>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</table>

<button onclick="window.location='/AddressBook'">Update table (Administrator only)</button></a>
<button id="logout" onclick="window.location='j_spring_security_logout'">Logout</button></a>
</body>
</html>
