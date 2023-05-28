<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Transport Manager</title>
</head>
<body>
    <p><a href="${pageContext.request.contextPath}/admin">Quay lại</a></p>
    <h1>Quản lí phương tiện</h1>
    <a href="${pageContext.request.contextPath}/admin/transportManager/create">Tạo mới phương tiện</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Hãng </th>
            <th>Miêu tả</th>
            <th>Số ghế </th>
            <th>Hình ảnh</th>
            <th>Thời gian tạo</th>
            <th>Sửa </th>
            <th>Xóa </th>
            <th>Xem chi tiết nhà xe</th>
        </tr>
        <c:forEach var="transport" varStatus="loop" items="${requestScope.transportList}">
        <tr>
            <th scope="row">${loop.index + 1}</th>
            <td>${transport.nameOfTransport}</td>
            <td>${transport.brand}</td>
            <td>${transport.description}</td>
            <td>${transport.totalSeat}</td>
            <td>
                <c:choose>
                    <c:when test="${empty transport.imageName}">
                        <img width="38" src="${pageContext.request.contextPath}/img/50px.png"
                             alt="50px.png">
                    </c:when>
                    <c:otherwise>
                        <img width="38" src="${pageContext.request.contextPath}/image/${transport.imageName}"
                             alt="${transport.imageName}">
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${transport.createAt}</td>
            <td>
                <a class="btn btn-success me-2"
                   href="${pageContext.request.contextPath}/admin/transportManager/update?id=${transport.id}"
                   role="button">
                    Sửa
                </a>
            </td>
            <td>
                <a class="btn btn-danger"
                   href="${pageContext.request.contextPath}/admin/transportManager/delete?id=${transport.id}"
                   role="button"
                   onclick="return confirm('Bạn có muốn xóa?')">
                    Xóa
                </a>
            </td>
            <td>
                <a class="btn btn-primary me-2"
                   href="${pageContext.request.contextPath}/admin/transportManager/detail?id=${transport.id}"
                   role="button">
                Xem
                </a>
            </td>
        </tr>
        </c:forEach>

    </table>
</body>
</html>
