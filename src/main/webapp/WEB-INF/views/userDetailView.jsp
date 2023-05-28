<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 29/05/23
  Time: 3:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Người dùng chi tiết </title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/admin/userManager">Quay lại</a></p>

  <h3 class="section-title">Thông tin người dùng</h3>
          <h2 class="col-md-9">${requestScope.user.id}</h2>
          <h3 class="col-md-3">Tên đăng nhập</h3>
          <h2 class="col-md-9">${requestScope.user.username}</h2>
          <h3 class="col-md-3">Họ và tên</h3>
          <h2 class="col-md-9">${requestScope.user.fullName}</h2>
          <h3 class="col-md-3">Email</h3>
          <h2 class="col-md-9">${requestScope.user.email}</h2>
          <h3 class="col-md-3">Số điện thoại</h3>
          <h2 class="col-md-9">${requestScope.user.phoneNumber}</h2>
          <h3 class="col-md-3">Giới tính</h3>
          <h2 class="col-md-9">${requestScope.user.gender == 0 ? 'Nam' : 'Nữ'}</h2>
          <h3 class="col-md-3">Địa chỉ</h3>
          <h2 class="col-md-9">${requestScope.user.address}</h2>
</body>
</html>
