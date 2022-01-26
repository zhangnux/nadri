<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/mainhead.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>나드리::즐길거리</title>
<style>
.btn-link{
	color:black;
	text-decoration-line: none;	
	font-family:'IBM Plex Sans KR';
	vertical-align: middle;
	height:50px; 
	width:150px; 
	text-align:left;
	padding-top:15px;
	border-radius:10%;
	transition: all 0.5s;
}
.btn-link:hover{
	transform:scale(1.05);
}
.card:hover{
	transform:scale(1.05);
	overflow: hidden;
	filter: brightness(95%);
}
</style>
</head>
<body>
<!-- Navigation-->
<%@ include file="../common/mainnav.jsp" %>

        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../resources/images/nadri-attr.jpg');background-attachment: local">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1 class="text-warning fw-bold">Attractions</h1>
                            <span class="subheading">전국 각지의 즐길거리를 소개합니다</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 text-center mb-5">
                <div class="col">
					<h5><strong>현재 나드리에는 ${count}개의 즐길거리가 등록되어 있습니다.</strong></h5>
				</div>
			</div>
			<div class="row">
				<div class="col col-auto mt-3 mx-auto me-5">
					<img src="../resources/images/koreamap.jpg">
					<!-- 팝오버 -->
	            </div>					
				<div class="col col-4" style="margin-top:8%;">
					<div class="row">
	            		<div class="col-4 mb-4">
	            			<a class="btn btn-link shadow" href="list.nadri">
	            				<i class="bi bi-flag"></i> 투어
	            			</a>
	            		</div>
	            	</div>
					<div class="row">
	            		<div class="col-4 mb-4">
	            			<a class="btn btn-link shadow" href="#">
	            				<i class="bi bi-ticket-detailed"></i> 입장권
	            			</a>
	            		</div>
	            	</div>
					<div class="row">
	            		<div class="col-4 mb-4">
	            			<a class="btn btn-link shadow" href="#">
	            				<i class="bi bi-send"></i> 액티비티
	            			</a>
	            		</div>
	            	</div>
					<div class="row">
	            		<div class="col-4 mb-4">
	            			<a class="btn btn-link shadow" href="#">
	            				<i class="bi bi-palette-fill"></i> 클래스
	            			</a>
	            		</div>
	            	</div>
            	</div>
            </div>
            
            <div id="carouselExampleIndicators" class="carousel slide mb-5 mt-5" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="..." class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="..." class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="..." class="d-block w-100" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
			<h1><strong>전체 리스트</strong></h1>
            <div class="row row-cols-1 row-cols-md-4 g-4 mt-5">
            <c:forEach var="att" items="${attr }">
			  <div class="col">
			    <div class="card h-100">
			      <img src="../resources/images/att/${att.thumbnail }" class="card-img-top" style="height:200px;">
			      <div class="card-body">
			      	<p class="card-text">${att.place } / ${att.category }</p>
			        <h5 class="card-title"><strong>${att.name }</strong></h5>
			        <p class="card-text">${att.content }</p>
			        <p class="card-text">★★★☆ 3.5 / 5.0</p>
			        <p class="card-text">후기 개</p>
			      </div>
			    </div>
			  </div>
			</c:forEach>
			</div>
            
        </div>
        
        
        <!-- Footer-->
		<%@ include file="../common/footer.jsp" %>
    </body>
</html>
