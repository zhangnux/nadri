<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title>나드리::음식점</title>
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
<div class="container m-3">
	
	<div class="row m-3 p-3" id="head">
		<div class="col">
			<h2><strong>Restaurant</strong></h2>
		</div>
	</div>
	

	<div id="restaurant-detail" class="row m-3">
		<div class="col-9 p-1" id="restaurant-picture">
			<img id="rt-img" alt="picture" src="${restaurant.picture }">
		</div>
		<div class="col-3 border p-1 position-sticky">
			<form action="checkout.nadri" id="reservation-form">
				<input type="hidden" name="restaurantNo" value="${restaurant.no }"/>
				<div class="m-3 mb-5">
					<h4><strong>예약</strong></h4>
				</div>
				<div class="row m-3">
					<div id="datepicker"></div>
					<p><strong>날짜 </strong>
					<input type="text" id="datepicker2" name="reservedDate"></p>
				</div>
				<div class="row m-3">
					<div class="col-3">
						<span><strong>시간</strong></span>
					</div>
					<div class="col-9 d-flex justify-content-start">
						<select class="form-select" id="select-timetable" name="timetableNo">
							
						</select>
					</div>
				</div>
				<div class="row mt-3 mb-5">
					<div class="row ms-3 mb-3">
						<p><strong>인원</strong></p>
					</div>
					<div class="row ms-5 gap-3">
						<div class="row">
							<div class="col-3">
								<span>어른</span>
							</div>
							<div class="col-9">
								<input type="hidden" name="adult" value="0"/>
								<i class="bi bi-arrow-left-circle" data-input-name="adult"></i>
								<span id="number-of-adult">0</span> 명
								<i class="bi bi-arrow-right-circle" data-input-name="adult"></i>
								<p style="font-size: 10px;" id="total-adult-price" data-adult-price="10000">0 </p>
							</div>
						</div>
						<div class="row">
							<div class="col-3">
								<span>아이</span>
							</div>
							<div class="col-9">
								<input type="hidden" name="child" value="0"/>
								<i class="bi bi-arrow-left-circle" data-input-name="child"></i>
								<span id="number-of-child">0</span> 명
								<i class="bi bi-arrow-right-circle" data-input-name="child"></i>
								<p style="font-size: 10px;" id="total-child-price" data-child-price="5000">0 </p>
							</div>
						</div>
					</div>
					<input type="hidden" name="people" value="0"/>
				</div>
				<div class="row m-3 mt-10">
					<div class="col-5">
						<p><strong>총 금액: <span id="totalPrice">0</span>원</strong></p>
						<input type="hidden" name="deposit" value="0">
					</div>
					<div class="col-7 d-flex justify-content-end">
						<button type="submit" href="checkout.nadri?no=${restaurant.no }" id="btn-book" class="btn btn-primary">book now</button>
					</div>				
				</div>
			</form>
		</div>
	</div>
	
	<div class="row m-3">
		<div class="col-12 border">
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
	<div class="row m-3">
		<div class="col-12">
			<h3>위치</h3>
		</div>
		<div class="col-12">
			<div id="map" style="width:500px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c05627174d60c45205e9a8a04f17dfac"></script>
			<script>
			
				var lat = "${restaurant.lat }"
				var lng = "${restaurant.lng }"
				
				var container = document.getElementById('map');
				var options = {
		    			center: new kakao.maps.LatLng(lat, lng),
		    			level: 3
		    		};
		
				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다
				var markerPosition  = new kakao.maps.LatLng(lat, lng); 

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

