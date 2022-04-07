<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2022-04-07
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <th width="5%"> <input type="checkbox"/></th>
                <th width="15%">상품이미지</th>
                <th width="40%">품명</th>
                <th>카테고리</th>
                <th>수량</th>
                <th>가격</th>
                <th>상태</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="checkbox"/>
                </td>
                <td>
                    <div style="width: 200px; height: 200px; background-color: aqua"></div>
                </td>
                <td>
                    <div class="prod-item"><p class="text-break"> 신당동 장독대를 뛰쳐나온 떡볶이 총각의 맛있는 프로포즈 </p></div>
                    <div class="prod-price">1,500</div>
                </td>
                <td>스낵</td>
                <td>허니버터칩</td>
                <td>2000원</td>
                <td>승인</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox"/>
                </td>
                <td>
                    <div style="width: 200px; height: 200px; background-color: aqua"></div>
                </td>
                <td>
                    <div class="prod-item"><p class="text-break">해태 홈런볼 커스터드 크림</p></div>
                    <div class="prod-price">1,500</div>
                </td>
                <td>스낵</td>
                <td>허니버터칩</td>
                <td>2000원</td>
                <td>승인</td>
            </tr>
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
