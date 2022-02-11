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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<c:if test="${not empty error }">
	<div class="alert alert-primary alert-dismissible fade show align-center" role="alert">
		<strong>오류</strong> ${error }
		<button type="button" class="btn-close fade show" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
</c:if>
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
						<input type="text" class="form-control" placeholder="아이디를 입력해주세요." name="id" id="id"> <label for="id">ID</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." name="password" id="password"> <label class="form-label" for="password" style="font-size: 13px">Password</label>
					</div>
					<div class="d-grid gap-3 p-2 col-12 mx-auto">
						<button type="submit" class="w-100 mb-2 btn btn-lg rounded-4 btn-primary">Sign In</button>
					</div>
					<div class="box">
						<span class="p-2 h-100 align-center" style="font-size:10pt">Not a member yet?&emsp;<a href="../user/insert.nadri">Sign Up</a></span>
					</div>
					<hr class="my-4">
					<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
					<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" type="submit">
						<svg class="bi me-1" width="16" height="16">
							<use xlink:href="#twitter"></use></svg>
						Sign up with Twitter
					</button>
					<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4" type="submit">
						<svg class="bi me-1" width="16" height="16">
							<use xlink:href="#facebook"></use></svg>
						Sign up with Facebook
					</button>
					<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-4" type="submit">
						<svg class="bi me-1" width="16" height="16">
							<use xlink:href="#github"></use></svg>
						Sign up with GitHub
					</button>
				</form>
			</div>
		</div>
	</div>
</div>
<%-- <div class="container">
	<div class="row mb-3">
		<div class="col-8">
			<h1>로그인 폼</h1>
		</div>
	</div>
	<div class="row">
		<c:if test="${not empty error }">
			<div class="mb-3 alert alert-danger">
				<strong>오류</strong> ${error }
			</div>
		</c:if>
		<form class="p-5 border bg-white col-sm-4 mx-auto" action="login.nadri" method="post" name="loginForm" id="loginForm">
			<div class="form-group p-2">
				<label class="form-label" for="id" style="font-size:13px">아이디 *</label> 
				<input type="text" class="form-control" placeholder="아이디를 입력해주세요." name="id" id="id">
			</div>
			<div class="form-group p-2">
				<label class="form-label" for="password" style="font-size:13px">비밀번호 *</label> 
				<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." name="password" id="password">
			</div>
			<div class="d-grid gap-3 p-2 col-12 mx-auto">
				<button type="submit" class="btn btn-primary btn-lg">로그인</button>
			</div>
			<div class="box">
				<span class="p-2 h-100 align-center" style="font-size:10pt">아직 회원이 아니신가요?&emsp;<a href="../user/insert.nadri">회원가입</a></span>
			</div>
		</form>
	</div>
</div> --%>
<script type="text/javascript">

</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>