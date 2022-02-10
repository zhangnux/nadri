<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<title>나드리::쿠폰리스트</title>
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
	<div class="row">
		<div class="col-auto pt-5 fw-bold">
			<h1><strong>쿠폰 관리</strong></h1>
		</div>
		<div class="col-auto pt-5">
			<a class="btn btn-dark mt-3" href="insertform.nadri" style="font-size:15px">신규 쿠폰 발급</a>
		</div>
	</div>
	
	<div class="row mt-5">
		<div class="col-auto">
			<h3><strong>쿠폰 현황</strong></h3>
		</div>
		<div class="col-auto">
			<form id="form-search-category" class="row" method="get" action="coulist.nadri">
				<input type="hidden" name="page" value="1">
				<select class="form-select-category" name="menu" aria-label="Default select example">
					<option selected disabled="disabled">사용처 별 검색</option>
					<option value="음식점">음식점</option>
					<option value="숙소">숙소</option>
					<option value="즐길거리">즐길거리</option>
				</select>
			</form>
		</div>
		<div class="col">
			<a>현재 사용가능한 쿠폰을 조회합니다.</a>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<table class="table" id="table-coupons" style="font-size:18px">
				<thead>
					<tr>
						<th style="width: 5%; text-align:center;">번호</th>
						<th style="width: 20%; text-align:center;">쿠폰 이름</th>
						<th style="width: 5%;">사용처</th>
						<th style="width: 5%">할인율</th>					
						<th style="width: 5%">잔여량</th>					
						<th style="width: 20%; text-align:center;">배포기간</th>
						<th style="width: 20%; text-align:center;">사용기간</th>
					</tr>
				</thead>
				<tbody class="validCoupon">
					</tbody>
				</table>		
			</div>
		</div>

		<div class="row">
			<div class="col-auto">
				<h3><strong>만료된 쿠폰</strong></h3>
			</div>
			<div class="col">
			<a>사용기간 만료, 수량없음, 삭제된 쿠폰을 조회합니다.</a>
			</div>
		</div>
	
	<div class="row mb-3">
		<div class="col">
			<table class="table" style="font-size:18px">
				<thead>
					<tr>
						<th style="width: 5%; text-align:center;">번호</th>
						<th style="width: 25%; text-align:center;">쿠폰 이름</th>
						<th style="width: 10%;">사용처</th>
						<th style="width: 10%;font-size:18px;">할인율</th>					
						<th style="width: 10%;font-size:18px;">잔여량</th>					
						<th style="width: 20%; text-align:center;">배포기간</th>
						<th style="width: 20%; text-align:center;">사용기간</th>
					</tr>
				</thead>
				<tbody class="invalidCoupon"></tbody>
			</table>		
		</div>
	</div>
</div>
</div>
</div>
<script type="text/javascript">
$(".validCoupon").on("click",".btn-outline-danger",function(){
	var couponNo = $(this).data("coupon-no");
	var doubleCheck = confirm("삭제된 쿠폰은 복구 할 수 없습니다. 계속하시겠습니까?")		
	if(doubleCheck){
		location.href='delete.nadri?no='+couponNo;	
	} else{}		
})

