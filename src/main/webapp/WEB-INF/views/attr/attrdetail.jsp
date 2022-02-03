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
						<strong>후기 ${count }</strong>
					</h5>
					<div class="row p-4">
						<div class="col-4 text-center" style="background-color:#f8f9fa;">
							<div class="mt-4">					
								<c:choose>
									<c:when test="${empty star }">
										<h2><strong>0.0</strong></h2>
									</c:when>
									<c:otherwise>
										<h2><strong>${star }</strong></h2>
									</c:otherwise>
								</c:choose>
							</div>
							<div><h2>★★★☆☆</h2></div>
						</div>
						<div class="col-6 ms-3 p-2" style="background-color:#f8f9fa; color:gold;">
							<div>★★★★★</div>
							<div>★★★★☆</div>
							<div>★★★☆☆</div>
							<div>★★☆☆☆</div>
							<div>★☆☆☆☆</div>
						</div>
					</div>
					
					<div id="review"></div>
					
					<div class="row border rounded mb-5 p-3">
						<h5>
							<strong>후기 작성</strong>
						</h5>
						<div class="col-10 form-floating">
						  <textarea class="form-control" id="floatingTextarea2" 
						  			style="height: 200px;resize: none;" maxlength="500"></textarea>
						  <label for="floatingTextarea2">500자까지 작성 가능합니다.</label>
						</div>
						<div class="col-2 d-flex align-items-end flex-column bd-highlight">
							  <button type="button" class="btn btn-outline-danger mt-auto mb-2" style="height:50px;width:50px">
							  	<i class="bi bi-camera"></i>
							  </button>
							  <button type="button" class="btn btn-outline-primary" style="height:50px;width:50px">
							  	<i class="bi bi-pencil-square"></i>
							  </button>
						</div>
					</div>
					
					<%-- 
<c:if test="${pagination.totalRecords gt 0 }">
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
				--%>

				<div class="row">
					<h3>
						<strong>${detail.place }의 다른 즐길거리</strong>
					</h3>
				</div>
			<a style="display:scroll;position:fixed;bottom:100px;right:100px; text-decoration-line : none; color:black;"
				href="javascript:window.scrollTo(0,0);"><i class="bi bi-arrow-up-square">
				</i><strong>위로</strong>
			</a>

			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
	// 로딩시점에 자동실행
$(function() {
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
					htmls += '<br>등록된 후기가 없습니다.</br>'
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
						htmls += this.star+'　'+this.userNo+'</div>'
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