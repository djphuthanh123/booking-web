<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/admin/transportManager">Quay lại</a></p>

      <h1 >${requestScope.transport.id}</h1>
      <h1 >Tên Phương tiện</h1>
      <p>${requestScope.transport.nameOfTransport}</p>
      <h1 >Mô tả Phương tiện</h1>
      <p >${requestScope.transport.description}</p>
      <h1 >Hình Phương tiện</h1>
        <c:choose>
          <c:when test="${empty requestScope.transport.imageName}">
            <img width="50" src="${pageContext.request.contextPath}/img/50px.png"
                 alt="50px.png">
          </c:when>
          <c:otherwise>
            <img width="50" src="${pageContext.request.contextPath}/image/${requestScope.transport.imageName}"
                 alt="${requestScope.transport.imageName}">
          </c:otherwise>
        </c:choose>
</body>
</html>
