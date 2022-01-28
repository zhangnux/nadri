<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/mainhead.jsp" %>
<meta charset="UTF-8">
<title></title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/mainnav.jsp" %>
<!-- Page Header-->
<header class="masthead" style="background-image: url('../resources/images/nadri-lodging.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning fw-bold">lodging </h1>
                    <span class="subheading">어떤 숙소를 찾으세요?</span>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="container">
	<div class="row">
		<div class="col">
			<h2>국내숙소</h2>	
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col">
			<ul class="nav nav-pills">
			  	<li class="nav-item">
			    	<a class="nav-link active" aria-current="page" href="#">호텔·리조트</a>
			  	</li>
			 	<li class="nav-item">
			    	<a class="nav-link " href="#">펜션·풀빌라</a>
			    	
			    </li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<form id="form-search" action="" method="get" class="row row-cols-lg g-3 align-items-center p-3">
				<div class="col-3">
					<select class="form-select" name="">
						<option value="" >어디로 떠나세요?</option>
						
					</select>
				</div>
				<div class="col-3">
					<select class="form-select" name="">
						<option value="" >날짜</option>
					</select>
				</div>
				<div class="col input-group">
					<select class="form-select" name="">
						<option value="" >인원</option>
					</select>
					<button type="button" class="btn btn-outline-primary btn-sm" id="">검색</button>
				</div>
			</form>
		</div>	
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card" style="width: 18rem;">
			  	<div class="card-body">
			   		 <h5 class="card-title"></h5>
			   		 <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
			   		 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			   		 <a href="#" class="card-link">Card link</a>
			  	 	 <a href="#" class="card-link">Another link</a>
			 	 </div>
			</div>
		</div>
	</div>
</div>
  <!-- Footer-->
<%@ include file="../common/footer.jsp" %>
</body>
</html>