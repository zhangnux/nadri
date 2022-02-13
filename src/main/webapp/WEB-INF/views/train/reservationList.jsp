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
</head>
<style>

	@media print {
		html, body {
			width: 297mm;
			heigh: 210mm;
		}
		#print-target {
			margin: 25px; width:916px;  min-width: 916px;
		}
	}

	#reservationTable td, #reservationTable th{
		border: 1px solid #C0C0C0;
		height: 50px;
	}
	
	#reservationTable td {
		height: 70px;
	}
	
	#reservationTable {
		text-align: center;
		width: 100%;
	}
	
	.btn {
		width: 100px;
		height: 35px;
		border-radius: 0;
		text-align-last: center;
		font-size: .875rem;
		padding: initial;
		font-weight: bold;
	}
	
	.btn-ticketing {
		width: 80px;
		height: 30px;
		border: 1px solid black;
		background-color: lightgray; 
		color: black;
	}
	
	hr + div div {
		background-color: #E6ECF3;
		border: 1px solid #E0E0E0;
		cursor: pointer;
	}
	hr + div div.active {
		background-color: #495C75;
		border: 1px solid #E0E0E0;
		color: white;
	}
	
	#credit-btn button {
		height: 45px;
		width: 150px;
	}
	#page span {
		border: 0;
		border-radius: 3px;
	}
	#page .page-item.active .page-link {
		background-color: #659ED7;
		height: 40px;
		
	}
	
	.page {
		padding: 9px 12px;
		cursor: pointer;
	}
	
	span[aria-label] {
		padding: 4px 12px;
		font-size: 21px;
	}
	#ticket-table th {
		height: 43px;
		border: 1px solid lightgray;
	}
	
	#ticket-table td {
		border: 1px solid lightgray;
		height: 37px;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container d-print-none">
	<div class="row my-5">
		<div class="col">
			<h2>발권/취소/변경</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="active" value="menu4"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row text-center" style="padding: 12px 12px; font-size: 20px;">
		<div class="col-4 p-4 active" id="cancel-div">
			발권/취소
		</div>
		<div class="col-4 p-4" id="modify-div">
			예약변경
		</div>
		<div class="col-4 p-4" id="search-div">
			이용내역
		</div>
	</div>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				${sessionScope.LOGIN_USER.name } <span>고객님의 예약 및 발권내역은 아래와 같습니다.</span>
			</li>
			<li class="mt-2">
				열차를 클릭하시면 티켓 상세정보를 확인하실 수 있습니다.
			</li>
			<li class="mt-2">
				출발시각 이전까지 예약한 승차권을 발권받지 않은 경우 자동 예약 좌석이 자동으로 취소되며, 위약금(결제금액의 15%)이 발생하니 반드시 승차권을 발권하시기 바랍니다.
			</li>
			<li class="mt-2">
				최대 <strong>2</strong>개의 예약 건을 결제하실 수 있습니다.
			</li>
			<li class="mt-2">
				반환요청 하실 티켓을 선택한 다음 반환요청 버튼을 눌러주세요.
			</li>
		</ul>
		<ul style="display: none;">
			<li>
				${sessionScope.LOGIN_USER.name } 고객님의 예약 및 발권내역은 아래와 같습니다
			</li>
			<li class="mt-1">
				승차일자, 구간, 차실, 출발시각 변경하거나 승차인원이 증가하는 경우는 예약취소 후 다시 예약해야 하며, 열차출발 2일 전 취소시는 수수료가 발생하지 않습니다.
			</li>
			<li class="mt-1">
				출발시각 이전까지 예약한 승차권을 발권 받지 않는 경우 예약 좌석이 자동을 취소되며, 위약금(결제금액의 15%)이 발생하니 반드시 승차권을 발권하시기 바랍니다.
			</li>
		</ul>
	</div>
	<div class="row mt-4">
		<div class="col">
			<form action="/train/refund.nadri" method="get" id="form-refund">
				<input type="hidden" name="reservationNo1" >
			</form>
			<form action="/train/payment.nadri" method="get" id="form-modify">
				<table class="text-center" id="reservationTable">
					<thead>
						<tr style="background-color: #D6DEE8; ">
							<th width="5%">선택</th>
							<th width="10%">승차일자</th>
							<th width="10%">열차</th>
							<th width="10%">출발</th>
							<th width="10%">도착</th>
							<th width="7%">예약매수</th>
							<th width="11%">총 결제금액</th>
							<th width="11%">소요시간</th>
							<th width="13%">결제기한</th>
							<th width="13%">예약취소/환불</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty reservationList }">
								<c:forEach var="reservation" items="${reservationList }">
								<tr>
									<td data-reservation-no="${reservation.no }">
									<c:if test="${reservation.tickectStatus eq '예약' }">
										<input type="checkbox" name="reservationNo" value="${reservation.no }">
									</c:if>
									</td>
									<td><fmt:formatDate value="${reservation.departureTime }" pattern="yyyy-MM-dd"/></td>
									<td class="ticket" style="color: #CD868B; cursor: pointer;"><strong>${reservation.trainName } - ${reservation.trainNo }</strong></td>
									<td>${reservation.departureStation }<div><fmt:formatDate value="${reservation.departureTime }" pattern="HH:mm"/></div></td>
									<td>${reservation.arrivalStation }<div><fmt:formatDate value="${reservation.arrivalTime }" pattern="HH:mm"/></div></td>
									<td>${reservation.totalCount }</td>
									<td><fmt:formatNumber value="${reservation.totalPrice }" pattern="##,###"/></td>
									<td>${reservation.diffTime }</td>
									<c:choose>
										<c:when test="${reservation.tickectStatus eq '예약' }">
											<td class="text-danger fw-bold"><fmt:formatDate value="${reservation.reservationDate }" pattern="HH시 mm분까지" />
												<button type="button" class="btn btn-payment" style="border: 1px solid black; height: 25px;">결제하기</button>
											</td>
											<td><button type="button" class="btn btn-cancel" style="background-color: #7E5C5E; color: white;">예약 취소</button></td>
										</c:when>
										<c:when test="${reservation.tickectStatus eq '결제' }">
											<td>결제 완료 
												<c:if test="${reservation.isPrinted eq 'N' }">
													<div><button type="button" class="btn btn-ticketing">발권</button></div>
												</c:if>
											</td>
											<td><button type="button" class="btn btn-refund" style="background-color: #A0A0A0; color: white;">환불</button></td>
										</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="10" class="p-5">예약된 내역이 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="text-end mt-5 text-center" id="credit-btn">
		<button class="btn btn-dark">결제하기</button>
		<button class="btn border" style="display: none;">인원변경</button>
	</div>
