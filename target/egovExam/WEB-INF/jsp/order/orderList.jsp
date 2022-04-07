<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2022-04-07
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문목록</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <span class="fs-2 fw-bold">주문관리</span>
            <div class="btn-group">
                <select class="form-select" aria-label="Default select example" style="width:100px; margin-right:7px;">
                    <option selected>신청자</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
                <select class="form-select" aria-label="Default select example" style="width:130px;">
                    <option selected>주문상태</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="header" width="30"><input type="checkbox" id="checkall" /></th>
                    <th>번호</th>
                    <th>품명</th>
                    <th>총가격</th>
                    <th>신청자</th>
                    <th>진행상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" name="_selected_" value="ROW_1"></td>
                    <td>1</td>
                    <td>허니버터칩 외 2개</td>
                    <td>15000</td>
                    <td>조영아</td>
                    <td>승인</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="_selected_" value="ROW_2"></td>
                    <td>2</td>
                    <td>홈런볼 외 1개</td>
                    <td>13000</td>
                    <td>주정민</td>
                    <td>반려</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="_selected_" value="ROW_3"></td>
                    <td>3</td>
                    <td>꼬북칩 외 4개</td>
                    <td>20000</td>
                    <td>최승주</td>
                    <td>대기</td>
                </tr>
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
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">2 <span class="sr-only"></span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary ">선택 주문 취소</button>
                <button type="button" class="btn btn-outline-secondary">전체 주문 취소</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
