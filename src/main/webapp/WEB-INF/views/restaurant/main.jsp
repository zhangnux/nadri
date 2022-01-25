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
</head>
<style>
	img {
		height: 200px;
		width: 70px;
		padding: 10px;
	}


</style>
<body>
<%@ include file="../common/mainnav.jsp" %>
<header class="masthead" style="background-image: url('../resources/images/nadri-restaurant.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning fw-bold">Restaurants</h1>
                    <span class="subheading">입 안의 즐거움!</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- ★ -->
<div class="container">
	
	<!-- 검색 -->
	<!-- 요소: 검색어로 한 다음 content, name, city 모두 걸리게 -->
	<div class="row mb-3">
		<div class="col">
			<form action="" method="post" class="row row-cols-lg-auto g-3 align-items-center">
				<div class="col-12">
					<select class="form-select" name="opt">
						<option></option>
					</select>
				</div>
				<div class="col-12">
					<input type="search" class="form-control" name="value" value="${param.value }">
				</div>
				<div class="col-12">
					<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-restaurant">검색</button>
				</div>
			</form>
		</div>
	</div>


	<div class="row mb-3">
		<div class="col">
			<h4>Best Restaurant</h4>
		</div>
	</div>
	<div class="row mb-3">
		<c:forEach var="restaurant" items="${restaurants }">
			<div class="col-3">
				<div class="card" style="width: 18rem;">
	  				<img src="${restaurant.picture}" class="card-img-top" alt="picture">
	  				<div class="card-body">
	    				<p class="card-text">${restaurant.name }</p>
	    				<p class="card-text">${restaurant.starPoint } 점</p>
	    				<a href="detail.nadri?no=${restaurant.no }" class="btn btn-primary">book now</a>
	  				</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="row mb-3">
		<div class="col">
			<a href="list.nadri">상세 리스트 보기 ></a>
		</div>
	</div>



</div>
	<!--  -->
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">


</script>
</html>