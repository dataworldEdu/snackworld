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

    $(document).ready(function () {
        // check box
        $('#checkAll').click(function () {
            if($(this).is(':checked')){
                $('input:checkbox').prop('checked', true);
            } else {
                $('input:checkbox').prop('checked', false);
            }
        })
        $('input[name="checkedItem"]').click(function () {
            if($('#checkAll').is(':checked')){
                $('#checkAll').prop('checked', false);
            }
        })

        // total price
        $('.itemPrice').each(function () {
            totalPrice += Number($(this).val());
        })
        $('input[name=totalPrice]').val(totalPrice);
        totalPrice = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
        $('.totalPrice').text(totalPrice);


        // 수정버튼
        $(".modBtn").on("click", function () {
            let setQty = Number($(this).closest("tr").find("#qty").val());
            let targetCartId = $(this).closest("tr").find("#cartId").val();
            let action = "/order/modifyCartQtyAction.do?"
            action += "cartId=" + targetCartId;
            action += "&qty=" + setQty;
            location.href = action;
        })

        let cartForm = $('#cartForm')
        $('#cartDelete').on('click', function () {
            if(!lengthCheck()){
                return;
            }
            $("input:checkbox[name='checkedItem']:checked").each(function () {
                $(this).closest("tr").find("#qty").attr("disabled", true);
            });

            cartForm.attr('action', '/order/cartDeleteAction.do');
            cartForm.submit();
        })

        $('#cartOrder').on('click', function () {
            if(!lengthCheck()){
                alert('주문 할 상품을 선택 해주세요.')
                return;
            }

            $("input:checkbox[name='checkedItem']:checked").each(function () {
                $(this).siblings().attr("disabled", false);
                $(this).closest("tr").find("#gdsPrice").attr("disabled", false);
            });

            cartForm.attr('action', '/order/cartOrderAction.do');
            cartForm.submit();
        })

        $('#allOrderBtn').on('click', function () {
            $('#checkAll').click();

            $("input:checkbox[name='checkedItem']:checked").each(function () {
                $(this).siblings().attr("disabled", false);
                $(this).closest("tr").find("#gdsPrice").attr("disabled", false);
            });

            cartForm.attr('action', '/order/cartOrderAction.do');
            cartForm.submit();
        })
    });

    function lengthCheck(){
        if ($("input:checkbox[name='checkedItem']:checked").length === 0) {
            return false;
        }
        return true;

    }

</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">장바구니</p>
        </div>
    </div>
    <form id="cartForm" method="get">
        <div class="row">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="header" style="width: 5%;">
                        <input type="checkbox" id="checkAll"/>
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
                            <input type="checkbox" name="checkedItem" value="${goods.cartId}"/>
                            <input type="hidden" name="gdsId" value="${goods.gdsId}" disabled/>

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
                            <input type="hidden" name="gdsPrice" id="gdsPrice" value="${goods.gdsPrice}" disabled/>
                        </td>
                        <td>${goods.catCode}</td>
                        <td>
                            <div class="input-group">
                                <input type="number" class="form-control" id="qty" name="qty" style="width: 10px;"
                                       min="1" value="${goods.qty}">
                            </div>
                        </td>
                        <td>
                            <input class="itemPrice" type="hidden" name="itemPrice" value="${goods.gdsPrice * goods.qty}" disabled/>
                            <fmt:formatNumber value="${goods.gdsPrice * goods.qty}"/>
                        </td>
                        <td>
                            <input type="hidden" id="cartId" name="cartId" value="${goods.cartId}" disabled/>
                            <button type="button" class="btn btn-outline-primary modBtn">수정</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <p class="fs-3 text-end text-white bg-secondary">총 주문 금액 :
                <span class="totalPrice fs-2 fw-bold fst-italic"/>
            </p>
        </div>
        <div class="row">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary" id="cartDelete">선택 삭제</button>
                <button type="button" class="btn btn-outline-secondary" id="cartOrder">선택 주문 요청</button>
                <button type="button" class="btn btn-outline-primary" id="allOrderBtn">전체 주문 요청</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
