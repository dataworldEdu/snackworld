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
    function deleteRow() {
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
        let url = "${pageContext.request.contextPath}/user/userMng.do";
        url = url + "?page=" + pageSet;
        url = url + "&range=" + rangeSet;
        location.href = url;
    }

    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, searchType, keyword) {
        let url = "${pageContext.request.contextPath}/user/userMng.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    //다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        let pageSet = parseInt((range * rangeSize)) + 1;
        let rangeSet = parseInt(range) + 1;
        let url = "${pageContext.request.contextPath}/user/userMng.do";
        url = url + "?page=" + pageSet;
        url = url + "&range=" + rangeSet;
        location.href = url;
    }

    /*삭제 관련*/
    function deleteUser(){
        if($("input:checkbox[name='selected']:checked").length === 0) {
            alert("삭제할 항목을 선택하세요.");
            return;
        }
        var arr = new Array();
        var checkbox =  $("input:checkbox[name='selected']:checked");
        checkbox.each(function(key) {
            var tr = checkbox.parent().parent().eq(key);
            var td = tr.children();

            var td_userId = td.eq(4).text();
            arr.push(td_userId);
        });

        if(arr.length != 0) {
            var url = "/user/deleteUser.do";
            $.ajax({
                type: "POST",
                dataType : 'json',
                url: url,
                data: {
                    checkBoxArr : arr
                },
                success: function(data){
                    if(data.removeUserCnt > 0) {
                        alert("회원이 삭제되었습니다.");
                        deleteRow();
                    }
                    else{
                        alert("회원 삭제에 실패했습니다.");
                    }
                },
                error: function(){alert("서버통신 오류");}
            });
        }
    }

    /*추가 관련*/
    let add_submit_formDone = false;
    function addForm_submit() {
        const submit_form = document.getElementById("addUserForm");

        if(add_submit_formDone) {
            return;
        }

        submit_form.userName.value = submit_form.userName.value.trim();
        if(submit_form.userName.value.length == 0) {
            alert('이름을 입력해주세요.');
            submit_form.name.focus();

            return false;
        }

        submit_form.userId.value = submit_form.userId.value.trim();
        if(submit_form.userId.value.length == 0) {
            alert('아이디를 입력해주세요.');
            submit_form.userId.focus();

            return false;
        }

        submit_form.userPw.value = submit_form.userPw.value.trim();
        if(submit_form.userPw.value.length == 0) {
            alert('비밀번호를 입력해주세요.');
            submit_form.userPw.focus();

            return false;
        }

        if(submit_form.userPw.value != submit_form.checkUserPw.value) {
            alert('비밀번호가 일치하지 않습니다.');
            submit_form.checkUserPw.focus();

            return false;
        }

        submit_form.submit();
        add_submit_formDone = true;
    }

    /*수정관련*/
    let mod_submit_formDone = false;
    function modForm_submit() {
        const submit_form = document.getElementById("modUserForm");

        if(mod_submit_formDone) {
            return;
        }

        submit_form.userName.value = submit_form.userName.value.trim();

        submit_form.userId.value = submit_form.userId.value.trim();

        submit_form.userPw.value = submit_form.userPw.value.trim();

        if(submit_form.userPw.value != submit_form.checkUserPw.value) {
            alert('비밀번호가 일치하지 않습니다.');
            submit_form.checkUserPw.focus();

            return false;
        }

        submit_form.submit();
        mod_submit_formDone = true;

        $("#modifyModal").modal('hide');
    }

    function modifyUser() {
        $("#modifyModal").modal('show');

        $('#modInputAuth').val($("#td_inputAuthId").val()).prop("selected",true);
        $("#modInputName").val($("#td_inputName")[0].innerText);
        $("#modInputId").val($("#td_inputId")[0].innerText);

    }

</script>
<body>
<div class="container" style="margin-top:30px;">
    <div class="row">
        <div class="col">
            <span style="font-weight:bold; font-size:2rem;">회원관리</span>
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary" onclick="deleteUser()">삭제</button>
                <button type="button" class="btn btn-outline-primary" id="addBtn" data-bs-toggle="modal" data-bs-target="#addModal">추가</button>
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
                        <input type="hidden" name="inputAuth" id="td_inputAuthId" value="${user.authId}">
                        <td><input type="checkbox" name="selected" value="row" onclick="checkSelectAll(this)"></td>
                        <td>${rowNum}</td>
                        <td id="td_inputName">${user.userName}</td>
                        <td id="td_inputId">${user.userId}</td>
                        <td id="td_inputAuthName">${user.authName}</td>
                        <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary btn-sm" onclick="modifyUser()" >수정</button></td>
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
                            <a class="page-link" onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')" tabindex="-1">Previous</a>
                        </li>
                    </c:if>

                    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="pageId">
                        <li class="page-item <c:out value="${pagination.page == pageId ? 'active' : ''}"/> ">
                            <a class="page-link" href="#" onclick="fn_pagination('${pageId}', '${pagination.range}', '${pagination.rangeSize}')">${pageId}</a>
                    </c:forEach>

                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link" href="#" onclick="fn_next('${pagination.range}','${pagination.range}','${pagination.rangeSize}')">Next</a>
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
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <h5 class="modal-title" id="addModalLabel">회원 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form method="post" action="/user/userAdd.do" id="addUserForm">
                    <div class="mb-3">
                        <label for="addInputAuth" class="form-label">권한</label>
                        <select class="form-select" id="addInputAuth" name="authId" required>
                            <option value="USER">사용자</option>
                            <option value="APPR">승인자</option>
                            <option value="SADM">관리자</option>
                        </select>
                        <div class="invalid-feedback">
                            권한을 선택해주세요.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="addInputName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="addInputName" name="userName">
                    </div>
                    <div class="mb-3">
                        <label for="addInputId" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="addInputId" name="userId" required>
                    </div>
                    <div class="mb-3">
                        <label for="addInputPassword" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="addInputPassword" name="userPw">
                    </div>
                    <div class="mb-3">
                        <label for="addInputCheckPassword" class="form-label">비밀번호확인</label>
                        <input type="password" class="form-control" id="addInputCheckPassword" name="checkUserPw">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" onclick="addForm_submit();">적용</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modModalLabel">회원 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" action="/user/userModify.do" id="modUserForm">
                    <div class="mb-3">
                        <label for="modInputAuth" class="form-label">권한</label>
                        <select class="form-select" id="modInputAuth" name="authId" required>
                            <option value="USER">사용자</option>
                            <option value="APPR">승인자</option>
                            <option value="SADM">관리자</option>
                        </select>
                        <div class="invalid-feedback">
                            권한을 선택해주세요.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="modInputName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="modInputName" name="userName">
                    </div>
                    <div class="mb-3">
                        <label for="modInputId" class="form-label">아이디</label>
                        <input type="text" class="form-control" id="modInputId" name="userId" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="modInputPassword" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="modInputPassword" name="userPw">
                    </div>
                    <div class="mb-3">
                        <label for="modInputCheckPassword" class="form-label">비밀번호확인</label>
                        <input type="password" class="form-control" id="modInputCheckPassword" name="checkUserPw">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" onclick="modForm_submit();">적용</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
