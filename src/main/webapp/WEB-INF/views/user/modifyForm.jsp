<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>프로필 변경</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/simplex/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	::placeholder {
		font-size: 0.8em;
	}
#ltPiggy{
    font-size: 66px;
    line-height: 66px;
    color:red;
}
.list{
	padding: 3px;
	margin: 3px;
	color: red;
	font-size:13px;
}
.form-label{
	font-weight:bold;
 	font-style:italic;
	font-size:16px;
	margin: 0;
}
.check {
}
body, button, dd, dl, dt, fieldset, form, h1, h2, h3, h3, h5, h6, input,
   legend, li, ol, p, select, option, div, table, label, td, textarea, th, ul {
   margin: 3px;
   padding: 3px;
}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<c:if test="${empty LOGIN_USER }">
<div class="container">
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold">이용 불가</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">프로필 관리는 로그인 된 사용자만 이용할 수 있습니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="../home.nadri"><button type="button" class="btn btn-lg btn-dark">홈페이지 돌아가기</button></a>
			</div>
			<div class="box pt-3">
				<span class="p-2 h-100 align-center" style="font-size: 10pt">아직 회원이 아니신가요?&emsp;<a href="../user/insert.nadri">회원가입</a></span>
			</div>
		</div>
	</div>
</div>
</c:if>
<c:if test="${not empty LOGIN_USER }">
<div class="container">
	<div class="row justify-content-sm-center h-100">
		<c:if test="${not empty error }">
			<div class="mb-3 alert alert-danger">
				<strong>오류</strong> ${error }
			</div>
		</c:if>
		<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
			<div class="card shadow-lg">
				<div class="card-body p-5">
					<h1 class="fs-4 card-title fw-bold mb-4">프로필 변경</h1>
					<div class="card mb-2 align-self-center" style="float: none; margin:0 auto; width: 15rem; height: 10rem;">
						<div class="card-body" style="text-align: center">
							<i class="bi bi-piggy-bank" id="ltPiggy"></i>
						</div>
					</div>
					<form method="post" action="modify.nadri" name="modifyForm" id="modifyForm">
						<div class="userInput">
							<label class="form-label">비밀번호 *</label> <input type="password" class="check form-control" name="password" id="pw" placeholder="영문, 숫자, 특수문자 2가지 조합 4~20자" maxlength="20" />
							<h6 class="list">
								<span id="pwError"></span>
							</h6>
						</div>
						<div class="userInput">
							<label class="form-label">비밀번호 확인 *</label> <input type="password" class="check form-control" id="pwCheck" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="20" />
							<h6 class="list">
								<span id="pwCheckError"></span>
							</h6>
						</div>
						<div class="userInput">
							<label class="form-label">이메일 *</label> <input type="email" class="check form-control" name="email" id="email" value="${LOGIN_USER.email}" placeholder="ID@example.com" maxlength="20" />
							<h6 class="list">
								<span id="emailError"></span>
							</h6>
						</div>
						<div class="userInput">
							<label class="form-label">전화번호 *</label> <input type="tel" class="check form-control" name="tel" id="tel" value="${LOGIN_USER.tel}" placeholder="-를 포함한 13자리" />
							<h6 class="list">
								<span id="telError"></span>
							</h6>
						</div>
						<div class="d-grid gap-2">
							<button type="button" class="btn btn-dark" id="back">이전페이지</button>
							<button type="submit" class="btn btn-primary">프로필 수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</c:if>
	<script type="text/javascript">
$(function() {
	$("#modifyForm").submit(function() {
		
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		var email = $("#email").val();
		var tel = $("#tel").val();
		var error = $("list > span");
		
		var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{4,20}$/;
		var nameLimit = /^[가-힣]{2,15}$/;
		var emailLimit = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var telLimit = /^01[016789]-[^0][0-9]{3,4}-[0-9]{4}/;
		
		// 비번 공백
		if (pw == "") {
			Swal.fire({
				  icon: 'error',
				  title: '비밀번호를 입력하세요.',
				  text: '비밀번호는 필수 입력값입니다.',
				}).then((result) => {
					if (result.isConfirmed) {
				    	$("#pw").focus();
				    	
						}
				})
	        
			return false;
		}
		
		// 비번 조건
		if (!pwLimit.test(pw)) {
			$("#pwError").text("영문 대소문자, 숫자와 특수기호 '~!@#$%^&*()_-'를 포함한 4~20자의 비밀번호가 사용 가능합니다.")
			$("#pw").focus();
			
			return false;
		}
		// 비번 재확인 검사
		if (pwCheck == "") {
			Swal.fire({
				  icon: 'error',
				  title: '비밀번호를 재확인하세요.',
				  text: '비밀번호를 한번 더 입력하세요.',
				}).then((result) => {
					if (result.isConfirmed) {
				    	$("#pwCheck").focus();
				    	
						}
				})
	        
			return false;
		}
		
		// 비번 같은지 
		if (pw != pwCheck) {
			$("#pwCheckError").text("비밀번호가 서로 다릅니다.");
			$("#pwCheck").focus();
			
			return false;
		}
		
		if (email == "") {
			Swal.fire({
				  icon: 'error',
				  title: '이메일을 입력하세요.',
				  text: '이메일은 필수 입력값입니다.',
				});
			$("#email").focus();
			
			return false;
		}
		
		if (!emailLimit.test(email)) {
			$("#emailError").text("이메일 형식이 올바르지 않습니다.");
			$("#email").focus();
			
			return false;
		}
		
		if (tel == "") {
			Swal.fire({
				  icon: 'error',
				  title: '전화번호를 입력하세요.',
				  text: '전화번호는 필수 입력값입니다.',
				});
			$("#tel").focus();
			
			return false;
		}
		
		if (!telLimit.test(tel)) {
			$("#telError").text("전화번호 형식이 올바르지 않습니다.");
			$("tel").focus();
			
			return false;
		}
		
		return true;
	})// submit
	
	$("#pw").keyup(function(){
		$("#pwError").text("");
	})
	
	$("#pwCheck").keyup(function(){
		$("#pwCheckError").text("");
	})
	
	$("#name").keyup(function(){
		$("#nameError").text("");
	})
	
	$("#email").keyup(function(){
		$("#emailError").text("");
	})
	
	$("#tel").keyup(function(){
		$("#telError").text("");
	})
	
	$("#back").click(function () { 
		Swal.fire({ 
			title: '뒤로 돌아가시겠습니까?', 
			text: "입력한 내용이 모두 삭제됩니다.", 
			icon: 'warning', 
			showCancelButton: true, 
			confirmButtonColor: '#3085d6', 
			cancelButtonColor: '#d33', 
			confirmButtonText: '이전페이지', 
			cancelButtonText: '취소' 
		}).then((result) => { 
			if (result.isConfirmed) { 
				window.history.back();
			} 
		}) 
	});

		
})// function

/* $(function() {
	$("[name=insertForm]").submit(function() {
		var idLimit = /^[a-zA-Z0-9-_]{5,20}$/;
		var id = $("#id").val();
		if (id == "") {
			$("#idError").text("아이디는 필수 입력값입니다.");
			return false;
		}
		if (!idLimit.test(id)) {
			$("#idError").text("5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			return false;
		}
		
	})
}) */



</script>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>