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
									<td style="width: 80%"><h2><strong id="restaurantName" data-rt-no="${restaurant.no }">${restaurant.name }</strong></h2></td>
								</tr>
								<tr>
									<td>
										<div class="row mb-3">
											<div class="col-3">
												<input type="hidden" name="restaurantNo" value="${restaurant.no }"/>
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
							<input type="text" value="${LOGIN_USER.name }" class="form-control" name="reservedName"/>
						</div>
						<div class="m-3">
							<label class="form-label">예약자 전화번호*</label>
							<input type="text" value="${LOGIN_USER.tel }" class="form-control" name="tel" placeholder="010-****-****"/>
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
									<select class="form-select" id="select-coupon" name="coupon">
									</select>
								</div>
							</div>
						</div>
					</div>
					<div>
					
					</div>
					<div id="final-price" class="p-3 m-3">
						<h4> = 총 결제 금액: <strong id="final-deposit" data-total-price="${register.deposit }"><span>${register.deposit }</span></strong>원</h4>
						<input type="hidden" name="deposit" value="0"/>
					</div>
				</div>
				<div class="row p-3 m-3">
					<div class="col d-flex justify-content-center gap-3">
						<a href="detail.nadri?no=${restaurant.no }" class="btn btn-danger g-3">취소</a>
						<button type="button" id="btn-pay" class="btn btn-primary g-3">결제</button>
					</div>
				</div>
			</form>
		</div>
	</div>


</div>
<script type="text/javascript">
	
	/*
	function getCouponList(){
		// 쿠폰리스트출력
		 $.ajax({
			 type:"get",
			 url:"",
			 success:function(couponList){
				 var htmls=""
				 if(couponList==0){
					 htmls+="보유한 쿠폰이 없습니다."
				 } else {
					 htmls+="	<option selected disabled>사용할 쿠폰을 선택하세요</option>"
					 $(coulist).each(function(){
						 htmls+="<option value="+this.couponNo+">"+this.couponName+" / 할인율 "+this.discountRate+"%</option>"
					 })
				 }
				 $("#select-coupon").html(htmls);
			 } 
		 })
	}
	*/


	$(function() {
		$("#btn-pay").click(function(e) {
			// 로그인
			if("${LOGIN_USER}" == ""){
				e.preventDefault()
				alert("로그인 후 이용하실 수 있습니다.")
				return location.replace("http://localhost/user/login.nadri");
			}
			
			// 이름, 전화번호 입력 확인
			
			if($(":input[name=reservedName]").val()==""){
				alert("이름을 입력해주세요");
				return;
			}
			
			if($(":input[name=tel]").val()==""){
				alert("연락 가능한 전화번호를 입력해주세요");
				return;
			}
			
			// 나중에 쿠폰 추가
			
			
			
			var restaurantNo= $("#restaurantName").attr("data-rt-no");
			var quantity = 1;
			var deposit = $("#final-deposit").attr("data-total-price");
			var reservedName = $(":input[name=reservedName]").val();
			var tel = $(":input[name=tel]").val();
			var reservedDate = $(":input[name=reservedDate]").val();
			var timetableNo = $(":input[name=timetableNo]").val();
			var child = $(":input[name=child]").val();
			var adult = $(":input[name=adult]").val();
			var people = $(":input[name=people]").val();
			

			$.ajax({
				type: 'post',
				url: '/restaurant/pay/ready.nadri',
				data: {
					restaurantNo: restaurantNo,
					quantity: quantity,
					deposit: deposit,
					reservedName: reservedName,
					tel: tel,
					reservedDate: reservedDate,
					timetableNo: timetableNo,
					child: child,
					adult: adult,
					people: people
				},
				success:function(response) {
					location.href= response.next_redirect_pc_url;
				}
			});
			
		});
	})
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>