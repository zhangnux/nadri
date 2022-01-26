<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title>nadri</title>
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
	#hocha span {
		cursor: pointer;
		width: 100px;
		height: 100px;
		background-image: url('../../resources/images/train/icon/canhocha.png');
		background-size: 50px 50px;
		background-repeat: no-repeat;
		padding: 15px 5px;
	}
	#hocha li {
		float: left;
		margin: 10px;
	}

	#seatList li {
		float: left;
		width: 6%;
	}
	#seatList span {
		cursor: pointer;
		display: inline-block;
		width: 35px;
		height: 42px;
		background-image: url('../../resources/images/train/icon/canchair.png');
		background-size: 35px 42px;
		background-repeat: no-repeat;
		padding: 9px 15px;
		
	}
	
	#seatList ul, #hocha ul {
		list-style: none;
		display: flex;
		place-content: center;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>

<!-- ★ -->
<div class="container" id="trainBooking">
	<div class="row my-5">
		<div class="col">
			<h2>기차표</h2>
		</div>
	</div>
	<c:set var="menu1" value="search"/>
	<c:set var="menu2" value="lookup"/>
	<c:set var="active" value="menu2"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<%@ include file="common/searchBar.jsp" %>
	<div class="row">
		<div class="col my-5">
			예약은 예약버튼 눌러.......
		</div>
	</div>
	<div class="row" style="position: fixed; left: 0; top: 140px; width: 13%; 
	height: 35%; border: 1px solid #BACBE2; background-color: white; border-radius: 3px; min-width: 110px;">
		<div class="col m-3" style="background-color: #D8E5F6; border-radius: 3px; border: 1px solid #BACBE2;">
			<h5 class="pt-3" style="font-weight: bolder;">가는 열차</h5>
			<div class=" mt-3" style="border: 2px solid #BACBE2; background-color: white;">
				<div class="text-center row p-2">
					<div class="col">
						<span >09:00</span>
						<span style="font-size: 14px;">서울</span>
					</div>
					<div class="col" style="padding: 0;">
						<i class="fas fa-long-arrow-alt-right fa-2x"></i>
					</div>
					<div class="col">
						<span >09:40</span>
						<span style="font-size: 14px;">부산</span>
					</div>
				</div>
				<div class="row mt-1">
					<div class="col text-center">
						KTX - 1
					</div>
				</div>
				<div class="row my-3">
					<div class="col text-center">
						좌석  1호차 11 <div style="font-size: 11px;">외 2명</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="border: 1px solid #D8E5F6; background-color: #7C97B9;">
		<h6 class="px-3 py-2 m-0 fw-bold" style="color: white;">가는 열차</h6> 
	</div>
	<div class="row">
		<div class="col">
			<table class="table text-center">
				<thead>
					<tr>
						<th>열차종류</th>
						<th>열차번호</th>
						<th>출발</th>
						<th>도착</th>
						<th>특실</th>
						<th>일반실</th>
						<th>소요기간</th>
						<th>운임</th>
					</tr>
				</thead>
				<tbody style="vertical-align: middle;">
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <div>9:00</div></td>
						<td>부산 <div>10:45</div></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>1:45:00</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-end">
		<button class="btn btn-secondary btn-sm">다음</button>
	</div>
	<div class="mt-5" style="border: 1px solid #D8E5F6; background-color: #7C97B9;">
		<h6 class="px-3 py-2 m-0 fw-bold" style="color: white;">오는 열차</h6> 
	</div>
	<div class="row">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th>열차종류</th>
						<th>열차번호</th>
						<th>출발</th>
						<th>도착</th>
						<th>특실</th>
						<th>일반실</th>
						<th>소요기간</th>
						<th>운임</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
					<tr>
						<td>KTX</td>
						<td>1</td>
						<td>서울 <span>9:00</span></td>
						<td>부산 <span>10:45</span></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td><button class="btn btn-secondary btn-sm">예매</button></td>
						<td>소요기간</td>
						<td>운임</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-end">
		<button class="btn btn-secondary btn-sm">다음</button>
	</div>
	<div class="modal" tabindex="-1" id="modal-seat" style="border: 1px solid #D8E5F6;">
 		<div class="modal-dialog modal-xl">
	   		<div class="modal-content" style="background-color: #7C97B9;">
	    		<div class="modal-body">
		    		<div style="display: flex; justify-content: space-between;">
		       			<h6 class="modal-title mb-2 fw-bold" style="color: white;">좌석 조회</h6>
	    	   			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
		    		</div>
	    			<div class="border" style="background-color: white;">
	    				<div class="m-5" id="hocha">
	    					<ul>
	    						<li><span>1호차</span></li>
	    						<li><span>2호차</span></li>
	    						<li><span>3호차</span></li>
	    					</ul>
	    				</div>
	    				<div>
	    					<h5 class="ms-5">KTX 1 서울 > 부산행 좌석 정보</h5>
	    				</div>
	    				<div class="text-end">
	    					<ul style="list-style: none; display: inline-flex;">
	    						<li class="mx-1">
			    					<em class="color me-2" style="border: 1px solid black; background-color: #69C4D7; padding: 0.2px 10px">
			    					</em>
			    					<span>선택 좌석</span>
	    						</li>
	    						<li class="mx-1">
			    					<em class="color me-2" style="border: 1px solid black; background-color: grey; padding: 0.2px 10px">
			    					</em>
			    					<span>선택 불가</span>
	    						</li>
	    						<li class="me-5 ms-1">
			    					<em class="color me-2" style="border: 1px solid black; padding: 0.2px 10px">
			    					</em>
			    					<span>선택 가능</span>
	    						</li>
	    					</ul>
	    				</div>
	    				<hr class="mx-5">
	    				<div id="seatList">
	    					<ul>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    					</ul>
	    					<ul>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    						<li><span>1</span></li>
	    					</ul>
	    				</div>
	    				<hr class="mx-5">
	    				<div class="text-end m-5 justify-content-between">
	    					<span>선택 좌석 <input type="text"></span>
	    					<button class="btn btn-secondary">선택좌석예약</button>
	    				</div>
	    			</div>
     			</div>
   			</div>
 		</div>
	</div>
</div>
<!--  -->
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		var seatModal = new bootstrap.Modal(document.getElementById('modal-seat'), {
			keyboard: false
		});
		
		$("button:contains('예매')").click(function() {
		
			//좌석 수 예약 수 가져 오고 
			// 해당 좌석을 클릭하면 input : hidden 에 그 값을 넣는다. 
			let totalSeat = $("")
			// 사용자가 누른 버튼이 특실인 경우 3으로 나누고 일반실이면 4로 나누고
			// 3으로 나누고 나머지가 1이면 마지막에 2면 끝에서 2개
			// 네모를 어떻게 만들지?
			
			
			seatModal.show()
		})
		
		
	})
	
</script>
</body>
</html>