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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2"></script>
<title>나드리::즐길거리</title>
<style>
.btn-link{
	color:black;
	text-decoration-line: none;	
	font-family:'IBM Plex Sans KR';
	vertical-align: middle;
	height:50px; 
	width:100px; 
	text-align:left;
	padding-top:15px;
	border-radius:10%;
	transition: all 0.5s;
}
.btn-link:hover{	
  	border-left:1px solid #6098FF;
  	border-right:1px solid #6098FF;	
}
.btn-link:hover::after {
  width:100%;
}
.card:hover{
	transform:scale(1.01);
	overflow: hidden;
	filter: brightness(95%);
	transition: all 0.5s;
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
        <div class="container">
            <div class="row gx-4 gx-lg-5 text-center mb-5">
                <div class="col">
					<h5><strong>현재 나드리에는 ${count}개의 즐길거리가 등록되어 있습니다.</strong></h5>
				</div>
			</div>
			<div class="mt-5 mb-3 text-center"><h1><strong>지역별 액티비티</strong></h1></div>
            <div class="row d-flex justify-content-center mb-4 mt-5">
           		<div class="col-1">
           			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=">
           				전국
           			</a>
           		</div>
           		<div class="col-1">
           			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=서울">
           				서울
           			</a>
           		</div>
           		<div class="col-1">
          			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=경기도">
          				경기도
          			</a>
           		</div>
           		<div class="col-1">
        			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=강원도">
        				강원도
        			</a>
           		</div>
           		<div class="col-1">
          			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=전라도">
          				전라도
          			</a>
           		</div>
           		<div class="col-1">
           			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=충청도">
           				충청도
           			</a>
           		</div>
           		<div class="col-1">
           			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=경상도">
           				경상도
           			</a>
           		</div>
           		<div class="col-1">
          			<a class="btn btn-link text-center fw-bold" href="list.nadri?place=제주도">
          				제주도
          			</a>
           		</div>
			</div>  
			<div class="row">
				<%@ include file="common/mainmap.jsp" %>
        	</div>   
        </div>    
        <!-- Footer-->
		<%@ include file="../common/footer.jsp" %>
    </body>
</html>
