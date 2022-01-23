<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="../common/mainhead.jsp" %>
	<title></title>
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
	<script src="https://kit.fontawesome.com/2dd5a5b03c.js" crossorigin="anonymous"></script>
</head>
<style>
	input:focus {
		outline: none;
	}
	div.div-show-station {
		position: relative;
		width: 94px;
	}
	.fa-train {
		position: absolute;
		top: 33%;
		left: 90%;
		color: #7E5C5E;
	}
	.bi-arrow-repeat {
		position: absolute;
		top: 0.4%;
		left: 75.8%;	
		opacity: 0.3;
		font-size: 40px;
		color: #7E5C5E;
	}
	div.div-show-station input, div#passenger input {
		height: 40px;
		width: 170px;
		font-size: 18px;
	}
	div#time input, select {
		border-radius: 0;
		border: 1px solid #949494;
		height: 36px;
	}
	
	.modal li {
		text-decoration: none;
		display: inline-block;
		padding: 4px 14px;
	}
	.modal a {
		text-decoration: none;
		color: black;
	}
	.station-table a {
		border: 1px solid #A6CAF9;
		width: 100px;
		display: inline-block;
		text-align: center;
		height: 30px;
		background-color: #B7D5FC;
	}
	a.none {
		background-color: #A0A0A0;
		border: 1px solid #808080;
		color: white;
	}
	.station-table td {
		float: left;
	}
	#famous img {
		border-radius: 3px;
		height: 240px;
		width: 100%;
		border-bottom-style: outset;
	}
	#famous {
		display: grid;
		grid: '. . .';
	 	gap: 40px;
	 	margin: auto;
	}
	#famous button {
		font-size: small; 
		background-color: #425B7B; 
		color: white;
	}
	#famous > div {
		border-radius: 3px;
		-webkit-box-shadow:0px 1px 1px grey;
		box-shadow: 0px 6px 10px #EAEAEA;
	}
