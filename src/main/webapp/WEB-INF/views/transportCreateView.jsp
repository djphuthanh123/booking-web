<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/transportManager">Quay lại</a>
<form action="${pageContext.request.contextPath}/admin/transportManager/create"
      method="POST"
      enctype="multipart/form-data">
    <label>
        <input type="text"
               autocomplete="off"
               name="nameOfTransport"
               placeholder="Tên của phương tiện">
    </label>
    <br>
    <label>
        <input type="text" name="licensePlate" placeholder="Nhập biển số xe">
    </label>
    <br>
    <label>
        <textarea  name="description" rows="4" cols="50" placeholder="Nhập miêu tả">
        </textarea>
    </label>
    <br>
    <label>
        <input type="file"
               class="form-control"
               name="image"
               accept="image/*">
    </label>
    <br>
    <label for="">Chọn số lượng ghế của phương tiện</label>
    <input type="text" name="slot" id="" value="1">
    <button>submit</button>
</form>
</body>
</html>
