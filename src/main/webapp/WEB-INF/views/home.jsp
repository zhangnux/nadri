<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="common/mainhead.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>

</style>
<title>::나드리::</title>
</head>
<body>
	<%@ include file="common/mainnav.jsp" %>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../resources/images/nadri-main1.jpg');background-attachment: local">
            <div class="container position-relative px-4 px-lg-5">                
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1 class="text-warning fw-bold" id="enfont">Nadri.</h1>
                            <span class="subheading">국내 여행 정보 사이트, 나드리</span>
                            <div class="bird-container"> <div class="bird"></div> </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <!-- Main Content-->
	<div class="container">
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="https://d2ur7st6jjikze.cloudfront.net/cms/478_original_1634118710.jpg?1634118710" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://d2ur7st6jjikze.cloudfront.net/cms/1595_original_1641521542.png?1641521542" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://d2ur7st6jjikze.cloudfront.net/cms/1163_original_1631163923.png?1631163923" class="d-block w-100" alt="...">
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
	</div>
        
        <!-- Footer-->
		<%@ include file="common/footer.jsp" %>
    </body>
</html>
