<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
<style>
.detail{
	position:fixed;.
	top:0; 
	right:6%; 
	bottom:40%; 
	padding:0;
}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-8 mt-3 mb-5">
			<div class="mb-3">
				<h5><i class="bi bi-pin-map"></i>
				<a href="list.nadri?place=${detail.place }" style="text-decoration:none; color:black;">
				&nbsp;${detail.place }</a></h5>
			</div>
			<div>
				<h2 class="text-center"><strong>${detail.name }</strong></h2>
			</div>
			<div class="border-bottom mb-4 mt-4 pb-4 text-center">
				★★★★★ 5.0/5.0 (0)
			</div>
			
			<!-- forEach -->
			<c:choose>
				<c:when test="${empty detail.detail }">
					<div class="mt-5">　</div>
				</c:when>
				<c:otherwise>
				
				<div class="border rounded mb-3 p-4">
					<h5><strong>${detail.category } 안내</strong></h5>
					${detail.detail }
				</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${empty detail.photo }">
				</c:when>
				<c:otherwise>
					<div>
						<img src="../../../resources/images/att/${detail.photo }" style="width:850px;">
					</div>
				</c:otherwise>
			</c:choose>
			<div class="border-top mt-5 pt-4">
				<h5 class="mb-3"><strong>위치 안내</strong></h5>
				<div id="map" style="width:500px;height:400px;">
				
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
				<h5><strong>후기 사진</strong></h5>
			</div>
			<div class="border-top mt-5 mb-5 pt-4">
				<h5><strong>후기</strong></h5>
			</div>
			<!--  -->
			
			<div class="border-top mt-5 pt-5">
				<h3><strong>${detail.place }의 다른 즐길거리</strong></h3>
			</div>
			
		</div>
	<%@ include file="common/detailside.jsp" %>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
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
</script>
</body>
</html>