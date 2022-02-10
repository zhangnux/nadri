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
<style>
	html, body {
		width: 100%;
		height: 100%;
	}

	.container-fluid
	{
    position:fixed;
    padding:0;
    margin:0;

    top:0;
    left:0;

    width: 100%;
    height: 100%;
	}
	
	.vGraph{ padding:20px 0;}
	.vGraph ul{ 
		margin:0; padding:0; height:264px; 
		border:1px solid #ddd; 
		border-top:0; 
		border-right:0; 
		font-size:11px; 
		font-family:Tahoma, Geneva, sans-serif; 
		list-style:none;
	}
	.vGraph ul:after{ 
		content:""; 
		display:block; 
		clear:both;
	}
	.vGraph li{ 
		float:left; 
		display:inline; 
		width:14%; 
		height:100%; 
		margin:0 3%; 
		position:relative; 
		text-align:center; 
		white-space:nowrap;
	}
	.vGraph .gTerm{ 
		position:relative; 
		display:inline-block; 
		width:100%; 
		height:20px; 
		line-height:0px; 
		margin:0 -100% -20px 0; 
		padding:280px 0 0 0; 
		vertical-align:bottom; 
		color:#767676; 
		font-weight:bold;}
	.vGraph .gBar{ 
		position:relative; 
		display:inline-block; 
		width:100%; 
		margin:-1px 0 0 0; 
		border:1px solid #ccc; 
		border-bottom:0; 
		background:#e9e9e9; 
		vertical-align:bottom;
	}
	.vGraph .gBar span{ 
		position:absolute; 
		width:100%; 
		top:-20px; 
		left:0; 
		color:#767676;
	}
	#table-user th{
		height: 40px;
		background-color: #E9E9E9;
	}
	#table-user td {
		height: 50px;
	}
	#table-user tr {
		border-bottom: 1px solid #C0C0C0;
		font-size: 15px;
	}
	.pie-chart2 {
		display:inline-block;
		position:relative;
		width: 200px;
		height: 200px;
		border-radius: 50%;
	}
	.pie-chart2  .center{
		position:absolute;
		width:165px; 
		height: 165px;
		background :#fff;
		border-radius: 50%;
		top: 18px;
		left:18px;
	}
	#page a {
		border: 0;
	}
	
	
	.page {
		padding: 10px;
	}
	a[aria-label] {
		font-size: 28px;
		padding: 0px;
	}
</style>
<body>
<div class="container-fluid bg-light">
<div class="row">
	<div class="col-2" style="position: fixed; height: 100%;">
		<%@ include file="../manager/common/navbar.jsp" %>
	</div>
	<div class="col-10" style="margin-left: 310px;">
	<h1 class="mt-5 mb-1"><strong>쿠폰 수정</strong></h1>
	<p class="mb-5">쿠폰 번호와 배포 시작일은 수정 할 수 없습니다.</p>
	
	<form id="form-modify-coupon" method="post" action="update.nadri" class="p-3 border-top border-bottom">
		<div class="row mb-3 mt-5">
			<div class="col col-4">
				<input class="form-control" name="no" type="text" value="${coupon.no}" hidden />
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">쿠폰이름</label>
			<div class="col col-4">
				<input class="form-control" name="couponName" type="text" value="${coupon.couponName}" maxlength=20>
			</div>
			<div class="col col-auto mt-2">
				<a>20자 이내로 작성해주세요.</a>
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">잔여수량</label>
			<div class="col col-1 me-5">
				<input class="form-control" name="quantity" type="number" value="${coupon.quantity }" min=0>
			</div>
			<label class="modiform col-auto p-2">할인율(%)</label>
			<div class="col col-1 me-5">
				<input class="form-control" name="discountRate" type="number" value="${coupon.discountRate }" min=0>
			</div>
			<label class="modiform col-auto p-2">사용처</label>
			<div class="col col-auto">
				<select class="form-select" id="autoSizingSelect" name="category">
					<option value="숙소" ${coupon.category eq '숙소'?'selected':'' }>숙소</option>
					<option value="음식점" ${coupon.category eq '음식점'?'selected':'' }>음식점</option>
					<option value="즐길거리" ${coupon.category eq '즐길거리'?'selected':'' }>즐길거리</option>
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
				<input class="form-control" name="issueEndDate" type="date" id="issueEndDate" value="<fmt:formatDate value="${coupon.issueEndDate }" pattern="yyyy-MM-dd"/>">
			</div>
		</div>
		<div class="row mb-3">
			<label class="modiform col-auto p-2">사용시작일</label>
			<div class="col col-2">
				<input class="form-control" name="startDate" type="date" value="<fmt:formatDate value="${coupon.startDate }" pattern="yyyy-MM-dd"/>">
			</div>
			<label class="modiform col-auto p-2">사용종료일</label>
			<div class="col col-auto">
				<input class="form-control" name="endDate" type="date" id="endDate" value="<fmt:formatDate value="${coupon.endDate }" pattern="yyyy-MM-dd"/>">
			</div>
		</div>
		<div class="row right">
			<div class="col-12 mt-5 mb-5">
				<button class="btn btn-outline-primary me-2" type="submit">수정</button>
				<a class="btn btn-outline-dark" href="coulist.nadri">취소</a>
			</div>
		</div>
	</form>
	</div>
	</div>
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
	document.getElementById("issueEndDate").setAttribute("min", today);

</script>
</body>
</html>