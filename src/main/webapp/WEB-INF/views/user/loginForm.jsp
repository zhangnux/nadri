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
		<form action="login.nadri" method="post">
			<div class="form-group">
				<label class="form-label">Id</label> 
				<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="id" id="id">
			</div>
			<div class="form-group">
				<label class="form-label">Password</label> 
				<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." name="password" id="password">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>