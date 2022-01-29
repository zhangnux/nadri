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

<!-- content  -->
<div class="container">
	<div class="row">
		<div class="col">
			<h2>국내숙소</h2>	
		</div>
	</div>
	
	<hr>
	
	<div class = "row mb-3 border">
			<div class="col-1">
					<p>1</p>
			</div>
			<div class="col-1">
					<p>1</p>
			</div>
			<div class="col-1">
					<p>1</p>
			</div>
	
	<hr>
	
		<div class="row mb-3">
			<div class="col-4">
				<select class="form-select" aria-label="Default select example">
				  	<option selected>Open this select menu</option>
				  	<option value="1">One</option>
				 	<option value="2">Two</option>
				  	<option value="3">Three</option>
				</select>
			</div>
			<div class="col-4">
				<select class="form-select" aria-label="Default select example">
				  	<option selected>Open this select menu</option>
				  	<option value="1">One</option>
				 	<option value="2">Two</option>
				  	<option value="3">Three</option>
				</select>
			</div>
			<div class="col-4">
				<select class="form-select" aria-label="Default select example">
				  	<option selected>Open this select menu</option>
				  	<option value="1">One</option>
				 	<option value="2">Two</option>
				  	<option value="3">Three</option>
				</select>
			</div>
			
		</div>
	</div>

	<!-- 사진  -->
	<div class="row mb-3">
		<div class="col">
			<div class="card" style="width: 18rem;">
			  	<img src="http://tong.visitkorea.or.kr/cms/resource/33/1896033_image2_1.jpg" class="card-img-top" alt="...">
			  	<div class="card-body">
			    	<p class="card-text">사진</p>
			  	</div>
			</div>	
		</div>
	</div>
</div>
  <!-- Footer-->
<%@ include file="../common/footer.jsp" %>
</body>
</html>