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
	#table-refund td, th, #table-seat-refund td, th{
		border: 1px solid #C0C0C0;
		height: 50px;
	}
	
	#table-refund, #table-seat-refund {
		text-align: center;
		width: 100%;
	}
	
	.btn {
		width: 100px;
		height: 35px;
		border-radius: 0;
		text-align-last: center;
		font-size: .875rem;
		padding: initial;
		font-weight: bold;
	}
	
	hr + div div {
		background-color: #E6ECF3;
		border: 1px solid #E0E0E0;
		cursor: pointer;
	}
	hr + div div.active {
		background-color: #495C75;
		border: 1px solid #E0E0E0;
		color: white;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col">
			<h2>반환수수료</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu8" value="payment"/>
	<c:set var="active" value="menu8"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				'${sessionScope.LOGIN_USER.name }' 고객님의 반환 수수료 내역입니다.
			</li>
			<li class="mt-2">
				수수료 내역을 확인하신 후 반환버튼을 눌러주세요.
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col">
			<table class="" id="table-refund">
				<thead>
					<tr>
						<th>탑승날짜</th>
						<th>열차이름</th>
						<th>열차번호</th>
						<th>출발시간</th>
						<th>출발역</th>
						<th>도착시간</th>
						<th>도착역</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2021/01/03</td>
						<td>KTX</td>
						<td>1</td>
						<td>9:00</td>
						<td>2021/01/03</td>
						<td>10:45</td>
						<td>2021/01/03</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>