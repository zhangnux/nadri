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
<c:if test="${empty LOGIN_USER }">
		<div class="col text-center">로그인 후 다시 이용해주세요</div>
</c:if>
<%-- <c:if test="${not empty LOGIN_USER }">		--%>
	<form method="post" action="waiting.nadri">
		<div class="border rounded p-3 mb-3">
			<div class="row mb-4 border-bottom"><h3><strong>구매 상품</strong></h3></div>
			<div class="row mb-3">
				<div class="col-auto"><img src="../../../resources/images/att/${orderInfo.attPic }" style="width:100px;height:100px;object-fit:cover"></div>
				<div class="col-8"><h4><strong>${orderInfo.attName }</strong></h4></div>
				<input type="hidden" name="attNo" value="${orderInfo.attNo }">
			</div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>사용일</strong></h5></div>
				<div class="col-9" id="attDateText"><fmt:formatDate value="${orderInfo.attDate }" pattern="yyyy년 MM월 dd일"/></div>
				<input type="date" name="attDate" value="<fmt:formatDate value="${orderInfo.attDate }" pattern="yyyy-MM-dd"/>" style="display:none;">					
			</div>
<c:choose>
	<c:when test="${not empty optionInfo}">
		<c:forEach var="opt" items="${optionInfo }">
			<div class="row border rounded p-3 mb-2">
				<input type="hidden" name="optionNo" value="${opt.optionNo }" id="optNo${opt.optionNo }">
				<div class="col-5"><strong>${opt.optionName }</strong></div>
				<input type="hidden" name="productQuantity" value="${opt.productQuantity }">						
				<div class="col-4">${opt.productQuantity }매　　
					<span onload="optquantity();" class="optionPrice${opt.optionNo }">${(opt.optionPrice)*(opt.productQuantity) }
					</span>원
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
 		<div class="row mt-3">
			<div class="col-3"><h5><strong>구매수량</strong></h5></div>
			<div class="col-4">
				<input type="hidden" name="productQuantity" value="${orderInfo.productQuantity }">
				${orderInfo.productQuantity }매　　<fmt:formatNumber value="${orderInfo.price }" pattern="###,###" />원</div>
		</div>
	</c:otherwise>
</c:choose>
		</div>
		<input type="hidden" name="totalQuantity" value="0">
		<div class="border rounded p-3 mb-3">								
			<div class="row mb-4 border-bottom"><h3><strong>할인 적용</strong></h3></div>
			<div class="row mt-3">
				<div class="col-3"><h5><strong>쿠폰선택</strong></h5></div>
				<div class="col-9" id="coupon"><%-- 쿠폰 선택 --%></div>					
				<div class="row mt-3" id="discount"><%-- 할인금액표시 --%></div>
				<input type="hidden" name="couponNo" value="">
			</div>
			<div class="row mt-3">
				<div class="col-3">
					<h5><strong>최종 결제금액</strong></h5>
				</div>
				<input type="hidden" id="originalPrice" value="${orderInfo.price }" disabled>
				<input type="hidden" name="lastPrice" value="${orderInfo.price }" id="lastPrice">
				<div class="col-4" id="finalprice">
					<fmt:formatNumber value="${orderInfo.price }" pattern="###,###" />원
				</div>					
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
			<div class="row mb-4 border-bottom"><h3><strong>결제 수단</strong></h3></div>
			<div class="row mt-3 p-2">
				<div class="col-auto">
					<a class="btn btn-primary" id="deposit">무통장입금</a>
				</div>
				<div class="col-auto">
					<a class="btn btn-warning">
						카카오페이<img src="https://developers.kakao.com/tool/resource/static/img/button/pay/payment_icon_yellow_small.png" style="height:20px;">
					</a>
				</div>					
			</div>			
		</div>
