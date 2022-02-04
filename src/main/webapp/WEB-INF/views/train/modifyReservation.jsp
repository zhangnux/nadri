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
	td, th{
		border: 1px solid #C0C0C0;
		height: 55px;
	}
	
	table {
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
<div class="container">
	<div class="row my-5">
		<div class="col">
			<h2>발권/취소/변경</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="active" value="menu4"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row text-center" style="padding: 12px 12px; font-size: 20px;">
		<div class="col-4 p-4">
			발권/취소
		</div>
		<div class="col-4 p-4 active">
			예약변경
		</div>
		<div class="col-4 p-4">
			이용내역
		</div>
	</div>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul>
			<li>
				고객님의 예약 및 발권내역은 아래와 같습니다.
			</li>
			<li class="mt-1">
				승차일자, 구간, 차실, 출발시각 변경하거나 승차인원이 증가하는 경우는 예약취소 후 다시 예약해야 하며, 열차출발 2일 전 취소시는 수수료가 발생하지 않습니다.
			</li>
			<li class="mt-1">
				출발시각 이전까지 예약한 승차권을 발권 받지 않는 경우 예약 좌석이 자동을 취소되며, 위약금(결제금액의 15%)이 발생하니 반드시 승차권을 발권하시기 바랍니다.
			</li>
		</ul>
	</div>
	<div class="row mt-4">
		<div class="col">
			<table class="text-center">
				<thead>
					<tr style="background-color: #D6DEE8; ">
						<th width="5%">선택</th>
						<th width="10%">승차일자</th>
						<th width="10%">열차</th>
						<th width="10%">출발</th>
						<th width="10%">도착</th>
						<th width="7%">예약매수</th>
						<th width="11%">총 결제금액</th>
						<th width="11%">소요시간</th>
						<th width="13%">결제기한</th>
						<th width="13%">예약취소/반환</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox"></td>
						<td>2022-01-15</td>
						<td>KTX - 1</td>
						<td>서울 <div>9:00</div></td>
						<td>부산 <div>10:45</div></td>
						<td>2</td>
						<td>40,200</td>
						<td>1:45:00</td>
						<td>15시 5분까지</td>
						<td><button type="button" class="btn" style="background-color: #A0A0A0; color: white;">예약 취소</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-end mt-5">
		<button class="btn btn-dark">결제하기</button>
	</div>
</div>
</body>
</html>