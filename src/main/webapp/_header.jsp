<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
    <c:when test="${not empty sessionScope.currentUser}">
        <span>Xin chào <strong>${sessionScope.currentUser.fullName}</strong>!</span>
        <a  href="${pageContext.request.contextPath}/admin/signout" role="button">
            Đăng xuất
        </a>
    </c:when>
    <c:otherwise>
        <a  href="${pageContext.request.contextPath}/signup" role="button">
            Đăng ký
        </a>
        <a  href="${pageContext.request.contextPath}/admin/signin" role="button">
            Đăng nhập
        </a>
    </c:otherwise>
</c:choose>
