<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>nadri</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	td, th{
		border: 1px solid #E0E0E0;
		height: 45px;
	}
	
	table {
		text-align: center;
		width: 100%;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col">
			<h2>예약 확인</h2>
		</div>
	</div>
	<c:set var="menu1" value="search"/>
	<c:set var="menu3" value="confirmReservation"/>
	<c:set var="active" value="menu3"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="border p-4 mt-4">
		10분 내에 결제하지 않으면 취소됩니다.
	</div>
	<div class="row mt-4">
		<div class="col">
			<form action="/train/payment.nadri" method="get" id="form-payment">
				<input name="reservationNo" type="hidden" value="${reservation1.no }">
				<c:if test="${not empty reservation2 }">
					<input name="reservationNo" type="hidden" value="${reservation2.no }">
				</c:if>
				<table class="text-center" id="train1">
					<thead>
						<tr>
							<th class="text-start px-3" colspan="9" style="background-color: #7E5C5E; color: white;">가는 열차</th>
						</tr>
						<tr style="background-color: #FFF7F8;">
							<th width="11%">승차일자</th>
							<th width="11%">열차종류</th>
							<th width="11%">열차번호</th>
							<th width="10%">출발역</th>
							<th width="10%">도착역</th>
							<th width="11%">출발시간</th>
							<th width="11%">도착시간</th>
							<th width="11%">인원</th>
							<th width="14%">총 결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><fmt:formatDate value="${reservation1.departureTime }" pattern="MM월 dd일" /></td>
							<td>${reservation1.trainName }</td>
							<td>${reservation1.trainNo }</td>
							<td>${reservation1.departureStation }</td>
							<td>${reservation1.arrivalStation }</td>
							<td><fmt:formatDate value="${reservation1.departureTime }" pattern="HH:mm" /></td>
							<td><fmt:formatDate value="${reservation1.arrivalTime }" pattern="HH:mm" /></td>
							<td>${reservation1.totalCount }</td>
							<td><fmt:formatNumber value="${reservation1.totalPrice }" pattern="##,###"/>원</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row mt-3">
		<div class="col">
			<table>
				<thead>
					<tr style="background-color: #FFF7F8; border-top: 2px solid black;">
						<th>객실등급</th>
						<th>좌석정보</th>
						<th>승객유형</th>
						<th>운임</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${ticket1 }">
						<tr>
							<td>${ticket.roomType }</td>
							<td>${ticket.roomName } <span> ${ticket.seatNo }</span></td>
							<td>${ticket.type }</td>
							<td><fmt:formatNumber value="${ticket.price }" pattern="##,###"/>원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<c:if test="${not empty reservation2 }">
		<div class="row mt-5">
			<div class="col">
				<table class="text-center" id="train2">
					<thead>
						<tr>
							<th class="text-start px-3" colspan="9" style="background-color: #577495; color: white;">오는 열차</th>
						</tr>
						<tr style="background-color: #EFF7FF;">
							<th width="11%">승차일자</th>
							<th width="11%">열차종류</th>
							<th width="11%">열차번호</th>
							<th width="10%">출발역</th>
							<th width="10%">도착역</th>
							<th width="11%">출발시간</th>
							<th width="11%">도착시간</th>
							<th width="11%">인원</th>
							<th width="14%">총 결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><fmt:formatDate value="${reservation2.departureTime }" pattern="MM월 dd일" /></td>
							<td>${reservation2.trainName }</td>
							<td>${reservation2.trainNo }</td>
							<td>${reservation2.departureStation }</td>
							<td>${reservation2.arrivalStation }</td>
							<td><fmt:formatDate value="${reservation2.departureTime }" pattern="HH:mm" /></td>
							<td><fmt:formatDate value="${reservation2.arrivalTime }" pattern="HH:mm" /></td>
							<td>${reservation2.totalCount }</td>
							<td><fmt:formatNumber value="${reservation2.totalPrice }" pattern="##,###"/>원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<table>
					<thead>
						<tr style="background-color: #EFF7FF; border-top: 2px solid black;">
							<th>객실등급</th>
							<th>좌석정보</th>
							<th>승객유형</th>
							<th>운임</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ticket" items="${ticket2 }">
							<tr>
								<td>${ticket.roomType }</td>
								<td>${ticket.roomName } <span> ${ticket.seatNo }</span></td>
								<td>${ticket.type }</td>
								<td><fmt:formatNumber value="${ticket.price }" pattern="##,###"/>원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
	<div class="text-end mt-3">
		<button class="btn btn-outline-dark submit-btn" style="border-radius: 0;" type="button">결제하기</button>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		$(".submit-btn").click(function() {
			$("#form-payment").submit();
		})
	})
</script>
</html>