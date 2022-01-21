<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나드리::쿠폰리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../common/head.jsp" %>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-auto pt-5">
			<h1>쿠폰관리</h1>
		</div>
		<div class="col-auto pt-5">
			<a class="btn btn-dark" href="#" style="font-size:15px">신규 쿠폰 발급</a>
		</div>
	</div>
	
	<div class="row mt-5">
		<div class="col-auto">
			<h3>쿠폰 현황</h1>
		</div>
		<div class="col-auto">
			<form id="form-search-category" class="row" method="get" action="coulist.nadri">
				<input type="hidden" name="page" value="1">
				<select class="form-select-category" name="menu" aria-label="Default select example">
					<option selected disabled="disabled">사용처 별 검색</option>
					<option value="res">음식점</option>
					<option value="lod">숙소</option>
					<option value="att">즐길거리</option>
				</select>
			</form>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<table class="table" id="table-coupons" style="font-size:18px">
				<thead>
					<tr>
						<th style="width: 5%; text-align:center;">번호</th>
						<th style="width: 25%; text-align:center;">쿠폰 이름</th>
						<th style="width: 10%;">사용처</th>
						<th style="width: 10%">남은 수량</th>					
						<th style="width: 15%; text-align:center;">배포기간</th>
						<th style="width: 15%; text-align:center;">사용기간</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty coupons }">
						<tr>
							<td class="text-center" colspan="6">사용가능한 쿠폰이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="coupon" items="${coupons }" varStatus="loop">
							<tr>
								<td style="width: 5%;">${coupon.no }</td>
								<td style="width: 25%;">${coupon.name }</td>
								<td style="width: 10%; font-size:18px">${coupon.category }</td>
								<td style="width: 10%; text-align:center;">${coupon.quantity }개</td>
								<td style="width: 20%; font-size:16px;">
									<fmt:formatDate value="${coupon.issueDate }" pattern="yyyy-MM-dd"/> 
									~ 
									<fmt:formatDate value="${coupon.issueEndDate }" pattern="yyyy-MM-dd"/>									
								</td>
								<td style="width: 20%; font-size:16px"><fmt:formatDate value="${coupon.startDate }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${coupon.endDate }" pattern="yyyy-MM-dd"/></td>
								<td style="width: 5%; text-align:center;">
									<button class="btn btn-outline-primary btn-sm">수정</button>
								</td>
								<td style="width: 5%; text-align:center;">
									<button class="btn btn-outline-danger btn-sm" data-delete-coupon>삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>		
			</div>
		</div>
	
	
		<div class="row">
			<div class="col-3">
				<h3>만료된 쿠폰</h3>
			</div>
		</div>
	
	<div class="row mb-3">
		<div class="col">
			<table class="table" id="table-coupons" style="font-size:18px">
				<thead>
					<tr>
						<th style="width: 5%; text-align:center;">번호</th>
						<th style="width: 25%; text-align:center;">쿠폰 이름</th>
						<th style="width: 10%;">사용처</th>
						<th style="width: 10%;font-size:18px;">남은 수량</th>					
						<th style="width: 20%; text-align:center;">배포기간</th>
						<th style="width: 20%; text-align:center;">사용기간</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty invalidCoupons }">
						<tr>
							<td class="text-center" colspan="6">만료된 쿠폰이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="invCoupon" items="${invalidCoupons }" varStatus="loop">
							<tr>
								<td style="width: 5%;">${invCoupon.no }</td>
								<td style="width: 25%;">${invCoupon.name }</td>
								<td style="width: 10%;">${invCoupon.category }</td>
								<td style="width: 10%; text-align:center;">${invCoupon.quantity }개</td>
								<td style="width: 20%;">
									<fmt:formatDate value="${invCoupon.issueDate }" pattern="yyyy-MM-dd"/> 
									~ 
									<fmt:formatDate value="${invCoupon.issueEndDate }" pattern="yyyy-MM-dd"/>								
								</td>
								<td style="width: 20%; font-size:16px">
									<fmt:formatDate value="${invCoupon.startDate }" pattern="yyyy-MM-dd"/> 
									~ 
									<fmt:formatDate value="${invCoupon.endDate }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>		
			</div>
		</div>
</div>
<script type="text/javascript">

	$("#delete-coupon").click(function(){
		console.log("삭제클릭");
	})

</script>
</body>
</html>
