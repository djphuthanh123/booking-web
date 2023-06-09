<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<html>
<head>
    <title>Title</title>

</head>
<body>
<a href="${pageContext.request.contextPath}/admin/tripsManager">Quay lại</a>
<form action="${pageContext.request.contextPath}/admin/tripsManager/create"
      method="POST"
      enctype="multipart/form-data">

    <%--    chon ten nha xe --%>
    <select id="nameTransport" name="nameTransport">
        <option value="">Lựa chọn nhà xe</option>
        <c:forEach var="transport" varStatus="loop" items="${requestScope.transportFromServer}">
            <option value="${transport.id}">
                    ${transport.nameOfTransport}
            </option>
        </c:forEach>
    </select>
    <%--    chon ten chuyen xe  --%>
    <select id="routeName" name="routeName">
        <option value="">Lựa chọn quảng đường</option>
        <c:forEach var="route" varStatus="loop" items="${requestScope.routeFromServer}">
            <option value="${route.id}">
                    ${route.name}
            </option>
        </c:forEach>
    </select>

    <input type="text" name="departureTime" placeholder="Nhập giờ khởi hành">
    <input type="text" name="departureEndTime" placeholder="Nhập giờ dự kiến đến">
    <input type="text" name="price" placeholder="Nhập giá tiền ">



    <label for="dateStart">Chọn ngày bắt đầu </label>
    <input type="date" id="dateStart" name="dateStart"  min="${currentDate}">
    <label for="dateEnd">Chọn ngày kết thúc </label>
    <input type="date" id="dateEnd" name="dateEnd" min="${currentDate}">

    <button>submit</button>
</form>

</body>
</html>
