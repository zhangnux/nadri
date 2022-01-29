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
	.listTable {
	  border-collapse: collapse;
	}
	.listTable td {
	  border: 1px solid #E0E0E0;
	}
	
	/* 호차 스킨 */
	#hocha span.can {
		cursor: pointer;
		width: 100px;
		height: 100px;
		background-image: url('../../resources/images/train/icon/canhocha.png');
		background-size: 50px 50px;
		background-repeat: no-repeat;
		padding: 15px 5px;
	}
	#hocha span.not {
		width: 100px;
		height: 100px;
		background-image: url('../../resources/images/train/icon/nohocha.png');
		background-size: 50px 50px;
		background-repeat: no-repeat;
		padding: 15px 5px;
	}
	#hocha li {
		float: left;
		margin: 3px;
	}

	#seatList ul li {
		float: left;
		width: 6%;
	}

	/* 좌석 스킨 */
	#seatList ul span {
		cursor: pointer;
		display: inline-block;
		width: 35px;
		height: 42px;
		background-image: url('../../resources/images/train/icon/canchair.png');
		background-size: 35px 42px;
		background-repeat: no-repeat;
		text-align: center;
		padding-top: 9px;
		padding-left: 5px;
		font-size: 15px;
		font-weight: bold;
		color: #606060;
	}
	#seatList ul span.no {
		background-image: url('../../resources/images/train/icon/nochair.png');
		color: white;
		cursor: default;
	}
	
	#seatList ul span.chosen {
		background-image: url('../../resources/images/train/icon/chosenchair.png');
	}
	
	/*  */
	.dpTime div, .arTime div {
		font-weight: bold;
	}
	#seatList ul {
		margin-bottom: 10px;
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
	
	/* sidebar 스킨 */
	.btn-s {
		background: #D8E5F6;
		position: absolute;
		top: 10px;
		left: 223px;
		width: 30px;
		padding: 0;
		height: 52px;
		border: 1px solid #BECDE4;
		color: black;
		font-weight: bold;
	}
	.btn-s + div {
		position: absolute;
		height: 265px;
		width: 200px;	
		background-color: #D8E5F6; 
		border-radius: 3px; 
		border: 1px solid #BACBE2;
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
		<div class="col m-5">
			예메 버튼을 눌러 좌석을 선택해 주세요.
		</div>
	</div>
	<div>
		<form action="" method="post" id="seatBooking">
			<!-- 예약 좌석 현황 sidebar -->
			<div class="row" style="position: fixed; left: 0; top: 140px; width: 13%;
			height: 300px; border: 1px solid #BACBE2; background-color: white; border-radius: 3px; width: 225px;">
				<button type="button" class="btn-s"><i class="bi bi-caret-left-fill"></i></button>
				<div class="col m-3">
					<h5 class="pt-3" style="font-weight: bolder;">가는 열차</h5>
					<div class=" mt-3" style="border: 2px solid #BACBE2; background-color: white; height: 175px;">
						<div class="text-center row p-2">
							<div class="col">
								<input type="hidden" name="schduleNo1">
								<input type="hidden" name="trainNo1">
								<input type="hidden" name="schduleNo2">
								<input type="hidden" name="trainNo2">
								<span><!-- 출발시간 --></span>
								<span style="font-size: 14px;"><!-- 출발역 --></span>
							</div>
							<div class="col" style="padding: 0; display: none;">
								<i class="fas fa-long-arrow-alt-right fa-2x"></i>
							</div>
							<div class="col">
								<span ><!-- 도착시간 --></span>
								<span style="font-size: 14px;"><!-- 도착역 --></span>
							</div>
						</div>
						<div class="row mt-1">
							<div class="col text-center">
								예약 정보가 없습니다.<!-- 기차종류, 번호 -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 가는 열차 -->
			<div style="border: 1px solid #D8E5F6; background-color: #094A6B; text-align-last: justify">
				<h6 class="px-3 py-2 m-0 fw-bold" style="color: white; display: inline-block;">가는 열차</h6> 
				<span class="px-3 fs-5" style="color: white;">${searchForm.dpDate1 }</span>
			</div>
			<div class="row">
				<div class="col">
					<table class="table text-center listTable">
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
									<td class="infoTrain" data-schedule-no="${schedule.scheduleNo }" >${schedule.trainName }
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
											<td><button class="btn special" type="button" style="background-color: #7E5C5E">예매</button></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${schedule.normalBooking eq schedule.normalSeat }">
											<td><button class="btn btn-secondary btn-sm" disabled="disabled">매진</button></td>
										</c:when>
										<c:otherwise>
											<td><button class="btn normal" type="button" style="background-color: #7E5C5E">예매</button></td>
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
				<button class="btn" type="button" id="prev1">이전</button>
				<button class="btn" type="button" id="next1">다음</button>
			</div>
			<c:if test="${not empty schedules2 }">
				<div style="border: 1px solid #D8E5F6; background-color: #094A6B; text-align-last: justify; margin-top: 100px;">
					<h6 class="px-3 py-2 m-0 fw-bold" style="color: white; display: inline-block;">오는 열차</h6> 
					<span class="px-3 fs-5" style="color: white;">${searchForm.dpDate2 }</span>
				</div>
				<div class="row">
					<div class="col">
						<table class="table text-center listTable">
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
									<td class="infoTrain" data-schedule-no="${schedule.scheduleNo }">${schedule.trainName }
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
											<td><button class="btn special" type="button" style="background-color: #7E5C5E;">예매</button></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${schedule.normalBooking eq schedule.normalSeat }">
											<td><button class="btn btn-secondary btn-sm" disabled="disabled">매진</button></td>
										</c:when>
										<c:otherwise>
											<td><button class="btn normal" type="button" style="background-color: #7E5C5E;">예매</button></td>
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
				<button class="btn" type="button" id="prev2">이전</button>
				<button class="btn" type="button" id="next2">다음</button>
			</div>
		</c:if>
		</form>
	</div>
	<!-- 좌석 선택 모달창 -->
	<div class="modal" tabindex="-1" id="modal-seat" style="border: 1px solid #D8E5F6;" data-root-type="">
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
	    						
	    					</ul>
	    				</div>
	    				<div>
	    					<h5 class="ms-5" id="rootInfo">
	    						
	    					</h5>
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
							
	    				</div>
	    				<hr class="mx-5">
	    				<div class="text-end m-5" style="text-align-last: justify;">
	    					<div class="chosenSeatList" style="display: inline-block;">선택 좌석 </div>
	    					<button class="btn btn-secondary" type="button" id="btn-booking" style="border-radius: 0;">선택좌석예약</button>
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
		// sidebar 토글
		$('.btn-s').click(function(){
			let $side = $(this).parent().toggleClass('open');

			if($side.hasClass('open')) {
				$side.stop(true).animate({left:'0px'}, 200);
				$(this).children().attr('class', 'bi bi-caret-left-fill');
			}else{
				$side.stop(true).animate({left:'-204px'}, 200);
				$(this).children().attr('class', 'bi bi-caret-right-fill');
			};
		});
		
		// 좌석 4, 3 분할
		function seatDivide(no, stan) {
			let four = Math.floor(no/stan);
			let array = [];
			let s;
			for (var i=1; i<=stan; i++) {
				if ((four*i + (four+1)*(stan-i)) == no) {
					s = i; 
				}
			}
			for (var i=1; i<=s; i++ ) {
				array.push(four); 
			}
			
			for (var i=1; i<=(stan-s); i++) {
				array.push(four+1);
			}
			return array;
		}
		
		// 숫자 콤마 붙이기
		function addCommas(nStr) {
		    nStr += '';
		    x = nStr.split('.');
		    x1 = x[0];
		    x2 = x.length > 1 ? '.' + x[1] : '';
		    var rgx = /(\d+)(\d{3})/;
		    while (rgx.test(x1)) {
		        x1 = x1.replace(rgx, '$1' + ',' + '$2');
		    }
		    return x1 + x2;
		}
		// ----------------------------------------------------------------------
		// 기차의 스케줄, 번호에 해당하는 모든 좌석정보 불러오기
		function hochaInfo(type, trainNo, scheduleNo, stan) {
			let $hocha = $("#hocha").children('ul').empty()
			let $seat = $("#seatList").empty()
			
			$.getJSON('/api/train/trainInfo',
					{roomType: type, trainNo: trainNo, schduleNo: scheduleNo},
					function(response) {
						console.log(response)
						$.each(response.rooms, function(index, room) {
							let ho;
							// 호차 나열
							if (room.bookedSeatNum == room.seatNum) {
								ho = "<li><span class='not'>" + room.name + "</span></li>"
							} else {
								ho = "<li><span class='can' data-room-no='"+ room.no +"'>" + room.name + "</span></li>"
							}
							let index1 = index;
							let no = room.seatNum;
							let seatdiv = seatDivide(no, stan);
							console.log(seatdiv)
							let seatNo = 0;

							let seat;
							if (index1 == 0) {
								seat = "<div data-seat-no='"+ room.no +"'>"
							} else {
								seat = "<div data-seat-no='"+ room.no +"' style='display:none'>"
							}
							// 좌석 분할  [10, 10, 10, 10]
							seatdiv.forEach(function(num, index) {
								seat += "<ul>"
								// 좌석 배치 (낱개)
								for (var i=1; i<= num; i++) {
									seat += "<li><span>" + ++seatNo +"</span></li>"										
								}
								seat += "</ul>"
								if (index == 1) {
									seat += "<ul class='m-4'></ul>"
								}
							})
							seat += "</div>"
								$seat.append(seat)	
							// 변화를 따로 빼서 준다.
							response.seatList.forEach(function(item) {
								let hoNo =item.roomNo;
								let seatNo = item.seatNo - 1
								$("div[data-seat-no="+hoNo+"] li span:eq("+seatNo+")").addClass('no')
							})
							$hocha.append(ho)
						})
				})
			seatModal.show()
		}
		
		// 모달창 생성
		var seatModal = new bootstrap.Modal(document.getElementById('modal-seat'), {
			keyboard: false
		});
		
		$("#btn-booking").click(function() {
			
		})
		
		// 모달창이 꺼질때 실행되는 이벤트 // 선택한 좌석 정보 삭제 
		 $('#modal-seat').on('hidden.bs.modal', function (event) {
			$(".chosenSeatList").find("span").empty()
			let target = $(this).closest('.modal').attr('data-root-type')
			$("[data-schedule-no="+ target + "]").closest('tbody').find('input').remove()
			if ($("[data-schedule-no="+ target + "]").closest('tbody').attr('id') == 'schedule1') {
				clickNo1 = $("input[name=count1]").val();
			} else {
				clickNo2 = $("input[name=count2]").val();
			}
		})
		
		// 선택 횟수만 조율하면 된다. 각각의 tbody의 id의 input의 개수의 /2 개가 count1,2 수 보다 크면 안된다.
		// 좌석을 클릭했을 때 
		$("#seatList").on('click', 'span', function(event) {
			event.preventDefault();
			// 가는 열차 or 오는 열차 좌석이냐 구분해주기
			let putNo = $(this).closest('.modal').attr('data-root-type')
			let target = $("td[data-schedule-no="+ putNo + "]").closest('tbody').attr('id')
			let inputNo;
			let inputRoomNo;
			let maxCount;
			if (target == 'schedule1') {
				inputNo = "<input type='hidden' name='seatNo1'"
				inputRoomNo = "<input type='hidden' name='roomNo1'"
				maxCount = $("[name=count1]").val()
			} else {
				inputNo = "<input type='hidden' name='seatNo2'"
				inputRoomNo = "<input type='hidden' name='roomNo2'"
				maxCount = $("[name=count2]").val()
			}
			
			if (!$(this).hasClass("no") && !$(this).hasClass("chosen")) {
				// 클릭횟수 제어
				let count = Math.floor($("td[data-schedule-no="+ putNo + "]").closest('tbody').find('input').length/2)
				if (count == maxCount) {
					alert(maxCount + "명 이상 선택할 수 없습니다.")
					return;
				}
				
				$(this).attr("class", "chosen")
				inputNo += " value=" + $(this).text() + " />"
				inputRoomNo += " value=" + $(this).closest('div').attr('data-seat-no') + " />"
				$("#"+ target).append(inputNo).append(inputRoomNo)
				
				//모달창 선택 좌석 표시
				$(".chosenSeatList").append("<span class='seatlist'>" + $(this).text() +"번</span>")
			} else if ($(this).hasClass("chosen")) {
				$(this).removeClass("chosen")
				$("[value=" + $(this).text() + "]").next().remove()
				$("[value=" + $(this).text() + "]").remove()
				$(".chosenSeatList").find("span:contains('" + $(this).text() + "')").remove()
			}
		});
		
		// 좌석 모달창에서 호차를 클릭할 때 // 호차에 해당하는 좌석이 뜬다. 다른 좌석 정보는 숨겨짐
		$("#hocha").on('click', 'span.can', function(event) {
			event.preventDefault();
			let no = $(this).attr('data-room-no')
			$("#seatList div").hide().filter("[data-seat-no="+ no +"]").show()
			console.log($("#seatList div").hide().filter("[data-seat-no="+ no +"]").show().closest('.modal').attr('data-root-type'))
			// 다른 호차 선택시 클릭 한거 초기화
			$(".chosenSeatList").find("span").empty()
			let target = $(this).closest('.modal').attr('data-root-type')
			$("[data-schedule-no="+ target + "]").closest('tbody').find('input').remove()
			if ($("[data-schedule-no="+ target + "]").closest('tbody').attr('id')== 'schedule1') {
				clickNo1 = $("input[name=count1]").val();
			} else {
				clickNo2 = $("input[name=count2]").val();
			}
		})
		
		// 특실 예약 클릭시
		$(".listTable").on('click', '.special', function(event) {
			event.preventDefault();
			let searchInfo = $(this).parent('td').siblings().filter(".infoTrain")
			let trainNo = searchInfo.next().text().trim()
			let scheduleNo = searchInfo.attr('data-schedule-no')
			let type = '특실'
			$("#modal-seat").attr('data-root-type', scheduleNo)
			
			// modal창에 표시할 값 설정
			let dp = $(this).parent('td').prevAll().filter('.dpTime').contents()[0].textContent
			let ar = $(this).parent('td').prevAll().filter('.arTime').contents()[0].textContent
			let trainName = searchInfo.text().trim()
			
			// 루트 표시
			$("#rootInfo").text(trainName + ' ' + trainNo + ' ').append("<strong class='mx-2 text-primary'>" + dp + ">" + ar + "</strong>행 일반실 좌석 정보")
			hochaInfo(type, trainNo, scheduleNo, 3) 
		})
		
		// 일반실 예약 클릭시
		$(".listTable").on('click', '.normal', function(event) {
			event.preventDefault();
			console.log($(this).closest('td').attr('id'))
			let searchInfo = $(this).parent('td').siblings().filter(".infoTrain")
			let trainNo = searchInfo.next().text().trim()
			let scheduleNo = searchInfo.attr('data-schedule-no')
			let type = '일반실'
			$("#modal-seat").attr('data-root-type', scheduleNo)
			
			let dp = $(this).parent('td').prevAll().filter('.dpTime').contents()[0].textContent
			let ar = $(this).parent('td').prevAll().filter('.arTime').contents()[0].textContent
			let trainName = searchInfo.text().trim()
			
			$("#rootInfo").text(trainName + ' ' + trainNo + ' ').append("<strong class='mx-2 text-primary'>" + dp + ">" + ar + "</strong>행 일반실 좌석 정보")
			hochaInfo(type, trainNo, scheduleNo, 4) 
		});
		
		//-----------------------------------------------------------
		// 가는열차 다음, 이전 버튼 페이지네이션
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
			$.getJSON("/api/train/schedule", 
					{departureStation:dpStation, arrivalStation:arStation, rowNo1:rowNo, dpDate1:dpDate, dpTime1:dpTime}, 
					function(response) {
						if (response.status == 'OK') {
							$("#schedule1").children().remove()
							$btn.siblings().prop('disabled', false)
							$.each(response.items, function(index, schedule) {
								let sh = "<tr>"
									sh += "<td>직통</td>"
									sh += "<td class='infoTrain' data-schedule-no='"+ schedule.scheduleNo +"'>" + schedule.trainName
									sh += "</td>"
									sh += "<td>" + schedule.trainNo + "</td>"
									sh += "<td class='dpTime'>${searchForm.departureStation}<div>" + schedule.departureTime + "</div></td>"
									sh += "<td class='arTime'>${searchForm.arrivalStation}<div>" + schedule.arrivalTime + "</div></td>"
								if (schedule.specialSeat == 0) {
									sh += "<td></td>"
								} else if (schedule.specialBooking == schedule.specialSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn special type='button'' style='background-color: #7E5C5E;'>예매</button></td>"
								)
								
								if (schedule.normalBooking == schedule.normalSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn normal' type='button' style='background-color: #7E5C5E;'>예매</button></td>"
								)
									sh += "<td class='runTime'>" + schedule.diffTime + "</td>"
									sh += "<td>" + addCommas(schedule.price) + "원</td>"
									sh += "</tr>"
								$("#schedule1").append(sh)
							})
							$("input[name=rowNo1]").val(rowNo)
						} else  {
							$btn.prop('disabled', true)
						}
			})
		});
		
		// 오는 열차 다음, 이전 버튼 페이지네이션
		$("#btn2").children().click(function() {
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
									sh += "<td class='infoTrain' data-schedule-no='"+ schedule.scheduleNo +"'>" + schedule.trainName
									sh += "</td>"
									sh += "<td>" + schedule.trainNo + "</td>"
									sh += "<td class='dpTime'>${searchForm.arrivalStation}<div>" + schedule.departureTime + "</div></td>"
									sh += "<td class='arTime'>${searchForm.departureStation}<div>" + schedule.arrivalTime + "</div></td>"
								if (schedule.specialSeat == 0) {
									sh += "<td></td>"
								} else if (schedule.specialBooking == schedule.specialSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn special' type='button' style='background-color: #7E5C5E;'>예매</button></td>"
								)
								
								if (schedule.normalBooking == schedule.normalSeat) {
									sh += "<td><button class='btn btn-secondary btn-sm' type='button' disabled='disabled'>매진</button></td>"
								} else (
									sh += "<td><button class='btn normal' type='button' style='background-color: #7E5C5E;'>예매</button></td>"
								)
									sh += "<td class='runTime'>" + schedule.diffTime + "</td>"
									sh += "<td>" + addCommas(schedule.price) + "원</td>"
									sh += "</tr>"
								$("#schedule2").append(sh)
							})
							$("input[name=rowNo2]").val(rowNo)
						} else  {
							$btn.prop('disabled', true)
						}
			})
		});
		
	});
	
</script>
</body>
</html>