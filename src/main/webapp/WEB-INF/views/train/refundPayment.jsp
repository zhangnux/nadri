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
<body>
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
			<table class="text-center" id="table-modify">
				<thead>
					<tr style="background-color: #D6DEE8; ">
						<th width="10%">승차일자</th>
						<th width="10%">열차이름</th>
						<th width="10%">열차번호</th>
						<th width="10%">출발역</th>
						<th width="10%">출발시간</th>
						<th width="10%">도착역</th>
						<th width="10%">도착시간</th>
						<th width="7%">인원</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><fmt:formatDate value="${reservation.departureTime }" pattern="yyyy-MM-dd"/></td>
						<td>${reservation.trainName }</td>
						<td>${reservation.trainNo }</td>
						<td>${reservation.departureStation }</td>
						<td><fmt:formatDate value="${reservation.departureTime }" pattern="HH:mm"/></td>
						<td>${reservation.arrivalStation }</td>
						<td><fmt:formatDate value="${reservation.arrivalTime }" pattern="HH:mm"/></td>
						<td>${reservation.totalCount }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" style="margin-top: 80px;">
		<div class="col">
			<form action="#" method="post" id="form-modify">
				<input type="hidden" name="reservationNo" value="${reservation.no }">
				<table class="text-center" id="table-seat-modify">
					<thead>
						<tr style="background-color: #D6DEE8; ">
							<th width="*%">선택</th>
							<th width="20%">좌석 정보</th>
							<th width="20%">객실 유형</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ticket" items="${ticketList }" >
							<tr>
								<td><input type="checkbox" name="no" value="${ticket.no }"></td>
								<td>${ticket.roomName} - ${ticket.seatNo}</td>
								<td>${ticket.roomType}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="text-end mt-5">
		<button class="btn btn-dark" id="btn-refund">반환요청</button>
	</div>
</div>
</body>
</html>