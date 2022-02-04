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
	#table-modify td, th, #table-seat-modify td, th{
		border: 1px solid #C0C0C0;
		height: 50px;
	}
	
	#table-modify, #table-seat-modify {
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
			<h2>인원 변경</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu5" value="modify"/>
	<c:set var="active" value="menu5"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row text-center" style="padding: 12px 12px; font-size: 20px;">
		<div class="col-4 p-4" id="cancel-div">
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
			<form action="" method="post">
				<input type="hidden" name="reservationNo" value="${reservation.no }">
				<table class="text-center" id="table-seat-modify">
					<thead>
						<tr style="background-color: #D6DEE8; ">
							<th width="20%">좌석 정보</th>
							<th width="20%">객실 유형</th>
							<th width="*%">승객유형</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ticket" items="${ticketList }" >
							<tr>
								<td>${ticket.roomName} - ${ticket.seatNo}</td>
								<td>${ticket.roomType}</td>
								<td>
									<select style="width: 300px; border: 1px solid #C0C0C0;">
										<option value="어른" ${ticket.type == '어른'? 'selected':'' }>어른</option>
										<option value="어린이" ${ticket.type == '어린이'? 'selected':'' }>어린이</option>
										<option></option>
									</select>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="text-end mt-5">
		<button class="btn btn-dark">수정</button>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#cancel-div").click(function() {
			location.replace("http://localhost/train/reservationList.nadri")
		})
		
		
	})
</script>
</body>
</html>