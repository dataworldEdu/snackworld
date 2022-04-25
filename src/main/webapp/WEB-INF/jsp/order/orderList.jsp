<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2022-04-07
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>주문목록</title>
</head>
<script>
    /*체크박스 관련*/
    function selectAll(selectAll)  {
        const checkboxes
            = document.getElementsByName('selected');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })
    }
    function checkSelectAll(checkbox)  {
        const selectall
            = document.querySelector('input[name="selectall"]');

        if(checkbox.checked === false)  {
            selectall.checked = false;
        }
    }

    function cancelCheckedList() {
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("취소할 항목을 선택하세요.");
            return;
        }

        getCheckedOrderId();

        let chk_form = document.getElementById("chkForm");
        if(confirm("선택 항목을 취소 하시겠습니까?")){
            chk_form.submit();
        }
    }

    function cancelAllList() {
        checkSelectAll();

        getCheckedOrderId();

        let chk_form = document.getElementById("chkForm");
        if(confirm("선택 항목을 취소 하시겠습니까?")){
            chk_form.submit();
        }
    }

    <!-- 결재 -->
    //승인
    function signOffOn() {
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("승인할 항목을 선택하세요.");
            return;
        }

        getCheckedOrderId();
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("승인할 항목이 없습니다.");
            return;
        }

        let chk_form = document.getElementById("chkForm");
        chk_form.action = "/order/modifyOrderStatus.do";
        if(confirm("선택 항목을 승인 하시겠습니까?")){
            chk_form.submit();
        }
    }

    //반려
    function sendBack() {
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("반려할 항목을 선택하세요.");
            return;
        }


        getCheckedOrderId();
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("반려할 항목이 없습니다.");
            return;
        }

        $("#statusFlag").val(2);

        let chk_form = document.getElementById("chkForm");
        chk_form.action = "/order/modifyOrderStatus.do";
        if(confirm("선택 항목을 반려 하시겠습니까?")){
            chk_form.submit();
        }
    }

    function getCheckedOrderId() {
        let checkbox =  $("input:checkbox[name='selected']:checked");
        checkbox.each(function(key, value) {
            let tr = checkbox.parent().parent().eq(key);
            let td = tr.children();
            let orderStatusCode = td.eq(7).text();

            if(orderStatusCode != 'A001') {
                value.checked = false;
            }
        });
    }

    <!-- pagination -->
    //이전 버튼 이벤트
    function fn_prev(page, range, rangeSize) {
        let pageSet = ((range - 2) * rangeSize) + 1;
        let rangeSet = range - 1;
        let url = "${pageContext.request.contextPath}/order/orderList.do";
        url = url + "?page=" + pageSet;
        url = url + "&range=" + rangeSet;
        location.href = url;
    }

    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, searchType, keyword) {
        let url = "${pageContext.request.contextPath}/order/orderList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    //다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        let pageSet = parseInt((range * rangeSize)) + 1;
        let rangeSet = parseInt(range) + 1;
        let url = "${pageContext.request.contextPath}/order/orderList.do";
        url = url + "?page=" + pageSet;
        url = url + "&range=" + rangeSet;
        location.href = url;
    }
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="btn-group ">
            <span class="fs-2 fw-bold">주문관리</span>
            <form id="search-form" action="/order/orderList.do">
                <div class="btn-group mt-1 ms-2">
                    <select class="form-select" name="searchType" aria-label="Default select example" style="width:130px; margin-right:7px;">
                        <option selected>신청자</option>
                        <c:forEach items="${userList}" var="list" varStatus="status">
                            <option value="${list.userId}">${list.userName}</option>
                        </c:forEach>
                    </select>
                    <select class="form-select" name="searchType2" aria-label="Default select example" style="width:130px;">
                        <option value="" selected>주문상태</option>
                        <option value="A001">대기</option>
                        <option value="A002">승인</option>
                        <option value="A003">반려</option>
                    </select>
                    <div class="input-group ms-2">
                        <button type="submit" class="bi bi-search btn btn-outline-secondary fs-5"></button>
                    </div>
                </div>
            </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form id="chkForm" action="/order/cancelOrder.do">
                <input type="hidden" id="statusFlag" name="statusFlag" value="1" >
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="header" style="width: 30px;"><input type="checkbox" value="selectall" name="selectall" onclick="selectAll(this)"/></th>
                        <th>주문번호</th>
                        <th style="width: 15%;"></th>
                        <th style="text-overflow: ellipsis; width: 50%;">품명</th>
                        <th>총가격</th>
                        <th>신청자</th>
                        <th>진행상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orderList}" var="order" varStatus="status">
                        <c:set var="rowNum" value="${(search.listCnt -status.index) - ((pageNum - 1) * 10) }"/>
                        <c:set var="orderStatusCode" value="${orderStatusCode}"/>
                        <tr>
                            <td>
                                <input type="checkbox" name="selected" value="${order.orderId}" onclick="checkSelectAll(this)">
                            </td>
                            <td>${order.orderId}</td>
                            <td>
                                <img src="${order.imgUrl != null ? order.imgUrl
                                    : order.storedFileName != null ? order.storedFileName
                                    : "/images/defaultimg.jpg"}" style="width: 150px; height: 150px">
                            </td>
                            <td>${order.orderName}</td>
                            <td>
                                <fmt:formatNumber value="${order.totalPrice}"/>
                            </td>
                            <td>${order.userName}</td>
                            <td>${order.orderStatus}</td>
                            <td style="display: none">${order.orderStatusCode}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col">

        </div>
        <div class="col">
            <div class="text-center">
                <ul class="pagination justify-content-center">

                    <c:if test="${pagination.prev}">
                        <li class="page-item">
                            <a class="page-link" href="#" onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="pageId">
                        <li class="page-item <c:out value="${pagination.page == pageId ? 'active' : ''}"/> ">
                            <a class="page-link" href="#" onclick="fn_pagination('${pageId}', '${pagination.range}', '${pagination.rangeSize}')">${pageId}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link" href="#" onclick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}')">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <c:choose>
                    <c:when test='${sessionScope.auth == "USER"}'>
                        <button type="button" class="btn btn-outline-secondary" onclick="cancelCheckedList()">선택 주문 취소</button>
                        <button type="button" class="btn btn-outline-secondary" onclick="cancelAllList()">전체 주문 취소</button>
                    </c:when>
                    <c:when test='${sessionScope.auth == "APPR"}'>
                        <button type="button" class="btn btn-outline-secondary" onclick="sendBack()">반려</button>
                        <button type="button" class="btn btn-outline-secondary" onclick="signOffOn()">승인</button>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</body>
</html>