$(function(){
	
	var pagination = '${param.page}';
	getValidCoupon();
	getInvalidCoupon();
	
	function getValidCoupon(){
		$.ajax({
			type:"post",
			data:{page:pagination},
			url:"valid",
			success:function(result){
				var htmls = "";
				var list = result.validList;
				if(list.length==0){
					htmls += "<tr>"
					htmls += "<td class=\"text-center\" colspan=\"6\">사용가능한 쿠폰이 없습니다.</td>"
					htmls += "</tr>"
				} else {
					$(list).each(function(){
						htmls += "<tr>"
						htmls += "	<td style=\"width: 5%;\">"+this.no +"</td>"
						htmls += "	<td style=\"width: 20%;\">"+this.couponName +"</td>"
						htmls += "	<td style=\"width: 10%; font-size:18px\">"+this.category+"</td>"
						htmls += "	<td style=\"width: 5%; text-align:center;\">"+this.discountRate +"%</td>"
						htmls += "	<td style=\"width: 5%; text-align:center;\">"+this.quantity +"개</td>"
						htmls += "	<td style=\"width: 20%; font-size:16px; text-align:center\">"
						htmls += this.issueDate+"~"+this.issueEndDate					
						htmls += "	</td>"
						htmls += "<td style=\"width: 20%; font-size:16px; text-align:center;\">"
						htmls += this.startDate +"~"+this.endDate
						htmls += "<td style=\"width: 5%; text-align:center;\">"
						htmls += "<a class=\"btn btn-outline-primary btn-sm\" href=\"modiform.nadri?no="+this.no+"\">수정</a>"
						htmls += "</td>"		
						htmls += "<td style=\"width: 5%; text-align:center;\">"
						htmls += "<button class=\"btn btn-outline-danger btn-sm\" data-coupon-no=\""+this.no+"\">삭제</button>"
						htmls += "</td>"
						htmls += "</tr>"		
					}); // each의 끝
					
    				var pagination = result.pagination;
    				if(pagination.totalRecords > 0){
    					htmls += '<div class="row mb-3 mt-4">'
    					htmls += '<div class="col">'
    					htmls += '<nav>'
						htmls += '<ul class="pagination justify-content-center">'
						htmls += '<li class="page-item '+(pagination.existPrev ? '' : 'disabled')+'">'
						htmls += '<a class="page-link" href="coulist.nadri?&page='+pagination.prevPage+'" data-page="'+pagination.prevPage+'">이전</a>'
						htmls += '</li>'
						var currentPage = pagination.currentPage;
						var beginPage = pagination.beginPage;
						var endPage = pagination.endPage;
						for(var num=beginPage; num <= endPage; num++){
							htmls += '<li class="page-item '+ (pagination.currentPageNo == num ? 'active' : '' ) + '">'
							htmls += '<a class="page-link" href="coulist.nadri?&page='+num+'" data-page="'+num+'">'+num+'</a>'
							htmls += '</li>'	
						}
						htmls += '<li class="page-item '+(pagination.existNext ? '' : 'disabled')+'">'
						htmls += '<a class="page-link" href="coulist.nadri?&page='+pagination.nextPage+'" data-page="'+pagination.nextPage+'">다음</a>'
						htmls += '</li>'
						htmls += '</ul>'
						htmls += '</nav>'
						htmls += '</div>'
						htmls += '</div>'
    				} // pagination if문 끝
					
				} // if의 끝
				
				$(".validCoupon").html(htmls);
			} // success의 끝	
		})// ajax의 끝
	} // getValidCoupon()의 끝
	
	function getInvalidCoupon(){
		$.ajax({
			type:"post",
			data:{page:pagination},
			url:"invalid",
			success:function(result){
				var htmls=""
				var list = result.invalidList;
				if(list.length==0){
					htmls += "<tr>"
					htmls += "<td class=\"text-center\" colspan=\"6\">만료된 쿠폰이 없습니다</td>"
					htmls += "</tr>"
				} else {
					$(list).each(function(){
						htmls += "<tr>"
						htmls += "	<td style=\"width: 5%;\">"+this.no +"</td>"
						htmls += "	<td style=\"width: 25%;\">"+this.couponName +"</td>"
						htmls += "	<td style=\"width: 10%; font-size:18px\">"+this.category+"</td>"
						htmls += "	<td style=\"width: 10%; text-align:center;\">"+this.discountRate +"%</td>"
						htmls += "	<td style=\"width: 10%; text-align:center;\">"+this.quantity +"개</td>"
						htmls += "	<td style=\"width: 20%; text-align:center\">"
						htmls += this.issueDate+"~"+this.issueEndDate					
						htmls += "	</td>"
						htmls += "<td style=\"width: 20%; text-align:center;\">"
						htmls += this.startDate +"~"+this.endDate
						htmls += "</tr>"
						}) // each의 끝
					} // if문의 끝
				$(".invalidCoupon").html(htmls);
				} // success의 끝
			}); // ajax의 끝
		} // getInValidCoupon()의 끝
	
	$(".form-select-category").change(function(){
		var cate = $(".form-select-category").val();	
		$.ajax({
			type:"post",
			url:"search",
			data: {page:pagination, category: cate},
			success:function(result){
				$(".validCoupon").empty();
				var htmls="";
				var list = result.searchResult;
				if(list.length==0){
					htmls += "<tr>"
					htmls += "<td class=\"text-center\" colspan=\"6\">일치하는 쿠폰이 없습니다.</td>"
					htmls += "</tr>"
				} else {
					$(list).each(function(){
						htmls += "<tr>"
						htmls += "	<td style=\"width: 5%;\">"+this.no +"</td>"
						htmls += "	<td style=\"width: 20%;\">"+this.couponName +"</td>"
						htmls += "	<td style=\"width: 10%; font-size:18px\">"+this.category+"</td>"
						htmls += "	<td style=\"width: 5%; text-align:center;\">"+this.discountRate +"%</td>"
						htmls += "	<td style=\"width: 5%; text-align:center; font-size:15px;\">"+this.quantity +"개</td>"
						htmls += "	<td style=\"width: 20%; font-size:16px; text-align:center\">"
						htmls += this.issueDate+"~"+this.issueEndDate					
						htmls += "	</td>"
						htmls += "<td style=\"width: 20%; font-size:16px; text-align:center;\">"
						htmls += this.startDate +"~"+this.endDate
						htmls += "<td style=\"width: 5%; text-align:center;\">"
						htmls += "<a class=\"btn btn-outline-primary btn-sm\" href=\"modiform.nadri?no="+this.no+"\">수정</a>"
						htmls += "</td>"		
						htmls += "<td style=\"width: 5%; text-align:center;\">"
						htmls += "<button class=\"btn btn-outline-danger btn-sm\" data-coupon-no=\""+this.no+"\">삭제</button>"
						htmls += "</td>"
						htmls += "</tr>"		
					}); // each의 끝
					
    				var pagination = result.pagination;
    				if(pagination.totalRecords > 0){
    					htmls += '<div class="row mb-3 mt-4">'
    					htmls += '<div class="col">'
    					htmls += '<nav>'
						htmls += '<ul class="pagination justify-content-center">'
						htmls += '<li class="page-item '+(pagination.existPrev ? '' : 'disabled')+'">'
						htmls += '<a class="page-link" href="coulist.nadri?&page='+pagination.prevPage+'" data-page="'+pagination.prevPage+'">이전</a>'
						htmls += '</li>'
						var currentPage = pagination.currentPage;
						var beginPage = pagination.beginPage;
						var endPage = pagination.endPage;
						for(var num=beginPage; num <= endPage; num++){
							htmls += '<li class="page-item '+ (pagination.currentPageNo == num ? 'active' : '' ) + '">'
							htmls += '<a class="page-link" href="coulist.nadri?&page='+num+'" data-page="'+num+'">'+num+'</a>'
							htmls += '</li>'	
						}
						htmls += '<li class="page-item '+(pagination.existNext ? '' : 'disabled')+'">'
						htmls += '<a class="page-link" href="coulist.nadri?&page='+pagination.nextPage+'" data-page="'+pagination.nextPage+'">다음</a>'
						htmls += '</li>'
						htmls += '</ul>'
						htmls += '</nav>'
						htmls += '</div>'
						htmls += '</div>'
    				} // pagination if문 끝
					
				} // if의 끝
				
				$(".validCoupon").html(htmls);
			} // success의 끝	
		}) // ajax 끝
	})	// 카테고리 검색 함수의 끝
		
}); // 자동실행 function의 끝 

</script>
</body>
</html>