<%-- </c:if>--%>
		<script>
		$(function(){
			
			/*
			// attDate input포맷변경하기
			var attDate = $("#attDateText").text();
			var formattedDate = attDate.replace(/(년|월)/g,'-').replace(/일/g,'').replace(/^\s+|\s+$/gm,'');
			*/
			
			// 전체구매갯수 구하기
		    var sum = 0;
		    $('input[name="productQuantity"]').each(function(){
		            sum += parseInt($(this).val());
		    });
		    $("input[name=totalQuantity]").val(sum);
			
		    // 쿠폰리스트출력
			 $.ajax({
				 type:"get",
				 url:"/coupon/attrcou",
				 success:function(coulist){
					 var htmls=""
					 var price=""
					 if(coulist==0){
						 htmls+="보유한 쿠폰이 없습니다."
					 } else {
						 htmls+="<select class=\"coupon-select\" aria-label=\"Default select example\">"
						 htmls+="	<option selected disabled>사용할 쿠폰을 선택하세요</option>"
						 $(coulist).each(function(){
							 htmls+="<option value="+this.couponNo+">"+this.couponName+" / 할인율 "+this.discountRate+"%</option>"
						 })
						 htmls+="</select>"
						 price+="<div class=\"col-3\"><h5><strong>할인금액</strong></h5></div>"
						 price+="<div class=\"col-9\"><span id=\"discountPrice\">0</span>원</div>"
						 
					 } // if문 끝
					 
					 $("#coupon").html(htmls);
					 $("#discount").html(price);
					 
				 } // success문 끝
			 }) // ajax 끝
			 
			 // 정보수정 시작
				 var originalPrice = $("#originalPrice").val();
			 $("#coupon").change(function(){
				 var discountRate = $(".coupon-select option:selected").text().slice(-3,-1).trim();
				 var discountPrice = originalPrice*(discountRate/100);
				 var finalPrice = originalPrice-discountPrice
				 var couponNo = $("select").val();
				 $("#discountPrice").html("<strong>-<span style=\"color:red;\">"+discountPrice+"</span></strong>");
				 $("#finalprice").html(finalPrice+"원");
				 $("input[name=lastPrice]").val(finalPrice);
				 $("input[name=\"couponNo\"]").val(couponNo);
			 })	 
			 
			 $('a#modifyInfo').click(function(){
				 $(this).hide();
				 editInfo();
			 });
			 
			 function editInfo(){
				 var originalName = $("#name").val();
				 
				 var name = "";
				 name += "<input type=\"text\" id=\"newName\" name=\"name\" value=\""+originalName+"\" maxlength=\"10\" size=\"20\" required>"
				 $(".originalName").html(name);
				 
				 var originalEmail = $("#email").val();
				 var mail = "";
				 mail += "<input type=\"text\" id=\"newEmail\" name=\"email\" value=\""+originalEmail+"\" maxlength=\"30\" size=\"20\" required>"
				 $(".originalEmail").html(mail);
				 
				 var originalTel = $("#tel").val();
				 var tel = "";
				 tel += "<input type=\"text\" id=\"newTel\" name=\"tel\" value=\""+originalTel+"\" maxlength=\"13\" size=\"20\" required>"
			 	 $(".originalTel").html(tel);
				 
				 $("#modifybtn").html("<div class=\"col-6\"><a class=\"btn btn-primary\" id=\"modify\" style=\"width:200px;\">변경</button></div>")
			 	
			 }
			 
			 $(".originalTel").on("keyup", "#newTel", function() { 
				 $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
			});

			 
			 $("#modifybtn").on("click","#modify",function(){
				 var newName = $("#newName").val();
				 if(newName==''){
					 alert("이름을 입력해주세요")
					 return false;
				 }

				 
				 var newEmail = $("#newEmail").val();
				 var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				 if (newEmail.match(regExp) == null) {
					 alert("이메일을 넣어주세요.")
					 return false;
				 }				 
				 if(newEmail==''){
					 alert("메일주소를 입력해주세요")
					 return false;
				 }

				 
				 var newTel = $("#newTel").val();
				 $("#newTel").val(newTel);				 
				 if(newTel==''){
					 alert("휴대폰번호를 입력해주세요")
					 return false;
				 }

				 $("#name").val(newName);
				 $(".originalName").html(newName);
				 $("#email").val(newEmail);
				 $(".originalEmail").html(newEmail);	
				 $("#tel").val(newTel);
				 $(".originalTel").html(newTel);					 
				 $('a#modifyInfo').show();
				 $(this).hide();
			}); // 정보수정 끝	 
			
			$("#deposit").click(function(){
				$("form").submit();
			})
			
			 // 카카오페이
			 /*
			 $("#").click(function(){
				 // 보낼 데이터
				 var attNo=$("input[name=attNo]").val();
				 var attDate=$("input[name=attDate]").val();
				 var totalQuantity=$("input[name=totalQuantity]").val();
				 var couponNo=$("input[name=couponNo]").val();
				 var lastPrice=$("input[name=lastPrice]").val();
				 var name=$("input[name=name]").val();
				 var email=$("input[name=email]").val();
				 var tel=$("input[name=tel]").val();
				 
				 var optionNoLength=$("input[name=optionNo]").length;
					 if(optionNoLength>0){
						 var optionNo = [];
						 $("input[name=optionNo]").each(function(){
							optionNo.push($(this).val());
						 });
					 } else{
						 var optionNo=0;
					 }
				 
				 var productQuantity=$("input[name=productQuantity]").length;
					 if(productQuantity>0){
						 var productQuantity=[];
						 $("input[name=productQuantity]").each(function(){
							 productQuantity.push($(this).val());
						 })
					 } else{
						 productQuantity=$("input[name=productQuantity]").val();
					 }
				var datas = {
						"attNo":attNo,
						"attDate":attDate,
						"optionNo":optionNo,
						"productQuantity":productQuantity,
						"totalQuantity":totalQuantity,
						"couponNo":couponNo,
						"lastPrice":lastPrice,
						"name":name,
						"email":email,
						"tel":tel
				}
					 
				// 값을 보내는 ajax
				$.ajax({
					type:post,
					data:datas,
					url:"",
					success:function(){
						$("form").submit();
					}
				})
					 
			 }) */
			
		}) // 함수의 끝	 
		</script>

															
	</form>
<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>