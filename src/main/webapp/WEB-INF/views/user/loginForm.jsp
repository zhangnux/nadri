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
		<form class="p-5 border bg-white col-sm-4 mx-auto" action="login.nadri" method="post" name="loginForm" id="loginForm">
			<div class="form-group p-2">
				<label class="form-label" style="font-size:13px">아이디 *</label> 
				<input type="text" class="form-control" placeholder="아이디를 입력해주세요." name="id">
			</div>
			<div class="form-group p-2">
				<label class="form-label" style="font-size:13px">비밀번호 *</label> 
				<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요." name="password">
			</div>
			<div class="d-grid gap-3 p-2 col-12 mx-auto">
				<button type="submit" class="btn btn-primary btn-lg">로그인</button>
			</div>
			<div class="box">
				<span class="p-2 h-100 align-center" style="font-size:10pt">아직 회원이 아니신가요?&emsp;<a href="../user/insert.nadri">회원가입</a></span>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript">
/*
$("#loginForm").submit(function(){
	var id = $("#id").val();
	var pw = $("#pw").val();
	
})
*/

</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>