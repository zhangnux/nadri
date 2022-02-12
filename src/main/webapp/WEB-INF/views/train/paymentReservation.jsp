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
	#table-price {
		width: 100%;
		height: 45px;
	}
	td, th{
		border: 1px solid #E0E0E0;
		height: 45px;
	}
	
	table {
		text-align: center;
		width: 100%;
	}
	.paymentType button.active {
		box-shadow: 0 0 0 0.25rem rgb(13 110 253 / 25%); 
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row my-5">
		<div class="col">
			<h2>결제하기</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu6" value="payment"/>
	<c:set var="active" value="menu6"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				결제수단은 카카오페이가 있습니다.
			</li>
			<li class="mt-2">
				결제수단을 선택하신 후 결제확인 버튼을 클릭해 주시길 바랍니다.
			</li>
			<li>
				승차권 발권을 위해 승차자 이름을 입력해주세요.
			</li>
		</ul>
	</div>
	<div>
		<table class="border" id="table-price">
			<tbody>
				<tr>
					<th class="text-center" style="width: 17%; background-color: #E6ECF3;">결제금액</th>
					<td class="ps-4 text-start"><fmt:formatNumber value="${reservation1.totalPrice + reservation2.totalPrice}" pattern="##,###"/> 원</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="mt-5">
		<h4>결제수단 선택</h4>
	</div>
	<div class="mt-3 paymentType">
		<button class="btn text-center p-2 focus" style="width: 200px; height: 80px; border: 1px solid black;" data-payment-type="kakao">
			<strong style="font-size: 25px;">pay</strong>
			<div>카카오페이</div>
		</button>
	</div>
	<div class="mt-5">
		<h4>발권</h4>
	</div>
	<div class="row mt-4">
		<div class="col">
			<form action="#" method="post">
				<input name="totalPrice" type="hidden" value="${reservation1.totalPrice + reservation2.totalPrice}">
				<input name="totalCount" type="hidden" value="${reservation1.totalCount + reservation2.totalCount}">
				<input name="paymentType" type="hidden">
				<input name="reservationNo1" type="hidden" value="${reservation1.no }">
				<input name="reservationNo2" type="hidden" value="${reservation2.no }">
				<table class="text-center" id="train1">
					<thead>
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
						<th>승차자명</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${ticket1 }">
						<tr>
							<td data-ticket="${ticket.no }" >${ticket.roomType }</td>
							<td>${ticket.roomName } <span> ${ticket.seatNo }</span></td>
							<td>${ticket.type }</td>
							<td><fmt:formatNumber value="${ticket.price }" pattern="##,###"/>원</td>
							<td><input type="text" name="name"/></td>
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
							<th>승차자명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ticket" items="${ticket2 }">
							<tr>
								<td data-ticket="${ticket.no }">${ticket.roomType }</td>
								<td>${ticket.roomName } <span> ${ticket.seatNo }</span></td>
								<td>${ticket.type }</td>
								<td><fmt:formatNumber value="${ticket.price }" pattern="##,###"/>원</td>
								<td ><input type="text" name="name"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
	<div class="text-end mt-3">
		<button class="btn btn-outline-dark btn-payment" style="border-radius: 0;">결제하기</button>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	$(function() {
		
		$(".paymentType button").click(function() {
			$("[name=paymentType]").val($(this).attr('data-payment-type'))
			$(this).toggleClass('active')
			
		})	
	
		$(".btn-payment").click(function() {
			let paymentNo = $("[name=reservationNo1]").val() + " " + $("[name=reservationNo2]").val()
			let no = new Array()
			$("[data-ticket]").each(function(index, element) {
				no.push($(this).attr("data-ticket"))
			})
			let name = new Array()
			$("[name=name]").each(function(index, element) {
				if ($(this).val() != '') {
					name.push($(this).val())
				}
			})
			
			if (name.length != no.length) {
				alert("모든 승차자명을 입력해주시길 바랍니다.")
				return;
			}
			
			let result = {totalPrice:$("[name=totalPrice]").val() , totalCount:$("[name=totalCount]").val(),
					reservationNo:paymentNo, no, name}
			
			let jsonData = JSON.stringify(result)
			if ($("[name=paymentType]").val() == '') {
				alert("결제수단을 선택해주시길 바랍니다.")
				return;
			}
			
			// [{no:100, name:"홍길동"}, {no:101 name:"이순신"}]
			if ($("[name=paymentType]").val() == 'kakao') {
				$.ajax({type:"PUT",
						url:'/api/train/kakaoPay',
						data:jsonData,
						contentType: "application/json",
						traditional:true,
						dataType: 'json',
						success:function(response) {
							console.log(response)
							console.log(response.tid)
							$.getJSON(
								'/api/train/progress',
								{tid:response.tid}
							)
							$(location).attr('href', response.next_redirect_pc_url);
						},
						statusCode:{
							404:function() {
								alert("취소된 예약정보 입니다.")
								location.replace("http://localhost/train/reservationList.nadri");
							}
						}
				})
			}
		})
	
	})
</script>
</html>