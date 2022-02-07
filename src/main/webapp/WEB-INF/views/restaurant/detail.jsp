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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
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
	
	.star-rating {
	  border:solid 1px #ccc;
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1.5em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	}
	
	.star-rating input {
	  display:none;
	}
	
	.star-rating label {
	  color:#ccc;
	  cursor:pointer;
	}
	
	.star-rating :checked ~ label {
	  color:#f90;
	}
	
	.star-rating label:hover,
	.star-rating label:hover ~ label {
	  color:#fc0;
	}
	
	/* explanation */
	
	article {
	  background-color:#ffe;
	  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
	  color:#006;
	  font-family:cursive;
	  font-style:italic;
	  margin:4em;
	  max-width:30em;
	  padding:2em;
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
		<div class="col-3 border p-1 position-sticky">
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
					<a href="checkout.nadri?no=${restaurant.no }" class="btn btn-primary d-flex justify-content-end">book now</a>
				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="p-3"><strong>${restaurant.name }</strong> ★ 5.0/5.0점</h1>
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
		    			center: new kakao.maps.LatLng(33.450701, 126.570667),
		    			level: 3
		    		};
		
				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다  33.450701, 126.570667
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
	<div class="row mb-5" style="border-bottom: 1px solid;">
		<div class="col p-3">
			<h3>리뷰</h3>
		</div>
	</div>
	<!-- 리뷰 작성 -->
	<div class="row m-3" id="reviewform">
		<div class="col">
			<form id="review-insert" >
				<input type="hidden" name="restaurantNo" value="${restaurant.no }"/>
				<div class="col-auto star-rating mt-3 mb-3">
				  <input type="radio" id="5-stars" name="rating" value="5" />
				  <label for="5-stars" class="star">&#9733;</label>
				  <input type="radio" id="4-stars" name="rating" value="4" />
				  <label for="4-stars" class="star">&#9733;</label>
				  <input type="radio" id="3-stars" name="rating" value="3" />
				  <label for="3-stars" class="star">&#9733;</label>
				  <input type="radio" id="2-stars" name="rating" value="2" />
				  <label for="2-stars" class="star">&#9733;</label>
				  <input type="radio" id="1-star" name="rating" value="1" />
				  <label for="1-star" class="star">&#9733;</label>
				</div>
				<div class="row">
					<div class="mb-3">
	 					<textarea name="content" class="form-control" id="reviewContent" rows="3"></textarea>
					</div>				
				</div>
				<div class="mb-3">
					<input type="file" class="form-control" name="upfile" id="up-file"/>
				</div>
				<!-- c:choose로 이미 내용이 있으면 수정과 삭제 버튼 -->
				<div class="mb-3 d-flex justify-content-end">
					<button type="button" class="btn btn-primary" id="btn-add-review">등록</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row mt-5 ms-3" style="border-bottom: 1px solid;">
		<div class="col">
			<h4>전체(0개)</h4>
		</div>
	</div>
	<div class="row m-3">
		<div class="col" id="user-review">
			
		</div>
	</div>
</div>
<script type="text/javascript">

	getReviewList();


	$("#btn-add-review").click(function() {
		var $reviewBox = $("#user-review").empty();
		// 로그인 안 되었을때, 로그인 해주세요
		
		// 내용 입력
		if($("#reviewContent").val().trim()==""){
			alert("내용을 입력해주세요");
			return false;
		}
		// 등록 확인
		// 레스토랑 번호 조회
		// 첨부파일 업로드를 지원하는 FormData 객체를 생성한다.
		var formData = new FormData();
		var restaurantNo = $(":input[name=restaurantNo]").val();
		// 별점 조회
		var rating = $(":input[name=rating]:checked").val();
		// 리뷰내용 조회
		var content = $(":input[name=content]").val();
		// FormData객체에 name,value의 쌍으로 값을 추가한다.
		formData.append("restaurantNo", restaurantNo);
		formData.append("rating", rating);
		formData.append("content", content);
		
		// 첨부파일 입력필드 조회
		var input = document.getElementById("up-file");	
		// 첨부파일 조회하기
		if (input.files.length) {
			var upfile = input.files[0]; 	// 첨부파일 input 엘리먼트에 첨부된 파일중에서 첫번째 파일을 FormData에 저장	
			formData.append("upfile", upfile);	

		}
	
	
		$.ajax({
			type:"post",				// 첨부파일이 업로드 되기 때문에 post 방식으로 지정한다.
			url:"/rest/restaurant/review/insert.nadri",
			data: formData,
			processData: false,			// processData를 false로 지정하면 name=value&name=value의 형태가 아닌 다른 방식으로 전달된다.
			contentType: false,			// contentType를 false로 지정하면 기본값으로 지정된 "application/x-www-form-urlencoded"가 적용되지 않는다.
			success: function() {
				getReviewList();
			}
		});
	
	});
	
	
	function getReviewList() {
		var $reviewBox = $("#user-review").empty();
		
		$.ajax({
			type: "get",
			url : "/rest/restaurant/review/list.nadri",
			data: {no: $(":input[name=restaurantNo]").val()},
			dataType: 'json',
			success: function(reviews) {
				$.each(reviews, function(index, review) {
					var htmlContent = '';
					htmlContent += '<div class="row mb-2 border-bottom">';
					htmlContent += '<div class="col-3 p-3 border-end">';
					htmlContent += '	<div id="starPoint">★ '+review.rating+'점</div>';
					htmlContent += '<div id="username" class="mb-3"><strong>'+review.userName+'</strong></div>';
					htmlContent += '<div>'+review.createdDate+'</div>';
					htmlContent += '</div>';
					htmlContent += '<div class="col-6 p-3">';
					htmlContent += '	<p>'+review.content+'</p>';
					htmlContent += '</div>';
					htmlContent += '<div class="col-3 p-3">';
					if (review.picture != null) {
						htmlContent += '	<img src="/resources/images/restaurants/review/'+review.picture+'" class="img-thumbnail"/>';
					}
					htmlContent += '</div>';
					htmlContent += '</div>';
	
					$reviewBox.append(htmlContent);
				})
			}
		});
	}
	


</script>
<!--  -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>