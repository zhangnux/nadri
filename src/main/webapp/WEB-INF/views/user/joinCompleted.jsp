<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp"%>
<title>회원가입 성공</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold">회원가입 완료</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">회원가입이 완료되었습니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="login.nadri"><button type="button" class="btn btn-lg btn-dark">로그인 하러가기</button></a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	Swal.fire({
		  title: '감사합니다! 회원가입 성공!',
		  width: 600,
		  padding: '3em',
		  color: '#716add',
		  background: '#fff url(/images/trees.png)',
		  backdrop: `
		    rgba(0,0,123,0.4)
		    url("../resources/images/user/cat.gif")
		    left top
		    no-repeat
		  `
		})
});

</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>