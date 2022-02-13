<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/mainnav.jsp" %>
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
            		<p>예약아이디 : </p>
            		<p>예약상태 : </p>
            		<p>결제금액 : <fmt:formatNumber value="" /></p>
            		<p>결제날짜 : <fmt:formatDate value="" pattern="yyyy년 M월 d일 a h시 m분 s초"/> </p>
            	</div>
            </div>
        </div>
    </div>
    <div class="row mb-3">
    	<div class="col text-end">
    		<a href="/restaurant/list" class="btn btn-primary btn-ls">계속</a>
    	</div>
    </div>
</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>