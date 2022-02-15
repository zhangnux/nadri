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
            <h1>주문 완료</h1>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col">
            <p>주문내용 정보를 확인하세요.</p>
            <div class="card">
            	<div class="card-body">
            		<h5 class="card-title">주문 정보 요약</h5>
            		<p>예약번호 : ${reservation.no }</p>
            		<p>예약상태 : ${reservation.process }</p>
            		<p>예약날짜 : ${reservation.reservedDate }</p>
            		<p>결제금액 : <fmt:formatNumber value="${reservation.deposit }" /></p>
            	</div>
            </div>
        </div>
    </div>
    <div class="row mb-3">
    	<div class="col text-end">
    		<a href="/restaurant/list.nadri" class="btn btn-primary btn-ls">계속</a>
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