<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../common/head.jsp" %>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
</head>
<style>
	.bi-exclamation-triangle-fill {
		font-size: 100px;
	}
</style>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
	<div class="row border" style="height: 500px; margin-top: 50px;">
		<div class="col" style="text-align: center;align-self: center;">
			<div class="row">
				<div class="col text-end">
				<i class="bi bi-exclamation-triangle-fill"></i>
				</div>
				<div class="col text-start" style="align-self: center;">
				<h1>Error</h1>
				</div>
			</div>
			<h4 class="my-3">결제를 실패했습니다.</h4>
			<p>알수없는 오류로 인해 결재를 실패했습니다.</p>
			<a href="/home.nadri" class="btn btn-dark mt-5 btn-home" style="border-radius: 0;">홈으로</a>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>