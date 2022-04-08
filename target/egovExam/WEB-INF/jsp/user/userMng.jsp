<%--
  Created by IntelliJ IDEA.
  User: jangsangik
  Date: 2022/04/04
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원관리</title>
</head>
<body>
<div class="container" style="margin-top:30px;">
    <div class="row">
        <div class="col">
            <span style="font-weight:bold; font-size:2rem;">회원관리</span>
        </div>
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary">삭제</button>
                <button type="button" class="btn btn-outline-primary">추가</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="header" width="30"><input type="checkbox" id="checkall" /></th>
                    <th>번호</th>
                    <th>이름</th>
                    <th>ID</th>
                    <th>권한</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox" name="_selected_" value="ROW_1"></td>
                    <td>1</td>
                    <td>조영아</td>
                    <td>zeroa7</td>
                    <td>사용자</td>
                    <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary btn-sm" >수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="_selected_" value="ROW_2"></td>
                    <td>2</td>
                    <td>주정민</td>
                    <td>jm_joo995</td>
                    <td>사용자</td>
                    <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary btn-sm" >수정</button></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="_selected_" value="ROW_3"></td>
                    <td>3</td>
                    <td>이후원</td>
                    <td>dlgndnjs1</td>
                    <td>사용자</td>
                    <td style="text-align: right;"><button type="button" class="btn btn-outline-secondary btn-sm" >수정</button></td>
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
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-outline-secondary ">취소</button>
                <button type="button" class="btn btn-outline-primary">저장</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
