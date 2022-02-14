<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>회원 탈퇴</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	::placeholder {
		font-size: 0.8em;
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
		<h1 class="display-5 fw-bold">비밀번호 검사</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">비밀번호 검사는 로그인 된 사용자만 이용할 수 있습니다.</p>
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
		<%-- <c:if test="${not empty error }">
			<div class="mb-3 alert alert-danger">
				<strong>오류</strong> ${error }
			</div>
		</c:if> --%>
		<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
			<div class="card shadow-lg">
				<div class="card-body p-5">
					<h1 class="fs-4 card-title fw-bold">비밀번호 확인</h1>
					<form method="post" action="passwordCheck.nadri" name="passwordCheckForm" id="passwordCheckForm">
						<div class="userInput">
							<label class="form-label">비밀번호 확인</label>
							<input type="password" class="check form-control" name="password" id="pw" placeholder="사용자의 비밀번호를 입력해주세요." />
						</div>
						<div class="">
							<button type="button" class="btn btn-dark" id="btn-back">이전페이지</button>
							<button type="submit" class="btn btn-primary">확인</button>
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
	$("#passwordCheckForm").submit(function() {
		
		var pw = $("#pw").val();
		
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
		return true;
	})// submit
	
	$("#pw").keyup(function(){
		$("#pwError").text("");
	})
	
	$("#btn-back").click(function () { 
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



</script>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>