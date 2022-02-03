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
	}
	
	#best-restaurant{
		rounded;
	}
	
	#go-list:hover{
		opacity: 0.4;
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
	
	<div class="row mb-3">
		<div class="col">
			<h2>레스토랑</h2>
		</div>
	</div>
	<hr>
	<!-- 검색 -->
	<!--검색어로 한 다음 content, name, city 모두 걸리게
		
		혹은
		옵션: 지역 //경기도 (city로)
			 카테고리
		검색어: 상호
		order by 매출
				 별점
	-->
	<div class="row mb-3">
	<!-- 검색하면 제출되게 스크립트 설정하기 '검색어를 입력하세요' -->
		<div class="col">
			<form id="form-search" action="list.nadri" method="get" class="row row-cols-lg g-3 align-items-center p-3">
				<input type="hidden" name="page" value="1" />
				<div class="col-3">
					<select class="form-select" name="city">
						<option value="" ${empty param.city ? 'selected' : ''}>전체 지역</option>
						<c:forEach var="city" items="${cities }">
							<option value="${city.no }" ${param.city == '${city.no}' ? 'selected' : ''}>
								${city.cityName }
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-3">
					<select class="form-select" name="category">
						<option value="" ${empty param.category ? 'selected' : ''}>전체 카테고리</option>
						<c:forEach var="category" items="${categories }">
							<option value="${category.no }" ${param.category == '${category.no}' ? 'selected' : ''}>
								${category.categoryName }
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col input-group">
					<input type="button" class="btn btn-outline-primary btn-sm" id="btn-search-restaurant">검색</button>
				</div>
				<div class="col-2">
					<select class="form-select" name="sort">
						<option value="sales" ${param.sort == 'sort' ? 'selected' : ''}>매출순</option>
						<option value="starPoint" ${param.sort == 'sort' ? 'selected' : ''}>별점순</option>
					</select>
				</div>
			</form>
		</div>
	</div>
	<hr>
	<div class="row mb-3 pt-5">
		<div class="col">
			<h4><Strong>Best Restaurant</Strong></h4>
		</div>
	</div>
	
	<div class="row mb-3">
		<c:forEach var="restaurant" items="${restaurants }">
			<div class="col-3">
				<div class="card shadow" style="width: 18rem;" id="best-restaurant">
	  				<img src="${restaurant.picture}" class="card-img-top" alt="picture">
	  				<div class="card-body">
	    				<p class="card-text"><strong>${restaurant.name }</strong></p>
	    				<p class="card-text">${restaurant.starPoint } 점</p>
	    				<a href="detail.nadri?no=${restaurant.no }" class="btn btn-primary"><strong>book now</strong></a>
	  				</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="row mb-3 pt-2">
		<div class="col">
			<a href="list.nadri" class="text-decoration-none text-primary" id="go-list" ><Strong>상세 리스트 보기 ></Strong></a>
		</div>
	</div>



</div>
	<!--  -->
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	$("#select-sort").change(function()){
		document.getElementById("form-search").submit();
	}

</script>
</html>