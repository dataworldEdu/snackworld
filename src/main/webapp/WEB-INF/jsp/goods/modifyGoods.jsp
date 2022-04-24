<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-04-07
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>상품 수정</title>
</head>

<script>
    let file;
    window.onload = function () {
        let setSelect = ${modifyGoods.catCode * 1};
        $('#catCode').val(setSelect).prop("selected", true);
    }


    let maxSize = 1048576; // 1MB

    function fileCheck(fileSize) {
        if (fileSize > maxSize) {
            alert("파일 사이즈는 1MB를 초과할 수 없습니다.");
            return false;
        }
        return true;
    }

    function setThumbnail(event) {
        <!-- 파일 읽기 -->
        file = $("input:file[name='uploadFile']")[0].files[0];

        <!-- 파일 사이즈 체크 -->
        if (!fileCheck(file.size)) {
            return false;
        }

        <!-- 이미지 미리보기 -->
        const reader = new FileReader();
        reader.onload = function (event) {
            const previewImage = document.getElementById("imgBox");
            previewImage.src = event.target.result;
        };
        reader.readAsDataURL(event.target.files[0]);


        <!-- 파일 업로드 -->
    }

    function submitBtn() {
        if ($('#catCode').val() == "") {
            alert("카테고리를 선택하세요")
            return false;
        }
        if ($('#gdsName').val() == "") {
            alert("상품명을 입력하세요")
            return false;
        }
        if ($('#gdsPrice').val() == "") {
            alert("상품 가격을 입력하세요")
            return false;
        }

        $('#modifyForm').submit();
    }


</script>

<body>

<div class="container">
    <div class="row">
        <div class="col">
            <p class="fs-2 fw-bold">상품 수정</p>
        </div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-4">
            <div class="row">
                <!-- image 추가-->
                <div class="row mb-1">
                    <img id="imgBox" src="${modifyGoods.imgUrl != null ? modifyGoods.imgUrl
                                    : modifyGoods.storedFileName != null ? modifyGoods.storedFileName
                                    : "/images/defaultimg.jpg"}" style="width: 400px; height: 400px">
                </div>
                <div class="row col-5">
                    <form id="fileForm" method="post" action="/goods/uploadFileAction.do" enctype="multipart/form-data">
                        <label for="uploadFile" class="btn btn-secondary">이미지 업로드</label>
                        <input type="file" id="uploadFile" style="display:none;" name="uploadFile" accept="image/*"
                               onchange="setThumbnail(event)"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-4">
            <form id="modifyForm" action="/goods/modifyGoodsAction.do" method="post">

                <!-- 상품 정보 입력-->
                <div class="row">
                    <input type="hidden" value="${modifyGoods.gdsId}" name="gdsId">
                    <div class="btn-group mb-5">
                        <select class="form-select" id="catCode" aria-label="Default select example"
                                style="width: 150px"
                                name="catCode">
                            <option value="" selected>카테고리</option>
                            <option value="01">스낵</option>
                            <option value="02">사탕</option>
                            <option value="03">초콜릿</option>
                            <option value="04">젤리</option>
                            <option value="05">파이류</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <p class="fs-5 fw-bold">이름</p>
                    <div class="input-group mb-2" style="width: 80%">
                        <input type="text" class="form-control" aria-label="Name"
                               aria-describedby="inputGroup-sizing-default"
                               value="${modifyGoods.gdsName}" name="gdsName" id="gdsName">
                    </div>
                </div>
                <div class="row">
                    <p class="fs-5 fw-bold">가격</p>
                    <div class="input-group mb-2" style="width: 80%">
                        <input type="text" class="form-control" aria-label="Price"
                               aria-describedby="inputGroup-sizing-default"
                               value="${modifyGoods.gdsPrice}" name="gdsPrice" id="gdsPrice">
                    </div>
                </div>

                <div class="row">
                    <p class="fs-5 fw-bold">URL</p>
                    <div class="input-group mb-3" style="width: 80%">
                    <textarea class="form-control" id="gdsURL" rows="3"
                              name="gdsURL">${modifyGoods.gdsUrl}</textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="padding-right: 1%">
                        <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
                        <button type="button" class="btn btn-outline-primary" onclick="submitBtn()">수정</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col mb-5"></div>
    </div>
</div>
</body>
</html>
