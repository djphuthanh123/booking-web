<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 01/06/23
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<html>
<head>
    <title>Quản lí tuyến đường</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/admin/routeManager/create">
    Tạo quảng đường
    </a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên chuyến </th>
            <th>Sửa </th>
            <th>Xóa </th>
            <th>Xem chi tiết quãng đường</th>
        </tr>
        <c:forEach var="route" varStatus="loop" items="${requestScope.routeFromServer}">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${route.name}</td>
                <td>${route.distance}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/routeManager/update?id=${route.id}"
                       role="button">
                        Sửa
                    </a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/routeManager/delete?id=${route.id}"
                       role="button"
                       onclick="return confirm('Bạn có muốn xóa?')">
                        Xóa
                    </a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/routeManager/detail?id=${route.id}"
                       role="button">
                        Xem
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
