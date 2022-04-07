<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-07
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 추가</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">상품 등록</p>
        </div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-4">
            <div class="row">
                <!-- image 추가-->
                <div class="row mb-1">
                    <div style="width: 400px; height: 400px; background-color: gray"></div>
                    <!--                <img src="..." class="img-thumbnail" alt="...">-->
                </div>
                <div class="row col-5">
                    <button type="button" class="btn btn-secondary">이미지 업로드</button>
                </div>
            </div>
        </div>
        <div class="col-4">
            <!-- 상품 정보 입력-->
            <div class="row">
                <div class="btn-group mb-5">
                    <select class="form-select" aria-label="Default select example" style="width: 150px">
                        <option selected>카테고리</option>
                        <option value="1">스낵</option>
                        <option value="2">초콜릿</option>
                        <option value="3">홈런볼</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <p class="fs-5 fw-bold">이름</p>
                <div class="input-group mb-2" style="width: 80%">
                    <input type="text" class="form-control" aria-label="Name" aria-describedby="inputGroup-sizing-default" >
                </div>
            </div>
            <div class="row">
                <p class="fs-5 fw-bold">가격</p>
                <div class="input-group mb-2" style="width: 80%">
                    <input type="text" class="form-control" aria-label="Price" aria-describedby="inputGroup-sizing-default" >
                </div>
            </div>

            <div class="row">
                <p class="fs-5 fw-bold">URL</p>
                <div class="input-group mb-3" style="width: 80%">
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
            </div>

            <div class="row">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-right: 1%">
                    <button type="button" class="btn btn-outline-secondary ">취소</button>
                    <button type="button" class="btn btn-outline-primary">등록</button>
                </div>
            </div>
        </div>
        <div class="col"></div>
    </div>
</div>
</body>
</html>
