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
					<a href="modify.nadri" class="fw-bold text-decoration-none"><i class="bi bi-gear"></i>&nbsp;프로필 관리</a>
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
								<a href="coupon.nadri" class="fw-bold text-decoration-none" ><span id="couponCount">0</span>개 &nbsp; <i class="bi bi-gift-fill"></i></a>
						</div>
					</div>
				</div>
			</div>
			<!-- Side widget-->
			<div class="card mb-2" style="width: 15rem;">
				<div class="card-body"> 이벤트를 걸까말까?</div>
			</div>
		</div>
		<div class="col-md-8">
		<!-- Featured blog post-->
			<div class="card mb-4">
				<div class="card-body" style="height: 50rem;">
					<div class="card-body" style="text-align:center">
					<!-- 
					 <img src="../resources/images/user/user.png" class="card-img-top" alt="..." width="98px" height="98px">
					 -->
					<i class="bi bi-piggy-bank" id="lgPiggy"></i>
					<p class="card-text fs-3 fw-bolder">${LOGIN_USER.name }</p>
					</div>
					<div class="row pt-3">
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">아이디</p>
						</div>
						<div class="col-md-5 p-3">
							<p>${LOGIN_USER.id }</p>
						</div>
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">이름</p>
						</div>
						<div class="col-md-5 p-3">
							<p>${LOGIN_USER.name }</p>
						</div>
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">이메일</p>
						</div>
						<div class="col-md-5 p-3">
							<p>${LOGIN_USER.email }</p>
						</div>
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">전화번호</p>
						</div>
						<div class="col-md-5 p-3">
							<p>${LOGIN_USER.tel }</p>
						</div>
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">주소</p>
						</div>
						<div class="col-md-5 p-3">
							<p>${LOGIN_USER.address }</p>
						</div>
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">성별</p>
						</div>
						<div class="col-md-5 p-3">
							<p>${LOGIN_USER.gender }</p>
						</div>
						<div class="col-md-3 offset-md-1 p-3">
							<p class="fw-bold">생일</p>
						</div>
						<div class="col-md-5 p-3">
							<p><fmt:formatDate value="${LOGIN_USER.birth}" pattern="yyyy년 M월 dd일"/></p>
						</div>
						<div class="col-md-10 p-3">
							<button type="button" class="btn btn-primary" onclick="password_update()">비밀번호 변경</button>
							<button type="button" class="btn btn-dark" onclick="delete_user()">회원 탈퇴</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>
<script type="text/javascript">
function delete_user(){
	location.href="delete.nadri";
}
function password_update(){
	location.href="passwordCheck.nadri";
}

$(function(){
	$.ajax({
		type:"get",
		url: "/coupon/coucount",
		success:function(count){
			$("#couponCount").text(count);
		}
	})
})
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>