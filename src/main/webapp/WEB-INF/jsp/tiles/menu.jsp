<%--
  Created by IntelliJ IDEA.
  User: jangsangik
  Date: 2022/04/01
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메뉴</title>
</head>
<style>
    .navbar-nav > .nav-item{
        margin: 0px 70px;
    }
    .active {
        font-weight: bold;
    }
</style>
<script>
    $(document).on("click", ".nav-item>a", function() {
        $(this).addClass('active');
        $(this).parent().siblings().children().removeClass('active');
    });
</script>
<body>
<div class="mb-3">
    <nav class="navbar navbar-expand-lg navbar-light bg-light rounded" aria-label="Twelfth navbar example">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample10">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/home/main.do">전체보기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home/main.do?catCode=01">스낵</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home/main.do?catCode=02">사탕</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home/main.do?catCode=03">초콜릿</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home/main.do?catCode=04">젤리</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home/main.do?catCode=04">파이류</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
