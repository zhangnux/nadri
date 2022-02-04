<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
<style>
.detail {
	position: fixed; .
	top: 40%;
	right: 6%;
	padding: 0;
}
.card:hover{
	transform:scale(1.01);
	overflow: hidden;
	filter: brightness(95%);
	transition: all 0.3s;
}
/* component */

.star-rating {
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
  color:#fc0;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#f90;
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

#thumb {
    display: block;
    overflow: hidden;
}
/*
#thumb img{
    display: block;
    min-width: 100%;
    min-height: 100%; 
    -ms-interpolation-mode: bicubic;
}
*/
</style>
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<%@ include file="common/detailside.jsp"%>
			<div class="col-8 mt-3 mb-5">
				<div class="mb-3">
					<h5>
						<i class="bi bi-pin-map"></i> <a
							href="list.nadri?place=${detail.place }"
							style="text-decoration: none; color: black;">
							&nbsp;${detail.place }</a>
					</h5>
				</div>
				<div>
					<h2 class="text-center">
						<strong>${detail.name }</strong>
					</h2>
				</div>
				<div class="border-bottom mb-4 mt-4 pb-4 text-center">
					<c:choose>
						<c:when test="${empty star }">
						0.0/5.0
						</c:when>
						<c:otherwise>
						★★★★★${star }/5.0 
						</c:otherwise>
					</c:choose>
					(${count })</div>

				<!-- forEach -->
				<c:choose>
					<c:when test="${empty detail.detail }">
						<div class="mt-5"></div>
					</c:when>
					<c:otherwise>

						<div class="mb-3 p-4">
							<h5>
								<strong>${detail.category } 안내</strong>
							</h5>
							${detail.detail }
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty detail.photo }">
					</c:when>
					<c:otherwise>
						<div>
							<img src="../../../resources/images/att/${detail.photo }"
								style="width: 850px;">
						</div>
					</c:otherwise>
				</c:choose>
				<div class="border-top mt-5 pt-4">
					<h5 class="mb-3">
						<strong>위치 안내</strong>
					</h5>
					<div id="map" style="width: 500px; height: 400px;">

						<!-- forEach -->
						<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
	
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
	
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('공덕동', function(result, status) {
	
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
	
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
	
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
				        });
				        infowindow.open(map, marker);
	
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
						<!--  -->

					</div>
				</div>

				<!-- 후기 -->
				<div class="border-top mt-5 pt-4">
					<h5>
						<strong>후기 사진</strong>
					</h5>
				</div>
				<div class="border-top mt-5 mb-5 pt-4">
					<h5>
						<strong>후기</strong>
					</h5>
					<div class="row">
						<div class="col-3 text-end">
							<div class="mt-3" style="font-size:60px;">					
								<c:choose>
									<c:when test="${empty star }">
										<strong>0.0</strong>
									</c:when>
									<c:otherwise>
										<strong><span style="color:gold;">★</span>&nbsp;${star }</strong>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-6 ms-3 p-2 mt-4">
						<span style="color:black;font-size:30px;"><strong>후기 ${count }개</strong></span>
						</div>
					</div>
					
					<div id="review"><%-- 리뷰 출력되는 곳(ajax) --%></div>
					
					<c:choose>
						<c:when test="${empty LOGIN_USER }">
						</c:when>
						<c:otherwise>
						<form name="reviewform" class="border rounded p-4 mb-4" enctype="multipart/form-data">
						<div class="row">
							<div class="col-auto mt-2">
								<h5>
									<strong>후기 작성</strong>
								</h5>
							</div>
							<div class="col-auto star-rating">
								  <input type="radio" id="5-stars" name="star" value="5" />
								  <label for="5-stars" class="star">&#9733;</label>
								  <input type="radio" id="4-stars" name="star" value="4" />
								  <label for="4-stars" class="star">&#9733;</label>
								  <input type="radio" id="3-stars" name="star" value="3" />
								  <label for="3-stars" class="star">&#9733;</label>
								  <input type="radio" id="2-stars" name="star" value="2" />
								  <label for="2-stars" class="star">&#9733;</label>
								  <input type="radio" id="1-star" name="star" value="1" />
								  <label for="1-star" class="star">&#9733;</label>
							</div>
						</div>
						<div class="row">
							<div class="col-10 form-floating">
							  <textarea class="form-control" id="textarea" name="content"
							  			style="height: 200px;resize: none;" maxlength="500"></textarea>
							  <label for="floatingTextarea2">500자까지 작성 가능합니다.</label>
							</div>
							<div class="col-2 d-flex align-items-end flex-column bd-highlight register">
								<label class="btn btn-outline-danger mt-auto mb-2" for="rphoto"
										style="padding-top:12px;height:50px;width:50px">
									<i class="bi bi-camera"></i>
								</label>
								<input type="file" name="photo" id="rphoto"
										style="display:none;" accept="image/*" multiple/>
								<button type="button" class="btn btn-outline-primary" style="height:50px;width:50px">
									<i class="bi bi-pencil-square"></i>
								</button>
							  <input type="hidden" name="attNo" value=${param.no }>
							  <input type="hidden" name="id" value=${LOGIN_USER.no }>
							</div>
						</div>
						<div class="mt-4" id="thumb"></div>
						</form>
						</c:otherwise>
					</c:choose>

				<div class="row mt-5 mb-3">
					<h3>
						<strong>${detail.place }의 다른 즐길거리</strong>
					</h3>
				</div>
				<div class="row">
	            <c:forEach var="rd" items="${random }">
				  <div class="col">
				    <div class="card h-100 shadow" onclick="location.href='detail.nadri?no=${rd.no}&page=1';">
				      <img src="../resources/images/att/${rd.thumbnail }" class="card-img-top" style="height:200px;">
				      <div class="card-body">
				      	<p class="card-text">${rd.place } / ${rd.category }</p>
				        <h5 class="card-title"><strong>${rd.name }</strong></h5>
				        <p class="card-text">${rd.content }</p>
				        <p class="card-text">★★★☆ ${rd.star } / 5.0　후기 ${rd.count }개</p>
				        <c:choose>
				        	<c:when test="${rd.price==0 }">
				        		<p class="text-end"><strong>옵션 별 상이</strong></p>
				        	</c:when>
				        	<c:when test="${rd.discountPrice==0 }">
				        		<p class="card-text text-end"><strong>
				        			<fmt:formatNumber value="${rd.price }" pattern="###,###" />원
				        		</strong></p>
				        	</c:when>
				        	<c:otherwise>
				        		<div class="card-text text-end">
				        			<span class="text-decoration-line-through">
				        				<fmt:formatNumber value="${rd.price }" pattern="0,000" />원
				        			</span>
				        			<span style="color:red"><strong>&nbsp;
				        				<fmt:formatNumber value="${rd.discountPrice }" pattern="0,000" />원
				        			</strong></span>
				        		</div>
				        	</c:otherwise>
				        </c:choose>
				      </div>
				    </div>
				  </div>
				</c:forEach>
				</div>
			
			<a style="display:scroll;position:fixed;bottom:2%;right:100px; text-decoration-line : none; color:black;"
				href="javascript:window.scrollTo(0,0);"><i class="bi bi-arrow-up-square">
				</i><strong>위로</strong>
			</a>

			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">

