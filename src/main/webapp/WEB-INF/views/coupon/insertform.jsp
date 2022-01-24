<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>나드리::쿠폰생성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%-- <%@ include file="../manager/common/navbar.jsp" %> --%>
<div class="container">
	<h1 class="mt-5 mb-5"><strong>쿠폰 생성</strong></h1>
	<form id="form-modify-coupon" method="post" action="insert.nadri" class="p-3 border-top border-bottom">
		<div class="row mb-3 mt-5">
			<label class="modiform col-auto p-2">쿠폰이름</label>
			<div class="col col-4">
				<input class="form-control" name="name" type="text" maxlength=20 required>
			</div>
			<div class="col col-auto mt-2">
				<a>20자 이내로 작성해주세요.</a>
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">쿠폰수량</label>
			<div class="col col-1 me-5">
				<input class="form-control" name="quantity" type="number" min=1 value=1>
			</div>
			<label class="modiform col-auto p-2">할인율(%)</label>
			<div class="col col-1 me-5">
				<input class="form-control" name="discountRate" type="number" min=1 value=1>
			</div>
			<label class="modiform col-auto p-2">사용처</label>
			<div class="col col-auto">
				<select class="form-select" id="autoSizingSelect" name="category">
					<option value="공통">공통</option>
					<option value="숙소">숙소</option>
					<option value="음식점">음식점</option>
					<option value="즐길거리">즐길거리</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">배포시작일</label>
			<div class="col col-auto">
				<input class="form-control" name="issueDate" type="date" id="issueDate">
			</div>
			<label class="modiform col-auto p-2">배포종료일</label>
			<div class="col col-2">
				<input class="form-control" name="issueEndDate" type="date" id="issueEndDate">
			</div>
		</div>
				<div class="row mb-3">
			<label class="modiform col-auto p-2">사용시작일</label>
			<div class="col col-2">
				<input class="form-control" name="startDate" type="date" id="startDate" required>
			</div>
			<label class="modiform col-auto p-2">사용종료일</label>
			<div class="col col-auto">
				<input class="form-control" name="endDate" type="date" id="endDate">
			</div>
		</div>
		<div class="row right">
			<div class="col-12 mb-5 mt-3">
				<button class="btn btn-outline-primary me-2">생성</button>
				<a class="btn btn-outline-dark" href="coulist.nadri">취소</a>
			</div>
		</div>
	</form>
</div>
<script>

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("issueDate").setAttribute("min", today);
	document.getElementById("issueDate").setAttribute("value", today);  
	document.getElementById("endDate").setAttribute("min", today);
	document.getElementById("endDate").setAttribute("value", today); 

	var tomorrow = new Date();
	var dd = tomorrow.getDate()+2;
	var mm = tomorrow.getMonth()+1; //January is 0!
	var yyyy = tomorrow.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	tomorrow = yyyy+'-'+mm+'-'+dd;	
	document.getElementById("endDate").setAttribute("min", tomorrow);
	document.getElementById("endDate").setAttribute("value", tomorrow);  
	document.getElementById("issueEndDate").setAttribute("min", tomorrow);
	document.getElementById("issueEndDate").setAttribute("value", tomorrow);  

</script>
</body>
</html>