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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>
	
	.btn {
		width: 100px;
		height: 46px;
		border-radius: 0;
		text-align-last: center;
		font-size: .875rem;
		padding: initial;
		font-weight: bold;
	}
	
	hr + div div, hr + div a {
		background-color: #E6ECF3;
		border: 1px solid #E0E0E0;
		cursor: pointer;
		text-decoration: none;
		color: black;
	}
	
	hr + div div.active {
		background-color: #495C75;
		border: 1px solid #E0E0E0;
		color: white;
	}

	.datepicker {
		border-radius: 0;
		border: 1px solid lightgray;
		height: 40px;
		width: 250px;
		padding: 5px 19px;
		font-size: 19px;
	}
	.table-list th {
		border: 1px solid lightgray;
		border-left: 0;
		background-color: aliceblue;
		width: 20%;
		text-align: center;
	}
	
	.table-list td {
		border-bottom: 1px solid lightgray;
		border-top: 1px solid lightgray;
	}
	
	.table-list {
		width: 100%;
		height: 62px;
	}
	
	#btn-search {
		background-color: gray;
		color: white;
	}
	#table-search {
		width: 100%;
	}
	#table-search th {
		border: 1px solid lightgray;
		height: 50px;
		background-color: #7E5C5E;
		color: white;
	}
	
	#table-search td {
		border-bottom: 1px solid lightgray;
		height: 65px;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
		<div class="row my-5">
		<div class="col">
			<h2>이용내역</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu9" value="search"/>
	<c:set var="active" value="menu9"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row text-center" style="padding: 12px 12px; font-size: 20px;">
		<div class="col-9 p-4 active">
			이용내역
		</div>
		<a href="/train/reservationList.nadri" class="col-3 p-4">
			발권/취소
		</a>
	</div>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				'${sessionScope.LOGIN_USER.name }' 고객님의 발권 및 환불내역을 확인하실 수 있습니다.
			</li>
		</ul>
	</div>
	<div class="row ">
		<div class="col">
			<form action="">
				<table class="table-list">
					<tbody>
						<tr>
							<th>승차일자</th>
							<td class="ps-5">
								<input type="text" class="datepicker" value="${param.dpDate1 }" name="date1" readonly="readonly">
								<span class="px-5"> ~ </span>
								<input type="text" class="datepicker" value="${param.dpDate2 }" name="date2" readonly="readonly">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col text-center">
			<button class="btn" type="button" id="btn-search">조회하기</button>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<table id="table-search" class="text-center">
				<thead>
					<tr>
						<th>승차일자</th>
						<th>열차번호</th>
						<th>출발역</th>
						<th>도착역</th>
						<th>인원</th>
						<th>발권 상태</th>
						<th>예약 상태</th>
						<th>금액</th>
					</tr>
				</thead>
				<tbody>
<%-- 					<c:choose>
						<c:when test="${not empty reservationList }">
							<c:forEach var="reservation" items="${reservationList }">
								<tr>
									<td><fmt:formatDate value="${reservation.departureTime }" pattern="yyyy-MM-dd"/></td>
									<td>${reservation.trainName } - ${reservation.trainNo }</td>
									<td>${reservation.departureStation }<div><fmt:formatDate value="${reservation.departureTime }" pattern="HH:mm"/></div></td>
									<td>${reservation.arrivalStation }<div><fmt:formatDate value="${reservation.arrivalTime }" pattern="HH:mm"/></div></td>
									<td>${reservation.totalCount }</td>
									<c:choose>
										<c:when test="${reservation.tickectStatus eq '결제' }">
											<td>결제완료</td>
										</c:when>
										<c:otherwise>
											<td>${reservation.tickectStatus }</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${reservation.isPrinted eq 'N' }">
											<td>미완료</td>
										</c:when>
										<c:otherwise>
											<td>발급완료</td>
										</c:otherwise>
									</c:choose>
									<td><fmt:formatNumber value="${reservation.totalPrice }" pattern="##,###"/></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="p-5">이용 내역이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose> --%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		let now = new Date(); 
		
		let nowDate = now.getFullYear() + "/" + (("00"+(now.getMonth()+1)).slice(-2)) + "/" + (("00"+now.getDate()).slice(-2))
		$(".datepicker").val(nowDate)
		
		$(function() {
		    $(".datepicker").datepicker({
		    	dateFormat: 'yy/mm/dd',
		    });
		});
		
		
	})
</script>
</html>