<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>나드리::메인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://d3js.org/d3.v6.min.js"></script>
	<script src="../../resources/css/billboard.js"></script>
	<link rel="stylesheet" href="../../resources/css/billboard.css">
</head>
<style>
	html, body {
		width: 100%;
		height: 100%;
		overflow: hidden;
	}

	.container-fluid
	{
	    position:fixed;
		overflow: auto;
	    padding:0;
	    margin:0;
	
	    top:0;
	    left:0;
	
	    width: 100%;
	    height: 100%;
	}
	
	#table-user th{
		height: 40px;
		background-color: #E9E9E9;
	}
	#table-user td {
		height: 50px;
		font-size: 18px;
	}
	#table-user tr {
		border-top: 1px solid #C0C0C0;
		border-bottom: 1px solid #C0C0C0;
		font-size: 15px;
	}
	#table-user {
		width: 90%;
	}
	.border {
		background-color: white;
	}
</style>
<body>
<c:set var="menu" value="home"/>
<%@ include file="common/navbar.jsp" %>
<div class="container-fluid bg-light">
	<div class="row">
		<div class="col-2" style="position: fixed; height: 100%;">
			<%@ include file="common/navbar.jsp" %>
		</div>
		<div class="col-10" style="margin-left: 310px;">
			<div class="row border m-4">
				<div class="col text-end p-2" style="background-color: white; font-size: 20px;">
					<strong>nadri 관리자 페이지 입니다.</strong>
				</div>
			</div>
			<div class="row m-4 mt-5">
				<div class="col-8 border me-3" style="text-align: -webkit-center;">
					<div class="p-3 text-start">
						<strong>일일 매출 현황</strong>
					</div>
					<table class="text-center mb-3" id="table-user"> 
						<thead>
							<tr>
								<th width="10%">카테고리.</th>
								<th width="5%">주문량</th>
								<th width="5%">예약</th>
								<th width="5%">결제</th>
								<th width="5%">취소</th>
								<th width="15%">매출액</th>
							</tr>
						</thead>
						<tbody id="tbody-user">
							<tr>
								<td>기차</td>
								<td>${trainStatus.total }</td>
								<td>${trainStatus.reservaion }</td>
								<td>${trainStatus.finish }</td>
								<td>${trainStatus.cancel }</td>
								<td data-train="${dayRate.trainPayment }"><fmt:formatNumber value="${dayRate.trainPayment }" pattern="##,###"/></td>
							</tr>
							<tr>
								<td>여행지</td>
								<td>${attrStatus.total }</td>
								<td>${attrStatus.reservaion }</td>
								<td>${attrStatus.finish }</td>
								<td>${attrStatus.cancel }</td>
								<td data-att="${dayRate.attractionPayment }"><fmt:formatNumber value="${dayRate.attractionPayment }" pattern="##,###"/></td>
							</tr>
							<tr>
								<td>음식점</td>
								<td>${resStatus.total }</td>
								<td>${resStatus.reservaion }</td>
								<td>${resStatus.finish }</td>
								<td>${resStatus.cancel }</td>
								<td data-res="${dayRate.restaurantPayment }"><fmt:formatNumber value="${dayRate.restaurantPayment }" pattern="##,###"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col border">
					<div class="p-3 text-start">
						<strong>금일 매출</strong>
					</div>
					<div class="text-center my-4">
						<h4 data-total="${dayRate.total }"><strong><fmt:formatNumber value="${dayRate.total }" pattern="##,###"/></strong>원</h4>
					</div>
					<div class="p-3 text-start">
						<strong>일일 회원 현황</strong>
					</div>
					<div class="mt-4 mb-5">
						<ul style="display: table; margin-left: auto; margin-right: auto; font-size:18px;">
							<li><strong>가입</strong>: <span class="ps-2">${dayRate.createdUser }</span>명</li>
							<li><strong>탈퇴</strong>: <span class="ps-2">${dayRate.deletedUser }</span>명</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row m-4">
				<div class="col-6 border me-3" style="text-align: -webkit-center; width: 766px;">
					<div class="p-3 text-start">
						<strong>회원 현황</strong>
					</div>
					<div id="simpleXYLineChart"></div>
				</div>
				<div class="col-6 border" style="width: 766px;">
					<div class="p-3 text-start">
						<strong>매출 현황</strong>
					</div>
					<div id="pieChart"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function() {
		let train = $("[data-train]").attr("data-train")
		let att = $("[data-att]").attr("data-att")
		let res = $("[data-res]").attr("data-res")
		let total = $("[data-total]").attr("data-total")
		console.log(train)
		console.log(att)
		console.log(res)
		console.log(Math.trunc((train/total*100)*10)/10)
		
		
		var chart = bb.generate({
			  data: {
			    columns: [
				["기차", Math.trunc((train/total*100)*10)/10],
				["여행지", Math.trunc((att/total*100)*10)/10],	["음식점", Math.trunc((res/total*100)*10)/10]
			    ],
			    type: "pie", 
			    colors: {
			      기차: "#83B1DF",
			      여행지: "#CD868B",
			      음식점: "#B393D2"
			    }
			  },
			  bindto: "#pieChart"
		});
		
		
		let date = new Date()
		let before = date.getMonth()
		let now = date.getMonth() + 1
		$.ajax({
			type:'GET',
			url:'/rest/admin/index',
			success:function(response) {
				var monthsRateArray =response.monthsRate;
				
				var dates = monthsRateArray.map(item => item.dates);
				var befores = monthsRateArray.map(item => item.before);
				var nows = monthsRateArray.map(item => item.now);
				
				bb.generate({
					  data: {
					    x: "x",
					    columns: [
						["x", ...dates],
						["지난달", ...befores],
						["이번달", ...nows]
					    ],
					    types: {
					    	지난달: "area", // for ESM specify as: area()
					        이번달: "area", // for ESM specify as: areaSpline()
					      },
					   	colors: {
					   		지난달: "#83B1DF",
					   		이번달: "#B393D2"
					    }
					  },
					  bindto: "#simpleXYLineChart"
				});
			}
			
		})
	})
</script>
</html>