<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<title>예약내용 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col mt-5 text-center">
			<h1><strong>예약정보조회</strong></h1>
		</div>
	</div>
	<div>
		<div class="row border rounded mt-3 p-4">
			<div class="col text-center">
				<h2><strong>${options[0].attName }</strong></h2>
			</div>
			<div class="row mt-4">
				<div class="col"><h4><strong>예약자 정보</strong></h4></div>
			</div>
			<div class="border rounded p-3">
				<div class="row">
					<div class="col-3"><strong>이름</strong></div>
					<div class="col-9">${options[0].buyerName }</div>
				</div>
				<div class="row">
					<div class="col-3"><strong>이메일</strong></div>
					<div class="col-9">${options[0].buyerEmail }</div>
				</div>
				<div class="row">
					<div class="col-3"><strong>전화번호</strong></div>
					<div class="col-9">${options[0].buyerTel }</div>
				</div>
			</div>
			<!-- forEach -->
			<c:choose>
				<c:when test="${not empty options[0].optionName }">
					<div class="row mt-3">
						<div class="col"><h4><strong>구매상품</strong></h4></div>
					</div>
					<c:forEach var="o" items="${options }">
						<div class="border rounded p-3 mb-1">
							<div class="row">
								<div class="col-7"><strong>${o.optionName }</strong></div>
								<div class="col-5">
									${o.productQuantity }매 / ${o.productQuantity*o.optionPrice }원</div>
									<input type="hidden" value="${o.productQuantity*o.optionPrice }" class="amount">
							</div>
						</div>
					</c:forEach>
					<div class="text-end mt-3">
						<div class="row">
							<div class="col">총 금액: <span id="totalAmount">${options[0].price*options[0].totalQuantity }</span></div>
						</div>
						<div class="row">
							<div class="col" style="color:red;"><strong>- 할인 금액: <span id="discountAmount"></span></strong></div>
							<div><strong>──────────</strong></div>
						</div>
						<script>
							$(function(){
								
								var optionAmount=0;
								$("input.amount").each(function(){
									optionAmount+=parseInt($(this).val());
								})
								$("#totalAmount").text(optionAmount);
							
							})
						</script>
				</c:when>
				<c:otherwise>
					<div class="text-end mt-3">
						<div class="row">
							<div class="col">총 금액: <span id="totalAmount">${options[0].price }</span></div>
						</div>
						<div class="row">
							<div class="col" style="color:red;"><strong>- 할인 금액: <span id="discountAmount"></span></strong></div>
							<div><strong>──────────</strong></div>
						</div>
				</c:otherwise>
			</c:choose>
			<!-- 총합 -->
				<div class="row">
					<div class="col"><strong>결제 금액: ${options[0].totalQuantity }매 / <span id="lastAmount">${options[0].lastPrice }</span></strong></div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col text-center">
				<button class="btn btn-primary" onclick="self.close();">닫기</button>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	
	var total = $("#totalAmount").text();
	var last = $("#lastAmount").text();
	var discount = total-last;
	$("#discountAmount").text(discount);
	
})
</script>
</body>
</html>