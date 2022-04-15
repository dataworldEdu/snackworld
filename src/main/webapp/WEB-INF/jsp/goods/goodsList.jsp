<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-07
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>상품리스트</title>
</head>
<script>
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

    function delCheckedList() {
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("삭제할 항목을 선택하세요.");
            return;
        }

        $("input:checkbox[name='selected']:checked").each(function(k,kVal) {
            console.log("kVal ::", kVal.parentElement.parentElement);
            let ad = kVal.parentElement.parentElement;
            $(ad).remove();
        });
    }

    <!-- pagination -->
    //이전 버튼 이벤트
    function fn_prev(page, range, rangeSize) {
        let pageSet = ((range - 2) * rangeSize) + 1;
        let rangeSet = range - 1;
        let url = "${pageContext.request.contextPath}/goods/goodsList.do";
        url = url + "?page=" + pageSet;
        url = url + "&range=" + rangeSet;
        location.href = url;
    }

    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, searchType, keyword) {
        let url = "${pageContext.request.contextPath}/goods/goodsList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    //다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        let pageSet = parseInt((range * rangeSize)) + 1;
        let rangeSet = parseInt(range) + 1;
        let url = "${pageContext.request.contextPath}/goods/goodsList.do";
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
                <span class="fw-bold fs-2">상품 리스트</span>
                <form id="search-form" action="/goods/goodsList.do" method="get">
                    <div class="btn-group mt-1 ms-2">
                        <select class="form-select me-1" name="searchType" aria-label="Default select example" style="width: 150px">
                            <option value="0" selected>전체</option>
                            <option value="1">스낵</option>
                            <option value="2">사탕</option>
                            <option value="3">초콜릿</option>
                            <option value="4">젤리</option>
                            <option value="5">파이류</option>
                        </select>
                        <div class="input-group">
                            <input type="text" class="form-control" name="keyword" placeholder="검색..." list="goods-List">
                            <datalist id="goods-List">
                                <c:forEach items="${listSearch}" var="list" varStatus="status">
                                    <option value="${list.gdsName}"/>
                                </c:forEach>
                            </datalist>
                            <button type="submit" class="bi bi-search btn btn-outline-secondary fs-5"></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="header" style="width: 30px;"><input type="checkbox" value="selectall" name="selectall" onclick="selectAll(this)"/></th>
                <th>번호</th>
                <th>카테고리</th>
                <th style="width: 15%;">이미지</th>
                <th style="text-overflow: ellipsis; width: 50%;">상품명</th>
                <th>가격</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${goodsList}" var="goods" varStatus="status">
                <c:set var="rowNum" value="${(search.listCnt -status.index) - ((pageNum - 1) * 10) }"/>
                <tr>
                    <td><input type="checkbox" name="selected" value="row" onclick="checkSelectAll(this)"></td>
                    <td>${rowNum}</td>
                    <td>
                        ${goods.catCode == "01" ? "스낵"
                        :(goods.catCode == "02") ? "사탕"
                        :(goods.catCode == "03") ? "초콜릿"
                        :(goods.catCode == "04") ? "젤리" : "파이류"}
                    </td>
                    <td>이미지</td>
                    <td>
                        <span onclick="location.href='/goods/goodsDetail.do?Id=${goods.gdsId}'" style="cursor: pointer">${goods.gdsName}</span>
                    </td>
                    <td><fmt:formatNumber value="${goods.gdsPrice}"/></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary"
                                onclick="location.href='/goods/modifyGoods.do?Id=${goods.gdsId}'">수정</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- button -->
    <div class="row">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-right: 1%">
            <button type="button" class="btn btn-outline-secondary">상품 삭제</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/goods/regGoods'">상품 추가</button>
        </div>
    </div>

    <!-- pagination -->
    <div class="row">
        <div class="col"></div>
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
        <div class="col"></div>
    </div>
</div>
<script>
    window.onload = function () {
        console.log(${pagination.startPage});
        console.log(${pagination.endPage});

    }
</script>
</body>
</html>
