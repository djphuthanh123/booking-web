<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Sửa Phương tiện</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/transportManager"
   role="button"
   onclick="return confirm('Bạn có muốn hủy?')">
    Hủy
</a>
<form action="${pageContext.request.contextPath}/admin/transportManager/update"
      method="POST"
      enctype="multipart/form-data">
    <input type="hidden" name="id" value="${requestScope.transport.id}">
    <label>
        <input type="text"
               autocomplete="off"
               name="nameOfTransport"
               placeholder="Tên của phương tiện" value="${requestScope.transport.nameOfTransport}">
    </label>
    <br>
    <label>Nhập biển số xe :
        <input type="text" name="licensePlate" value="${requestScope.transport.licensePlate}">
    </label>
    <br>
    <c:choose>
        <c:when test="${not empty requestScope.transport.imageName}">
            <img width="50"
                 src="${pageContext.request.contextPath}/image/${requestScope.transport.imageName}"
                 alt="${requestScope.transport.imageName}"
                 title="${requestScope.transport.imageName}">
            <input type="checkbox"
                   value="deleteImage"
                   name="deleteImage" ${not empty requestScope.deleteImage ? 'checked' : ''}>
            <label >Xóa hình này?</label>
        </c:when>
        <c:otherwise>
            <div >Không có hình</div>
        </c:otherwise>
    </c:choose>
    <input type="file"
           name="image"
           accept="image/*">
    <br>
    <br>
    <input type="text" name="imageName" value="${requestScope.transport.imageName}">
    <label>
        <textarea  name="description" rows="4" cols="50">
           ${requestScope.transport.description}
        </textarea>
    </label>
    <br>
    <label for="">Chọn số lượng ghế của phương tiện</label>
    <input type="text" name="slot" id="" value="${requestScope.transport.slot}">
    <button type="submit" >
        Sửa
    </button>

</form>

</body>
</html>
