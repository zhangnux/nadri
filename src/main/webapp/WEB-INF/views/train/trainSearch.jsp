<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<h2>기차표</h2>		
		</div>
	</div>
	<c:set var="menu1" value="search"/>
	<c:set var="active" value="menu1"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row">
		<div class="col">
			<form action="" method="post">
				<div>
					<input >
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	
</script>
</body>
</html>