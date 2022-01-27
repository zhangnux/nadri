<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h2>결제</h2>
		</div>
	</div>
	<div class="row mb-3 p-3 border">
		<div class="col">
			<form action="">
				<div>
					<label class="form-label">예약자 이름</label>
					<input type="text" class="form-control" name="reservedName"/>
				</div>
				<div>
					<a class="btn btn-primary">결제</a>
				</div>
			</form>
		</div>
	</div>




</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>