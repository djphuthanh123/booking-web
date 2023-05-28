<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 8:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title> Quản lí Chung </title>
</head>
<body>
<h1 >Quản lý Chung</h1>
        <br>
        <jsp:include page="_headerAdmin.jsp"/>
        <br>
        <span>Người dùng</span>
        <h4 class="title">${requestScope.totalUsers}</h4>
        <br>
        <span>Tổng số phương tiện</span>
        <h4 class="title">${requestScope.totalTransport}</h4>
</body>
</html>
