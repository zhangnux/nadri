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
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
   
</head>
<style>

	#review-img{
		height: 150px;
		width: 150px;
	}
	
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
				<div class="m-3">
					<h4>예약</h4>
				</div>
				<div class="mt-3">
					<div class="m-3">
						<div id="datepicker"></div>
						<p>날짜:  <input type="text" id="datepicker2" name="revdate"></p>
					</div>
					<div class="m-3">
						<label class="form-label">시간</label>
						<select class="form-select">
							<option value=""></option>
						</select>
					</div>
					<div class="m-3">
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
					<div class="m-3">
						<p><strong>총 금액: 0원</strong></p>
					</div>
					<div class="mb-3 d-flex justify-content-end">
						<a href="checkout.nadri?no=${restaurant.no }" class="btn btn-primary">book now</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-12">
			<c:choose>
			
			</c:choose>
			<h1 class="p-3"><strong>${restaurant.name }</strong> ★ ${starPiont }/5.0점</h1>
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
			<input type="hidden" name="lon" value="${restaurant.lat }" />
			<input type="hidden" name="lat" value="${restaurant.lon }" />
		<div class="col-12">
			<div id="map" style="width:500px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c05627174d60c45205e9a8a04f17dfac"></script>
			<script>
			
				var lat = $(":input[name=lat]").val();
				var lon = $(":input[name=lon]").val();
				
				var container = document.getElementById('map');
				var options = {
		    			center: new kakao.maps.LatLng(lat, lon),
		    			level: 3
		    		};
		
				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다
				var markerPosition  = new kakao.maps.LatLng(lat, lon); 

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
			<h4 id="reviewCount">전체(${reviewCount }개)</h4>
		</div>
	</div>
	<div class="row m-3">
		<div class="col" id="user-review">
			
		</div>
	</div>
	<div class="row m-3">
		<div class="col d-flex justify-content-center" id="review-pagination">
			
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
	
	
	
	
	
	function getReviewList(page) {
		var $reviewBox = $("#user-review").empty();
		page = page || 1;
		$.ajax({
			type: "get",
			url : "/rest/restaurant/review/list.nadri",
			data: {no: $(":input[name=restaurantNo]").val(), page:page},
			dataType: 'json',
			success: function(response) { // {"reviews": [{}, {}, {}], "pagination":{toal}}
				$.each(response.reviews, function(index, review) {
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
					// if loginuser.no = userNo
					htmlContent += '		<div class="row">';
					htmlContent += '			<div class="col gap-3 d-flex justify-content-end">';	
					htmlContent += '				<a>수정</a>';
					htmlContent += '				<a data-item-no="'+review.no+'">삭제</a>';
					htmlContent += '			</div>';
					htmlContent += '		</div>';
					htmlContent += '		<div class="row">';	
					if (review.picture != null) {
						htmlContent += '		<img id="review-img" src="/resources/images/restaurants/reviews/'+review.picture+'" class="img-thumbnail"/>';
					}
					htmlContent += '		</div>';
					htmlContent += '	</div>';
					htmlContent += '</div>';
	
					$reviewBox.append(htmlContent);
				});
				$("#review-pagination").empty();
				var pagination = response.pagination;
				var pageContent = "";
				pageContent += '<nav aria-label="...">';
				pageContent += '  <ul class="pagination">';
				if (pagination.existPrev) {
					pageContent += '    <li class="page-item">';
					pageContent += '      <a class="page-link" href="javascript:getReviewList('+pagination.prevPage+')">Previous</a>';
					pageContent += '    </li>';
					
				} else {
					pageContent += '    <li class="page-item disabled">';
					pageContent += '      <a class="page-link">이전</a>';
					pageContent += '    </li>';
					
				}
				for (var num = pagination.beginPage; num <= pagination.endPage; num++) {
					if (num == pagination.pageNo) {
						pageContent += '    <li class="page-item active "><a class="page-link" href="javascript:getReviewList('+num+')">'+num+'</a></li>';
					} else {
						pageContent += '    <li class="page-item "><a class="page-link" href="javascript:getReviewList('+num+')">'+num+'</a></li>';
					}
					
				}
				if (pagination.existNext) {
					pageContent += '    <li class="page-item">';
					pageContent += '      <a class="page-link"  href="javascript:getReviewList('+pagination.nextPage+')">Next</a>';
					pageContent += '    </li>';
				} else{
					pageContent += '    <li class="page-item disabled">';
					pageContent += '      <a class="page-link">다음</a>';
					pageContent += '    </li>';
					
				}
				
				pageContent += '  </ul>';
				pageContent += '</nav>';
				
				$("#review-pagination").append(pageContent);
			}
		});
	}
	
	/*
	function deletereview(){
		
		if (!confirm("삭제하시겠습니까?")) {
	        return;
	    }
	
		var replyseq = $(this).attr("data-del");
	    var sendData = {"replyseq": replyseq}
	    $.ajax({
	        method: 'GET',
	        url : 'replyDelete',
	        data : sendData,
	        success: init
	}
	    */
	
	$(function(){
		// 날짜
		$("#datepicker2").datepicker({
	     minDate:0,
	     dateFormat: 'yy-mm-dd',
	     prevText: '이전 달',
	     nextText: '다음 달',
	     monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	     monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	     dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	     dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	     dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	     showMonthAfterYear: true,
	     yearSuffix: '년'
	
	   });
		$('#datepicker2').datepicker('setDate', 'today');
	})

</script>
<!--  -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>