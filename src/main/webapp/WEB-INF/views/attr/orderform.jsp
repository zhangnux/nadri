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
				<div class="col-auto"><img src="../../../resources/images/att/${orderInfo.attPic }" style="width:100px;height:100px;object-fit:cover"></div>
				<div class="col-8"><h4><strong>${orderInfo.attName }</strong></h4></div>
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>사용일</strong></h5></div>
				<div class="col-9"><fmt:formatDate value="${orderInfo.attDate }" pattern="yyyy년 MM월 dd일"/></div>						
			</div>
<c:choose>
	<c:when test="${not empty optionInfo}">
		<c:forEach var="opt" items="${optionInfo }">
			<div class="row border rounded p-3 mb-2">
				<input type="hidden" name="optionNo" value="${opt.optionNo }" id="optNo${opt.optionNo }">
				<div class="col-5"><strong>${opt.optionName }</strong></div>						
				<div class="col-4">${opt.productQuantity }매　　
					<span onload="optquantity()" class="optionPrice${opt.optionNo }">${(opt.optionPrice)*(opt.productQuantity) }
					</span>원
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
 		<div class="row mt-3">
			<div class="col-3"><h5><strong>구매수량</strong></h5></div>
			<div class="col-4">${orderInfo.productQuantity }매　　<fmt:formatNumber value="${orderInfo.price }" pattern="###,###" />원</div>
		</div>
	</c:otherwise>
</c:choose>
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
				<div class="col-3" id="discount"><h5><strong>할인금액</strong></h5></div>
				<div class="col-9">0원</div>						
			</div>
			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col-5">
					<h5><strong>최종 결제금액</strong></h5>
				</div>
				<div class="col-4">
					<fmt:formatNumber value="${orderInfo.price }" pattern="###,###" />원
				</div>	
				<input type="hidden" name="lastprice" value="0">					
			</div>
		</div>

		<div class="border rounded p-3 mb-3">								
			<div class="row mb-4 border-bottom">
				<div class="col-auto">
					<h3><strong>예약자 정보</strong></h3>
				</div>
				<div class="col">
					<a class="btn btn-success" id="modifyInfo">예약정보변경</a>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>예약자명</strong></h5></div>
				<div class="col-auto originalName">${LOGIN_USER.name }</div>
				<input type="hidden" id="name" name="name" value="${LOGIN_USER.name }" maxlength="5" size="5" required>				
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>이메일 주소</strong></h5></div>
				<div class="col-9 originalEmail">${LOGIN_USER.email }</div>
				<input type="hidden" id="email" name="email" value="${LOGIN_USER.email }" maxlength="5" size="5" required>				
			</div>
			<div class="row mt-3">
				<div class="col-3" class="originalTel"><h5><strong>휴대폰 번호</strong></h5></div>
				<div class="col-9 originalTel">${LOGIN_USER.tel }</div>	
				<input type="hidden" id="tel" name="tel" value="${LOGIN_USER.tel }" maxlength="5" size="5" required>					
			</div>
			<div class="row mt-3 d-flex justify-content-center" id="modifybtn"><%-- 수정버튼 들어갈 곳 --%></div>
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

		<script>
		 $(function(){
			 
			 $('a#modifyInfo').click(function(){
				 $(this).hide();
				 editInfo();
			 });
			 
			 function editInfo(){
				 var originalName = $("#name").val();
				 
				 var name = "";
				 name += "<input type=\"text\" id=\"newName\" name=\"name\" value="+originalName+" maxlength=\"10\" size=\"20\" required>"
				 $(".originalName").html(name);
				 
				 var originalEmail = $("#email").val();
				 var mail = "";
				 mail += "<input type=\"text\" id=\"newEmail\" name=\"email\" value="+originalEmail+" maxlength=\"30\" size=\"20\" required>"
				 $(".originalEmail").html(mail);
				 
				 var originalTel = $("#tel").val();
				 var tel = "";
				 tel += "<input type=\"text\" id=\"newTel\" name=\"tel\" value="+originalTel+" maxlength=\"13\" size=\"20\" required>"
			 	 $(".originalTel").html(tel);
				 
				 $("#modifybtn").html("<div class=\"col-6\"><a class=\"btn btn-primary\" id=\"modify\" style=\"width:200px;\">변경</button></div>")
			 	
			 }
			 
			 $("#modifybtn").on("click","#modify",function(){
				 var newName = $("#newName").val();
				 $("#name").val(newName);
				 $(".originalName").html(newName);
				 
				 var newEmail = $("#newEmail").val();
				 $("#email").val(newEmail);
				 $(".originalEmail").html(newEmail);
				 
				 var newTel = $("#newTel").val();
				 $("#tel").val(newTel);
				 $(".originalTel").html(newTel);
				 
				 $('a#modifyInfo').show();
				 $(this).hide();
			 });
		});		 
		</script>

															
	</form>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>