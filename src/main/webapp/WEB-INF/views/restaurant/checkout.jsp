<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	#confirm{
		border-top: 1px solid;
	}
	#reservation-info{
		border-bottom: 1px solid;
	}
	#coupon-point{
		border-bottom: 1px;
	}
	#final-price{
		border-top: 1px solid;
	}
	#rt-img{
		height: 150px;
		width: 200px;
	}

</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h2>결제</h2>
		</div>
	</div>
	<div class="row mb-3 p-3 border">
		<div class="col">
			<form action="">
				<div class="row m-3 p-3 border">
					<div class="col p-3">
						<h4>1. 예약 확인</h4>
					</div>
					<div>
						<table class="table p-3" id="confirm">
							<tbody>
								<tr>
									<td rowspan="2" style="width: 20%"><img id="rt-img" alt="" src="${restaurant.picture }"></td>
									<td style="width: 80%"><h2><strong>${restaurant.name }</strong></h2></td>
								</tr>
								<tr>
									<td>
										<div class="row mb-3">
											<div class="col-3">
												<p>날짜: ${register.reservedDate }</p>
												<input type="hidden" name="reservedDate" value="${register.reservedDate }"/>
											</div>
											<div class="col-3">
												<p>예약 시간: ${time.startTime }</p>
												<input type="hidden" name="timetableNo" value="${register.timetableNo }">
											</div>
											<div class="col-3">
												<p>어른: ${register.adult }명</p>
												<input type="hidden" name="adult" value="${register.adult }">
											</div>
											<div class="col-3">
												<p>아이: ${register.child }명</p>
												<input type="hidden" name="child" value="${register.child }"/>
											</div>
												<input type="hidden" name="people" value="${register.people }"/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row m-3 p-3 border">
					<div class="col p-3" id="reservation-info">
						<h4>2. 예약자 정보 입력</h4>
					</div>
					<div class="p-3">
						<div class="m-3">
							<label class="form-label">예약자 이름*</label>
							<input type="text" class="form-control" name="reservedName"/>
						</div>
						<div class="m-3">
							<label class="form-label">예약자 전화번호*</label>
							<input type="text" class="form-control" name="tel" placeholder="010-****-****"/>
						</div>
					</div>
				</div>
				<div class="row border p-3 m-3">
					<div class="col p-3">
						<div class="m-3" id="coupon-point">
							<div>
								<h5>보유 쿠폰</h5>
							</div>
							<div class="row">
								<div class="col">
									<select class="form-select">
										<option value=""></option>
									</select>
								</div>
							</div>
						</div>
						<div class="m-3">				
							<div>
								<div>
									<h5>보유 포인트: 10000</h5>
								</div>
								<div>
									<span>사용 포인트: </span>
									<input type="number" class="form-control" min="0" name="usedpoint"/>
								</div>
							</div>
						</div>
					</div>
					<div id="final-price" class="p-3">
						<h4>= 총 결제 금액: <strong id="total-amount" data-total-amount="">15000</strong>원</h4>
						<input type="hidden" name="deposit" value="0"/>
					</div>
				</div>
				<div class="row p-3 m-3">
					<div class="col d-flex justify-content-center gap-3">
						<a href="detail.nadri?no=${restaurant.no }" class="btn btn-danger g-3">취소</a>
						<button type="submit" id="btn-pay" class="btn btn-primary g-3">결제</button>
					</div>
				</div>
			</form>
		</div>
	</div>


</div>
<script type="text/javascript">
	$(function() {
		$("#btn-pay").click(function(e) {
			
			$.ajax({
				type: 'get',
				url: '/order/pay',
				data: {
					id: $("#book-title").attr("data-book-id"),
					quantity: 1,
					total_amount: $("#total-amount").attr("data-total-amount"),
				},
				success:function(response) {
					window.open(response.next_redirect_pc_url, "결제창", "toolbar=yes,scrollbars=no,resizable=no,top=500,left=500,width=500,height=800");
				}
			});
		});
	})
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>