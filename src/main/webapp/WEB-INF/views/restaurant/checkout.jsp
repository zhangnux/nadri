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
				<div class="row p-3">
					<div class="col p-3">
						<h4>1. 예약 확인</h4>
					</div>
					<div>
						<table class="table p-3" id="confirm">
							<tbody>
								<tr>
									<td rowspan="2" style="width: 20%"><img alt="" src=""></td>
									<td style="width: 80%"><h5>Nantes</h3></td>
								</tr>
								<tr>
									<td>
										<div class="row mb-3">
											<div class="col-3">
												<label class="form-labeL">날짜</label>
												<input type="date" value="" class="form-control" name="reservedDate" />
											</div>
											<div class="col-3">
												<label class="form-label">시간</label>
												<select class="form-select">
													<option value=""></option>
												</select>
											</div>
											<div class="col-3">
												<label class="form-label">어른</label>
												<select class="form-select">
													<option value="1">1명</option>
													<option value="2">2명</option>
													<option value="3">3명</option>
													<option value="4">4명</option>
												</select>
											</div>
											<div class="col-3">
												<label class="form-label">아이</label>
												<select class="form-select">
													<option value="1">1명</option>
													<option value="2">2명</option>
													<option value="3">3명</option>
													<option value="4">4명</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row p-3">
					<div class="col p-3" id="reservation-info">
						<h4>2. 예약자 정보 입력</h4>
					</div>
					<div class="p-3">
						<div>
							<label class="form-label">예약자 이름*</label>
							<input type="text" class="form-control" name="reservedName"/>
						</div>
						<div>
							<label class="form-label">예약자 전화번호*</label>
							<input type="text" class="form-control" name="tel" placeholder="010-****-****"/>
						</div>
					</div>
				</div>
				<div class="row border p-3">
					<div class="col p-3" id="coupon-point">
						<div>
							<h5>보유 쿠폰</h5>
						</div>
						<div>
							<h5>보유 포인트: 10000</h5>
							<label class="form-label">사용 포인트:</label>
							<input type="number" class="form-control" name="usedpoint"/>
						</div>
					</div>
					<div id="final-price" class="p-3">
						<h4>= 총 결제 금액: <strong>15000</strong>원</h4>
					</div>
				</div>
				<div class="p-3">
					<a href="#" class="btn btn-danger g-3">취소</a>
					<a href="#" class="btn btn-primary g-3">결제</a>
				</div>
			</form>
		</div>
	</div>


</div>
<script type="text/javascript"></script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>