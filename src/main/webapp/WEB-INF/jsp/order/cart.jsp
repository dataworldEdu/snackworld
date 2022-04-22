<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-07
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<script>
    let totalPrice = 0;

    function selectAll(selectAll) {
        const checkboxes
            = document.getElementsByName('selected');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }

    function checkSelectAll(checkbox) {
        const selectall
            = document.querySelector('input[name="selectall"]');

        if (checkbox.checked === false) {
            selectall.checked = false;
        }
    }

    $(document).ready(function () {
        $('.itemPrice').each(function () {
            totalPrice += Number($(this).val());
        })
        totalPrice = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
        $('.totalPrice').text(totalPrice);

        $("#allOrderBtn").on("click", function () {
            alert("1122")
        });

        $(".modBtn").on("click", function () {
            console.info(Number($(this).closest("tr").find("#qty").val()))
            console.info(($(this).closest("tr").find("#qty").val()))
            console.info($(this).closest("tr").find("#cartId").val())

            let setQty = Number($(this).closest("tr").find("#qty").val());
            let targetCartId = $(this).closest("tr").find("#cartId").val();
            let action = "/order/modifyCartQtyAction.do?"
            action += "cartId=" + targetCartId;
            action += "&qty=" + setQty;
            location.href = action;


        })
    });

</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">장바구니</p>
        </div>
    </div>
    <form>
        <div class="row">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="header" style="width: 5%;">
                        <input type="checkbox" value="selectall" name="selectall" onclick="selectAll(this)"/>
                    </th>
                    <th scope="col" style="width: 15%">상품이미지</th>
                    <th scope="col" style="width: 40%">품명</th>
                    <th scope="col">카테고리</th>
                    <th scope="col" style="width: 7%;">수량</th>
                    <th scope="col">항목 가격</th>
                    <th scope="col"></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${cartList}" var="goods" varStatus="status">
                    <tr>
                        <td>
                                <%--                         onclick 기능은 추후 공통 기능으로 묶어서 구현 --%>
                            <input type="checkbox" name="selected" value="${goods.gdsId}"
                                   onclick="checkSelectAll(this)"/>
                        </td>
                        <td>
                            <img src="${goods.imgUrl != null ? goods.imgUrl
                                    : goods.storedFileName != null ? goods.storedFileName
                                    : "/images/defaultimg.jpg"}" style="width: 150px; height: 150px">
                        </td>
                        <td>
                            <div class="prod-item">${goods.gdsName}</div>
                            <div class="prod-price">
                                <fmt:formatNumber value="${goods.gdsPrice}"/>
                            </div>
                        </td>
                        <td>${goods.catCode}</td>
                        <td>
                            <div class="input-group">
                                <input type="number" class="form-control" id="qty" name="qty" style="width: 10px;"
                                       min="1"
                                       value="${goods.qty}">
                            </div>
                        </td>
                        <td>
                            <input class="itemPrice" type="hidden" value="${goods.gdsPrice * goods.qty}"/>
                            <fmt:formatNumber value="${goods.gdsPrice * goods.qty}"/>
                        </td>
                        <td>
                            <input type="hidden" id="cartId" value="${goods.cartId}"/>
                            <button type="button" class="btn btn-outline-primary modBtn">수정</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <p class="fs-3 text-end text-white bg-secondary">총 주문 금액 :
                <span class="totalPrice fs-2 fw-bold fst-italic" name="totalPrice"/>
            </p>
        </div>
        <div class="row">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary ">선택 삭제</button>
                <button type="button" class="btn btn-outline-secondary">선택 주문 요청</button>
                <button type="button" class="btn btn-outline-primary" id="allOrderBtn">전체 주문 요청</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
