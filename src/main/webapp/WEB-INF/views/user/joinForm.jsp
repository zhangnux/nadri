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
</style>
</head>
<body>
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
		<form class="p-5 border bg-white p-3 col-sm-4 mx-auto" method="post" action="" enctype="multipart/form-data">
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">아이디 *</label> 
				<input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label class="form-label" for="password" style="font-size: 14px;">비밀번호 *</label> 
				<input type="text" class="form-control" name="password" placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">비밀번호 확인 *</label> 
				<input type="text" class="form-control" name="password" placeholder="비밀번호를 한번 더 입력해주세요." />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">이름 *</label> 
				<input type="text" class="form-control" name="name" placeholder="이름을 입력해주세요." />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">이메일 *</label> 
				<input type="text" class="form-control" name="email" placeholder="ID@example.com" />
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">성별 *</label> 
				<input type="text" class="form-control" name="gender" placeholder="성별을 입력해주세요." />
				<input type="radio" name="gender" value="남자" checked>남자
				<input type="radio" name="gender" value="여자">여자
			</div>
			<div class="mb-3">
				<label class="form-label" style="font-size: 14px;">생일 *</label> 
				<input type="date" class="form-control" name="birth" placeholder="생일을 입력해주세요." />
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-primary">Button</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">

</script>	
</body>
</html>