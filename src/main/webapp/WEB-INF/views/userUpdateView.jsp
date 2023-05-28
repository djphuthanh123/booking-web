<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 29/05/23
  Time: 3:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa </title>
</head>
<body>
            <h3 class="section-title">Sửa người dùng ${requestScope.user.id}</h3>
            <br>
            <form class="col-lg-6" method="POST" action="${pageContext.request.contextPath}/admin/userManager/update">
                    <label >Tên đăng nhập
                    <input type="text"
                           name="username"
                           value="${requestScope.user.username}"
                           required>
                    </label>
                <br>
                    <label >Mật khẩu
                    <input type="password"
                           name="password"
                           value="${requestScope.user.password}"
                           placeholder="Nhập mật khẩu mới hoặc để trống">
                    </label>
                <br>
                    <label >Họ và tên
                    <input type="text"
                           name="fullname"
                           value="${requestScope.user.fullName}"
                           required>
                    </label>
                <br>
                    <label >Email
                    <input type="email"
                           name="email"
                           value="${requestScope.user.email}"
                           required>
                    </label>
                <br>
                    <label >Số điện thoại
                    <input type="text"
                          name="phoneNumber"
                          value="${requestScope.user.phoneNumber}"
                          required>
                    </label>
                <br>
                    <label >Giới tính :
                        <label>Nam
                    <input
                            type="radio"
                            name="gender"
                            value="0"
                            ${requestScope.user.gender == '0' ? 'checked' : ''}
                            required>
                        </label>
                        <label>Nữ
                            <input type="radio"
                                   name="gender"
                                   value="1"
                                   ${requestScope.user.gender == '1' ? 'checked' : ''}
                                   required>
                        </label>
                </label>
                <br>
                    <label >Địa chỉ
                    <input type="text"
                           name="address"
                           value="${requestScope.user.address}"
                           required>
                    </label>
                <br>
                    <label>Quyền
                        <select name="role"
                                required>
                            <option ${empty requestScope.user.role ? 'selected' : ''} disabled>
                                Chọn một quyền...
                            </option>
                            <option value="ADMIN" ${requestScope.user.role == 'ADMIN' ? 'selected' : ''}>
                                Quản trị viên
                            </option>
                            <option value="EMPLOYEE" ${requestScope.user.role == 'EMPLOYEE' ? 'selected' : ''}>
                                Nhân viên
                            </option>
                            <option value="CUSTOMER" ${requestScope.user.role == 'CUSTOMER' ? 'selected' : ''}>
                                Khách hàng
                            </option>
                        </select>
                    </label>
                <input type="hidden" name="id" value="${requestScope.user.id}">
                <br>
                <button type="submit" >
                    Sửa
                </button>
                <br>
<%--                <button type="reset"--%>
<%--                        onclick="return confirm('Bạn có muốn để giá trị mặc định?')">--%>
<%--                    Mặc định--%>
<%--                </button>--%>
                <a href="${pageContext.request.contextPath}/admin/userManager"
                   role="button"
                   onclick="return confirm('Bạn có muốn hủy?')">
                    Hủy
                </a>
            </form>

</body>
</html>
