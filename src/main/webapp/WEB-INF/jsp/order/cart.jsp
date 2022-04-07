<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-07
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">장바구니</p>
        </div>
    </div>

    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col" width="5%"> <input type="checkbox"/></th>
                <th scope="col" width="15%">상품이미지</th>
                <th scope="col" width="30%">품명</th>
                <th scope="col">카테고리</th>
                <th scope="col">수량</th>
                <th scope="col">항목 가격</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="checkbox"/>
                </td>
                <td>
                    <!---->
                    <div style="width: 200px; height: 200px; background-color: aqua"></div>
                </td>
                <td>
                    <div class="prod-item">신당동 장독대를 뛰쳐나온 떡볶이 총각의 맛있는 프로포즈</div>
                    <div class="prod-price">1,500</div>
                </td>
                <td>스낵</td>
                <td>
                    <div class="input-group">
                        <input type="number" class="form-control" id="inputQTY" style="width: 10px;" min="0">
                    </div>
                </td>
                <td>7,500</td>
                <td>
                    <button type="button" class="btn btn-outline-primary">수정</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button type="button" class="btn btn-outline-secondary ">선택 삭제</button>
            <button type="button" class="btn btn-outline-secondary">선택 주문 요청</button>
            <button type="button" class="btn btn-outline-primary">전체 주문 요청</button>
        </div>
    </div>
</div>

</body>
</html>
