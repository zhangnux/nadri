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
<style>
	::placeholder {
		font-size: 0.8em;
	}
	.id_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_re_2{
		color : red;
		display : none;
	}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
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
		<form class="p-5 border bg-white p-3 col-sm-4 mx-auto" method="post" action="home.nadri" name="insertForm" enctype="multipart/form-data">
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">아이디 *</label> 
				<input type="text" class="id_input form-control" name="id" id="id" placeholder="아이디를 입력해주세요." />
				<span class="id_re_1">사용 가능한 아이디 입니다.</span>
				<span class="id_re_2">아이디가 이미 존재합니다.</span>
			</div>
			<div class="mb-3">
				<label class="form-label" for="password" style="font-size: 14px;">비밀번호 *</label> 
				<input type="password" class="form-control" name="password" id="password" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" />
			</div>
			<div class="mb-3">
				<label class="form-label" for="password" style="font-size: 14px;">비밀번호 재확인 *</label> 
				<input type="password" class="form-control" name="repassword" id="repassword" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">이름 *</label> 
				<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요." />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">이메일 *</label> 
				<input type="email" class="form-control" name="email" id="email" placeholder="ID@example.com" />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">전화번호 *</label> 
				<input type="tel" class="form-control" name="tel" id="tel" placeholder="010-1234-1234" />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">성별 *</label> 
				<input type="radio" name="gender" value="남자" id="male" checked>남자
				<input type="radio" name="gender" value="여자" id="female" >여자
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">생일 *</label> 
				<input type="date" class="form-control" name="birth" id="birth" placeholder="생일을 입력해주세요." />
			</div>
			<div class="d-grid gap-2">
				<!-- <button type="button" class="btn btn-dark" onclick="history.back()">이전페이지</button>
				<button type="button" class="btn btn-primary" onclick="joinCheck()">회원가입</button> -->
				<input type="button" class="join_button" value="가입하기">
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	// 회원가입 버튼
	$(".join_button").click(function(){
		$("#join_form").attr("action", "/login.nadri");
		$("#join_form").submit();
	});
});

$('.id_input').on("propertychange change keyup paste input", function() {
	//console.log("키업 test")
});

var id = $('.id_input').val();			// .id_input에 입력되는 값
var data = {id : id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

$.ajax({
	type : "post",
	url : "/member/memberIdChk",
	data : data
}); // ajax 종료	




/* function joinCheck() {
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	var repassword = document.getElementById("repassword");
	var name = document.getElementById("name");
	var email = document.getElementById("email");
	var tel = document.getElementById("tel");
	var male = document.getElementById("male");
	var female = document.getElementById("female");
	var birth = document.getElementById("birth");
	
	if (id.value == "") {
		alert("아이디를 입력하세요")
		id.focus();
		return false;
	};
	
	if (password.value == "") {
		alert("비밀번호를 입력하세요")
		password.focus();
		return false;
	};
	
	var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
	if (!passwordCheck.test(pwd.value)) {
		alert("비밀번호는 영문자 + 숫자 + 특수문자를 포함한 8~25자리를 입력해야 합니다.");
		password.focus();
		return false;
	};
	
	if (repassword.value !== password.value) {
		alert("비밀번호가 일치하지 않습니다.");
		repassword.focus();
		return false;
	};
	
	if (name.value !== "") {
		alert("이름을 입력하세요.");
		name.focus();
		return false;
	};
	
	if (!femail.checked && !male.checked) {
		alert("성별을 선택하세요.");
		male.focus();
		return false;
	};
	
	if (email.value == "") {
		alert("이메일 주소를 입력하세요.");
		email.focus();
		return false;
	};
	
	document.insertForm.submit();
}

function id_check() {
	if (id == ) {
		alert("중복된 아이디 입니다.")
		id.focus();
		return false;
	}
}
 */

</script>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>