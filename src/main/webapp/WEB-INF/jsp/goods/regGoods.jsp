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

<script>
    $(document).ready((function () {
        $('#regBtn').on("click", function () {
            console.log("111")
            if ($('#catCode').val() == "") {
                alert("카테고리를 선택하세요")
                return;
            }
            if ($('#gdsName').val() == "") {
                alert("상품명을 입력하세요")
                return;
            }
            if ($('#gdsPrice').val() == "") {
                alert("상품 가격을 입력하세요")
                return;
            }

            $('#regForm').submit();
        })
    }))
</script>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">상품 등록</p>
        </div>
    </div>

    <form id="regForm" action="/goods/regGoodsAction.do" method="get">
        <div class="row">
            <div class="col"></div>
            <div class="col-4">
                <div class="row">
                    <!-- image 추가-->
                    <div class="row mb-1">
                        <img src="${goods.imgUrl != null ? goods.imgUrl
                                    : goods.storedFileName != null ? goods.storedFileName
                                    : "/images/defaultimg.jpg"}" style="width: 400px; height: 400px">
                        <%--                    <div style="width: 400px; height: 400px; background-color: gray"></div>--%>
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
                        <select class="form-select" id="catCode" name="catCode" aria-label="Default select example"
                                style="width: 150px">
                            <option value="" selected>카테고리</option>
                            <option value="01">스낵</option>
                            <option value="02">사탕</option>
                            <option value="03">초콜릿</option>
                            <option value="04">젤리</option>
                            <option value="05">파이류</option>
                        </select>
                        <span class="fs-5 fw-bold text-danger ms-2">*</span>
                    </div>
                </div>

                <div class="row">
                    <p class="fs-5 fw-bold">이름
                        <span class="text-danger">*</span>
                    </p>
                    <div class="input-group mb-2" style="width: 80%">
                        <input type="text" class="form-control" aria-label="Name"
                               aria-describedby="inputGroup-sizing-default"
                               name="gdsName" id="gdsName">
                    </div>
                </div>
                <div class="row">
                    <p class="fs-5 fw-bold">가격
                        <span class="text-danger">*</span>
                    </p>
                    <div class="input-group mb-2" style="width: 80%">
                        <input type="text" class="form-control" aria-label="Price"
                               aria-describedby="inputGroup-sizing-default" name="gdsPrice" id="gdsPrice">
                    </div>
                </div>

                <div class="row">
                    <p class="fs-5 fw-bold">URL</p>
                    <div class="input-group mb-3" style="width: 80%">
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"
                              name="gdsUrl"></textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-right: 1%">
                        <button type="button" class="btn btn-outline-secondary" onclick="location.href='/goods/goodsList.do'">취소</button>
                        <button type="button" class="btn btn-outline-primary" id="regBtn">등록</button>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </form>
</div>
</body>
</html>