</style>
<body>
<%@ include file="../common/mainnav.jsp" %>
<header class="masthead" style="background-image: url('../resources/images/nadri-train.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning fw-bold">Train Booking</h1>
                    <span class="subheading">기차 예약 편하게 하세요</span>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container">
	<div class="row">
		<div class="col my-5">
			<h2>기차표</h2>		
		</div>
	</div>
		<c:set var="menu1" value="search"/>
		<c:set var="active" value="menu1"/>
		<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row">
		<div class="col">
			<form action="" method="post" class="border">
				<div class="row">
					<div class="my-3 ms-4 col-md-1 div-show-station" id="departure">
						<label style="display: block; font-size: 14px; color: gray;">출발지</label>
						<input type="text" style="border: none;" name="departureStation">
					</div>
					<div class="m-3 col-md-1 div-show-station">
						<a href="#" style="color: black;">
							<i class="bi bi-arrow-repeat"></i>
							<i class="fa fa-train" aria-hidden="true"></i>
						</a>
					</div>
					<div class="m-3 col-md-1 div-show-station" id="arrival">
						<label style="display: block; font-size: 14px; color: gray;">도착지</label>
						<input type="text" style="border: none;" name="arrivalStation">
					</div>
					<div class="col-md-7 text-end" style="margin: auto;">
						<input type="radio" value="편도" name="way" checked="checked">편도
						<input class="ms-3" type="radio" value="왕복" name="way">왕복
					</div>
				</div>
				<hr class="ms-3 my-0">
				<div class="row" id="go">
					<div class="col-md-1" style="display: flex; align-items: center; justify-content: center; width: 140px;">
						<span id="one"><i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i>출발일</span>
						<span style="display: none"><i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i>가는열차</span>
					</div>
					<div class="m-3 col-md-3" style="border-left: 1px solid; border-left-color: #ced4da;
						border-right: 1px solid; border-right-color: #ced4da; ">
						<label style="display: block; font-size: 14px; color: gray;">출발시간</label>
						<div id="time">
							<input class="" type="date" name="goTime">
							<select name="goTime" style="width: 50px;">
								<c:forEach var="time" begin="0" end="23">
									<c:choose>
										<c:when test="${time lt 10}">
											<option value="${time }">0${time }</option>
										</c:when>
										<c:otherwise>
											<option value="${time }">${time }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<span>시</span>
						</div>
					</div>
					<div class="col-md-7" style="display:flex; justify-content:space-between; align-items: center; 
					width:808px; padding: 0;" id="passenger">
						  <div class="m-3 dropdown-toggle" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" 
						  aria-expanded="false" style="display: inline-block;">
							<label style="display: block; font-size: 14px; color: gray;">승객</label>
							<input type="text" style="border: none;" name="count" readonly="readonly" value="1명">
						  </div>
						  <ul class="dropdown-menu" aria-labelledby="defaultDropdown" style="width: 200px;">
						    <li style="display: flex; justify-content: space-between; margin: 8px;">
						    	<div >어른 <p style="font-size: 14px; color: gray;">만 13세 이상</p></div>
							    <div>
							    	<a href="#"><i class="bi bi-dash-circle"></i></a> 0
							    	<a class="" href="#"><i class="bi bi-plus-circle"></i></a>
							    </div>
					    	</li>
						    <li style="display: flex; justify-content: space-between; margin: 8px;">
						    	<div>어린이</div>
							    <div>
							    	<a href="#"><i class="bi bi-dash-circle"></i></a> 0
							    	<a class="" href="#"><i class="bi bi-plus-circle"></i></a>
							    </div>
					    	</li>
						</ul>
						<div class="h-100" style="text-align-last:center; display:inline-block; 
							width: 90px; margin-right: 4px; background-color: #7E5C5E;">
							<i class="bi bi-search" style="font-size: 30px; color: white; display:flex; padding: 30px;"></i>
						</div>
					</div>
				</div>
				<hr class="ms-3 my-0" style="display: none;">
				<div class="row" style="display: none;">
					<div class="col-md-1" style="display: flex; align-items: center; justify-content: center; width: 140px;">
						<i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i><span>오는열차</span>
					</div>
					<div class="m-3 col-md-3" style="border-left: 1px solid; border-left-color: #ced4da; border-right: 1px solid; border-right-color: #ced4da;">
						<label style="display: block; font-size: 14px; color: gray;">출발시간</label>
						<div id="time">
							<input class="" type="date" name="goTime">
							<select name="goTime" style="width: 50px;">
								<c:forEach var="time" begin="0" end="23">
									<c:choose>
										<c:when test="${time lt 12}">
											<option value="${time }">0${time }</option>
										</c:when>
										<c:otherwise>
											<option value="${time }">${time }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<span>시</span>
						</div>
					</div>
					<div class="col-md-6" style="align-items: center; padding: 0;" 
						id="passenger">
						  <div class="m-3 dropdown-toggle" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
							<label style="display: block; font-size: 14px; color: gray;">승객</label>
							<input type="text" style="border: none;" name="count" readonly="readonly" value="1명">
						  </div>
						  <ul class="dropdown-menu" aria-labelledby="defaultDropdown" style="width: 200px;">
						    <li style="display: flex; justify-content: space-between; margin: 8px;">
						    	<div >어른 <p style="font-size: 14px; color: gray;">만 13세 이상</p></div>
							    <div>
							    	<a href="#"><i class="bi bi-dash-circle"></i></a> 0
							    	<a class="" href="#"><i class="bi bi-plus-circle"></i></a>
							    </div>
					    	</li>
						    <li style="display: flex; justify-content: space-between; margin: 8px;">
						    	<div>어린이</div>
							    <div>
							    	<a href="#"><i class="bi bi-dash-circle"></i></a> 0
							    	<a class="" href="#"><i class="bi bi-plus-circle"></i></a>
							    </div>
					    	</li>
						  </ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="rowl mt-5">
		<div class="col">
			<h5>인기노선</h5>			
		</div>
	</div>
	<div class="row my-4 w-100" id="famous">
		<div class="border p-0">
			<div>
				<img alt="부산" src="../../resources/images/train/busan.jpg">
			</div>
			<div>
				<div class="my-2" style="">
					<i class="bi bi-arrow-down fs-1" style="vertical-align: top;"></i>
					<div style="display: inline-block;">
						<div class="mb-3">서울</div>
						<div>부산</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="text-align-last: justify">
				<span class="fs-5 fw-bold m-3">12,000원</span>
				<div style="display: inline-block;">
					<button class="btn fw-bold m-3">Book Now</button>
				</div>
			</div>
		</div>
		<div class="border p-0" style="border-radius: 3px;">
			<div>
				<img alt="부산" src="../../resources/images/train/busan.jpg">
			</div>
			<div>
				<div class="my-2" style="">
					<i class="bi bi-arrow-down fs-1" style="vertical-align: top;"></i>
					<div style="display: inline-block;">
						<div class="mb-3">서울</div>
						<div>부산</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="text-align-last: justify">
				<span class="fs-5 fw-bold m-3">12,000원</span>
				<div style="display: inline-block;">
					<button class="btn fw-bold m-3">Book Now</button>
				</div>
			</div>
		</div>
		<div class="border p-0" style="border-radius: 3px;">
			<div>
				<img alt="부산" src="../../resources/images/train/busan.jpg">
			</div>
			<div>
				<div class="my-2" style="">
					<i class="bi bi-arrow-down fs-1" style="vertical-align: top;"></i>
					<div style="display: inline-block;">
						<div class="mb-3">서울</div>
						<div>부산</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="text-align-last: justify">
				<span class="fs-5 fw-bold m-3">12,000원</span>
				<div style="display: inline-block;">
					<button class="btn fw-bold m-3">Book Now</button>
				</div>
			</div>
		</div>
		<div class="border p-0" style="border-radius: 3px;">
			<div>
				<img alt="부산" src="../../resources/images/train/busan.jpg">
			</div>
			<div>
				<div class="my-2" style="">
					<i class="bi bi-arrow-down fs-1" style="vertical-align: top;"></i>
					<div style="display: inline-block;">
						<div class="mb-3">서울</div>
						<div>부산</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="text-align-last: justify">
				<span class="fs-5 fw-bold m-3">12,000원</span>
				<div style="display: inline-block;">
					<button class="btn fw-bold m-3">Book Now</button>
				</div>
			</div>
		</div>
		<div class="border p-0" style="border-radius: 3px;">
			<div>
				<img alt="부산" src="../../resources/images/train/busan.jpg">
			</div>
			<div>
				<div class="my-2" style="">
					<i class="bi bi-arrow-down fs-1" style="vertical-align: top;"></i>
					<div style="display: inline-block;">
						<div class="mb-3">서울</div>
						<div>부산</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="text-align-last: justify">
				<span class="fs-5 fw-bold m-3">12,000원</span>
				<div style="display: inline-block;">
					<button class="btn fw-bold m-3">Book Now</button>
				</div>
			</div>
		</div>
		<div class="border p-0" style="border-radius: 3px;">
			<div>
				<img alt="부산" src="../../resources/images/train/busan.jpg">
			</div>
			<div>
				<div class="my-2" style="">
					<i class="bi bi-arrow-down fs-1" style="vertical-align: top;"></i>
					<div style="display: inline-block;">
						<div class="mb-3">서울</div>
						<div>부산</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="text-align-last: justify">
				<span class="fs-5 fw-bold m-3">12,000원</span>
				<div style="display: inline-block;">
					<button class="btn fw-bold m-3">Book Now</button>
				</div>
			</div>
		</div>
	</div>
	<div class="border" style="height: 100px; margin-bottom: 100px; margin-top: 70px; background-color: #567CAF; white-space: pre-line;">
		<h3 style="color: white; margin: 8px 30px;">기차표예매 가이드</h3>
	</div>
	<div class="modal" tabindex="-1" id="modal-station">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h6 class="modal-title">역명 조회</h6>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body">
      				<div>
      					<ul class="border">
      						<li><a href="#">가</a></li>
      						<li><a href="#">나</a></li>
      						<li><a href="#">다</a></li>
      						<li><a href="#">라</a></li>
      						<li><a href="#">마</a></li>
      						<li><a href="#">바</a></li>
      						<li><a href="#">사</a></li>
      						<li><a href="#">아</a></li>
      						<li><a href="#">자</a></li>
      						<li><a href="#">차</a></li>
      						<li><a href="#">카</a></li>
      						<li><a href="#">타</a></li>
      						<li><a href="#">파</a></li>
      						<li><a href="#">하</a></li>
      					</ul>
      				</div>
        			<div class="card" style="text-align: center">
        				<!-- <div class="card-header"><strong id="movie-title"></strong></div> -->
        				<table class="station-table" style="margin: 24px;">
        					<tbody style="display: table-row-group;">
        						<tr style="display: table-row;" id="station">
        							
        						</tr>
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
		$("input[value=왕복]").click(function() {
			$("#go").nextAll().show()
			$("#one").hide().next().show()
		}) 
		
		$("input[value=편도]").click(function() {
			$("#go").nextAll().hide()
			$("#one").show().next().hide()
		})
		
		
		var stationModal = new bootstrap.Modal(document.getElementById('modal-station'), {
			keyboard: false
		});
		
		$("div#departure").click(function() {
			let $tr = $(".station-table tr").empty()
			$.getJSON("/api/train/station/45207", function(response) {
				if (response.status == 'OK') {
					$.each(response.items, function(index, station) {
						let st = "<td data-station-id=" + station.id + ">"
						if (station.isUsed == 'N') {
							st += "<a class='none'>" + station.name + "</a>"
						} else (
							st += "<a href='#'>" + station.name + "</a>"
						)
							st += "</td>"
						$tr.append(st)
					})
					stationModal.show()
				}
			})
		})
	})
</script>
</body>
</html>