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
	#reservationTable td, th{
		border: 1px solid #C0C0C0;
		height: 50px;
	}
	
	#reservationTable td {
		height: 70px;
	}
	
	#reservationTable {
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
	
	#credit-btn button {
		height: 45px;
		width: 150px;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
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
		<div class="col-4 p-4 active" id="cancel-div">
			발권/취소
		</div>
		<div class="col-4 p-4" id="modify-div">
			예약변경
		</div>
		<div class="col-4 p-4">
			이용내역
		</div>
	</div>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				'${sessionScope.LOGIN_USER.name }' 고객님의 예약 및 발권내역은 아래와 같습니다.
			</li>
			<li class="mt-2">
				출발시각 이전까지 예약한 승차권을 발권받지 않은 경우 자동 예약 좌석이 자동으로 취소되며, 위약금(결제금액의 15%)이 발생하니 반드시 승차권을 발권하시기 바랍니다.
			</li>
			<li class="mt-2">
				최대 <strong>2</strong>개의 예약 건을 결제하실 수 있습니다.
			</li>
			<li class="mt-2">
				반환요청 하실 티켓을 선택한 다음 반환요청 버튼을 눌러주세요.
			</li>
		</ul>
		<ul style="display: none;">
			<li>
				'${sessionScope.LOGIN_USER.name }' 고객님의 예약 및 발권내역은 아래와 같습니다.
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
			<form action="/train/refund.nadri" method="get" id="form-refund">
				<input type="hidden" name="reservationNo1" >
			</form>
			<form action="/train/payment.nadri" method="get" id="form-modify">
				<table class="text-center" id="reservationTable">
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
							<th width="13%">예약취소/환불</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty reservationList }">
								<c:forEach var="reservation" items="${reservationList }">
								<tr>
									<td data-reservation-no="${reservation.no }">
									<c:if test="${reservation.tickectStatus eq '예약' }">
										<input type="checkbox" name="reservationNo" value="${reservation.no }">
									</c:if>
									</td>
									<td><fmt:formatDate value="${reservation.departureTime }" pattern="yyyy-MM-dd"/></td>
									<td>${reservation.trainName } - ${reservation.trainNo }</td>
									<td>${reservation.departureStation }<div><fmt:formatDate value="${reservation.departureTime }" pattern="HH:mm"/></div></td>
									<td>${reservation.arrivalStation }<div><fmt:formatDate value="${reservation.arrivalTime }" pattern="HH:mm"/></div></td>
									<td>${reservation.totalCount }</td>
									<td><fmt:formatNumber value="${reservation.totalPrice }" pattern="##,###"/></td>
									<td>${reservation.diffTime }</td>
									<c:choose>
										<c:when test="${reservation.tickectStatus eq '예약' }">
											<td class="text-danger fw-bold"><fmt:formatDate value="${reservation.reservationDate }" pattern="HH시 mm분까지" />
												<button type="button" class="btn btn-payment" style="border: 1px solid black; height: 25px;">결제하기</button>
											</td>
											<td><button type="button" class="btn btn-cancel" style="background-color: #7E5C5E; color: white;">예약 취소</button></td>
										</c:when>
										<c:when test="${reservation.tickectStatus eq '결제' }">
											<td>결제 완료</td>
											<td><button type="button" class="btn btn-refund" style="background-color: #A0A0A0; color: white;">환불</button></td>
										</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="10" class="p-5">예약된 내역이 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="text-end mt-5 text-center" id="credit-btn">
		<button class="btn btn-dark">결제하기</button>
		<button class="btn border" style="display: none;">인원변경</button>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#modify-div").click(function() {
			$("#reservationTable").find('th').last().hide()
			$("#reservationTable").find('td:nth-of-type(10)').hide().prev().find('button').hide()
			$("input[name=reservationNo]").attr('type', 'radio');
			$("#credit-btn").children().hide().next().show()
			$(this).addClass('active').siblings().removeClass('active')
			$("#explanation").hide().next().show()
		})
		
		$("#cancel-div").click(function() {
			$("#reservationTable").find('th').last().show()
			$("#reservationTable").find('td:nth-of-type(10)').show().prev().find('button').show()
			$("#credit-btn").children().show().next().hide()
			$("input[name=reservationNo]").attr('type', 'checkbox');
			$(this).addClass('active').siblings().removeClass('active')
			$("#explanation").show().next().hide()
		})
		
		// 다중 결제하기 버튼
		$("#credit-btn > button:first-child").click(function() {
 			if ($(":checked").val() == null) {
				alert("결제하실 표를 선택해 주세요.")
				return;
			} 
			
			if ($(":checked").length > 2) {
				alert("2개 이상은 결제하실 수 없습니다.")
				return;
			}
			
			$("#form-modify").attr('action', '/train/payment.nadri')
			$("#form-modify").submit()
		})
		
		// 단일 결제하기 버튼
		$(".btn-payment").click(function() {
			$(":checked").prop('checked', false)
			console.log($(this).parent().prevAll().eq(7).children())
			$(this).parent().prevAll().eq(7).children().prop('checked', true)
			
			$("#form-modify").attr('action', '/train/payment.nadri')
			$("#form-modify").submit()
		})
		
		$(".btn-refund").click(function() {
			let target = $(this).parent().prevAll().eq(8).attr('data-reservation-no')
			$("[name=reservationNo1]").val(target)
			$("#form-refund").submit()
		})
		
		// 예약변경 버튼
		$("#credit-btn > button:nth-child(2)").click(function() {
			if ($(":checked").val() != null) {
				$("#form-modify").attr('action', '/train/modify.nadri')
				$("#form-modify").submit()
			} else {
				alert("변경하실 표를 선택해 주세요.")
			}
		})
		
		// 예약취소버튼
		$(".btn-cancel").click(function() {
			let cancel = confirm("예약을 취소하시겠습니까?")
			let $btn = $(this)
			if (cancel) {
				let target = $(this).parent().siblings().eq(0).children().val()
				$.ajax({type:'DELETE',
						dataType:'json',
						url:"/api/train/reservation/" + target,
						success:function() {
							$btn.closest('tr').remove()
							alert("취소가 완료되었습니다.")
						},
						error:function() {
							
						},
						statusCode:{
							404:function() {
								$btn.closest('tr').remove()
								alert("취소된 예약정보 입니다.")
							}
						}
				})
			}
		})
	
	})
</script>
</body>
</html>