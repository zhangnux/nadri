<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
		width: 300px;
	}


</style>
<body>

<%@ include file="../common/mainnav.jsp" %>
<header class="masthead" style="background-image: url('../resources/images/nadri-restaurant.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning fw-bold">Restaurant</h1>
                    <span class="subheading">입 안의 즐거움!</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- ★ -->

<div class="container">

	
	<div class="row mb-3 p-3">
		<div class="col">
			<h2>목록</h2>
		</div>
	</div>
	
	<hr>
	<!-- 검색 -->
	<div class="row mb-3">
		<div class="col">
		<!-- 검색하면 제출되게 스크립트 설정하기 -->
			<form id="form-search" action="list.nadri" method="get" class="row row-cols-lg g-3 align-items-center p-3">
				<input type="hidden" name="page" value="1" />
				<div class="col-3">
					<select class="form-select" name="city">
						<option value="" ${empty param.city ? 'selected' : ''}>전체 지역</option>
						<c:forEach var="city" items="${cities }">
							<option value="${city.no }" ${param.city == city.no ? 'selected' : ''}>
								${city.cityName }
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-3">
					<select class="form-select" name="category">
						<option value="" ${empty param.category ? 'selected' : ''}>전체 카테고리</option>
						<c:forEach var="category" items="${categories }">
							<option value="${category.no }" ${param.category == category.no ? 'selected' : ''}>
								${category.categoryName }
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="col input-group">
					<input type="search" class="form-control" name="name" value="${param.name }" placeholder="상호를 입력하세요">
					<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-restaurant">검색</button>
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
	
	<div class="row mb-3">
	<!-- sideNavbar -->
		<div class="col-2">
			<ul class="nav flex-column nav-tabs">
				<li class="nav-item">
					<a class="nav-link" aria-current="page" href="list.nadri">전체</a>
				</li>
				<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">도시</a>
				    <ul class="dropdown-menu">
				    	<c:forEach var="city" items="${cities }">
				    		<li><a class="dropdown-item" href="list.nadri?city=${city.no} ">${city.cityName }</a></li>
				    	</c:forEach>
				    </ul>
				</li>
				<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
				    <ul class="dropdown-menu">
				    	<c:forEach var="category" items="${categories }">
				    		<li><a class="dropdown-item" href="list.nadri?category=${category.no }">${category.categoryName }</a></li>
				    	</c:forEach>
				    </ul>
				</li>
			</ul>
		</div>
		<!-- list -->
		<div class="col-10">
			<c:choose>
				<c:when test="${empty restaurants }">
					<div class="col col-12 text-center fw-bold"><h1>일치하는 음식점이 없습니다.</h1></div>
				</c:when>
				<c:otherwise>
					<c:forEach var="restaurant" items="${restaurants }">
						<table class="table p-3 border">
							<tbody>
									<tr>
										<td rowspan="3" style="width: 20%"><img alt="" src="${restaurant.picture }"></td>
										<td style="width: 80%">${restaurant.name }</td>
									</tr>
									<tr>
										<td>별점: ${restaurant.starPoint }점</td>
									</tr>
									<tr>
										<td>${restaurant.categoryName } 주차:${restaurant.parking }
										<a href="detail.nadri?no=${restaurant.no }" class="btn btn-primary">book now</a></td>
									</tr>
							</tbody>
						</table>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	

	<c:if test="${pagination.totalRecords gt 0 }">
	<!-- 페이지 내비게이션 표시 -->
	<div class="row mb-3">
		<div class="col">
			<nav>
		  		<ul class="pagination justify-content-center">
		    		<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		     			<a class="page-link" href="list.nadri?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    		</li>
		    		<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			   			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			   				<a class="page-link" href="list.nadri?page=${num }" data-page="${num }">${num }</a>
			   			</li>	    			
		    		</c:forEach>
		    		
		    		<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      			<a class="page-link" href="list.nadri?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
		    		</li>
		  		</ul>
			</nav>
			</div>
		</div>
	</c:if>

</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script type="text/javascript">
	$("#select-sort").change(function()){
		document.getElementById("form-search").submit();
	}
	
	// 페이지내비게이션의 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$(".pagination a").click(function(event) {
		event.preventDefault();
		// 클릭한 페이지내비게이션의 페이지번호 조회하기
		var pageNo = $(this).attr("data-page");
		// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
		$(":input[name=page]").val(pageNo);
		
		// 검색폼에 onsubmit 이벤트 발생시키기
		$("#form-search").trigger("submit");
	})
	
	

</script>
</html>