<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-4 order-md-last detail">

	<form id="attr-option" action="orderform.nadri" method="post">
		<div class="rounded mb-3 p-4" style="background-color:#f5f6f7;">
			<h5><strong>티켓구매</strong></h5>
			<div class="border p-4 mt-3" style="background-color:white;" id="ticket">
				<div class="mb-3">
					<strong>날짜</strong>
					<input type="Date" name="attdate" id="startdate">
				</div>
				<c:choose>
					<c:when test="${!empty option }">
						<c:forEach var="opt" items="${option }">
						<div class="optionselect border rounded p-3 mb-2">
							<div class="row mb-2">
								<div class="col">
									<h5><strong>${opt.option}</strong></h5>
								</div>
							</div>
							<div class="row text-end">
								<div class="col-8">
									<a style="font-size:18px;">1인
										<input type="hidden" name="item${opt.optNo }" value="${opt.price }" data-no="${opt.optNo }" disabled >
										<input type="hidden" name="productQuantity" id="quantity-${opt.optNo }" value="0" >
										<fmt:formatNumber value="${opt.price }" pattern="0,000" />원
									</a>
									<input type="hidden" name="optionNo" value="${opt.optNo }" />
									<input type="hidden" name="optionName" value="${opt.option}" />
									<input type="hidden" name="optionPrice" value="${opt.price}" />
								</div>
								<div class="col-4">
									<h5>
										<i class="bi bi-arrow-left-circle down" id="${opt.optNo }" data-down="${opt.optNo }"></i></span>
										<span class="sum" id="${opt.optNo }">0</span>
										<i class="bi bi-arrow-right-circle up" id="${opt.optNo }" data-up="${opt.optNo }"></i></span>
									</h5>
								</div>
							</div>
						</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="optionselect border rounded p-3 mb-2">
							<div class="row mb-2">
								<div class="col">
									<h5><strong>수량</strong></h5>
								</div>
							</div>
							<div class="row text-end">
								<div class="col-8">
									<span style="font-size:18px;">1인
									<span style="font-size:18px;" class="price">
										<input type="hidden" name="item1" value="${(detail.discountPrice==0)?detail.price:detail.discountPrice }" disabled>
										<fmt:formatNumber value="${(detail.discountPrice==0)?detail.price:detail.discountPrice }" pattern="###,###,###" />
									</span>원</span>								
								</div>
								<div class="col-4">
									<h5>
									<i class="bi bi-arrow-left-circle down" data-down="1"></i>
									<span class="sum">0</span>
									<i class="bi bi-arrow-right-circle up" data-up="1"></i>
									<input type="hidden" name="productQuantity" id="quantity-1" value="0" />	
									</h5>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
	
			</div>
			<div class="mt-3 text-end">
			<strong>
				총 금액: 
				<input type="hidden" name="price" value="0"><span id="total">0</span>원　　
			</strong>
				<c:choose>
					<c:when test="${!empty LOGIN_USER }">
						<button class="btn btn-primary btn-lg order">결제하기</button>
					</c:when>
				</c:choose>
			</div>		
		</div>
		<input type="hidden" name="attNo" value="${param.no }">
		<input type="hidden" name="attName" value="${detail.name }">
		<input type="hidden" name="attPic" value="${detail.thumbnail }">
	</form>

	<!-- 쿠폰 -->
	<div class="coupon border rounded p-3" style="background-color:#f5f6f7;">
	<c:choose>
		<c:when test="${not empty couponList }">
		<div class="row mb-2"><h4><strong>발급 가능한 쿠폰</strong></h4></div>
			<c:forEach var="c" items="${couponList }">
				<div class="coupon-print border rounded p-3 mb-3" style="background-color:#ffffff;">
					<div class="row">
						<div class="col-12">
							<strong>${c.couponName }</strong>
						</div>
					</div>
					<div class="row">
						<div class="col">
						할인율: ${c.discountRate }%
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							사용기간 ~<fmt:formatDate value="${c.endDate }" pattern="yyyy-MM-dd"/>
						</div>
						<div class="col-6 text-end">
							<a class="btn btn-outline-warning" id="${c.couponNo }">발급받기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="text-center">로그인 후 할인 혜택을 확인하세요!</div>
		</c:otherwise>
	</c:choose>
	</div>
	<script>
	$(function(){	
		
		
		$("a.btn-outline-warning").click(function(){
			var couponNo=$(this).attr("id")
			var userNo = ${LOGIN_USER.no};
			$.ajax({
				type:"get",
				url:"addCoupon",
				data:{userno:userNo, couponno:couponNo},
				success: function(){
					alert("쿠폰 발급이 완료되었습니다.")
					location.reload();
				}
			})
		})
		
		/* 달력 설정 */
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 	
		today = yyyy+'-'+mm+'-'+dd;
		document.getElementById("startdate").setAttribute("min", today);
		
		
		$(".order").click(function(){
			// 날짜
			var attdate = $("#startdate").val();
			if(attdate == ''){
				alert("날짜를 선택해주세요");
				return false;
			}
			// 옵션
			var total = $("#total").text();
			if(total==0){
				alert("구매수량을 선택해주세요");
				return false;
			}
		})
		
		var total = 0
		
		$(".up").click(function(e){
			e.preventDefault();
			var sum =$(this).prev().text();
			var num = parseInt(sum);
			num++;
			$(this).prev().text(num);
			
			var optNo = $(this).data("up");
			var price = parseInt($('input[name=item'+optNo+']').val());
			total += price
			$("#total").text(total);
			$("input[name=price]").val(total);
			$("#quantity-" + optNo).val(num);
		});
		
		$(".down").click(function(e){
			e.preventDefault();
			var sum = $(this).next().text();
			var num = parseInt(sum);
			num--;
			if(num<0){
				return false;
			}
			$(this).next().text(num);
			
			var optNo = $(this).data("down");
			var price = parseInt($('input[name=item'+optNo+']').val());
			total = parseInt($('#total').text());
			if(total!=0){
				var newtotal = total-price;
				total=newtotal;
			}
			$("#total").text(newtotal);
			$("input[name=price]").val(newtotal);
			$("#quantity-" + optNo).val(num);

		});
		
	})
	</script>
	
</div>