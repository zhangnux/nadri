<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	
	#rt-img{
		height: 500px;
		width: 800px;
	}
	
	#head {
		border-bottom: 1px solid;
	}

	#review{
		border-top: 1px solid;
		
	}
	
	#review-insertform{
		border: 1px solid;
	}
	
</style>
<body>
<%@ include file="../common/navbar.jsp" %>

<!-- ★ -->
<div class="container">
	
	<div class="row mb-3 p-3" id="head">
		<div class="col">
			<h2>예약</h2>
		</div>
	</div>
	

	<div id="restaurant-detail" class="row mb-3">
		<div class="col-9 p-1" id="restaurant-picture">
			<img id="rt-img" alt="picture" src="${restaurant.picture }">
		</div>
		<div class="col-3 border p-1">
			<form action="">
				<div class="mb-3">
					<label class="form-labeL">날짜</label>
					<input type="date" class="form-control" name="reservedDate" />
				</div>
				<div class="mb-3">
					<label class="form-label">시간</label>
					<select class="form-select">
						<option value=""></option>
					</select>
				</div>
				<div class="mb-3">
					<label class="form-label">어른</label>
					<select class="form-select">
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
					</select>
					<label class="form-label">아이</label>
					<select class="form-select">
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
					</select>
				</div>
				<div class="mb-3">
					<a href="checkout.nadri?no=${restaurant.no }" class="btn btn-primary">book now</a>
				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="p-3"><strong>${restaurant.name }</strong> 별점: 5점</h1>
			<p>${restaurant.content }</p>
		</div>
		<div class="col-12 p-3">
			<table class="table">
				<thead>
					<tr>
						<th>주소</th>
						<th>휴일</th>
						<th>영업시간</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${restaurant.address }</td>
						<td>${restaurant.restDate }</td>
						<td>${restaurant.openTime }</td>
						<td>${restaurant.tel }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<h3>위치</h3>
		</div>
		<div class="col-12">
			<div id="map" style="width:500px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c05627174d60c45205e9a8a04f17dfac"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					// ${restaurant.lat} 값 어떻게 넣지??
					center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
			</script>
		</div>
	
	</div>
	


</div>

<div class="container" id="review">
		<!--
		리뷰 로그인해야 작성할수 있게
		수정 삭제는 로그인된 유저 정보 받아와서 일치하면 보이게
		페이지 변경이 없으니 ajax로 해야함
		0개 count도 ajax로 하면 됨!
	-->

	<div class="row mb-3" id="review-insertform">
		<div class="col">
			<form id="review-insert" action="" method="get">
				<div class="mb-3">
					<label class="form-label">별점</label>
					<select class="form-select">
						<option value="5">5점</option>
						<option value="4.5">4.5점</option>
						<option value="4">4점</option>
						<option value="3.5">3.5점</option>
						<option value="3">3점</option>
						<option value="2.5">2.5점</option>
						<option value="2">2점</option>
						<option value="1.5">1.5점</option>
						<option value="1">1점</option>
					</select>
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlTextarea1" class="form-label">댓글 내용</label>
 					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>
				<!-- c:if로 이미 내용이 있으면 수정과 삭제 버튼 -->
				<div class="mb-3">
					<button class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3" style="border-bottom: 1px solid;">
		<div class="col p-3">
			<h3>리뷰(0개)</h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
		<!-- c:foreach -->
			<table id="user-review" class="table pt-3 pb-3 border">
				<tbody>
					<tr>
						<td id="username" style="text-align: left; width: 8%;">홍길동</td>
						<td id="starPoint" style="text-align: left; width: 10%;">별점: 5점</td>
						<td id="createdDate" style="text-align: right; width: 82%;">2022/02/03</td>
					</tr>
					<tr>
						<td id="reviewContent" colspan="3">리뷰 내용</td>
					</tr>
				</tbody>
				<!-- c:if로 사진 있음과 없음 가르기. 다음 음식점 리뷰 보여드리고 어떻게 하는지 여쭙기 -->
				<tbody>
					<tr>
						<td id="username" style="text-align: left; width: 8%;">홍길동</td>
						<td id="starPoint" style="text-align: left; width: 10%;">별점: 5점</td>
						<td id="createdDate" style="text-align: right; width: 82%;">2022/02/03</td>
					</tr>
					<tr>
						<td id="reviewContent" colspan="3">리뷰 내용</td>
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
	-->
</div>
<script type="text/javascript">
	$(function() {
		
		
	}


</script>
<!--  -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>