</div>
<div class="modal d-print-block" tabindex="-1" data-bs-backdrop="static" id="modal-print" style="border: 1px solid #D8E5F6;">
	<div class="modal-dialog modal-dialog-scrollable modal-xl" >
   		<div class="modal-content" style="background-color: #7C97B9; min-height: 600px;">
    		<div class="modal-body pt-2">
    			<div class="d-print-none" style="display: flex; justify-content: space-between;">
	       			<h6 class="modal-title mb-2 fw-bold" style="color: white;">승차권 발권</h6>
    	   			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
	    		</div>
   				<div style="background-color: white; min-height: 620px; " id="print-list">
   					<div class="mx-4 pt-3 row d-print-none" id="print-info">
   						<div class="col-10">
   							승차권 인쇄 버튼을 눌러서 승차권을 인쇄하여 주십시오.
   						</div>
   						<div class="col-1">
	    					<button class="btn btn-outline-dark" onclick="onPrint()">프린트</button>
   						</div>
   					</div>
   					<div id="print-target" >
	    				
	    			</div>
	    			<div class="d-print-none pb-2" id="pagination">
	    				<nav aria-label="Page navigation example" style="text-decoration: none;" id="page">
							<ul class="pagination justify-content-center mt-4">
								<li class="page-item" id="previous">
									<span class="page-link" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</span>
								</li>
								<li class="page-item" id="next">
									<span class="page-link" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</span>
								</li>
							</ul>
						</nav>
	    			</div>
    			</div>
			</div>
  		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-ticket" style="border: 1px solid #D8E5F6;">
	<div class="modal-dialog modal-lg">
   		<div class="modal-content" style="background-color: #7C97B9;">
    		<div class="modal-body pt-2">
    			<div style="display: flex; justify-content: space-between;">
	       			<h6 class="modal-title mb-2 fw-bold" style="color: white;">예약좌석 정보</h6>
    	   			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
	    		</div>
   				<div class="py-4" style="background-color: white;">
    				<div class="mx-4" >
    					<table style="margin: 0; width: 100%; text-align: center;" id="ticket-table">
    						<thead>
    							<tr style="background-color: #ECF5FF;">
    								<th>객실등급</th>
    								<th>좌석 정보</th>
    								<th>승객 유형</th>
    								<th>결제가격</th>
    							</tr>
    						</thead>
    						<tbody id="ticketList">
    							
    						</tbody>
    					</table>
    				</div>
    			</div>
			</div>
 		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
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
		
		var printModal = new bootstrap.Modal(document.getElementById('modal-print'), {
			keyboard: false
		});

		var ticketModal = new bootstrap.Modal(document.getElementById('modal-ticket'), {
			keyboard: false
		});
		
		$(".ticket").click(function() {
 			let reservationNo = $(this).siblings().eq(0).attr('data-reservation-no')
			
			$.ajax({type:"GET",
				url:"/api/train/ticket/" + reservationNo,
				success:function(response) {
					$("#ticketList").empty();
					$.each(response, function(index, data) {
						let ticket;
						ticket = '<tr><td>' + data.roomType + '</td>'
						ticket += '<td>' + data.roomName + " - " + data.seatNo + '</td>'
						ticket += '<td>' + data.type + '</td>'
						ticket += '<td>' + data.price + '</td>'
						ticket += '</tr>'
						$("#ticketList").append(ticket);
					})
				},
				error:function() {
					alert("티켓 정보가 존재하지 않습니다.")
				}
			})
			ticketModal.show()
		})
		
		
		$("#search-div").click(function() {
			$(location).attr('href', "http://localhost/train/search.nadri")
		})
		
		$("#modify-div").click(function() {
			$("#reservationTable").find('th').last().hide()
			$("#reservationTable").find('td:nth-of-type(10)').hide().prev().find('button').hide()
			$("input[name=reservationNo]").attr('type', 'radio');
			$("#credit-btn").children().hide().next().show()
			$(this).addClass('active').siblings().removeClass('active')
			$("#explanation").hide().next().show()
		})
		
		$("#cancel-div").click(function() {
			$("#reservationTable").find('th').last().show()
			$("#reservationTable").find('td:nth-of-type(10)').show().prev().find('button').show()
			$("#credit-btn").children().show().next().hide()
			$("input[name=reservationNo]").attr('type', 'checkbox');
			$(this).addClass('active').siblings().removeClass('active')
			$("#explanation").show().next().hide()
		})
		
		// 다중 결제하기 버튼
		$("#credit-btn > button:first-child").click(function() {
 			if ($(":checked").val() == null) {
				alert("결제하실 표를 선택해 주세요.")
				return;
			} 
			
			if ($(":checked").length > 2) {
				alert("2개 이상은 결제하실 수 없습니다.")
				return;
			}
			
			$("#form-modify").attr('action', '/train/payment.nadri')
			$("#form-modify").submit()
		})
		
		// 단일 결제하기 버튼
		$(".btn-payment").click(function() {
			$(":checked").prop('checked', false)
			console.log($(this).parent().prevAll().eq(7).children())
			$(this).parent().prevAll().eq(7).children().prop('checked', true)
			
			$("#form-modify").attr('action', '/train/payment.nadri')
			$("#form-modify").submit()
		})
		
		$(".btn-refund").click(function() {
			let target = $(this).parent().prevAll().eq(8).attr('data-reservation-no')
			$("[name=reservationNo1]").val(target)
			$("#form-refund").submit()
		})
		
		// 예약변경 버튼
		$("#credit-btn > button:nth-child(2)").click(function() {
			if ($(":checked").val() != null) {
				$("#form-modify").attr('action', '/train/modify.nadri')
				$("#form-modify").submit()
			} else {
				alert("변경하실 표를 선택해 주세요.")
			}
		})
		
		// 예약취소버튼
		$(".btn-cancel").click(function() {
			let cancel = confirm("예약을 취소하시겠습니까?")
			let $btn = $(this)
			if (cancel) {
				let target = $(this).parent().siblings().eq(0).children().val()
				$.ajax({type:'DELETE',
						dataType:'json',
						url:"/api/train/reservation/" + target,
						success:function() {
							$btn.closest('tr').remove()
							alert("취소가 완료되었습니다.")
						},
						error:function() {
							
						},
						statusCode:{
							404:function() {
								$btn.closest('tr').remove()
								alert("취소된 예약정보 입니다.")
							}
						}
				})
			}
		})
		
		function pagination($info, no) {
			console.log($info)
			let reservationNo = $info.eq(0).attr("data-reservation-no")
			let dpDate = $info.eq(1).text()
			let dpStation = $info.eq(3).contents()[0].textContent
			let dpTime = $info.eq(3).contents()[1].textContent
			let arStation = $info.eq(4).contents()[0].textContent
			let arTime = $info.eq(4).contents()[1].textContent
			let train = $info.eq(2).text()
			$.ajax({
				type:'GET',				
				url:'/api/train/print/'+ reservationNo, 
				data: {page:no},
				success:function(response) {
					console.log(response)
					$("#print-target").empty()
					$(".pagination li:has(.page)").remove()
					$.each(response.ticketList, function(index, ticket) {
						let add;
						add = '<div class="row border d-print-block d-print-flex jstify-content-between" id="print-target" style="margin: 25px; max-width: 916px;">'
	    				add += '<div class="col m-3 border">'
    					add += '<h6 class="py-3"><strong>이용안내</strong></h6>'
    					add += '<ol class="ps-3" style="font-size: 14px;">'
    					add += '<li>티켓은 승차권에 표시된 승차자가 이용하셔야 하며, 도착역을 벗어날때까지 소지하셔야 합니다.</li>'
        				add += '<li>직원이 본인 확인을 요구할 경우 신분증을 제시하셔야 합니다.</li>'
    					add += '<li>열차출발시작이전에는 인터넷, 역 및 대리점에서 반환이 가능하나 출발시간, 이후에는 역과 대리점에서만 반환이 가능하며 도착역 도착시각 이후에는 반환이 불가능합니다.</li>'
    					add += '</ol>'
    					add += '</div>'
    					add += '<div class="col m-3" style="background-color: #EBEBEB; border: 1px solid black;">'
    					add += '<div class="row" style="background-color: lightgray; border-bottom: 1px solid black">'
    					add += '<div class="col-3 mt-1">'
    					add += '<h5 style="display: inline-block;">승차일</h5>'
    					add += '</div>'
    					add += '<div class="col mt-1">'
    					add += '<span>' + dpDate + '</span>'
    					add += '</div>'
    					add += '</div>'
    					add += '<div class="row mt-1">'
    					add += '<div class="col-5"><h3>' + dpStation + '</h3><div>' + dpTime + '</div></div>'
    					add += '<div class="col-1"> → </div>'
    					add += '<div class="col"><h3>' + arStation + '</h3><div>' + arTime + '</div></div>'
    					add += '</div>'
    					add += '<div class="row mt-1"><div class="col">' + train + '열차</div><div class="col"> ' + ticket.roomType + ' ' + ticket.roomName + ' ' + ticket.seatNo + '</div></div>'
    					add += '<div class="mt-1 row" style="background-color: lightgray; border-bottom: 1px solid black; border-top: 1px solid black;"><div class="col">운임요금 ' + addCommas(ticket.price) + '원</div></div>'
    					add += '<div class="my-1">' + ticket.type + '</div>'
    					add += '<div>예약자 : ' + name + ' <span class="ms-4">승차자 : ' + ticket.customerName + '</span></div>'
    					add += '</div>'
    					add += '</div>'
	    				$("#print-target").append(add)
					})
					
					let page = response.pagination
					let pagination = "";
					
					if (!page.existPrev) {
						$("#previous").addClass("disabled")						
					}
					if (!page.existNext) {
						$("#next").addClass("disabled")						
					}
					
					for (var i=page.beginPage; i<= page.endPage; i++) {
						if (i == page.pageNo) {
							pagination += '<li class="page-item active"><span class="page-link page" >' + i +'</span></li>'
						} else {
							pagination += '<li class="page-item"><span class="page-link page">' + i +'</span></li>'
						}
					}
					$("#previous").after(pagination)
				}
			})
		}
		let $info
		$(".btn-ticketing").click(function() {
			$info = $(this).closest('td').siblings()
			console.log($info)
			
			let name = $("#explanation").find('li').eq(0).contents()[0].textContent.trim()
			// reservationNo로 결제한 티켓 리스트 가져오기
			pagination($info, 1)
			printModal.show()
		})
		
		$(".pagination").on('click', "li:has(.page)", function() {
			console.log($info)
			pagination($info, $(this).children().text())
		})
		
	})
	
	// 프린트 하는 방법
	function onPrint() {
		window.print();
		
	}

</script>
</body>
</html>