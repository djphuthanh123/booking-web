<%@ page import="booking.beans.Transport" %>
<%@ page import="java.util.List" %>
<%@ page import="booking.beans.Trips" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/4/2023
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Title</title>
  <link href="../css/seat.css" rel="stylesheet" />
  <style>
    .seat {
      width: 40px;
      height: 40px;
      margin: 4px;
      background-color: #e1e1e1;
      border-radius: 5px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
    }

    .seat.available {
      background-color: #77dd77;
    }

    .seat.selected {
      background-color: #ff6961;
      cursor: not-allowed;

    }

  </style>
</head>
<body>
<%
  //    listSeatNumber
  List<Integer> listSeat = (List<Integer>) request.getAttribute("listSeatNumber");
  Transport transport = (Transport) request.getAttribute("transport");
  int slots = Integer.parseInt(String.valueOf(transport.getSlot()));
%>
<p><a href="${pageContext.request.contextPath}/admin">Quay lại</a></p>

<h2>Chọn ghế</h2>

<form action="${pageContext.request.contextPath}/client/home/chooseSeat"
      method="POST"
>
  <p>${tripName} </p>
  <input name="tripId" value=${tripId}>
  <div class="car_driver">
    <p class="seat">Lai xe</p>
    <p class="seat">cua tren</p>
  </div>
  <table class="seat_below">
    <%for (int i = 0; i < 5; i++) {%>
    <tr>
      <%for (int j = (i*slots/5) +1; j <= ((i+1) *slots)/5; j++)
      {
      %>if(listSeat.contains(j))
      {

      <td class="selected  seat"><a><%=j%><a/></td>

      }else
      {
      <td class="seat"><input type="submit" name="seatNumber" value=<%=j%>></td>
      }<%
        }
      }%>
    </tr>
  </table>
</form>
</body>
</html>
