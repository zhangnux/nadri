<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="row mt-5 mb-4"><h2><strong>결제하기</strong></h2></div>
			
	<form action="kakao" method="post">
		<div class="border rounded p-3 mb-3">
			<div class="row mb-4 border-bottom"><h3><strong>구매상품</strong></h3></div>
			<div class="row mb-3">
				<div class="col-auto"><img src="../../../resources/images/att/review/reviewtest.jpg" style="width:100px;height:100px;object-fit:cover"></div>
				<div class="col-8"><h4><strong>이름이 들어갈 곳</strong></h4></div>
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>사용일</strong></h5></div>
				<div class="col-9">0000년00월00일</div>						
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>구매상품</strong></h5></div>
				<div class="col-5"><strong>옵션이름</strong></div>						
				<div class="col-4">0매 0원</div>						
			</div>	
			<div class="row mt-3">
				<div class="col-8"><h5><strong>총 결제금액</strong></h5></div>
				<div class="col-4">0원</div>						
			</div>
		</div>
		<div class="border rounded p-3 mb-3">								
			<div class="row mb-4 border-bottom"><h3><strong>할인 적용</strong></h3></div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>쿠폰선택</strong></h5></div>
				<div class="col-9">
					<select class="form-select" aria-label="Default select example">
					  <option selected>사용할 쿠폰을 선택하세요</option>
					  <option value="1">One</option>
					  <option value="2">Two</option>
					  <option value="3">Three</option>
					</select>
				</div>						
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>총 할인금액</strong></h5></div>
				<div class="col-9">0원</div>						
			</div>
			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col-5"><h5><strong>최종 할인금액</strong></h5></div>
				<div class="col-4">0원</div>						
			</div>
		</div>
		<div class="border rounded p-3 mb-3">								
			<div class="row mb-4 border-bottom"><h3><strong>예약자 정보</strong></h3></div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>예약자명</strong></h5></div>
				<div class="col-9">홍길동</div>						
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>이메일 주소</strong></h5></div>
				<div class="col-9">aa@aa.aa</div>						
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>휴대폰 번호</strong></h5></div>
				<div class="col-9"><input type="text" value="010-" maxlength="13" required></div>						
			</div>
		</div>	
		<div class="border rounded p-3 mb-4">
			<div class="row mb-4 border-bottom"><h3><strong>결제방법</strong></h3></div>
			<div class="row mt-3 p-2">
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
				  <label class="form-check-label" for="flexRadioDefault1">
				    무통장입금
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  <label class="form-check-label" for="flexRadioDefault2">
				    카카오페이&nbsp;<img src="https://developers.kakao.com/tool/resource/static/img/button/pay/payment_icon_yellow_small.png" style="height:20px;">
				  </label>
				</div>						
			</div>			
		</div>
		<div class="row text-end mb-5">
			<button type="submit" class="btn btn-outline-primary">결제하기</button>
		</div>
		
		<button type="submit" id="apibtn" class="btn btn-primary">카카오페이</button>
		<script>
		/* $(function(){
			$('#apibtn').click(function(){
				$.ajax({
					url:'kakao',
					dataType:'json',
					success:function(data){
						console.log(data)
						//var box = data.resp.next_redirect_pc_url;
						//window.open(box); // 새창 열기
						//location.href = box;
					},
					error:function(error){
						console.log(error)
					}
				});
			});
		});		 */
		</script>

															
	</form>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>