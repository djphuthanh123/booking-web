<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 26/05/23
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Đăng nhập</title>
</head>
<body>
<span style="color: red">Đây là đăng nhập cho quản trí viên ! Vui lòng không phận sử miển vào</span>
<p><a href="${pageContext.request.contextPath}/index.jsp">Quay lại</a></p>
<h1>Đăng nhập</h1>
<form action="${pageContext.request.contextPath}/admin/signin" method="post">
  <label>
    <input name="username"
           placeholder="Tên đăng nhập"
           type="text"
           autocomplete="off"
           value="${requestScope.values.username}">
  </label>
  <br>
  <c:if test="${not empty requestScope.violations.usernameViolations}">
    <c:forEach var="violation" items="${requestScope.violations.usernameViolations}">
      <span>${violation}</span>
    </c:forEach>
  </c:if>

  <br>
  <input name="password"
         placeholder="Mật khẩu "
         type="text"
         autocomplete="off"
         value="${requestScope.values.password}">
  <c:if test="${not empty requestScope.violations.passwordViolations}">
    <c:forEach var="violation" items="${requestScope.violations.passwordViolations}">
      <span>${violation}</span>
    </c:forEach>
  </c:if>
  <br>
  <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
</form>
<p >Không có tài khoản? <a href="${pageContext.request.contextPath}/signup">Đăng ký</a></p>

</body>
</html>
