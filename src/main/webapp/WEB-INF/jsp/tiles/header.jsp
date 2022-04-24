<%--
  Created by IntelliJ IDEA.
  User: jangsangik
  Date: 2022/04/01
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>헤더</title>
</head>
<body>
<nav class="py-2 bg-light border-bottom">
    <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">

        </ul>
        <ul class="nav">
            <li class="nav-item"><a href="/user/userMng.do" class="nav-link link-dark px-2">회원관리</a></li>
            <li class="nav-item"><a href="/standard/standardMng.do" class="nav-link link-dark px-2">기준관리</a></li>
            <li class="nav-item"><a href="/goods/goodsList.do" class="nav-link link-dark px-2" aria-current="page">상품관리</a></li>
            <li class="nav-item"><a href="/order/cart.do" class="nav-link link-dark px-2">장바구니</a></li>
            <li class="nav-item"><a href="/order/orderList.do" class="nav-link link-dark px-2">주문목록</a></li>
            <li class="nav-item"><a href="/login/loginForm.do" class="nav-link link-dark px-2">로그아웃</a></li>
        </ul>
    </div>
</nav>
<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="/home/main.do" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <img src="/images/logo.png" alt="My Image" width="50" height="35" style="margin-right:10px; margin-bottom:10px;">
            <span class="fs-4">SNACK WORLD</span>
        </a>
        <div style="margin-right:20px;">
            <li style="list-style:none;">전체 잔액</li>
            <li style="list-style:none;"><fmt:formatNumber value="${sessionScope.order_amt}"/>원</li>
        </div>
        <div style="margin-right:20px;">
            <li style="list-style:none;">개인 잔액</li>
            <li class="ms-2" style="list-style:none; "><fmt:formatNumber value="${sessionScope.user_amt}"/>원</li>
        </div>
        <div style="margin: 10px; width: 250px;">
            <form id="search-form" action="/home/main.do">
                <input type="text" class="form-control" name="keyword" placeholder="검색..." style="width: 82%; float: left">
                <button type="submit" class="bi bi-search btn btn-outline-secondary fs-10"></button>
            </form>
        </div>
    </div>
</header>
</body>
</html>
