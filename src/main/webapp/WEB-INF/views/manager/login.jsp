<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>나드리::관리자</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	html,body {
 		height: 100%;
	}
	input {
		width: 28%;
		height: 37px;
	}
	body {
		background-color: #E1F6FA;
	}
	div button.btn {
		border: 1px solid #787878;
		border-radius: 0;
		background-color: #787878; 
		width: 28%;
		color: white;
	}
</style>
</head>
<body>
<div class="container h-100">
	<c:if test="${not empty error }">
		<div>
			${error }
		</div>
	</c:if>
	<div class="row d-flex align-content-center justify-content-center h-100">
		<h3 class="text-center mb-4" style="color: #505050">Nadri 관리자 페이지 입니다.</h3>
		<form action="" method="post" id="form-insert-info">
			<div class="text-center my-1">
				<input type="text" class="" name="managerId" id="managerId" 
				placeholder="아이디" onfocus="this.placeholder=''" onblur="this.placeholder='아이디'">
			</div>
			<div class="text-center">
				<input type="password" class="" name="managerPwd" id="managerPwd" 
				placeholder="비밀번호" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호'">
			</div>
			<div class="text-center mt-4">
				<button type="button" class="btn" id="btn-submit-data">LOGIN</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		let login = function() {
			let id = $("#managerId").val()
			let pwd = $("#managerPwd").val()
			
			if (id.trim() == '') {
				alert("아이디를 입력해주세요")
			} else if (pwd.trim() == '') {
				alert("비밀번호를 입력해주세요")
			} else (
				$.ajax({
					type:"post", 
					url:"/rest/admin/login.do",
					data:{id:id, password:pwd},
					dataType:"json",
					success: function(response) {
						if (response.status == 'OK') {
							location.href = "http://localhost/admin/index.nadri";
						} else {
							alert(response.error)
						}
					}
				})
			)
		}
		
		$("#btn-submit-data").click(login)

		$("#form-insert-info").keypress(function(k) {
			if (k.keyCode === 13) {
				login()
			}
		})
	})
	
</script>
</body>
</html>