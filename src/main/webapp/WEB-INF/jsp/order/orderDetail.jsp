<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2022-04-07
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>주문상세</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">주문상세</p>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th width="5%"><input type="checkbox"/></th>
                <th width="15%">상품이미지</th>
                <th width="40%">품명</th>
                <th>카테고리</th>
                <th>수량</th>
                <th>가격</th>
                <th>상태</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderDetail}" var="order" varStatus="status">
                <tr>
                    <td>
                        <input type="checkbox"/>
                    </td>
                    <td>
                        <img src="${order.imgUrl != null ? order.imgUrl
                                    : order.storedFileName != null ? order.storedFileName
                                    : "/images/defaultimg.jpg"}" style="width: 150px; height: 150px">
                    </td>
                    <td>
                        <div class="prod-item">${order.gdsName}</div>
                        <div class="prod-price">
                            <fmt:formatNumber value="${order.gdsPrice}"/>
                        </div>
                    </td>
                    <td>${order.catCode}</td>
                    <td>${order.qty}</td>
                    <td>
                        <fmt:formatNumber value="${order.totalPrice}"/>
                    </td>
                    <td>${order.orderStatusCode}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary ">선택 주문 승인</button>
                <button type="button" class="btn btn-outline-secondary">전체 주문 반려</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
