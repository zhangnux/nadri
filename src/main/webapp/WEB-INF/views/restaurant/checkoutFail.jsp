<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="../common/head.jsp"%>
    <title>나드리::음식점</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body onload="setTimeout('home()', 2000)">
<%@ include file="../common/navbar.jsp"%>
<div class="container">
    <div class="row mb-3">
        <div class="col">
            <h1>예약 실패</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <p>메인 페이지로 돌아갑니다.</p>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
function home(){
	location.replace("http://localhost/home.nadri");
}
</script>
</body>
</html>