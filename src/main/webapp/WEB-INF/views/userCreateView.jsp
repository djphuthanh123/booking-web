<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 29/05/23
  Time: 2:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tạo tài khoản</title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/admin/userManager">Quay lại</a></p>

<form action="${pageContext.request.contextPath}/admin/userManager/create" method="POST">
  <label>Tên đăng nhập
    <input type="text" name="username">
  </label>
  <br>
  <label>Mật khẩu
    <input type="text" name="password">
  </label>
  <br>
  <label>Họ và tên
    <input type="text" name="fullName">
  </label>
  <br>
  <label>Email
    <input type="text" name="email">
  </label>
  <br>
  <label>Số điện thoại
    <input type="text" name="phoneNumber">
  </label>
  <br>
  <div>
    <label>Nam
      <input type="radio" name="gender" value="0">
    </label>
    <label>Nữ
      <input type="radio" name="gender" value="1">
    </label>
  </div>
  <br>
  <label>Địa chỉ
    <input type="text" name="address">
  </label>
  <br>
  <label for=""></label><select name="role" id="">
    <option disabled>Chọn một quyền</option>
    <option value="ADMIN">Quản lí </option>
    <option value="EMPLOYEE">Nhân viên</option>
    <option value="CUSTOMER">Khách hàng</option>
  </select>
  <br>
  <button type="submit" >
    Tạo
  </button>
  <br>
  <button type="reset"
          onclick="return confirm('Bạn có muốn để giá trị mặc định?')">
    Mặc định
  </button>
  <br>
  <a href="${pageContext.request.contextPath}/admin/userManager"
     onclick="return confirm('Bạn có muốn hủy?')">
    Hủy
  </a>
</form>

</body>
</html>
