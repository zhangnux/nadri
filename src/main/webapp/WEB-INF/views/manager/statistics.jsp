<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
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
<style>
	html, body {
		width: 100%;
		height: 100%;
	}

	.container-fluid
	{
    position:fixed;
    padding:0;
    margin:0;

    top:0;
    left:0;

    width: 100%;
    height: 100%;
	}
	.store li {
		cursor: pointer;
		font-size: 23px;
		margin-right: 20px;
		font-weight: bold;
	}
	.store span {
		color: #606060;
	}
	.store .active {
		color: #7C474A;
	}
	#famousList img {
		border-radius: 3px;
		width: 280px;
		height: 200px;
	}
	#famousList {
		display: grid;
		grid: '. . . .';
	 	gap: 50px;
	 	margin: auto;
	 	text-align: center;
	 	padding: 10px 50px 30px 50px ;
	}
	#famousList div {
		padding: 0;
		width: 281px;
	}
</style>
<body>
<c:set var="menu" value="statistics"/>
<%@ include file="common/navbar.jsp" %>
<div class="container-fluid bg-light">
	<div class="row">
		<div class="col-2" style="position: fixed; height: 100%; min-width: 280px;">
			<%@ include file="common/navbar.jsp" %>
		</div>
		<div class="col-10" style="margin-left: 310px;">
			<div class="row border m-4">
				<div class="col" style="background-color: white;">
					<ul class="nav justify-content-end store" style="height: 50px;">
						<li class="nav-item">
							<span class="nav-link active">음식점</span>
						</li>
						<li class="nav-item">
							<span class="nav-link">여행지</span>
						</li>
						<li class="nav-item">
							<span class="nav-link">기차</span>
						</li>
						<li class="nav-item">
							<span class="nav-link">항공기</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="border m-4">
				<h4 class="mt-4 ms-5"><strong>예약순위</strong></h4>
				<div class="mx-4" id="famousList">
					<div class="border">
						<img alt="열차1" src="../../resources/images/train/route/busan2.jpg">
						<div class="text-start ps-3 mt-3">
							<h5><strong>서울 -> 부산</strong></h5>
						</div>
						<div class="text-start pb-2 px-3">
							예약 건수: 4
						</div>
					</div>
					<div class="">
						<img alt="열차1" src="../../resources/images/train/route/busan2.jpg">
					</div>
					<div class="">
						<img alt="열차1" src="../../resources/images/train/route/busan2.jpg">
					</div>
					<div class="">
						<img alt="열차1" src="../../resources/images/train/route/busan2.jpg">
					</div>
				</div>
			</div>
			<div class="row border m-4">
				<div class="col">
					asdsa
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>