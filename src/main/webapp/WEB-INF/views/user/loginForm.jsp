<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>로그인 폼</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
::placeholder {
	font-size: 0.8em;
}
.box {
	text-align:center;
}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<c:if test="${not empty LOGIN_USER }">
	<div class="container">
		<div class="px-4 py-5 my-5 text-center">
			<h1 class="display-5 fw-bold">이용 불가</h1>
			<div class="col-lg-6 mx-auto">
				<p class="lead mb-4">로그인은 비회원만 이용할 수 있습니다.</p>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					<a href="../home.nadri"><button type="button" class="btn btn-lg btn-dark">홈페이지 돌아가기</button></a>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${not empty error }">
	<div class="alert alert-primary alert-dismissible fade show align-center" role="alert">
		<strong>오류</strong> ${error }
		<button type="button" class="btn-close fade show" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
</c:if>
<c:if test="${empty LOGIN_USER }">
	<div class="container">
		<div class="modal modal-signin position-static d-block py-5" tabindex="-1" role="dialog" id="modalSignin">
			<div class="modal-dialog" role="document">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h5 class="modal-title"></h5>
						<h2 class="fw-bold mb-0">Sign In</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
		
					<div class="modal-body p-5 pt-0">
						<form class="" action="login.nadri" method="post" name="loginForm" id="loginForm">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" placeholder=" " name="id" id="id"> <label for="id">ID</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" placeholder=" " name="password" id="password"> <label for="password">Password</label>
							</div>
							<div class="d-grid gap-3 p-2 col-12 mx-auto">
								<button type="submit" class="w-100 mb-2 btn btn-lg rounded-4 btn-primary">Sign In</button>
							</div>
							<div class="box">
								<span class="p-2 h-100 align-center" style="font-size:14px;">Not a member yet?&emsp;<a href="../user/insert.nadri">Sign Up</a></span>
							</div>
						</form>
							<hr class="my-4">
						<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
						<a class="w-100 py-2 mb-2 btn btn-outline-warning rounded-4" id="btn-kakao-login" href="kakao/login" type="submit">
							<i class="bi bi-chat-fill"></i>
							Sign up with Kakao
						</a>
					</div>
				</div>
			</div>
		</div>
		<form id="form-kakao-login" method="post" action="kakao-login">
	   		<input type="hidden" name="id" />
	   		<input type="hidden" name="name" />
	   		<input type="hidden" name="email" />
	   		<input type="hidden" name="gender" />
	   	</form>
	</div>
</c:if>
<script type="text/javascript">
$(function() {
	// 카카오 로그인 버튼을 클릭할 때 실행할 이벤트 핸들러 함수를 등록한다.
	$('#btn-kakao-login').click(function(event){
		// a태그는 클릭이벤트가 발생하면 페이지를 이동하는 기본동작이 수행되는데, 그 기본동작이 실행되지 않게 한다.
		event.preventDefault();
		// 카카오 로그인 실행시 오류메세지를 표시하는 경고창을 화면에 보이지 않게 한다.
		$("#alert-kakao-login").addClass("d-none");
		// 사용자키를 전달해서 카카오 로그인 서비스를 초기화한다.
		Kakao.init('ed0e18dc56c2e428f0075b50e0ea0ac6');
		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기
		Kakao.Auth.login({
			success: function(auth) {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response) {
						// 사용자 정보를 가져와서 폼에 추가한다.
						var account = response.kakao_account;
						
						$('#form-kakao-login input[name=id]').val(response.id);
						$('#form-kakao-login input[name=name]').val(account.profile.nickname);
						$('#form-kakao-login input[name=email]').val(account.email);
						$('#form-kakao-login input[name=gender]').val(account.gender);
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector("#form-kakao-login").submit()
					},
					fail: function(error) {
						// 경고창에 에러 메세지를 표시한다.
						$("#alert-kakao-login").removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생하였습니다.");
					}
				});
			},
			fail: function(error) {
				// 경고창에 에러 메세지를 표시한다.
				$("#alert-kakao-login").removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생하였습니다.");
			}
		});		
	})
})
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>