<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="common/mainhead.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
a {
  text-align: center;
  text-decoration: none; /* 링크의 밑줄 제거 */
  color: inherit; /* 링크의 색상 제거 */
}
.card:hover{
	transform:scale(1.01);
	overflow: hidden;
	filter: brightness(95%);
	transition: all 0.3s;
}
#form-search{
	position:fixed;
	padding-top:120px;
}
.bg-dark{
	position:fixed;
	width:100%;
	z-index:99999;
}
#listcontent{
	padding-top:100px;
	padding-bottom:300px;
}
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

	<div class="row mt-5 mb-5">
		<h3><strong>🍜음식점 예약은 나드리!</strong></h3>
			<c:forEach var="r" items="${res }">
		<div class="col-3">
			   <div class="card h-100 shadow" onclick="location.href='restaurant/detail.nadri?no=${r.no}';">
			    <div class="card h-100 shadow">
			      <img src="${r.picture }" class="card-img-top" style="height:200px;">
			      <div class="card-body">
			      	<p class="card-text">${r.address }</p>
			        <h5 class="card-title"><strong>${r.name }</strong></h5>  
			      </div>
			    </div>
			   </div>
		</div>
			</c:forEach>
	</div>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 2"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <a href="http://localhost/attr/list.nadri?place=%EC%A0%9C%EC%A3%BC%EB%8F%84">
		      	<img src="https://img.modetour.com//promotion20/11369/1100_11369.jpg" class="d-block w-100">
		      </a>
		    </div>
		    <div class="carousel-item">
		      <a href="http://localhost/train">
		      	<img src="../../resources/images/train_banner.jpg" class="d-block w-100">
		      </a>
		    </div>
		    <div class="carousel-item">
		      <a href="http://localhost/restaurant/list.nadri?category=2">
		      	<img src="../../resources/images/restaurant_banner.jpg" class="d-block w-100">
		      </a>
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
		
	<div class="row mt-5">
		<h3><strong>🏌️‍♂️액티비티 예약도 나드리!</strong></h3>
			<c:forEach var="att" items="${attr }">
		<div class="col-3">
			   <div class="card h-100 shadow" onclick="location.href='attr/detail.nadri?no=${att.no}';">
			    <div class="card h-100 shadow">
			      <img src="../resources/images/att/${att.thumbnail }" class="card-img-top" style="height:200px;">
			      <div class="card-body">
			      	<p class="card-text">${att.place }</p>
			        <h5 class="card-title"><strong>${att.name }</strong></h5>  
			      </div>
			    </div>
			   </div>
		</div>
			</c:forEach>
	</div>

	<div class="row mt-5">
		<h3><strong>공지사항</strong></h3>
		<div class="mt-3">
			<div class="row">
				<div class="row border-bottom" style="font-size:18px" >
					<div class="col-1">번호</div>
					<div class="col-8">제목</div>
					<div class="col-2">작성일</div>
					<div class="col-1">조회수</div>
				</div>
			<c:forEach var="n" items="${notice }">
				<div class="row" style="font-size:18px">
					<div class="col-1">${n.no }</div>
					<div class="col-8">
						<a href="http://localhost/noticeBoard/detail.nadri?no=${n.no}" style="text-decoration-line: none;">
						${n.title }
						</a>
					</div>
					<div class="col-2"><fmt:formatDate value="${n.createdDate }" pattern="yyyy-MM-dd" /></div>
					<div class="col-1">${n.viewCount }</div>
				</div>		
			</c:forEach>
				<div class="col-12 text-end">
					<a href="http://localhost/noticeBoard/userlist.nadri"><i class="bi bi-plus-square"></i> 더보기</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="mt-5 mb-5">
      <a href="http://localhost/coupon/zone.nari">
      	<img src="../../resources/images/coupon_banner.jpg" class="d-block w-100">
      </a>		    
	</div>
	
</div>        
<!-- Footer-->
<%@ include file="common/footer.jsp" %>
</body>
</html>
