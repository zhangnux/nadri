<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title>나드리::기차</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>
	
	.btn {
		width: 100px;
		height: 46px;
		border-radius: 0;
		text-align-last: center;
		font-size: .875rem;
		padding: initial;
		font-weight: bold;
	}
	
	hr + div div, hr + div a {
		background-color: #E6ECF3;
		border: 1px solid #E0E0E0;
		cursor: pointer;
		text-decoration: none;
		color: black;
	}
	
	hr + div div.active {
		background-color: #495C75;
		border: 1px solid #E0E0E0;
		color: white;
	}

	.datepicker {
		border-radius: 0;
		border: 1px solid lightgray;
		height: 40px;
		width: 250px;
		padding: 5px 19px;
		font-size: 19px;
	}
	.table-list th {
		border: 1px solid lightgray;
		border-left: 0;
		background-color: aliceblue;
		width: 20%;
		text-align: center;
	}
	
	.table-list td {
		border-bottom: 1px solid lightgray;
		border-top: 1px solid lightgray;
	}
	
	.table-list {
		width: 100%;
		height: 62px;
	}
	
	#btn-search {
		background-color: gray;
		color: white;
	}
	#table-search {
		width: 100%;
	}
	#table-search th {
		border: 1px solid lightgray;
		height: 50px;
		background-color: #7E5C5E;
		color: white;
	}
	
	#table-search td {
		border-bottom: 1px solid lightgray;
		height: 65px;
	}
	
	#page span {
		border: 0;
		border-radius: 3px;
	}
	#page .page-item.active .page-link {
		background-color: #7E5C5E;
		height: 40px;
		
	}
	.page-link {
		color: #9A565B;
	}
	.page {
		padding: 9px 12px;
		cursor: pointer;
	}
	
	span[aria-label] {
		padding: 4px 12px;
		font-size: 21px;
	}
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
		<div class="row my-5">
		<div class="col">
			<h2>이용내역</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu9" value="search"/>
	<c:set var="active" value="menu9"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row text-center" style="padding: 12px 12px; font-size: 20px;">
		<div class="col-9 p-4 active">
			이용내역
		</div>
		<a href="/train/reservationList.nadri" class="col-3 p-4">
			발권/취소
		</a>
	</div>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				'${sessionScope.LOGIN_USER.name }' 고객님의 발권 및 환불내역을 확인하실 수 있습니다.
			</li>
		</ul>
	</div>
	<div class="row ">
		<div class="col">
			<form action="">
				<table class="table-list">
					<tbody>
						<tr>
							<th>승차일자</th>
							<td class="ps-5">
								<input type="text" class="datepicker" value="${param.dpDate1 }" name="date1" readonly="readonly">
								<span class="px-5"> ~ </span>
								<input type="text" class="datepicker" value="${param.dpDate2 }" name="date2" readonly="readonly">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col text-center">
			<button class="btn" type="button" id="btn-search">조회하기</button>
		</div>
	</div>
	<div class="row mt-5">
		<div class="col">
			<table id="table-search" class="text-center">
				<thead>
					<tr>
						<th width="12%">승차일자</th>
						<th width="12%">열차번호</th>
						<th width="12%">출발역</th>
						<th width="12%">도착역</th>
						<th width="8%">객실등급</th>
						<th width="10%">좌석정보</th>
						<th width="10%">승차자명</th>
						<th width="12%">발권 상태</th>
						<th width="12%">금액</th>
					</tr>
				</thead>
				<tbody id="tbody-info">
		
				</tbody>
			</table>
		</div>
	</div>
	<div class="pb-2" id="pagination">
		<nav aria-label="Page navigation example" style="text-decoration: none;" id="page">
			<ul class="pagination justify-content-center mt-4">

			</ul>
		</nav>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
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
		
		let now = new Date(); 
		
		let nowDate = now.getFullYear() + "/" + (("00"+(now.getMonth()+1)).slice(-2)) + "/" + (("00"+now.getDate()).slice(-2))
		$(".datepicker").val(nowDate)
		
		$(function() {
		    $(".datepicker").datepicker({
		    	dateFormat: 'yy/mm/dd',
		    });
		});
		
		function pagination(no) {
			let start = moment($("[name=date1]").val(), "YYYY/MM/DD")
			let end = moment($("[name=date2]").val(), "YYYY/MM/DD")
 			if (end.diff(start, 'months') > 2) {
				alert("조회기간은 최대 3개월까지 가능합니다.")
				return;
			} else if (end.diff(start, 'days') < 0) {
				alert("시작일이 종료일보다 빠른날짜 입니다.")
				return;
			}
			let result = {startDate:start, endDate:end, pageNo:no}
			let jsonData = JSON.stringify(result)
			
			$.ajax({
				type:"POST",
				url:"/api/train/searchReserved",
				contentType:"application/json",
				data:jsonData,
				success:function(response) {
					console.log(response)
					$(".pagination").empty()
					$("#tbody-info").empty()
					let list = "";
					if (response.infoList.length == 0) {
						list += '<tr><td class="py-5" colspan="9">이용내역이 존재하지 않습니다.</td></tr>' 
					} else {
						$.each(response.infoList, function(index, data) {
							list += '<tr>'
							list += '<td>' + moment(data.departureDate).format('yyyy-MM-DD') + '</td>'
							list += '<td>' + data.trainName + " " + data.trainNo + '</td>'
							list += '<td>' + data.departureStation + '<div>' + moment(data.departureDate).format('HH:mm') + '</div></td>'
							list += '<td>' + data.arrivalStation + '<div>' + moment(data.arrivalDate).format('HH:mm') + '</div></td>'
							list += '<td>' + data.roomType + '</td>'
							list += '<td>' + data.roomName + ' - ' + data.seatNo + '</td>'
							if (data.customerName != null) {
								list += '<td>' + data.customerName + '</td>'
							} else {
								list += '<td> - </td>'
							}
							if (data.isPrinted == 'N') {
								list += '<td>발권완료</td>'
							} else {
								list += '<td>미완료</td>'
							}
							list += '<td>' + addCommas(data.price) + '</td>'
							list += '</tr>'
						})
						
					}
					$("#tbody-info").append(list)
					
					let page = response.pagination
					let pagination = "";
					
					if (page.existPrev) {
						pagination += '<li class="page-item" id="previous" data-prev-page="' + page.prevPage +'">'
					} else {
						pagination += '<li class="page-item disabled" id="previous" data-prev-page="">'
					}
					
					pagination += '<span class="page-link" aria-label="Previous">'
					pagination += '<span aria-hidden="true"><strong>&laquo;</strong></span>'
					pagination += '</span></li>'
					
					for (var i=page.beginPage; i<= page.endPage; i++) {
						if (i == page.pageNo) {
							pagination += '<li class="page-item active"><span class="page-link page" >' + i +'</span></li>'
						} else {
							pagination += '<li class="page-item"><span class="page-link page">' + i +'</span></li>'
						}
					}
					
					if (page.existNext) {
						pagination += '<li class="page-item" id="next" data-next-page="' + page.nextPage + '">'
					} else {
						pagination += '<li class="page-item disabled" id="next" data-next-page="">'
					}
					pagination += '<span class="page-link" aria-label="Next">'
					pagination += '<span aria-hidden="true"><strong>&raquo;</strong></span>'
					pagination += '</span></li>'
					$(".pagination").append(pagination)
				}
			})
		}
		
		$("#btn-search").click(function() {
			pagination(1)
			
		})
		
		$(".pagination").on('click', "li:has(.page)", function() {
			console.log($(this).children().text())
			pagination($(this).children().text())
		})
		$(".pagination").on('click', "#next", function() {
			console.log($(this).attr("data-next-page"))
			pagination($(this).attr("data-next-page"))
		})
		$(".pagination").on('click', "#previous", function() {
			console.log($(this).attr("data-prev-page"))
			pagination($(this).attr("data-prev-page"))
		})
	})
</script>
</html>