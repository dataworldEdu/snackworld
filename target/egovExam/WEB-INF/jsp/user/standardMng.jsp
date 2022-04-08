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
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <span class="fs-2 fw-bold">기준관리</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
        </div>
        <div class="col">
            <div class="col-12 mb-3">
                <label for="dept_name" class="form-label">부서</label>
                <select class="form-select" id="dept_name" required>
                    <option value="">솔루션개발본부</option>
                    <option>경영지원팀</option>
                    <option>SM1팀</option>
                    <option>SM2팀</option>
                    <option>SI팀</option>
                    <option>AI연구팀</option>
                    <option>개발팀</option>
                    <option>빅데이터팀</option>
                </select>
                <div class="invalid-feedback">
                    부서를 선택해주세요.
                </div>
            </div>
            <div class="col-12 mb-3">
                <label for="order_amt" class="form-label">주문가능금액</label>
                <input type="text" class="form-control" id="order_amt" placeholder="170000" required>
                <div class="invalid-feedback">
                    금액을 입력해주세요.
                </div>
            </div>
            <div class="col-12 mb-3">
                <label for="user_amt" class="form-label">개인잔액</label>
                <input type="text" class="form-control" id="user_amt" placeholder="20000" required>
                <div class="invalid-feedback">
                    잔액을 입력해주세요.
                </div>
            </div>
            <div class="col-12 mb-3">
                <label for="start_dt" class="form-label">주문가능기간</label>
                <div>
                    <input type="date" class="form-control" id="start_dt" placeholder="" required style="width:150px; display:inline;">
                    ~
                    <input type="date" class="form-control" id="end_dt" placeholder="" required style="width:150px; display:inline;">
                </div>
            </div>
        </div>
        <div class="col">
        </div>
    </div>
    <div class="row">
        <div class="col">
        </div>
        <div class="col">
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary ">취소</button>
                <button type="button" class="btn btn-secondary">저장</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
