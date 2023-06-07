<%--
  Created by IntelliJ IDEA.
  User: vuade
  Date: 27/05/23
  Time: 5:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <jsp:include page="_meta.jsp"/>
    <title>Title</title>
</head>
<body>
<%--<a href="${pageContext.request.contextPath}/admin/transportManager">Quay lại</a>--%>
<%--<form action=--%>
<%--      method="POST"--%>
<%--      enctype="multipart/form-data">--%>
<%--    <label>--%>
<%--        <input type="text"--%>
<%--               autocomplete="off"--%>
<%--               name="nameOfTransport"--%>
<%--               placeholder="Tên của phương tiện">--%>
<%--    </label>--%>
<%--    <br>--%>
<%--    <label>--%>
<%--        <input type="text" name="licensePlate" placeholder="Nhập biển số xe">--%>
<%--    </label>--%>
<%--    <br>--%>
<%--    <label>--%>
<%--        <textarea  name="description" rows="4" cols="50" placeholder="Nhập miêu tả">--%>
<%--        </textarea>--%>
<%--    </label>--%>
<%--    <br>--%>
<%--    <label>--%>
<%--        <input type="file"--%>
<%--               class="form-control"--%>
<%--               name="image"--%>
<%--               accept="image/*">--%>
<%--    </label>--%>
<%--    <br>--%>
<%--    <label for="">Chọn số lượng ghế của phương tiện</label>--%>

<%--    --%>
<%--    <button>submit</button>--%>
<%--</form>--%>
<jsp:include page="_headerAdmin.jsp"/>

<section class="section-content">
    <div class="container">
        <header class="section-heading py-4">
            <h3 class="section-title">Thêm Phương tiện</h3>
        </header> <!-- section-heading.// -->

        <main class="row mb-5">
            <form class="col-lg-6" method="POST" action="${pageContext.request.contextPath}/admin/transportManager/create"
                  enctype="multipart/form-data">
                <c:if test="${not empty requestScope.successMessage}">
                    <div class="alert alert-success mb-3" role="alert">
                            ${requestScope.successMessage}
                    </div>
                </c:if>
                <c:if test="${not empty requestScope.errorMessage}">
                    <div class="alert alert-danger mb-3" role="alert">
                            ${requestScope.errorMessage}
                    </div>
                </c:if>
                <div class="mb-3">
                    <label for="transport-name" class="form-label">Tên phương tiện <span class="text-danger">*</span></label>
                    <input type="text"
                           class="form-control ${not empty requestScope.violations.nameViolations
                   ? 'is-invalid' : (not empty requestScope.transport.nameOfTransport ? 'is-valid' : '')}"
                           id="transport-name"
                           name="nameOfTransport"
                           value="${requestScope.transport.nameOfTransport}"
                           required>
                    <c:if test="${not empty requestScope.violations.nameViolations}">
                        <div class="invalid-feedback">
                            <ul class="list-unstyled">
                                <c:forEach var="violation" items="${requestScope.violations.nameViolations}">
                                    <li>${violation}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>
                <label>Biển số xe
                    <input type="text" name="licensePlate" >
                </label>
                <div class="mb-3">
                    <label for="transport-description" class="form-label">Mô tả thể loại</label>
                    <textarea class="form-control ${not empty requestScope.violations.descriptionViolations
                      ? 'is-invalid' : (not empty requestScope.category.description ? 'is-valid' : '')}"
                              id="transport-description"
                              rows="5"
                              name="description">${requestScope.category.description}</textarea>
                    <c:if test="${not empty requestScope.violations.descriptionViolations}">
                        <div class="invalid-feedback">
                            <ul class="list-unstyled">
                                <c:forEach var="violation" items="${requestScope.violations.descriptionViolations}">
                                    <li>${violation}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>
                <input type="text" name="slot" id="" value="1">
                <div class="mb-3">
                    <label for="transport-imageName" class="form-label">Hình thể loại</label>
                    <input type="file"
                           class="form-control"
                           id="transport-imageName"
                           name="image"
                           accept="image/*">
                </div>
                <button type="submit" class="btn btn-primary me-2 mb-3">
                    Thêm
                </button>
                <button type="reset"
                        class="btn btn-warning me-2 mb-3"
                        onclick="return confirm('Bạn có muốn để giá trị mặc định?')">
                    Mặc định
                </button>
                <a class="btn btn-danger mb-3"
                   href="${pageContext.request.contextPath}/admin/categoryManager"
                   role="button"
                   onclick="return confirm('Bạn có muốn hủy?')">
                    Hủy
                </a>
            </form>
        </main>
    </div> <!-- container.// -->
</section> <!-- section-content.// -->

<jsp:include page="_footerAdmin.jsp"/>

</body>
</html>
