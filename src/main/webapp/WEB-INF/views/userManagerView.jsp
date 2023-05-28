<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 29/05/23
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lí Tài khoản</title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/admin">Quay lại</a></p>
<h1>Quản lí Tải khoản</h1>
    <a href="${pageContext.request.contextPath}/admin/userManager/create">Tạo tài khoản</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tài khoản</th>
            <th>Mật Khẩu</th>
            <th>Họ và tên</th>
            <th>Email</th>
            <th>Quyền</th>
            <th>Sửa</th>
            <th>Xóa</th>
            <th>Xem</th>
        </tr>
        <c:forEach var="user" varStatus="loop" items="${requestScope.users}">
        <tr>
             <th scope="row">${loop.index + 1}</th>
            <td>
                ${user.username}
            </td>
            <td>
                ${user.password}
            </td>
            <td>
                ${user.fullName}
            </td>
            <td>
                ${user.email}
            </td>
            <td>
                ${user.role}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/userManager/update?id=${user.id}"
                   role="button">
                    Sửa
                </a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/userManager/delete?id=${user.id}"
                   role="button"
                   onclick="return confirm('Bạn có muốn xóa?')">
                    Xóa
                </a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/userManager/detail?id=${user.id}"
                   role="button">
                    Xem
                </a>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
