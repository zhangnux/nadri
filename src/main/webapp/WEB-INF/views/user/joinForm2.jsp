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
		<h1>유저 회원가입</h1>
		<form id="form-modify-user" class="border bg-light p-3" method="post" action="insertUser" enctype="multipart/form-data">
		
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" class="form-control" placeholder="Enter username" id="name">
			</div>
			
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" placeholder="Enter password" autocomplete="off" id="password">
			</div>
			
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" class="form-control" placeholder="Enter email" id="email">
			</div>
			<div class="text-end">
				<a href="home.nadri" class="btn btn-secondary">취소</a>		
				<button type="submit" id="btn-save" class="btn btn-primary">회원가입</button>
			</div>		
		</form>
	</div>
<script type="text/javascript">

</script>	
</body>
</html>