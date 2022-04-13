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
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <span style="font-weight: bold; font-size: 2rem">상품 리스트</span>
            <div class="btn-group">
                <select class="form-select" aria-label="Default select example" style="width: 150px">
                    <option selected>카테고리</option>
                    <option value="1">스낵</option>
                    <option value="2">사탕</option>
                    <option value="3">초콜릿</option>
                    <option value="4">젤리</option>
                    <option value="5">파이류</option>
                </select>
                <input type="search" class="form-control" placeholder="검색..." aria-label="Search">
                <div style="margin : 10px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="goods-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th class="header" width="30"><input type="checkbox" value="selectall" name="selectall" onclick="selectAll(this)"/></th>
                <th>번호</th>
                <th>카테고리</th>
                <th>이미지</th>
                <th>상품명</th>
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
                    <td class="catCode">${goods.catCode}</td>
<%--                    <td class="reCode"></td>--%>
                    <td>이미지</td>
                    <td>${goods.gdsName}</td>
                    <td><fmt:formatNumber value="${goods.gdsPrice}"/></td>
                    <td>
                        <button type="button" class="btn btn-outline-primary"
                                onclick="location.href='/goods/modifyGoods?Id=${goods.gdsId}'">수정</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
<%--    <script>--%>
<%--        window.onload = function(){--%>
<%--                let code = $('.catCode').val();--%>
<%--                console.log(code);--%>
<%--                $(".reCode").text(code);--%>
<%--        }--%>

<%--    </script>--%>
    <!-- button -->
    <div class="row">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-right: 1%">
            <button type="button" class="btn btn-outline-secondary">상품 삭제</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/goods/regGoods'">상품 추가</button>
        </div>
    </div>

    <!-- pagination -->
    <div class="row">
        <div class="col">
        </div>
        <div class="col">
            <div class="text-center">
                <ul class="pagination justify-content-center">
                    <c:if test="${pagination.prev}">
                        <li class="page-item disabled">
                            <a class="page-link" href="/goods/goodsList" tabindex="-1">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="pageId">
                        <li class="page-item" <c:out value="${pagination.page == pageId ? 'active' : ''}"/>
                            <a class="page-link" href="/goods/goodsList?page=${pageId}">${pageId}</a></li>
                    </c:forEach>

                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link" href="/goods/goodsList">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="col">
        </div>
    </div>


</div>
</body>
</html>
