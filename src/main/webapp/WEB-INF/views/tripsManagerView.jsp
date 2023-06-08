<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/2/2023
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/admin">Quay lại</a></p>
<h1>Quản lí phương tiện</h1>
<a href="${pageContext.request.contextPath}/admin/tripsManage/create">Tạo Chuyến mới</a>
<table border="1">

    <tr>
        <th>tên nhà xe</th>
        <th>tên Chuyến</th>
        <th>Giờ xuất phát </th>
        <th>Giờ kết thúc</th>
        <th>Giá </th>
        <th>Tối đa chỗ</th>
        <th>Ngày đi</th>
        <th> Ngày Đến</th>
    </tr>
    <c:forEach var="trip" varStatus="loop" items="${requestScope.tripsList}">
        <tr>
            <td>${trip.transportName}</td>
            <td>${trip.tripName}</td>
            <td>${trip.departureTime}</td>
            <td>${trip.departureEndInFuture}</td>
            <td>${trip.price}</td>
            <td>${trip.slotAvailable}</td>
            <td>${trip.departureDate}</td>
            <td>${trip.departureEndDate}</td>
            <td>
                <a class="btn btn-success me-2"
                   href="${pageContext.request.contextPath}/admin/transportManager/update?id=${trip.id}"
                   role="button">
                    Sửa
                </a>
            </td>
            <td>
                <a class="btn btn-danger"
                   href="${pageContext.request.contextPath}/admin/tripsManage/deleteTrip?id=${trip.id}"
                   role="button"
                   onclick="return confirm('Bạn có muốn xóa?')">
                    Xóa
                </a>
            </td>
            <td>
                <a class="btn btn-primary me-2"
                   href="${pageContext.request.contextPath}/admin/transportManager/detail?id=${trip.id}"
                   role="button">
                    Xem
                </a>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
