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
		height: 50px;
	}
	
	#table-refund-rate {
		width: 80%;
		font-size: 14px;
	}
	
	#table-refund-rate td {
		height: 40px;
	}
	#table-refund-rate th {
		height: 60px;
		background-color: #F2F2F2;
		font-weight: bold;
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
	.explanation li {
		margin-top: 7px;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col">
			<h2>반환</h2>
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
				'${sessionScope.LOGIN_USER.name }'고객님의 티켓 내역입니다.
			</li>
			<li class="mt-2">
				반환하실 티켓을 선택해 주세요
			</li>
		</ul>
	</div>
	<div class="row mt-4">
		<div class="col">
			<table class="text-center" id="table-refund">
				<thead>
					<tr style="background-color: #D6DEE8; ">
						<th width="13%">승차일자</th>
						<th width="10%">열차종류</th>
						<th width="10%">열차번호</th>
						<th width="10%">출발역</th>
						<th width="10%">도착역</th>
						<th width="10%">출발시간</th>
						<th width="10%">도착시간</th>
						<th width="7%">인원</th>
						<th width="10%">총결제금액</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td data-departureTime="${reservation.departureTime }"><fmt:formatDate value="${reservation.departureTime }" pattern="yyyy-MM-dd"/></td>
						<td>${reservation.trainName }</td>
						<td>${reservation.trainNo }</td>
						<td>${reservation.departureStation }</td>
						<td>${reservation.arrivalStation }</td>
						<td><fmt:formatDate value="${reservation.departureTime }" pattern="HH:mm"/></td>
						<td><fmt:formatDate value="${reservation.arrivalTime }" pattern="HH:mm"/></td>
						<td>${reservation.totalCount }</td>
						<td><fmt:formatNumber value="${reservation.totalPrice }" pattern="##,###"/>원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" style="margin-top: 80px;">
		<div class="col">
			<form action="/train/refund.nadri" method="post" id="form-refund">
				<input type="hidden" name="reservationNo" value="${reservation.no }">
				<table class="text-center" id="table-seat-refund">
					<thead>
						<tr style="background-color: #D6DEE8; ">
							<th width="5%">선택</th>
							<th width="20%">좌석 정보</th>
							<th width="20%">객실 유형</th>
							<th width="20%">승객 유형</th>
							<th width="20%">가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ticket" items="${ticketList }" >
							<tr>
								<td><input type="checkbox" name="ticketNo" value="${ticket.no }"></td>
								<td>${ticket.roomName} - ${ticket.seatNo}</td>
								<td>${ticket.roomType}</td>
								<td>${ticket.type}</td>
								<td><fmt:formatNumber value="${ticket.price}" pattern="##,###"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="text-end mt-5">
		<button class="btn btn-dark" id="btn-refund" type="button">반환요청</button>
	</div>
	<div class="row" style="margin-top: 100px;">
		<div class="col">
			<table class="text-center" id="table-refund-rate">
				<thead>
					<tr>
						<th rowspan="2" width="10%">구분</th>
						<th colspan="3" width="45%" style="height: 37px;">출발 전</th>
						<th colspan="3" width="45%" style="height: 37px;">출발 후</th>
					</tr>
					<tr>
						<th width="10%">1개월 ~ 당일</th>
						<th width="10%">당일 ~ 3시간 전</th>
						<th width="10%">3시간 전 ~ 출발시간 전</th>
						<th width="10%">20분까지</th>
						<th width="10%">20분 ~ 60분</th>
						<th width="10%">60분 ~ 도착</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="height: 40px;">월 ~ 목요일</th>
						<td colspan="2">무료</td>
						<td>5%</td>
						<td rowspan="2">15%</td>
						<td rowspan="2">40%</td>
						<td rowspan="2">70%</td>
					</tr>
					<tr>
						<th style="height: 40px;">금 ~ 일요일</th>
						<td>400원</td>
						<td>5%</td>
						<td>10%</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col">
			<ul class="explanation">
				<li>구입한 승차권을 반환하는 경우 <strong>반환시점에 따른 위약금</strong>이 발생합니다.</li>
				<li>수수료를 공제한 잔액을 반환해 드립니다.</li>
				<li>반환 수수료가 400원 미만일 경우 최저수수료인 400원의 반환수수료를 공제합니다.</li>
				<li>열차 <strong>출발시각 이후에는 역 창구에서만 환불</strong>이 가능합니다.</li>
				<li>승차권에 표기된 도착역 <strong>도착시각 이후에는 환불 하실 수 없습니다.</strong></li>
			</ul>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		$("#btn-refund").click(function() {
			// 보낼 값이 많으므로 post으로 request body에 담아서 보낸다.
			let dpDate = $("#table-refund").find('td').eq(0).text()
			let dpTime = $("#table-refund").find('td').eq(5).text()
			let dp = new Date(dpDate + " " + dpTime)
			let now = new Date()
			// 빠른 값이 더 크다
			// 환불하는 날짜가 출발날짜보다 이전이어야 한다.
			if (now < dp) {
				$("#form-refund").submit()
			} else {
				alert("열차가 출발한 후에 반환할 수 없습니다.")
			}
			// 티켓의 날자와 지금 날짜가 같거나 지금 날짜 보다 느리다면 환불 안되게 한다.
			// 체크한 티켓들의 환불값을 자바스크립트에서 측정해서 즉각 반환할까 
			// 아니면 페이지를 하나더 만들어서 자바에 환불가격을 측정해서 화면에 표시할까?
					
			// reservationNo와 ticket번호와 티켓 가격을 전달할까?
			// List<integer>
			// 티켓 여러개를 선택해서 환불금 측정하는 클래스 생성하기
			
			// 예약 reservation 에 카카오 페이에서 응답
			// 결제 고유 번호를 저장해야 한다.
			// 카카오페이로 결제 취소 시키기
			// $.getJson으로
			// 티켓 번호를 보내서 해당하는 티켓 리스트를 가져온다음 티켓 vo에 있는 값들로 카카오페이에 취소 값을 입력한다.
			// 카카오 페이에서 취소가 완료되면
			// 티켓 리스트에 있는 예약번호를 확인해서 예약번호에 해당하는 예약 정보를 가져온다.
			// 카카오 페이에서 취소가 되면 삭제를 진행하고
			// 티켓 번호 전달된 것이 예약된 매수와 같으면 예약을 아예 취소한다.
			
			})
	})
</script>
</html>