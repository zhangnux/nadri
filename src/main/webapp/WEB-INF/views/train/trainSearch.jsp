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
	<!-- 달력 ui -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<style>
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
<div class="container" id="trainBooking">
	<div class="row">
		<div class="col my-5">
			<h2>기차표</h2>		
		</div>
	</div>
		<c:set var="menu1" value="search"/>
		<c:set var="active" value="menu1"/>
		<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<%@ include file="common/searchBar.jsp" %>
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
	</div>
	<div class="border" style="height: 100px; margin-bottom: 100px; margin-top: 70px; background-color: #567CAF; white-space: pre-line;">
		<h3 style="color: white; margin: 8px 30px;">기차표예매 가이드</h3>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		
		let now = new Date(); 
		let nowDate = now.getFullYear() + "/" + now.getMonth()+1 + "/" + now.getDate()
		$(".datepicker").val(nowDate)
		
		$("#search").click(function() {
			let valid = true;
			if ($("[name=departureStation]").val().trim() == '') {
				alert("출발역을 입력해주세요.")
				valid = false;
				return;
			} else if ($("[name=arrivalStation]").val().trim() == '') {
				alert("도착역을 입력해주세요.")
				valid = false;
				return;
			} 
			
			if ($("[name=count1]").val() == 0) {
				$("[name=count1]").val(1)
				$("[name=adNo1]").val(1)
			}
			if ($("[name=count2]").val() == 0) {
				$("[name=count2]").val(1)
				$("[name=adNo2]").val(1)
			}
			
			let goDate = new Date($("[name=dpDate1]").val())
			let comeDate = new Date($("[name=dpDate2]").val())
			
			if ($("[name=way]:checked").val() == '왕복') {
				/* if (goDate.getTime() == comeDate.getTime() && $("[name=goTime]").val() >= $("[name=comeTime]").val()) {
					alert("알맞는 시간을 입력해 주세요.")
				} else  */
				console.log(goDate)
				console.log(comeDate)
				if (goDate > comeDate) {
					alert("복편을 왕편보다이전 일자로 선택하셨습니다. 일정을 다시 한번 선택하여 주십시오.")
					valid = false;
				}
			}
			
			if (valid) {
				$("#trainSearch").submit()
			}
		})
		
		
/* 		
		let now = new Date(); 
		let nowDate = now.getFullYear() + "/" + now.getMonth()+1 + "/" + now.getDate()
		
		$(".time select").change(function(){
			console.log($(".datepicker").val())
			if ($(".datepicker").val() == nowDate && now.getHours() >= $(this).val()) {
				alert("이후 시각입력")
			}
		}) */
		
	})
</script>
</body>
</html>