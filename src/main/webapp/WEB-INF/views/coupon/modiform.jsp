<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>나드리::쿠폰수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%-- <%@ include file="../manager/common/navbar.jsp" %> --%>
<div class="container">
	<h1 class="mt-5 mb-1"><strong>쿠폰 수정</strong></h1>
	<p class="mb-5">쿠폰 번호와 배포 시작일은 수정 할 수 없습니다.</p>
	<form id="form-modify-coupon" method="post" action="#" class="p-3 border-top border-bottom">
		<div class="row mb-3 mt-5">
			<label class="modiform col-auto p-2">쿠폰번호</label>
			<div class="col col-4">
				<input class="form-control" name="no" type="text" placeholder="${coupon.no}" disabled>
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">쿠폰이름</label>
			<div class="col col-4">
				<input class="form-control" name="name" type="text" placeholder="${coupon.name}">
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">쿠폰수량</label>
			<div class="col col-1 me-5">
				<input class="form-control" name="quantity" type="number" value="${coupon.quantity }" min=0>
			</div>
			<label class="modiform col-auto p-2">할인율(%)</label>
			<div class="col col-1">
				<input class="form-control" name="discountRate" type="number" value="${coupon.discountRate }" min=0>
			</div>
			<label class="modiform col-auto p-2">사용처</label>
			<div class="col col-auto">
				<select class="form-select" id="autoSizingSelect">
					<option name="lod" ${coupon.category eq 'lod'?'selected':'' }>숙박</option>
					<option name="res" ${coupon.category eq 'res'?'selected':'' }>음식점</option>
					<option name="attr" ${coupon.category eq 'attr'?'selected':'' }>즐길거리</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">배포시작일</label>
			<div class="col col-auto">
				<input class="form-control" name="issuedate" value="<fmt:formatDate value="${coupon.issueDate }" pattern="yyyy-MM-dd"/>" disabled>
			</div>
			<label class="modiform col-auto p-2">배포종료일</label>
			<div class="col col-2">
				<input class="form-control" name="issueEndDate" type="date" id="issueEndDate">
			</div>
		</div>
				<div class="row mb-3">
			<label class="modiform col-auto p-2">사용시작일</label>
			<div class="col col-2">
				<input class="form-control" name="startDate" type="date" value="<fmt:formatDate value="${coupon.startDate }" pattern="yyyy-MM-dd"/>">
			</div>
			<label class="modiform col-auto p-2">사용종료일</label>
			<div class="col col-auto">
				<input class="form-control" name="endDate" type="date" id="endDate">
			</div>
		</div>
		<div class="row right">
			<div class="col-12 mt-5 mb-5">
				<button class="btn btn-outline-primary me-2">수정</button>
				<a class="btn btn-outline-dark" href="coulist.nadri">취소</a>
			</div>
		</div>
	</form>
</div>
<script>
	
	var today = new Date();
	var dd = today.getDate()+1;
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("endDate").setAttribute("min", today);
	document.getElementById("endDate").setAttribute("value", today);  
	document.getElementById("issueEndDate").setAttribute("min", today);
	document.getElementById("issueEndDate").setAttribute("value", today);  

</script>
</body>
</html>