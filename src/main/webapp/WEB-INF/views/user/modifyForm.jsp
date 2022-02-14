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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	margin: 1;
}
.check {

}
.userInput{
	padding:3px;
}
input {
	margin-bottom:10px;
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
			<p class="lead mb-4">프로필 관리는 회원만 이용할 수 있습니다.</p>
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
			<div class="col-md-4">
					<div class="card shadow-lg">
						<div class="card-body m-3 p-4">
							<h1 class="fs-4 card-title fw-bold mb-4">프로필 변경</h1>
							<div class="" style="text-align: center">
								<i class="bi bi-piggy-bank" id="ltPiggy"></i>
							</div>
						</div>
						<form class="m-3" method="post" action="modify.nadri" name="modifyForm" id="modifyForm">
						<div class="row">
							<div class="col-md-5">
								<label for="firstName" class="form-label">이름</label> 
								<input type="text" class="form-control" id="name" name="name" value="${LOGIN_USER.name }" disabled>
							</div>
							<div class="col-md-7">
								<label for="firstName" class="form-label">전화번호</label> 
								<input type="tel" class="check form-control" name="tel" id="tel" value="${LOGIN_USER.tel}" placeholder="-를 포함한 13자리" />
								<h6 class="list">
									<span id="telError"></span>
								</h6>
							</div>
							<div class="">
								<label for="firstName" class="form-label">이메일</label> 
								<input type="tel" class="check form-control" name="email" id="email" value="${LOGIN_USER.email}" placeholder="ID@example.com" maxlength="20"/>
								<h6 class="list">
									<span id="telError"></span>
								</h6>
							</div>
							<div class="">
								<label for="firstName" class="form-label">주소</label><input class="btn btn-success btn-sm"  style="float:right; font-size:14px;" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"> 
								<input type="text" class="check form-control" id="roadAddress" name="address" value="${LOGIN_USER.address }">
								<span id="guide" style="color: #999; display: none"></span>
								<h6 class="list">
									<span id="telError"></span>
								</h6>
								
							</div>
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
</c:if>
<script type="text/javascript">
$(function() {
	$("#modifyForm").submit(function() {
		
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		var email = $("#email").val();
		var tel = $("#tel").val();
		var error = $("list > span");
		var address = $("#roadAddress").val();
		
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
		
		if (address == "") {
			Swal.fire({
				  icon: 'error',
				  title: '도로명 주소를 입력하세요.',
				  text: '도로명 주소는 필수 입력값입니다.',
				});
			$("#tel").focus();
			
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
            document.getElementById("roadAddress").value = roadAddr;

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
                
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

</script>
<%@ include file="../common/footer.jsp" %>	
</body>
</html>