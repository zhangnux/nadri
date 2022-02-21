<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<title>마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
#text {
	text-align: right;
}
#ltPiggy{
    font-size: 44px;
    line-height: 44px;
    color:red;
}
#lgPiggy{
    font-size: 88px;
    line-height: 88px;
    color:red;
}
.member-box .form-group .title {
    font-weight: 600;
    position: absolute;
    width: 122px;
}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<header class="py-3 border-bottom mb-4">
	<div class="container">
		<div class="text-left">
			<h1 class="fw-bolder">프로필 관리</h1>
		</div>
	</div>
</header>
<c:if test="${empty LOGIN_USER }">
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold">이용 불가</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">프로필 관리는 로그인 된 사용자만 이용할 수 있습니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="../user/login.nadri"><button type="button" class="btn btn-lg btn-dark">로그인 하기</button></a>
				<a href="../home.nadri"><button type="button" class="btn btn-lg btn-dark">홈페이지 돌아가기</button></a>
			</div>
			<div class="box pt-3">
				<span class="p-2 h-100 align-center" style="font-size: 10pt">아직 회원이 아니신가요?&emsp;<a href="../user/insert.nadri">회원가입</a></span>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${not empty LOGIN_USER }">
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<!-- Search widget-->
			<div class="card mb-2" style="width: 15rem; height: 10rem;">
				<div class="card-body" style="text-align:center">
					<!-- 
					 <img src="../resources/images/user/user.png" class="card-img-top" alt="..." width="98px" height="98px">
					 -->
					<i class="bi bi-piggy-bank" id="ltPiggy"></i>
					<p class="card-text">${LOGIN_USER.id }</p>
					<a href="/user/modify.nadri" class="fw-bold text-decoration-none"><i class="bi bi-gear"></i>&nbsp;프로필 관리</a>
				</div>
			</div>
			<!-- Categories widget-->
			<div class="card mb-2" style="width: 15rem;">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-6">
							<div>내 포인트</div>
							<div>내 쿠폰</div>
						</div>
						<div class="col-sm-6" id="text">
								<a href="#" class="fw-bold text-decoration-none">${LOGIN_USER.point } 원 &nbsp; <i class="bi bi-server"></i></a><br>
								<!-- 아래쪽에 쿠폰 연결 ....... -->
								<a href="http://localhost/user/coupon.nadri" class="fw-bold text-decoration-none" ><span id="couponCount">0</span>개 &nbsp; <i class="bi bi-gift-fill"></i></a>
						</div>
					</div>
				</div>
			</div>
			<!-- Side widget-->
			<div class="card mb-2" style="width: 15rem;">
				<div class="card-body">
					<h5><strong>내 예약관리</strong></h5>
					<div><a href="/train/reservationList.nadri" style="text-decoration-line : none;">기차</a></div>
					<div><a href="http://localhost/attr/reservation.nadri" style="text-decoration-line : none;">즐길거리</a></div>
				</div>
			</div>
		</div>

		<div class="col-md-8">
		<!-- Featured blog post-->
			<div class="card mb-4">
				<div class="card-body">
					<div class="card-body">
				<!-- ★ -->
				<div class="text-center"><h1><strong>내 예약</strong></h1></div>
				<div class="text-center mb-4"><h3>즐길거리</h3></div>
				<hr>
				<c:choose>
					<c:when test="${empty reserv }">

						<div class="col-12 text-center mt-5"><h3>예약 내역이 없습니다.</h3></div>
					</c:when>
				</c:choose>
				<c:forEach var="r" items="${reserv }">
				<div class="row mb-3">
					<div class="border rounded p-3">
						<div class="row">
							<div class="col-9">
								<h4>
								<a href="http://localhost/attr/detail.nadri?no=${r.attNo }" 
										style="text-decoration: none;color: inherit;">
								<strong>
									${r.attName }

								</strong>
								</a>
								</h4>
							</div>
							<div class="col-3">이용일: <fmt:formatDate value="${r.attDate }" pattern="yyyy-MM-dd" /></div>
						</div>
						<div class="row">
							<div class="col-9 text-end"><strong>${r.orderProcess }</strong></div>
							<div class="col-3 text-end">
								${r.totalQuantity }매　
								<fmt:formatNumber value="${r.lastPrice }" pattern="###,###" />원
							</div>
						</div>
						<form action="pay/cancel" method="post">
							<div class="row justify-content-end mt-2">
								<div class="col-auto">
									<a class="btn btn-outline-primary getDetail" id="${r.orderNo }">상세내역</a>
								</div>
								<c:choose>
									<c:when test="${r.orderProcess =='결제완료'}">
										<input type="hidden" name="orderNo" value="${r.orderNo }">
										<div class="col-auto">
											<button class="btn btn-outline-danger cancel-btn">예약취소</button>
										</div>
									</c:when>
									<c:when test="${r.orderProcess=='결제대기' }">
										<input type="hidden" name="orderNo" value="${r.orderNo }">
										<div class="col-auto">
											<a class="btn btn-outline-danger cancel-btn" href="cancel?orderNo=${r.orderNo }">예약취소</a>
										</div>
									</c:when>
									<c:when test="${r.orderProcess='예약취소' }">
									</c:when>
								</c:choose>
							</div>
						</form>
					</div>
				</div>
				</c:forEach>
				<!--  -->
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>
<script>

$(".getDetail").click(function(){
	var orderNo = $(this).attr("id");
	var detail = window.open("detailinfo.nadri?orderNo="+orderNo+"","orderDetail","width=600, height=800, scrollbars=yes, location=no")
})

$(function(){
	$.ajax({
		type:"get",
		url: "/coupon/coucount",
		success:function(count){
			$("#couponCount").text(count);
		}
	})
})

$(".cancel-btn").click(function(){
	
    if(confirm("정말 취소하시겠습니까 ?") == true){}
    else{
        return false;
    }
	
})

</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>