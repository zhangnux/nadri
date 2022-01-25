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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="https://kit.fontawesome.com/2dd5a5b03c.js" crossorigin="anonymous"></script>
	<!-- 달력 ui -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>

</style>
<body>
<%@ include file="../common/navbar.jsp" %>

<!-- ★ -->
<div class="container" id="trainBooking">
	<div class="row">
		<div class="col">
			<h2>기차표</h2>
		</div>
	</div>
	<c:set var="menu1" value="search"/>
	<c:set var="menu2" value="lookup"/>
	<c:set var="active" value="menu2"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<%@ include file="common/searchBar.jsp" %>
	<div class="row">
		<div class="col">
			기차 종류		
		</div>
	</div>
</div>
<!--  -->
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		
	})
	
</script>
</body>
</html>