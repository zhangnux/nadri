<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-3 order-md-last detail">

	<form id="attr-option" action="#" method="post">
		<div class="rounded mb-3 p-4" style="background-color:#f5f6f7;">
			<h5><strong>티켓구매</strong></h5>
			<div class="border p-4 mt-3" style="background-color:white;">
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
									<input type="hidden" name="" value="${opt.price }"> <fmt:formatNumber value="${opt.price }" pattern="0,000" />원</a>
								</div>
								<div class="col-4">
									<h5>
									<span onclick=""><i class="bi bi-arrow-left-circle"></i></span>
									<span class="updown">&nbsp;0&nbsp;</span>
									<span onclick=""><i class="bi bi-arrow-right-circle"></i></span>
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
									<a style="font-size:18px;">1인
									<input type="hidden" name="" value="${detail.price }">
									${detail.discountPrice }
									${detail.price }
									<br>
										<fmt:formatNumber value="${(detail.discountPrice==0)?detail.price:detail.discountPrice }"
															pattern="###,###,###" />원
									</a>
								</div>
								<div class="col-4">
									<h5>
									<span onclick=""><i class="bi bi-arrow-left-circle"></i></span>
									<span class="updown">&nbsp;0&nbsp;</span>
									<span onclick=""><i class="bi bi-arrow-right-circle"></i></span>
									</h5>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
	
			</div>
			<div class="mt-3 text-end">
			<strong><span id="sum">총 금액: 0원</span>　　</strong>
				<c:choose>
					<c:when test="${empty LOGIN_USER }"></c:when>
					<c:otherwise>
						<button class="btn btn-primary btn-lg">결제하기</button>
					</c:otherwise>
				</c:choose>
			</div>					
		</div>
	</form>
	<script>
			
		
	</script>

	<div class="input-group text-center border rounded p-4 ">
	모달창으로 발급가능한 쿠폰 띄우기
	</div>
</div>