<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
</head>
<body onload="setTimeout('home()', 2000)">
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="row border rounded mt-5 p-3 border-5">
		<div class="row border-bottom text-center border-2">
			<h1><strong>결제가 완료되었습니다.</strong></h1>
		</div>
		<div class="col text-center mt-3"><h4>상세 내역은 마이페이지를 확인해주세요</h4></div>
	</div>
</div>
<script>
function home(){
	window.location.href="http://localhost/home.nadri";
}
</script>
</body>
</html>