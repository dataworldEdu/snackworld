<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2022-04-06
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상품상세</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">상품 상세</p>
            <!--            <span style="font-weight: bold; font-size: 2rem">상품 수정</span>-->
        </div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-4">
            <div class="row">
                <!-- image 추가-->
                <div class="row mb-1">
                    <!-- 이미지 대용-->
                    <div style="width: 400px; height: 400px; background-color: gray"></div>
                    <!--                <img src="..." class="img-thumbnail" alt="...">-->
                </div>
            </div>
        </div>
        <div class="col-4">
            <!-- 상품 정보 입력-->
            <div class="row mb-3">
                <p class="fs-5 fw-bold">카테고리</p>
                <p class="fs-5" id="catCode"></p>
            </div>

            <div class="row mb-3">
                <p class="fs-5 fw-bold">이름</p>
                <p class="fs-5" id="gdsName">${goodsDetail.gdsName}</p>
            </div>
            <div class="row mb-3">
                <p class="fs-5 fw-bold">가격</p>
                <p class="fs-5" id="gdsPrice"><fmt:formatNumber value="${goodsDetail.gdsPrice}"/></p>
            </div>

            <div class="row mb-2">
            </div>

            <div class="row">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-right: 1%">
                    <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
                    <button type="button" class="btn btn-outline-primary" onclick="location.href='/goods/modifyGoods.do?Id=${goodsDetail.gdsId}'">수정</button>
                </div>
            </div>
        </div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col mb-5"></div>
    </div>
</div>

<script>
    $(document).ready(function (){
        let catValue;
        if('${goodsDetail.catCode}' == "01"){
            catValue = "스낵";
        }
        else if('${goodsDetail.catCode}' == "02"){
            catValue = "사탕";
        }
        else if('${goodsDetail.catCode}' == "03"){
            catValue = "초콜릿";
        }
        else if('${goodsDetail.catCode}' == "04"){
            catValue = "젤리";
        }
        else if('${goodsDetail.catCode}' == "05"){
            catValue = "파이류";
        }
        $('#catCode').text(catValue);
    });
</script>

</body>
</html>
