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
	/*벤치마킹 - 박스 디자인*/
.box {
   margin : 0px auto;
   display: block;
   width: 60%;
   height: 51px;
   padding-top: 10px;
   padding-right: 110px;
   padding-bottom: 10px;
   padding-left: 14px;
   background: #fff;
   box-sizing: border-box;
   vertical-align: top;
   vertical-align: top;
}
/*벤치마킹 - input 디자인*/
.int {
   display: block;
   position: relative;
   width: 100%;
   height: 29px;
   border: solid 1px #dadada;
   padding-right: 25px;
   line-height: 29px;
   border: none;
   background: #fff;
   font-size: 15px;
   box-sizing: border-box;
   z-index: 10;
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
		<form class="p-5 border bg-white p-3 col-sm-4 mx-auto" method="post" action="insert.nadri" name="insertForm" >
			<div class="userInput">
				<h6 class="list">아이디<span id="idError"></span></h6>
				<input type="text" class="check form-control" name="id" id="id" placeholder="아이디를 입력해주세요." minlength="5" maxlength="20" />
			</div>
			<div class="userInput">
				<h6 class="list">비밀번호<span id="pwError"></span></h6>
				<input type="password" class="check form-control" name="password" id="password" placeholder="영문, 숫자, 특수문자 2가지 조합 4~20자" minlength="4" maxlength="20" />
			</div>
			<div class="userInput">
				<h6 class="list">비밀번호 재확인<span id="pwCheckError"></span></h6> 
				<input type="password" class="check form-control" name="pwCheck" id="pwCheck" placeholder="영문, 숫자, 특수문자 2가지 조합 4~20자" minlength="4" maxlength="20" />
			</div>
			<div class="userInput">
				<h6 class="list">이름<span id="nameError"></span></h6> 
				<input type="text" class="check form-control" name="name" id="name" placeholder="이름을 입력해주세요." maxlength="15" />
			</div>
			<div class="userInput">
				<h6 class="list">이메일<span id="emailError"></span></h6> 
				<input type="email" class="check form-control" name="email" id="email" placeholder="ID@example.com" maxlength="20" />
			</div>
			<div class="userInput">
				<h6 class="list">전화번호<span id="telError"></span></h6> 
				<input type="tel" class="check form-control" name="tel" id="tel" placeholder="-를 제외한 11자리" />
			</div>
			<div class="userInput">
				<label class="form-label" style="font-size: 14px;">성별 *</label> 
				<input type="radio" name="gender" value="남자" id="male" checked>남자
				<input type="radio" name="gender" value="여자" id="female" >여자
			</div>
			<div class="userInput">
				<label class="form-label" style="font-size: 14px;">생일 *</label> 
				<input type="date" class="check form-control" name="birth" id="birth" placeholder="생일을 선택해주세요." />
			</div>
			<div class="d-grid gap-2">
				<button type="button" class="btn btn-dark" onclick="history.back()">이전페이지</button>
				<button type="submit" class="btn btn-primary">회원가입</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
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
//       <div class="userInput">
//                 <h3 class="list">성명<span id="nameError"></span></h3>
//                  <span class="box int_id"><input type="text" id="name" class="int check"
//                     maxlength="20"></span>
//               </div>






// [ 회원가입 유효성검사 ]
//자원을 화면에 로드하게 되면 수행할 동작(==function)

window.onload = function() {
	var join = document.insertForm; //form데이터를 모두 join변수에 저장
	
	var input = document.querySelectorAll('.check');
	
	var errorId = [ "idError", "pwError", "pwCheckError", "nameError", "telError" ];
	var error = document.querySelectorAll('.list > span');

		function innerReset(error){
		for (var i = 0; i < error.length; i++) {
		error[i].innerHTML = "";
		}
	}

	// 초기화 메서드 호출
	innerReset(error);
   
	// [ ID 입력문자 유효성검사 ] 
	join.id.onkeydown = function(){
		innerReset(error); // 초기화 메서드 호출
		var idLimit = /^[a-zA-Z0-9-_]{5,20}$/;
		if (!idLimit.test(input[0].value)) {
		document.getElementById(errorId[0]).innerHTML = "5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";

		}
	}
		// [ PW 입력문자 유효성검사 ]
		join.password.onkeydown = function(){
		innerReset(error); // 초기화 메서드 호출
		var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{8,20}$/; //정규식( a~z, A~Z, 0~9, ~!@#$%^&*()_- )
		if (!pwLimit.test(input[1].value)) {
			
		document.getElementById(errorId[1]).innerHTML = " 4~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
		}   
	}
	// [ PW 재확인 입력문자 초기화 ]
	//비밀번호 동일여부는 submit 버튼 클릭시 검사해줄 예정
	join.pwCheck.onkeydown = function(){
		
		innerReset(error);// 오류문구 초기화   
	}
	
	// [ 휴대폰번호 입력문자 유효성검사 ]
	join.tel.onkeydown = function(){
	innerReset(error);   
	var telLimit =  /^01[0|1|6|7|8|9]{1}[0-9]{8}$/; // 정규식(^$--> 문자의미, 01, (6자리중 "1자리"), 0~9--> "8자리")
	if (!telLimit.test(input[4].value)) {
		
		document.getElementById(errorId[4]).innerHTML = " 올바른 형식이 아닙니다. 다시 확인해주세요.";
		}
	}
	
	//submit 실행시 수행할 동작
	join.onsubmit = function() {           
		var errorStr = [ " 아이디를", " 비밀번호를", " 비밀번호 확인을", " 성함을", " 휴대폰번호를", " 이메일을" ];
       
		innerReset(error);
       
		// [ input 공백확인 ]
		for (var i = 0; i < input.length - 1; i++) { 
			if (!input[i].value) { 
				document.getElementById(errorId[i]).innerHTML = errorStr[i]+ " 입력해 주세요.";
				input[i].focus();
				return false;
			}
		}         
       
	//유효성검사) 비밀번호 재확인
	if (join.pw.value != join.pwCheck.value) {
		document.getElementById("pwCheckError").innerHTML = " 비밀번호가 일치하지 않습니다.";
		join.pwCheck.focus();
		return false;
	}

	// 정규식 변수 모음     
	var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식( a~z, A~Z, 0~9, -, _ )
	var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{8,20}$/;///[a-zA-Z0-9]{10, 20}/; ( a~z, A~Z, 0~9,~!@#$%^&*()_-특수문자 )
	var telLimit =  /^01[0|1|6|7|8|9]{1}[0-9]{8}$/; // 01로 시작, 0,1,6,7,8,9 중 한자리, 0~9에서 8자리 입력

	// [ ID 유효성검사 ]
	if (!idLimit.test(input[0].value)) {
		document.getElementById(errorId[0]).innerHTML = " 5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
		join.id.focus(); // 포커스 이동
		return false;
	}
       
	// [ PW 유효성검사 ]
	if (!pwLimit.test(input[1].value)) {
		document.getElementById(errorId[1]).innerHTML = " 4~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
		join.pw.focus(); // 포커스 이동
		return false;
	}         
	
      // [ 휴대폰번호 유효성검사 ]
	if (!telLimit.test(input[4].value)) { 
		document.getElementById(errorId[4]).innerHTML = " 올바른 형식이 아닙니다. 다시 확인해주세요.";
		join.tel.focus(); // 포커스 이동
		return false;
	}
       
//	개인정보 동의박스 체크
//	var consentCheck = document.getElementById("check");
//	if(!consentCheck.checked){
//		document.getElementById("consentError").innerHTML = "개인정보 수집이용 동의를 해주세요.";
//		return false;
//		}
//      
		alert("회원가입이 완료되었습니다.");
	}

}


</script>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>