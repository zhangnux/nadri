<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width: 70px;
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

	
	
	<hr>
	
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<tbody>
					<tr>
						<td rowspan="3" style="width: 20%"><img alt="" src=""></td>
						<td style="width: 80%">레스토랑 이름</td>
					</tr>
					<tr>
						<td>별점: 5점</td>
					</tr>
					<tr>
						<td>한식 주차가능
						<a href="" class="btn btn-primary">book now</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!--
	<c:if test="${pagination.totalRecords gt 0 }">
	-->
		<!-- 페이지 내비게이션 표시 -->
		<!-- 
		<div class="row mb-3">
			<div class="col">
				<nav>
		  			<ul class="pagination justify-content-center">
		    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		      				<a class="page-link" href="list.do?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    			</li>
	
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="list.do?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
	
		    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="list.do?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
		    			</li>
		  			</ul>
				</nav>
			</div>
		</div>
	</c:if>
	-->
</div>
</body>
</html>