<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
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
		<form action="/action_page.php">
			<div class="form-group">
				<label for="username">Username</label> <input type="text" class="form-control" placeholder="Enter username" id="uesrname">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password" class="form-control" placeholder="Enter password" id="password">
			</div>
			<div class="form-group form-check">
				<label class="form-check-label"> <input class="form-check-input" type="checkbox"> Remember me
				</label>
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</div>
<script type="text/javascript">
	
</script>
</body>
</html>