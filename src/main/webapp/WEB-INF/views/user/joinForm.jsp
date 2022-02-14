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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
	font-size:16px;
	margin: 0;
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
				<p class="lead mb-4">회원가입은 비회원만 이용할 수 있습니다.</p>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					<a href="../home.nadri"><button type="button" class="btn btn-lg btn-dark">홈페이지 돌아가기</button></a>
				</div>
			</div>
		</div>
	</div>
</c:if>
	<c:if test="${not empty error }">
		<div class="mb-3 alert alert-danger">
			<strong>오류</strong> ${error }
		</div>
	</c:if>
<c:if test="${empty LOGIN_USER }">
	<div class="container">
		<div class="modal modal-signin position-static d-block py-5" tabindex="-1" role="dialog" id="modalSignin">
			<div class="modal-dialog" role="document">
				<div class="modal-content rounded-5 shadow">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h5 class="modal-title"></h5>
						<h2 class="fw-bold mb-0">Register</h2>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
		
					<div class="modal-body p-5 pt-0">
						<form method="post" action="insert.nadri" name="insertForm" id="insertForm">
							<div class="form-floating mb-1">
								<input type="text" class="form-control" placeholder=" " name="id" id="id" maxlength="20">
								<label class="form-label" for="id" style="font-size: 13px">아이디 (5~20자의 영문 대소문자와 숫자)</label>
								<h6 class="list"><span id="idError"></span></h6>
							</div>
							<div class="form-floating mb-1">
								<input type="password" class="form-control" placeholder=" " name="password" id="pw"> 
								<label class="form-label" for="password" style="font-size: 13px">비밀번호 (영문, 숫자, 특수문자 2가지 조합 4~20자)</label>
								<h6 class="list"><span id="pwError"></span></h6>
							</div>
							<div class="form-floating mb-1">
								<input type="password" class="form-control" placeholder=" " id="pwCheck"> 
								<label class="form-label" for="pwCheck" style="font-size: 13px">비밀번호 재확인</label>
							<h6 class="list"><span id="pwCheckError"></span></h6> 
							</div>
							<div class="form-floating mb-1">
								<input type="text" class="form-control" placeholder=" " name="name" id="name"> 
								<label class="form-label" for="name" style="font-size: 13px">이름 (한글만 가능합니다.)</label>
								<h6 class="list"><span id="nameError"></span></h6>
							</div>
							<div class="form-floating mb-1">
								<input type="email" class="form-control" placeholder=" " name="email" id="email"> 
								<label class="form-label" for="email" style="font-size: 13px">이메일 (ID@example.com)</label>
								<h6 class="list"><span id="emailError"></span></h6>
							</div>
							<div class="form-floating mb-1">
								<input type="tel" class="form-control" placeholder=" " name="tel" id="tel"> 
								<label class="form-label" for="tel" style="font-size: 13px">휴대전화 (-를 포함한 13자리)</label>
								<h6 class="list"><span id="telError"></span></h6>
							</div>
							<div class="card shadow-sm border p-3 rounded">
								<div class="form-floating mb-1">
									<input type="text" class="form-control" id="postcode" placeholder=" ">
									<label class="form-label" for="postcode" style="font-size: 13px">우편번호</label>
								</div>
								<div class="form-floating mb-1">
									<input type="text" class="form-control" id="roadAddress" name="address" placeholder=" ">
									<label class="form-label" for="roadAddress" style="font-size: 13px">도로명주소</label>
								</div>
								<div class="form-floating mb-1">
									<input type="text" class="form-control" id="jibunAddress" placeholder=" ">
									<label class="form-label" for="jibunAddress" style="font-size: 13px">지번주소</label>
									<span id="guide" style="color:#999;display:none"></span>
								</div>
								<div class="form-floating mb-1">
									<input class="btn btn-dark btn-sm"  style="float:right; font-size:14px;" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
								</div>
							</div>
							<div class="mt-3 mb-3">
								<label class="form-label">성별</label> 
								<input type="radio" name="gender" value="male" id="male" checked>남자 
								<input type="radio" name="gender" value="female" id="female">여자
							</div>
							<div class="">
								<label class="form-label" for="tel" style="font-size: 17px">Birth</label>
								<i class="bi bi-calendar-check" style="width:60px;"></i><input type="text" class="form-control" id="flatpicker" name="birth">
							</div>
								<div class="d-grid gap-3 pt-3 col-12 mx-auto">
								<button type="submit" class="w-100 mb-2 btn btn-lg rounded-4 btn-primary">회원가입</button>
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
	$("#insertForm").submit(function() {
		
		var id = $("#id").val();
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var tel = $("#tel").val();
		var address = $("#roadAddress").val();
		var birth = $("#flatpicker").val();
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
		
		
		if (address == "") {
			Swal.fire({
				  icon: 'error',
				  title: '도로명 주소를 입력하세요.',
				  text: '도로명 주소는 필수 입력값입니다.',
				});
			$("#tel").focus();
			
			return false;
		}
		
		if (birth == "") {
			Swal.fire({
				  icon: 'error',
				  title: '생일을 선택하세요.',
				  text: '생일은 필수 입력값입니다.',
				});
			$("#birth").focus();
			
			return false;
		}
		return true;
	})// submit
	
	$("#id").keyup(function(){
		$("#idError").text("");
	})
	
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
	
	$("#flatpicker").flatpickr({ 
		dateFormat: "Y-m-d",
		});
	
	
})// function

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

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