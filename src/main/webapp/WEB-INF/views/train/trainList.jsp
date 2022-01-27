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
	table {
	  border-collapse: collapse;
	}
	table td {
	  border: 1px solid #E0E0E0;
	}


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
	
	.dpTime div, .arTime div {
		font-weight: bold;
	}
	
	#seatList ul, #hocha ul {
		list-style: none;
		display: flex;
		place-content: center;
	}
	#schedule1 button, #schedule2 button {
	
		width: 90px;
		height: 25px;
		padding: initial;
		color: white;
		border-radius: 0;
		font-size: .875rem;
		font-weight: bold;
	}
	#btn1 button, #btn2 button {
		width: 90px;
		height: 35px;
		border-radius: 0;
		text-align-last: center;
		background-color: #003366;
		color: white;
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
	<div class="row" style="position: fixed; left: 0; top: 140px; width: 13%; display:none; 
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
	<div style="border: 1px solid #D8E5F6; background-color: #094A6B; text-align-last: justify">
		<h6 class="px-3 py-2 m-0 fw-bold" style="color: white; display: inline-block;">가는 열차</h6> 
		<span class="px-3 fs-5" style="color: white;">${searchForm.dpDate1 }</span>
	</div>
	<div class="row">
		<div class="col">
			<table class="table text-center">
				<thead style="border-bottom: inset;">
					<tr style="background-color: #E1EDFC; border-bottom: none;">
						<th style="width: 7%;">구분</th>
						<th style="width: 10%;">열차종류</th>
						<th style="width: 10%;">열차번호</th>
						<th style="width: 15%;">출발</th>
						<th style="width: 15%;">도착</th>
						<th style="width: 11%;">특실</th>
						<th style="width: 11%;">일반실</th>
						<th style="width: 10%;">소요기간</th>
						<th style="width: *;">운임</th>
					</tr>
				</thead>
				<tbody id="schedule1" style="vertical-align: middle;">
					<c:forEach var="schedule" items="${schedules1 }">
						<tr>
							<td>직통</td>
							<td>${schedule.trainName }
								<input type="hidden" name="scheduleNo1" value="${schedule.scheduleNo }">
								<input type="hidden" name="trainNo1" value="${schedule.trainNo }">
								<input type="hidden" name="specialBooking1" value="${schedule.specialBooking }">
								<input type="hidden" name="normalBooking1" value="${schedule.normalBooking }">
								<input type="hidden" name="specialSeat1" value="${schedule.specialSeat }">
								<input type="hidden" name="normalSeat1" value="${schedule.normalSeat }">
							</td>
							<td>${schedule.trainNo }</td>
							<td class="dpTime">${searchForm.departureStation } <div><fmt:formatDate value="${schedule.departureTime }" pattern="HH:mm"/></div></td>
							<td class="arTime">${searchForm.arrivalStation }<div><fmt:formatDate value="${schedule.arrivalTime }" pattern="HH:mm"/></div></td>
							<c:choose>
								<c:when test="${schedule.specialSeat eq 0 }">
									<td></td>
								</c:when>
								<c:when test="${schedule.specialBooking eq schedule.specialSeat }">
									<td><button class="btn btn-secondary btn-sm" disabled="disabled">매진</button></td>
								</c:when>
								<c:otherwise>
									<td><button class="btn special" style="background-color: #7E5C5E">예매</button></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${schedule.normalBooking eq schedule.normalSeat }">
									<td><button class="btn btn-secondary btn-sm" disabled="disabled">매진</button></td>
								</c:when>
								<c:otherwise>
									<td><button class="btn normal" style="background-color: #7E5C5E">예매</button></td>
								</c:otherwise>
							</c:choose>
							<td class="runTime">${schedule.diffTime }</td>
							<td><fmt:formatNumber value="${schedule.price }" pattern="##,###" />원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div style="text-align-last: justify" id="btn1">
		<button class="btn" id="prev1">이전</button>
		<button class="btn" id="next1">다음</button>
	</div>
	<c:if test="${not empty schedules2 }">
		<div style="border: 1px solid #D8E5F6; background-color: #094A6B; text-align-last: justify; margin-top: 100px;">
			<h6 class="px-3 py-2 m-0 fw-bold" style="color: white; display: inline-block;">오는 열차</h6> 
			<span class="px-3 fs-5" style="color: white;">${searchForm.dpDate2 }</span>
		</div>
		<div class="row">
			<div class="col">
				<table class="table text-center">
					<thead style="border-bottom: inset;">
						<tr style="background-color: #E1EDFC;">
							<th style="width: 7%;">구분</th>
							<th style="width: 10%;">열차종류</th>
							<th style="width: 10%;">열차번호</th>
							<th style="width: 15%;">출발</th>
							<th style="width: 15%;">도착</th>
							<th style="width: 11%;">특실</th>
							<th style="width: 11%;">일반실</th>
							<th style="width: 10%;">소요기간</th>
							<th style="width: *;">운임</th>
						</tr>
					</thead>
					<tbody id="schedule2" style="vertical-align: middle;">
					<c:forEach var="schedule" items="${schedules2 }">
						<tr>
							<td>직통</td>
							<td>${schedule.trainName }
								<input type="hidden" name="scheduleNo2" value="${schedule.scheduleNo }">
								<input type="hidden" name="trainNo2" value="${schedule.trainNo }">
								<input type="hidden" name="specialBooking2" value="${schedule.specialBooking }">
								<input type="hidden" name="normalBooking2" value="${schedule.normalBooking }">
								<input type="hidden" name="specialSeat2" value="${schedule.specialSeat }">
								<input type="hidden" name="normalSeat2" value="${schedule.normalSeat }">
							</td>
							<td>${schedule.trainNo }</td>
							<td class="dpTime">${searchForm.arrivalStation } <div><fmt:formatDate value="${schedule.departureTime }" pattern="HH:mm"/></div></td>
							<td class="arTime">${searchForm.departureStation }<div><fmt:formatDate value="${schedule.arrivalTime }" pattern="HH:mm"/></div></td>
							<c:choose>
								<c:when test="${schedule.specialSeat eq 0 }">
									<td></td>
								</c:when>
								<c:when test="${schedule.specialBooking eq schedule.specialSeat }">
									<td><button class="btn btn-secondary btn-sm" disabled="disabled">매진</button></td>
								</c:when>
								<c:otherwise>
									<td><button class="btn special" style="background-color: #7E5C5E;">예매</button></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${schedule.normalBooking eq schedule.normalSeat }">
									<td><button class="btn btn-secondary btn-sm" disabled="disabled">매진</button></td>
								</c:when>
								<c:otherwise>
									<td><button class="btn normal" style="background-color: #7E5C5E;">예매</button></td>
								</c:otherwise>
							</c:choose>
							<td class="runTime">${schedule.diffTime }</td>
							<td><fmt:formatNumber value="${schedule.price }" pattern="##,###" />원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div style="text-align-last: justify; margin-bottom: 100px;" id="btn2">
		<button class="btn" id="prev2">이전</button>
		<button class="btn" id="next2">다음</button>
	</div>
	</c:if>
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
		// 검색창 그래도 가져오기 값 까지		
		$(".special").click(function() {
			
			// trainNo, roomType='특실'을 입력하여 room_no roomName(호차)와 rootSeatCount(개수)를 조회
			// 호차수 만큼 호차를 늘리고
			// 호차 버튼을 누르면 rootSeatCount에 해당하는 값을 /3한다. 나머지는 1씩 더하기
			// 예약 리스트 불러오기 티켓테이블에서 SCHEDULE_NO에 해당하는 값들을 가져온다.
			// room_no에 해당하는 호차의 좌석 번호를 조회하여 값이 있으면 해당좌석의 선택 불가로 만든다.
			// getJSON을 두번 불러야 되나??
/* 			$.getJSON('/api/train/getSeat.do', {}, function() {
				
			}); */
			
			seatModal.show()
		});
		
		$("#prev1").click(function() {
		})
		
		$("#btn1").children().click(function() {
			console.log($(this))
			let $btn = $(this) 
			let dpStation = $("input[name=departureStation]").val();
			let arStation = $("input[name=arrivalStation]").val();
			let rowNo;
			if ($btn.attr('id') == 'next1') {
				rowNo = parseInt($("input[name=rowNo1]").val()) + 1;
			} else {
				 rowNo = parseInt($("input[name=rowNo1]").val()) - 1;
			}
			
			let dpDate = $("input[name=dpDate1]").val()
			let dpTime = $("select[name=dpTime1]").val()
			$.getJSON('/api/train/schedule', 
					{departureStation:dpStation, arrivalStation:arStation, rowNo1:rowNo, dpDate1:dpDate, dpTime1:dpTime}, 
					function(response) {
						if (response.status == 'OK') {
							$("#schedule1").children().remove()
							$btn.siblings().prop('disabled', false)
							$.each(response.items, function(index, schedule) {
								let sh = "<tr>"
									sh += "<td>직통</td>"
									sh += "<td>" + schedule.trainName
									sh += "<input type='hidden' name='scheduleNo1' value=" + schedule.scheduleNo + ">"
									sh += "<input type='hidden' name='trainNo1' value=" + schedule.trainNo + ">"
									sh += "<input type='hidden' name='specialBooking1' value=" + schedule.specialBooking + ">"
									sh += "<input type='hidden' name='normalBooking1' value=" + schedule.normalBooking + ">"
									sh += "<input type='hidden' name='normalSeat1' value=" + schedule.normalSeat + ">"
									sh += "<input type='hidden' name='specialSeat1' value=" + schedule.specialSeat + ">"
									sh += "</td>"
									sh += "<td>" + schedule.trainNo + "</td>"
									sh += "<td class='dpTime'>${searchForm.departureStation}<div>" + schedule.departureTime + "</div></td>"
									sh += "<td class='arTime'>${searchForm.arrivalStation}<div>" + schedule.arrivalTime + "</div></td>"
								if (schedule.specialSeat == 0) {
									sh += "<td></td>"
								} else if (schedule.specialBooking == schedule.specialSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn special' style='background-color: #7E5C5E;'>예매</button></td>"
								)
								
								if (schedule.normalBooking == schedule.normalSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn normal' style='background-color: #7E5C5E;'>예매</button></td>"
								)
									sh += "<td class='runTime'>" + schedule.diffTime + "</td>"
									sh += "<td>" + schedule.price + "원</td>"
									sh += "</tr>"
								$("#schedule1").append(sh)
							})
							$("input[name=rowNo1]").val(rowNo)
						} else  {
							$btn.prop('disabled', true)
						}
			})
		});
		
		$("#btn2").children().click(function() {
			console.log($(this))
			let $btn = $(this) 
			let dpStation = $("input[name=arrivalStation]").val();
			let arStation = $("input[name=departureStation]").val();
			let rowNo;
			if ($btn.attr('id') == 'next2') {
				rowNo = parseInt($("input[name=rowNo2]").val()) + 1;
			} else {
				 rowNo = parseInt($("input[name=rowNo2]").val()) - 1;
			}
			
			let dpDate = $("input[name=dpDate2]").val()
			let dpTime = $("select[name=dpTime2]").val()
			$.getJSON('/api/train/schedule', 
					{departureStation:dpStation, arrivalStation:arStation, rowNo1:rowNo, dpDate1:dpDate, dpTime1:dpTime}, 
					function(response) {
						if (response.status == 'OK') {
							$("#schedule2").children().remove()
							$btn.siblings().prop('disabled', false)
							$.each(response.items, function(index, schedule) {
								let sh = "<tr>"
									sh += "<td>직통</td>"
									sh += "<td>" + schedule.trainName
									sh += "<input type='hidden' name='scheduleNo1' value=" + schedule.scheduleNo + ">"
									sh += "<input type='hidden' name='trainNo1' value=" + schedule.trainNo + ">"
									sh += "<input type='hidden' name='specialBooking1' value=" + schedule.specialBooking + ">"
									sh += "<input type='hidden' name='normalBooking1' value=" + schedule.normalBooking + ">"
									sh += "<input type='hidden' name='normalSeat1' value=" + schedule.normalSeat + ">"
									sh += "<input type='hidden' name='specialSeat1' value=" + schedule.specialSeat + ">"
									sh += "</td>"
									sh += "<td>" + schedule.trainNo + "</td>"
									sh += "<td class='dpTime'>${searchForm.arrivalStation}<div>" + schedule.departureTime + "</div></td>"
									sh += "<td class='arTime'>${searchForm.departureStation}<div>" + schedule.arrivalTime + "</div></td>"
								if (schedule.specialSeat == 0) {
									sh += "<td></td>"
								} else if (schedule.specialBooking == schedule.specialSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn special' style='background-color: #7E5C5E;'>예매</button></td>"
								)
								
								if (schedule.normalBooking == schedule.normalSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn normal' style='background-color: #7E5C5E;'>예매</button></td>"
								)
									sh += "<td class='runTime'>" + schedule.diffTime + "</td>"
									sh += "<td>" + schedule.price + "원</td>"
									sh += "</tr>"
								$("#schedule2").append(sh)
							})
							$("input[name=rowNo2]").val(rowNo)
						} else  {
							$btn.prop('disabled', true)
						}
			})
		});
		
		
		var seatModal = new bootstrap.Modal(document.getElementById('modal-seat'), {
			keyboard: false
		});
		
/* 		$("button:contains('예매')").click(function() {
			//좌석 수 예약 수 가져 오고 
			// 해당 좌석을 클릭하면 input : hidden 에 그 값을 넣는다. 
			// 사용자가 누른 버튼이 특실인 경우 3으로 나누고 일반실이면 4로 나누고
			// 3으로 나누고 나머지가 1이면 마지막에 2면 끝에서 2개
		}) */
		
		
	});
	
</script>
</body>
</html>