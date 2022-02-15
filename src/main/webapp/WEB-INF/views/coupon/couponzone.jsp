<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>나드리::쿠폰발급</title>
<style>
    @keyframes anime_textup { 0% { top: 0; } 20% { top: -0.2rem; } 40% { top: 0 } 60% { top: 0 } 80% { top: 0 } 100% { top: 0 } }
 
    .test_obj span {
        position: relative;
        animation: anime_textup 1.5s infinite;
    }
 
    .test_obj span:nth-of-type(1) {
        animation-delay: .1s;
    }
 
    .test_obj span:nth-of-type(2) {
        animation-delay: .2s;
    }
 
    .test_obj span:nth-of-type(3) {
        animation-delay: .3s;
    }
 
    .test_obj span:nth-of-type(4) {
        animation-delay: .4s;
    }
 
    .test_obj span:nth-of-type(5) {
        animation-delay: .5s;
    }
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="row ms-1 mt-5 mb-1">
		<div class="col">
			<a href="http://localhost/home.nadri" style="text-decoration: none; color: black;">홈 ></a>
			쿠폰존
		</div>
	</div>
	<div class="p-3">
		<div class="row text-center">
			<div class="test_obj">
				<h3><strong>
					<span>모</span>
					<span>르</span>
					<span>면</span>
					<span>손</span>
					<span>해</span>
					</strong></h3>
			</div>
			<h2><strong>모든 쿠폰을 한자리에! 나드리 쿠폰존</strong></h2>
			<hr>
		</div>
		<div class="row p-5">
			<div class="col">
				<img src="../../../resources/images/coupon25.jpg" style="height:500px;width:500px">
			</div>
			<div class="col">
				<img src="../../../resources/images/coupon20.jpg" style="height:500px;width:500px">				
			</div>
		</div>
		<div class="row">
			<div class="mb-3 text-center">
				<h3><strong>🌸나드리의 새봄맞이 쿠폰🌸</strong></h3>
			</div>
			<div class="mb-5 row d-flex justify-content-center">
			<!-- forEach -->
			<c:forEach var="c" items="${coupons }">
				<div class="col-3 p-3 m-2 border rounded">
					<div class="row">
						<div class="col-7">
							<h5><strong>${c.couponName }</strong></h5>
						</div>
						<div class="col-5">
							~ <fmt:formatDate value="${c.endDate }" pattern="yyyy-MM-dd" />
						</div>
					</div>
					<div>
						사용처: ${c.category }
					</div>
					<div>
						할인율: ${c.discountRate }%
					</div>
					<div class="col-12 text-end">
						<button class="btn btn-outline-danger" id="couponIssue" data-coupon-no="${c.no }">발급받기</button>
					</div>
				</div>
			</c:forEach>
			<!--  -->
			</div>
		</div>
		<hr>
	</div>
</div>
<script>
$(function(){
	

	$(".rounded").on("click","#couponIssue",function(){
		var loginCheck = $("input[name=\"userNo\"]").val();
		if(loginCheck==''){
			alert("로그인이 필요합니다.");
		} else {
			var couponNo=$(this).data("coupon-no");
			$.ajax({
				url:"/coupon/check",
				data: {couponNo:couponNo},
				type:"get",
				success:function(result){
					if(result=="1"){
						alert("이미 보유한 쿠폰입니다.")
					} else {
						
					}
				} // success 끝
			}) // ajax 끝			
		}
	})	

	
})// function 끝
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>