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
	<script src="https://d3js.org/d3.v6.min.js"></script>
	<script src="../../resources/css/billboard.js"></script>
	<link rel="stylesheet" href="../../resources/css/billboard.css">
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
	
	#table-user th{
		height: 40px;
		background-color: #E9E9E9;
	}
	#table-user td {
		height: 50px;
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
								<th width="5%">취소</th>
								<th width="15%">매출액</th>
							</tr>
						</thead>
						<tbody id="tbody-user">
							<tr>
								<td>음식점</td>
								<td>10</td>
								<td>10</td>
								<td>2</td>
								<td>100,000원</td>
							</tr>
							<tr>
								<td>음식점</td>
								<td>10</td>
								<td>10</td>
								<td>2</td>
								<td>100,000원</td>
							</tr>
							<tr>
								<td>음식점</td>
								<td>10</td>
								<td>10</td>
								<td>2</td>
								<td>100,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col border">
					<div class="p-3 text-start">
						<strong>금일 매출</strong>
					</div>
					<div class="text-center my-4">
						<h4><strong>3,500,000</strong>원</h4>
					</div>
					<div class="p-3 text-start">
						<strong>일일 회원 현황</strong>
					</div>
					<div class="my-4">
						<ul style="display: table; margin-left: auto; margin-right: auto; font-size:18px;">
							<li><strong>가입</strong>: <span class="ps-2">4</span>명</li>
							<li><strong>탈퇴</strong>: <span class="ps-2">4</span>명</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row m-4">
				<div class="col-6 border me-3" style="text-align: -webkit-center;">
					<div class="p-3 text-start">
						<strong>회원 현황</strong>
					</div>
					<div id="simpleXYLineChart"></div>
				</div>
				<div class="col border">
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
		let date = new Date()
		let before = date.getMonth() + "월"
		let now = date.getMonth() + 1 + "월"
		var chart = bb.generate({
			  data: {
			    x: "x",
			    columns: [
				["x", 1, 2, 3, 4],
				[before, 4, 10, 14, 20],
				[now, 20, 10, 44, 30]
			    ],
			    type: "line", 
			   	colors: {
			   		before: "#83B1DF",
			   		now: "#B393D2"
			    }
			  },
			  bindto: "#simpleXYLineChart"
			});
		
		var chart = bb.generate({
			  data: {
			    columns: [
				["기차", 3],
				["여행지", 5],	["음식점", 2]
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
	})
</script>
</html>