<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="../common/mainhead.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		top: 40%;
		left: 90%;
		color: #43698A;
	}
	.bi-arrow-repeat {
		position: absolute;
		top: 1%;
		left: 75.8%;	
		opacity: 0.3;
		font-size: 40px;
		color: #43698A;
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
</style>
<body>
<%@ include file="../common/mainnav.jsp" %>
<header class="masthead" style="background-image: url('../resources/images/nadri-train.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning fw-bold">menu name</h1>
                    <span class="subheading">소개 문구 입력</span>
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
					<div class="my-3 ms-4 col-md-1 div-show-station">
						<label style="display: block; font-size: 14px; color: gray;">출발지</label>
						<input type="text" style="border: none;" name="departureStation">
					</div>
					<div class="m-3 col-md-1 div-show-station">
						<a href="#" style="color: black;">
							<i class="bi bi-arrow-repeat"></i>
							<i class="fa fa-train" aria-hidden="true"></i>
						</a>
					</div>
					<div class="m-3 col-md-1 div-show-station">
						<label style="display: block; font-size: 14px; color: gray;">도착지</label>
						<input type="text" style="border: none;" name="arrivalStation">
					</div>
					<div class="col-md-7 text-end" style="margin: auto;">
						<input type="radio" value="편도" name="s" checked="checked">편도
						<input class="ms-3" type="radio" value="왕복" name="s">왕복
					</div>
				</div>
				<hr class="mx-3 my-0">
				<div class="row">
					<div class="col-md-1" style="display: flex; align-items: center; justify-content: center; width: 140px;">
						<i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i><span>가는열차</span>
					</div>
					<div class="m-3 col-md-3" style="border-left: 1px solid; border-left-color: #ced4da;">
						<label style="display: block; font-size: 14px; color: gray;">출발시간</label>
						<div id="time">
							<input class="" type="date" name="goTime">
							<select name="goTime" style="width: 50px;">
								<c:forEach var="time" begin="0" end="23">
									<option value="${time }">${time }</option>
								</c:forEach>
							</select>
							<span>시</span>
						</div>
					</div>
					<div class="m-3 col-md-6" style="align-items: center; border-left: 1px solid; border-left-color: #ced4da;" id="passenger">
						<label style="display: block; font-size: 14px; color: gray;">승객</label>
						<input type="text" style="border: none;" name="count" readonly="readonly" value="1명">
					</div>
					<div class="m-3 col-md-1 text-end" style="margin: 0; align-self: center; width: 80px;">
						<i class="bi bi-search" style="font-size: 30px;"></i>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!--  -->

<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$(function() {
		
	})
</script>
</body>
</html>