/*
// 썸네일
function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("#thumb").appendChild(img);
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }
*/
// 로딩 완료시점에 자동실행
$(function() {
	/**
	 * 첨부파일로직
	 */
	 $("#rphoto").on("change", fileCheck);
	// 파일 현재 필드 숫자 totalCount랑 비교값
	var fileCount = 0;
	// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	var totalCount = 3;
	// 파일 고유넘버
	var fileNum = 0;
	// 첨부파일 배열
	var content_files = new Array();
	function fileCheck(e) {
	    var files = event.target.files;
	    
	    // 파일 배열 담기
	    var filesArr = Array.prototype.slice.call(files);
	    
	    // 파일 개수 확인 및 제한
	    if (fileCount + filesArr.length > totalCount) {
	      alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
	      return;
	    } else {
	    	 fileCount = fileCount + filesArr.length;
	    }
	    
	    // 각각의 파일 배열담기 및 기타
	    filesArr.forEach(function (f) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        content_files.push(f);
	        $('#thumb').append(
	       		'<div id="file' + fileNum + '">'
	       		+ '<font style="font-size:12px">' + f.name + '</font>'  
	       		+ '&nbsp;<img src=\"https://cdn-icons-png.flaticon.com/512/75/75519.png" style="width:10px; height:10px; cursor: pointer;" onclick="fileDelete(\'file' + fileNum + '\')"/>' 
	       		+ '<div/>'
			);
	        fileNum ++;
	      };
	      reader.readAsDataURL(f);
	    });
	    console.log(content_files);
	    //초기화
	    $("#rphoto").val("");
	  }

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
	    var no = fileNum.replace(/[^0-9]/g, "");
	    content_files[no].is_delete = true;
		$('#' + fileNum).remove();
		fileCount --;
	    console.log(content_files);
	}
	
	/* 후기등록 */
	$(".register .btn-outline-primary").click(function(){
		var textarea = document.getElementById("textarea");
		var form = document.reviewform;

		// 별점 여부 확인
		var star = document.getElementsByName("star");
		var starvalue = null;
		for(var i=0;i<star.length;i++){
			if(star[i].checked == true){ 
				starvalue = star[i].value;
			}
		}
		if(starvalue == null){
            alert("별점을 선택하세요"); 
			return false;
		}
		
		// 내용 유무 확인
		if(textarea.value.trim()==""){
			alert("내용을 입력해주세요");
			return false;
		}
		
		var doubleCheck = confirm("등록하시겠습니까?")		
		if(doubleCheck){
			form.action="home.nadri";
			form.method="get";
			form.submit();
		} else{}	
	})
	
	/* 달력 설정 */
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 	
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("startdate").setAttribute("min", today);
	
	/* 리뷰 */
	var currentPage = '${param.page}'
	var no = '${param.no}'
	getReviewList();
 	
	function getReviewList(){
		$.ajax({
			type:'POST',
			url: '/attr/review',
			data: {"no":no, "page":currentPage},
			success: function(result) {
				var list = result.reviewList;
               	var htmls = "";
				if(list.length == 0){
					htmls += '<div class="row p-4 mb-5 text-center">'
					htmls += '<br><strong>등록된 후기가 없습니다.</strong></br>'
				} else {
                    $(list).each(function(){	
						htmls += '<div class="row p-4 border-bottom">'
						switch(this.star){
						case 1: htmls += '<div><a style="color:gold;">★☆☆☆☆&nbsp;</a>'; break;
						case 2: htmls += '<div><a style="color:gold;">★★☆☆☆&nbsp;</a>'; break;
						case 3: htmls += '<div><a style="color:gold;">★★★☆☆&nbsp;</a>'; break;
						case 4: htmls += '<div><a style="color:gold;">★★★★☆&nbsp;</a>'; break;
						case 5: htmls += '<div><a style="color:gold;">★★★★★&nbsp;</a>'; break;
						}
						htmls += this.star+'　'+this.userId+'</div>'
						htmls += '<div>'+this.date+'</div>'
						htmls += '<div class="col-11 mt-2">'+this.content+'</div>'
						htmls += '<div class="col-1">'
						if(result.photo != null){
						htmls += '<img src="../../../resources/images/att/review'+this.photo+'" style="width:70px;height:70px;">'
						} else {
							htmls += '</div>'
							htmls += '</div>'
						}
                     
                	});	//each end
                	
    				var pagination = result.pagination;
    				if(pagination.totalRecords > 0){
    					htmls += '<div class="row mb-3 mt-4">'
    					htmls += '<div class="col">'
    					htmls += '<nav>'
						htmls += '<ul class="pagination justify-content-center">'
						htmls += '<li class="page-item '+(pagination.existPrev ? '' : 'disabled')+'">'
						htmls += '<a class="page-link" href="detail.nadri?no='+no+'&page='+pagination.prevPage+'" data-page="'+pagination.prevPage+'">이전</a>'
						htmls += '</li>'
					var currentPage = pagination.currentPage;
					var beginPage = pagination.beginPage;
					var endPage = pagination.endPage;
					for(var num=beginPage; num <= endPage; num++){
						htmls += '<li class="page-item '+ (pagination.currentPageNo == num ? 'active' : '' ) + '">'
						htmls += '<a class="page-link" href="detail.nadri?no='+no+'&page='+num+'" data-page="'+num+'">'+num+'</a>'
						htmls += '</li>'	
					}   			

					htmls += '<li class="page-item '+(pagination.existNext ? '' : 'disabled')+'">'
					htmls += '<a class="page-link" href="detail.nadri?no='+no+'&page='+pagination.nextPage+'" data-page="'+pagination.nextPage+'">다음</a>'
					htmls += '</li>'
					htmls += '</ul>'
					htmls += '</nav>'
					htmls += '</div>'
					htmls += '</div>'
					
    				}		
                	
				}
				$("#review").html(htmls);
			}	   // Ajax success end
		});	// Ajax end
	}
	
	/* 페이지 변경 */
	 $("#review").on('click', '.page-link', function(event){
		 event.preventDefault();
		 currentPage = $(this).attr("data-page")
	  	 getReviewList();
	 });
	
});
</script>

</body>
</html>