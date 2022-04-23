<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2022-04-07
  Time: 오후 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>기준관리</title>
</head>
<script>
    let add_submit_formDone = false;
    function addForm_submit() {
        const submit_form = document.getElementById("addStandardForm");

        if(add_submit_formDone) {
            return;
        }

        submit_form.dept_name.value = submit_form.dept_name.value.trim();
        if(submit_form.dept_name.value.length == 0) {
            alert('부서를 입력해주세요.');
            submit_form.name.focus();

            return false;
        }

        submit_form.order_amt.value = submit_form.order_amt.value.trim();
        if(submit_form.order_amt.value.length == 0) {
            alert('주문금액을 입력해주세요.');
            submit_form.order_amt.focus();

            return false;
        }

        submit_form.user_amt.value = submit_form.user_amt.value.trim();
        if(submit_form.user_amt.value.length == 0) {
            alert('개인잔액을 입력해주세요.');
            submit_form.user_amt.focus();

            return false;
        }

        submit_form.start_dt.value = submit_form.start_dt.value.trim();
        if(submit_form.start_dt.value.length == 0) {
            alert('주문기간을 입력해주세요.');
            submit_form.start_dt.focus();

            return false;
        }

        submit_form.end_dt.value = submit_form.end_dt.value.trim();
        if(submit_form.end_dt.value.length == 0) {
            alert('주문기간을 입력해주세요.');
            submit_form.end_dt.focus();

            return false;
        }

        submit_form.submit();
        add_submit_formDone = true;
    }
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <span class="fs-2 fw-bold">기준관리</span>
        </div>
    </div>
    <div class="row">
        <form method="post" action="/standard/addStandard.do" id="addStandardForm">
            <div class="col">
            </div>
            <div class="col">
                <div class="col-12 mb-3">
                    <label for="dept_name" class="form-label">부서</label>
                    <select class="form-select" id="dept_name" required>
                        <option value="1">솔루션개발본부</option>
                        <option value="2">경영지원팀</option>
                        <option value="3">SM1팀</option>
                        <option value="4">SM2팀</option>
                        <option value="5">SI팀</option>
                        <option value="6">AI연구팀</option>
                        <option value="7">개발팀</option>
                        <option value="8">빅데이터팀</option>
                    </select>
                    <div class="invalid-feedback">
                        부서를 선택해주세요.
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label for="order_amt" class="form-label">주문가능금액</label>
                    <input type="text" class="form-control" id="order_amt" name="orderAmt" value="${standard.orderAmt}" required>
                    <div class="invalid-feedback">
                        금액을 입력해주세요.
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label for="user_amt" class="form-label">개인잔액</label>
                    <input type="text" class="form-control" id="user_amt" name="userAmt" value="${standard.userAmt}" required>
                    <div class="invalid-feedback">
                        잔액을 입력해주세요.
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label for="start_dt" class="form-label">주문가능기간</label>
                    <div>
                        <input type="date" class="form-control" id="start_dt" name="orderBgng" value="${standard.orderBgng}" required style="width:150px; display:inline;">
                        ~
                        <input type="date" class="form-control" id="end_dt" name="orderEnd" value="${standard.orderEnd}" required style="width:150px; display:inline;">
                    </div>
                </div>
            </div>
            <div class="col">
            </div>
        </form>
    </div>
    <div class="row">
        <div class="col">
        </div>
        <div class="col">
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="reset" class="btn btn-outline-secondary" form="addStandardForm">취소</button>
                <button type="submit" class="btn btn-secondary" form="addStandardForm">저장</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
