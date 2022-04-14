<%--
  Created by IntelliJ IDEA.
  User: jangsangik
  Date: 2022/04/04
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원관리</title>
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

    // $('#exampleModal').on('shown.bs.modal', function (e) {
    //     // do something...
    // })

</script>
<body>
<div class="container" style="margin-top:30px;">
    <div class="row">
        <div class="col">
            <span style="font-weight:bold; font-size:2rem;">회원관리</span>
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary" onclick="delCheckedList()">삭제</button>
                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">추가</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="header" width="30"><input type="checkbox" value="selectall" name="selectall" onclick="selectAll(this)"/></th>
                    <th>번호</th>
                    <th>이름</th>
                    <th>ID</th>
                    <th>권한</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user" varStatus="status">
                    <c:set var="rowNum" value="${(search.listCnt -status.index) - ((pageNum - 1) * 10) }"/>
                    <tr>
                        <td><input type="checkbox" name="selected" value="row" onclick="checkSelectAll(this)"></td>
                        <td>${rowNum}</td>
                        <td>${user.userName}</td>
                        <td>${user.userId}</td>
                        <td>${user.authId}</td>
                        <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary btn-sm" >수정</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col">
        </div>
        <div class="col">
            <div class="text-center">
                <ul class="pagination justify-content-center">
                    <c:if test="${pagination.prev}">
                        <li class="page-item disabled">
                            <a class="page-link" href="/user/userMng" tabindex="-1">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="pageId">
                        <li class="page-item <c:out value="${pagination.page == pageId ? 'active' : ''}"/> ">
                            <a class="page-link" href="/user/userMng?page=${pageId}">${pageId}</a></li>
                    </c:forEach>

                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link" href="/user/userMng">Next</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="col">
        </div>
    </div>
    <div class="row">
        <div class="col">
<%--            <div class="d-grid gap-2 d-md-flex justify-content-md-end">--%>
<%--                <button type="button" class="btn btn-outline-secondary ">취소</button>--%>
<%--                <button type="button" class="btn btn-outline-primary">저장</button>--%>
<%--            </div>--%>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">회원 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/user">
                    <div class="mb-3">
                        <label for="inputName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="inputName">
                    </div>
                    <div class="mb-3">
                        <label for="inputId" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="inputId">
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="inputPassword">
                    </div>
                    <div class="mb-3">
                        <label for="inputCheckPassword" class="form-label">비밀번호확인</label>
                        <input type="password" class="form-control" id="inputCheckPassword">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary">적용</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
