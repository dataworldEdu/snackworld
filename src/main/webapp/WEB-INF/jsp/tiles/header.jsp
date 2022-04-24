<%--
  Created by IntelliJ IDEA.
  User: jangsangik
  Date: 2022/04/01
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <form class="col-12 col-lg-auto mb-3 mb-lg-0">
            <input type="search" class="form-control" placeholder="검색..." aria-label="Search">
        </form>
        <div style="margin : 10px;">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="goods-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>
        </div>
    </div>
</header>
</body>
</html>