<div class="container m-3" id="review">

	<!-- 
		결제 버튼 누르면 로그인, 날짜, 시간, 어른 1명은 무조건 선택되는지 확인하고 경고창 띄우기
	 -->
	 

	<!--
		리뷰 로그인해야 작성할수 있게
		수정 삭제는 로그인된 유저 정보 받아와서 일치하면 보이게
		페이지 변경이 없으니 ajax로 해야함
		0개 count도 ajax로 하면 됨!
	-->
	<div class="row m-3 mb-5" style="border-bottom: 1px solid;">
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
	
	// btn-book 버튼 클릭시 로그인, 시간, 인원 수 여부 확인
	$("#btn-book").click(function(e) {
		// 로그인
		//if("${LOGIN_USER}" == ""){
		//	e.preventDefault()
		//	alert("로그인 후 이용하실 수 있습니다.")
		//	return location.replace("http://localhost/user/login.nadri");
		//}
		
		// 시간
		
		if($("#select-timetable").val() == null){
			alert("시간을 선택하세요"); 
			return e.preventDefault();
		}
		//인원 수 최소 어른 1명
		var adult = parseInt($("#number-of-adult").text());
		if(parseInt($("#number-of-adult").text()) == 0){
			alert("어른을 최소 1명 선택해야합니다.")
			return e.preventDefault();
		}

		
		
	})
	

	// 리뷰 등록
	$("#btn-add-review").click(function() {
		var $reviewBox = $("#user-review").empty();
		// 로그인 안 되었을때, 로그인 해주세요
		if("${LOGIN_USER}" == ""){
			alert("로그인을 해주세요.");
			
			return getReviewList();
		}
		
		// 별점 여부	
		if(document.querySelector('input[name="rating"]').checked == false){
            alert("별점을 선택하세요"); 
			return getReviewList();
		}
		
		// 내용 입력
		if($("#reviewContent").val().trim()==""){
			alert("내용을 입력해주세요");
			return getReviewList();
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
					htmlContent += '<div class="row mb-2 border-bottom" id="no'+review.no+'">';
					htmlContent += '<div class="col-3 p-3 border-end">';
					htmlContent += '	<div >★ <span id="starPoint-'+review.no+'">'+review.rating+'</span>점</div>';
					htmlContent += '<div id="username'+review.no+'" class="mb-3"><strong>'+review.userName+'</strong></div>';
					htmlContent += '<div id="createdDate'+review.no+'">'+review.createdDate+'</div>';
					htmlContent += '</div>';
					htmlContent += '<div class="col-6 p-3">';
					htmlContent += '	<p id="content'+review.no+'">'+review.content+'</p>';
					htmlContent += '</div>';
					htmlContent += '<div class="col-3 p-3">';
					if('${LOGIN_USER.no}' == review.userNo){
					htmlContent += '		<div class="row">';
					htmlContent += '			<div class="col gap-3 d-flex justify-content-end">';	
					htmlContent += '				<a href="javascript:void(0)" onclick="modifyformReview('+review.no+')" style="padding-right:5px">수정</a>';
					htmlContent += '				<a href="javascript:void(0)" onclick="deleteReview(' + review.no + ')" >삭제</a>';
					htmlContent += '			</div>';
					htmlContent += '		</div>';
					}
					htmlContent += '		<div class="row">';	
					if (review.picture != null) {
						htmlContent += '		<img id="review-img'+review.no+'" src="/resources/images/restaurants/reviews/'+review.picture+'" class="img-thumbnail"/>';
					}
					htmlContent += '		</div>';
					htmlContent += '	</div>';
					htmlContent += '</div>';
	
					$reviewBox.append(htmlContent);
				});
				$("#review-pagination").empty();
				if (response.reviews.length > 0) {
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
			}
		});
	}
	
	// 리뷰 수정
	
	function modifyformReview(reviewNo){
		
		var starPoint = $("#starPoint-" + reviewNo).text();
		
		
		var htmlContent = '';
		htmlContent += '<div class="row mb-2 border-bottom" id="no'+reviewNo+'">';
		htmlContent += '<div class="col-3 p-3 border-end">';
		htmlContent += '<div class="col-auto star-rating mt-3 mb-3">';
		htmlContent += '<input type="radio" id="5-stars" name="edit-rating" value="5" '+ (starPoint == 5 ? 'checked' : '')+' />';
		htmlContent += '<label for="5-stars" class="star">&#9733;</label>';
		htmlContent += '<input type="radio" id="4-stars" name="edit-rating" value="4" '+ (starPoint == 4 ? 'checked' : '')+'/>';
		htmlContent += '<label for="4-stars" class="star">&#9733;</label>';
		htmlContent += ' <input type="radio" id="3-stars" name="edit-rating" value="3" '+ (starPoint == 3 ? 'checked' : '')+'/>';
		htmlContent += ' <label for="3-stars" class="star">&#9733;</label>';
		htmlContent += '  <input type="radio" id="2-stars" name="edit-rating" value="2" '+ (starPoint == 2 ? 'checked' : '')+'/>';
		htmlContent += '  <label for="2-stars" class="star">&#9733;</label>';
		htmlContent += '  <input type="radio" id="1-star" name="edit-rating" value="1" '+ (starPoint == 1 ? 'checked' : '')+' />';
		htmlContent += ' <label for="1-star" class="star">&#9733;</label>';
		htmlContent += '</div>';
		htmlContent += '<div id="username" class="mb-3"><strong>${LOGIN_USER.name}</strong></div>';
		htmlContent += '<div>'+$('div#createdDate'+reviewNo).text()+'</div>';
		htmlContent += '</div>';
		htmlContent += '<div class="col-6 p-3">';
		htmlContent += '	<textarea name="editContent" class="form-control" id="editContent" rows="3">'+$('p#content'+reviewNo).text()+'</textarea>';
		htmlContent += '	<input type="file" class="form-control" name="upfile" id="edit-up-file""/>';				
		htmlContent += '</div>';
		htmlContent += '<div class="col-3 p-3">';
		htmlContent += '		<div class="row">';
		htmlContent += '			<div class="col gap-3 d-flex justify-content-end">';	
		htmlContent += '				<a href="javascript:void(0)" onclick="updateReview('+reviewNo+')" style="padding-right:5px">저장</a>';
		htmlContent += '				<a href="javascript:void(0)" onClick="getReviewList()">취소<a>';
		htmlContent += '			</div>';
		htmlContent += '		</div>';
		htmlContent += '	</div>';
		htmlContent += '</div>';
		
		$('#no' + reviewNo).replaceWith(htmlContent);
		$('#no' + reviewNo + ' #editContent').focus();
		
		$('#no' + reviewNo).find('.star').click(function() {
			// 모든 라이오버튼의 체크상태를 해제상태로 변경함  
			$(":radio[name=edit-rating]").prop("checked", false);
			// 모든 별의 색을 회색으로 변경
			$('#no' + reviewNo).find('.star').css("color", '#ccc');
			// 클릭한 변의 색을 주황색으로 변경하고, 그 별 바로 앞에 있는 라디오 버튼을 체크상태로 변경함 
			$(this).prev().prop("checked", true);
			
			var checked = false;
			$(":radio[name=edit-rating]").each(function(index, radio) {
				if ($(radio).prop('checked') == true) {
					checked = true;
				}
				if (checked) {
					$(this).next().css('color', '#f90')
				}
			})
			
		});
		
		
	}
	
	function updateReview(reviewNo){
		// 로그인 안 되었을때, 로그인 해주세요
		if("${LOGIN_USER}" == ""){
			alert("로그인을 해주세요.");
			
			return getReviewList();
		}
		
		// 별점 여부	
		if(document.querySelector('input[name="edit-rating"]').checked == false){
            alert("별점을 선택하세요"); 
			return getReviewList();
		}
		
		// 내용 입력
		if($("#editContent").val().trim()==""){
			alert("내용을 입력해주세요");
			return getReviewList();
		}
		
		var formData = new FormData();
		// 별점 조회
		var rating = $(":input[name=edit-rating]:checked").val();
		// 리뷰내용 조회
		var content = $(":input[name=editContent]").val();
		// FormData객체에 name,value의 쌍으로 값을 추가한다.
		formData.append("reviewNo", reviewNo);
		formData.append("rating", rating);
		formData.append("content", content);
		// 첨부파일 입력필드 조회
		var input = document.getElementById("edit-up-file");	
		// 첨부파일 조회하기
		if (input.files.length) {
			var upfile = input.files[0]; 	// 첨부파일 input 엘리먼트에 첨부된 파일중에서 첫번째 파일을 FormData에 저장	
			formData.append("upfile", upfile);	

		}
		

		$.ajax({
			type:"post",				// 첨부파일이 업로드 되기 때문에 post 방식으로 지정한다.
			url:"/rest/restaurant/review/modify.nadri",
			data: formData,
			processData: false,			// processData를 false로 지정하면 name=value&name=value의 형태가 아닌 다른 방식으로 전달된다.
			contentType: false,			// contentType를 false로 지정하면 기본값으로 지정된 "application/x-www-form-urlencoded"가 적용되지 않는다.
			success: function() {
				getReviewList();
			}
		});
		
	}

		
	
	// 리뷰 삭제
	function deleteReview(no){
		var paramData = {"no": no};
		$.ajax({
			url: "/rest/restaurant/review/delete.nadri"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				getReviewList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
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
	     yearSuffix: '년',
	     
	     onSelect: function(date, inst) {
   			$("#select-timetable").empty();
   			
	    	 $.ajax({
	    		 type: "get",
	    		 url : "/rest/restaurant/book/bookable.nadri",
	    		 data: {no: "${restaurant.no}", date: date},
	    		 dataType: 'json',
	    		 success: function(bookables){
	    			
			    	$("#select-timetable").append('<option value="" selected disabled>선택</option>')
		    		$.each(bookables, function(index, bookable) {
			    		var opt = '	<option value="'+bookable.timeTableNo+'" '+(bookable.bookablePeople == 0 ? "disabled" : "")+'" >'+bookable.startTime+'</option>';
			    		$("#select-timetable").append(opt);
		    		})
	    			
		  	 	}
	     	})
	     	
	     }
	   
	   });
		$('#datepicker2').datepicker('setDate', 'today');
	})
	
	
	
	
	// 가격 구하기
	
	$(".bi-arrow-right-circle").click(function(){
		// adult/child 인지 조회하기
		var peopleType = $(this).attr('data-input-name');
		var number = parseInt($(":input[name="+peopleType+"]").val());
		
		
		// 10 이상은 등록 안됨.
		var preAdult = parseInt($("#number-of-adult").text());
		var preChild = parseInt($("#number-of-child").text());
		var preTotalPeople = preAdult+preChild+1;
		
		
		if (preTotalPeople >= 10) {
			alert("10명 이상은 가게로 직접 문의하세요.")
			var peopleType = $(this).attr('data-input-name');
			var number = parseInt($(":input[name="+peopleType+"]").val());
			return false;
		} else{
			number++;
		}
		
		
		
		
		$(":input[name="+peopleType+"]").val(number);
		$(this).prev().text(number);
		
		var price = parseInt($("#total-" + peopleType + "-price").attr("data-" + peopleType + "-price"));
		var totalPrice = number*price;
		$("#total-" + peopleType + "-price").text(totalPrice);
		
		
		
		
		var adult = parseInt($("#number-of-adult").text());
		var child = parseInt($("#number-of-child").text());
		var totalPeople = adult+child;
		
		$(":input[name=people]").val(totalPeople);
		
		var adultTotalPrice = parseInt($("#total-adult-price").text());
		var childTotalPrice = parseInt($("#total-child-price").text());
		var adultChildTotalPrice = adultTotalPrice + childTotalPrice;
		
		$("#totalPrice").text(adultChildTotalPrice);
		$(":input[name=deposit]").val(adultChildTotalPrice)
	})
	
	
	$(".bi-arrow-left-circle").click(function(){
		
		var peopleType = $(this).attr('data-input-name');
		var number = parseInt($(":input[name="+peopleType+"]").val());
		number--;
		if(number<0){
			return false;
		}
		
		$(":input[name="+peopleType+"]").val(number);
		$(this).next().text(number);
		
		var price = parseInt($("#total-" + peopleType + "-price").attr("data-" + peopleType + "-price"));
		var totalPrice = number*price;
		$("#total-" + peopleType + "-price").text(totalPrice);
		
		
		var adult = parseInt($("#number-of-adult").text());
		var child = parseInt($("#number-of-child").text());
		var totalPeople = adult+child;
		$(":input[name=people]").val(totalPeople);
		
		var adultTotalPrice = parseInt($("#total-adult-price").text());
		var childTotalPrice = parseInt($("#total-child-price").text());
		var adultChildTotalPrice = adultTotalPrice + childTotalPrice;
		
		$("#totalPrice").text(adultChildTotalPrice);
		$(":input[name=deposit]").val(adultChildTotalPrice)
		
	})
	


</script>
<!--  -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>