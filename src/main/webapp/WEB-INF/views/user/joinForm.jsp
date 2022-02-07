<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>회원가입 폼</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	::placeholder {
		font-size: 0.8em;
	}
	/*벤치마킹 - 박스 디자인*/
/*벤치마킹 - input 디자인*/
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
<!-- 
<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
						<img src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="logo" width="100">
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
							<form method="POST" class="needs-validation" novalidate="" autocomplete="off">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="name">Name</label>
									<input id="name" type="text" class="form-control" name="name" value="" required="" autofocus="">
									<div class="invalid-feedback">
										Name is required	
									</div>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">E-Mail Address</label>
									<input id="email" type="email" class="form-control" name="email" value="" required="">
									<div class="invalid-feedback">
										Email is invalid
									</div>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="password">Password</label>
									<input id="password" type="password" class="form-control" name="password" required="">
								    <div class="invalid-feedback">
								    	Password is required
							    	</div>
								</div>

								<p class="form-text text-muted mb-3">
									By registering you agree with our terms and condition.
								</p>

								<div class="align-items-center d-flex">
									<button type="submit" class="btn btn-primary ms-auto">
										Register	
									</button>
								</div>
							</form>
						</div>
						<div class="card-footer py-3 border-0">
							<div class="text-center">
								Already have an account? <a href="index.html" class="text-dark">Login</a>
							</div>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">
						Copyright © 2017-2021 — Your Company 
					</div>
				</div>
			</div>
		</div>
	</section>
 -->
<div class="container">
	<div class="row mb-3">
		<div class="col-8">
			<h1>회원가입 폼</h1>
		</div>
	</div>
	<div class="row">
		<c:if test="${not empty error }">
			<div class="mb-3 alert alert-danger">
				<strong>오류</strong> ${error }
			</div>
		</c:if>
		<form class="p-5 border bg-light col-sm-4 mx-auto" method="post" action="insert.nadri" name="insertForm" id="insertForm">
			<div class="userInput">
				<label class="form-label">아이디 *<span class="">(5~20자)</span></label>
				<input type="text" class="check form-control" name="id" id="id" placeholder="아이디를 입력해주세요. (5~20자)"  maxlength="20"  />
				<h6 class="list"><span id="idError"></span></h6>
			</div>
			<div class="userInput">
				<label class="form-label">비밀번호 *</label>
				<input type="password" class="check form-control" name="password" id="pw" placeholder="영문, 숫자, 특수문자 2가지 조합 4~20자"  maxlength="20" />
				<h6 class="list"><span id="pwError"></span></h6>
			</div>
			<div class="userInput">
				<label class="form-label">비밀번호 재확인 *</label>
				<input type="password" class="check form-control" name="pwCheck" id="pwCheck" placeholder="비밀번호를 한번 더 입력해주세요" maxlength="20" />
				<h6 class="list"><span id="pwCheckError"></span></h6> 
			</div>
			<div class="userInput">
				<label class="form-label">이름 *</label>
				<input type="text" class="check form-control" name="name" id="name" placeholder="이름을 입력해주세요."  maxlength="15" />
				<h6 class="list"><span id="nameError"></span></h6> 
			</div>
			<div class="userInput">
				<label class="form-label">이메일 *</label>
				<input type="email" class="check form-control" name="email" id="email" placeholder="ID@example.com" maxlength="20"  />
				<h6 class="list"><span id="emailError"></span></h6> 
			</div>
			<div class="userInput">
				<label class="form-label">전화번호 *</label>
				<input type="tel" class="check form-control" name="tel" id="tel" placeholder="-를 포함한 13자리"  />
				<h6 class="list"><span id="telError"></span></h6> 
			</div>
			<div class="userInput">
				<label class="form-label">성별 *</label> 
				<input type="radio" name="gender" value="남자" id="male" checked>남자
				<input type="radio" name="gender" value="여자" id="female" >여자
			</div>
			<div class="userInput">
				<label class="form-label">생일 *</label> 
				<input type="date" class="check form-control" name="birth" id="birth" placeholder="생일을 선택해주세요."  />
			</div>
			<div class="d-grid gap-2">
				<button type="button" class="btn btn-dark" id="back">이전페이지</button>
				<button type="submit" class="btn btn-primary">회원가입</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$("#insertForm").submit(function() {
		var id = $("#id").val();
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var tel = $("#tel").val();
		var error = $("list > span");
		
		var idLimit = /^[a-zA-Z0-9]{5,20}$/;
		var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{4,20}$/;
		var nameLimit = /^[가-힣]{2,15}$/;
		var emailLimit = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var telLimit = /^01[016789]-[^0][0-9]{3,4}-[0-9]{4}/;
		
			// 아이디 공백
		if (id == "") {
			Swal.fire({
				  icon: 'error',
				  title: '아이디를 입력하세요.',
				  text: '아이디는 필수 입력값입니다.',
				});
	        $("#id").focus();
	        
			return false;
		}
		
		// 아이디 조건
		if(!idLimit.test(id)) {
			$("#idError").text("5~20자의 영문 대소문자와 숫자만 사용가능합니다.");
	        $("#id").focus();
	        
			return false;
		}
		
		// 비번 공백
		if (pw == "") {
			Swal.fire({
				  icon: 'error',
				  title: '비밀번호를 입력하세요.',
				  text: '비밀번호는 필수 입력값입니다.',
				});
	        $("#pw").focus();
	        
			return false;
		}
		
		// 비번 조건
		if (!pwLimit.test(pw)) {
			$("#pwError").text("영문 대소문자, 숫자와 특수기호 '~!@#$%^&*()_-'를 포함한 4~20자의 비밀번호가 사용 가능합니다.")
			$("#pw").focus();
			
			return false;
		}
		
		// 아이디,비번 중복 불가
		if (id == pw) { 
			$("#pwError").text("아이디와 비밀번호가 같습니다.");
			$("#pw").focus(); 
			
			return false; 
		}	
		
		// 비번 재확인 검사
		if (pwCheck == "") {
			Swal.fire({
				  icon: 'error',
				  title: '비밀번호를 재확인하세요.',
				  text: '비밀번호를 한번 더 입력하세요.',
				});
	        $("#pwCheck").focus();
	        
			return false;
		}
		
		// 비번 같은지 
		if (pw != pwCheck) {
			$("#pwCheckError").text("비밀번호가 서로 다릅니다.");
			$("#pwCheck").focus();
			
			return false;
		}
		
		if (name == "") {
			Swal.fire({
				  icon: 'error',
				  title: '이름을 입력하세요.',
				  text: '이름은 필수 입력값입니다.',
				});
			$("#name").focus();
			
			return false;
		}
		
		if (!nameLimit.test(name)) {
			$("#nameError").text("이름은 한글로 입력 가능합니다.");
			$("#name").focus();
			
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
	
	$("#id").keyup(function(){
		$("#idError").text("");
	})
	
	$("#id").keyup(function(){
		$("#pwError").text("");
	})
	
	$("#id").keyup(function(){
		$("#pwCheckError").text("");
	})
	
	$("#id").keyup(function(){
		$("#nameError").text("");
	})
	
	$("#id").keyup(function(){
		$("#emailError").text("");
	})
	
	$("#id").keyup(function(){
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