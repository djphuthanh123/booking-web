<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 29/05/23
  Time: 6:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="servletPath" scope="page" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<c:choose>
    <c:when test="${not empty sessionScope.currentUser}">
        <span>Xin chào <strong>${sessionScope.currentUser.fullName}</strong>!</span>
        <a class="btn btn-light ms-2" href="${pageContext.request.contextPath}/admin/signout" role="button">
            Đăng xuất
        </a>
    </c:when>
    <c:otherwise>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/signin" role="button">
            Đăng nhập
        </a>
    </c:otherwise>
</c:choose>
    <ol>
        <li>
        <a href="${pageContext.request.contextPath}/admin/transportManager">Quản lí xe</a>
        </li>
        <li>
        <a href="${pageContext.request.contextPath}/admin/userManager">Quản lí người dùng</a>
        </li>
    </ol>

