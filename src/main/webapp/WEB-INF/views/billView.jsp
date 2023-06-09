<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="${pageContext.request.contextPath}/admin">Quay lại</a></p>

<table border="1">
    <tr>
        <th>Trip Name</th>
        <th>Price</th>
        <th>status pay</th>
        <th>SeatNumber </th>
    </tr>

    <c:forEach var="bill"  items="${listBill}">
        <tr>
            <td>${bill.tripName}</td>
            <td>${bill.price}</td>
            <td>${bill.statusPay}</td>
            <td>${bill.seatNumber}</td>
            <td>
                <a class="btn btn-success me-2"
                   href="${pageContext.request.contextPath}/client/home/chooseSeat?id=${listTrips.id}"
                   role="button">
                    Thanh toán
                </a>
                <a class="btn btn-success me-2"
                   href="${pageContext.request.contextPath}/client/home/chooseSeat?id=${listTrips.id}"
                   role="button">
                    Hủy vé
                </a>
            </td>
        </tr>
    </c:forEach>
    <p>total bill:  ${totalBill}</p>
    <p>total money:  ${totalMoney}</p>

</table>

<h1>Trang chủ</h1>
<a href="https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=1806000&vnp_Command=pay&vnp_CreateDate=20210801153333&vnp_CurrCode=VND&vnp_IpAddr=127.0.0.1&vnp_Locale=vn&vnp_OrderInfo=Thanh+toan+don+hang+%3A5&vnp_OrderType=other&vnp_ReturnUrl=https%3A%2F%2Fdomainmerchant.vn%2FReturnUrl&vnp_TmnCode=DEMOV210&vnp_TxnRef=5&vnp_Version=2.1.0&vnp_SecureHash=3e0d61a0c0534b2e36680b3f7277743e8784cc4e1d68fa7d276e79c23be7d6318d338b477910a27992f5057bb1582bd44bd82ae8009ffaf6d141219218625c42
">
    Thanh toán vnpay
</a>
<a href="${pageContext.request.contextPath}/client/home">Trang chủ</a>
<a  href="${pageContext.request.contextPath}/admin/signin" role="button">
    Đăng nhập admin
</a>
</body>
</html>
