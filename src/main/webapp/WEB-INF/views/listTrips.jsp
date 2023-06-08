<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2023
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<c:set var="listTrips" value="${requestScope.listTrips}" />
<p><a href="${pageContext.request.contextPath}/admin">Quay lại</a></p>
<h1>ListTrip</h1>
<c:if test="${fn:length(listTrips) >= 1}">
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

    <c:forEach var="listTrips"  items="${listTrips}">
      <tr>
        <td>${listTrips.transportName}</td>
        <td>${listTrips.tripName}</td>
        <td>${listTrips.departureTime}</td>
        <td>${listTrips.departureEndInFuture}</td>
        <td>${listTrips.price}</td>
        <td>${listTrips.slotAvailable}</td>
        <td>${listTrips.departureDate}</td>
        <td>${listTrips.departureEndDate}</td>
        <td>
          <a class="btn btn-success me-2"
             href="${pageContext.request.contextPath}/client/home/chooseSeat?id=${listTrips.id}"
             role="button">
            Chọn chuyến
          </a>
        </td>
      </tr>
    </c:forEach>
  </table>
</c:if>

<c:if test="${fn:length(listTrips) == 0}">
  <p>Không có chuyến nào, Sorry!!</p>
</c:if>

</body>
</html>
