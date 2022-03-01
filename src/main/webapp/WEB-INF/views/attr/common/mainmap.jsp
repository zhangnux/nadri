<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>			
<div class="mt-5 mb-3 text-center"><h1><strong>내 주변 액티비티</strong></h1></div>
<div class="row mt-5 mb-5 d-flex justify-content-center text-center">
	<div class="col-5">
	<!-- forEach -->
		<div class="row border rounded p-3">
			<div class="col-6">
				<img src="1234.jpg">
			</div>
			<div class="col-6">
				<div><h4><strong>48시간 프리패스</strong></h4></div>
				<div>제주도/입장권</div>
				<div class="mt-4">여행계획부터 준비까지ㅁㄴㅇㄹㄴㄹㄴㅇㄹㄴㅇㄹㅇㄴㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ</div>
				<div class="mt-3">★ 4.0/5.0</div>
			</div>
		</div>
	<!--  -->	
	</div>
	
	<div class="col-6">
		<div id="map" style="width:750px;height:350px;"></div>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c86a6bad7327a2b75d4058fd4d98faa"></script>
		<script>		
		$(function(){	
			// 지도
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.5759040910202, 126.976842133821), // 지도의 중심좌표
		        level: 6 // 지도의 확대 레벨 
		    }; 
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        map.setCenter(new kakao.maps.LatLng(lat,lon));

				}); 

			}
			
			$.ajax({
				url:"maplist",
				type:"get",
				success:function(result){
					selectedMarker = null
					for(var i=0;i<result.length;i++){
						var lat = result[i].lat;
						var lng = result[i].lng;
						
					    var marker = new kakao.maps.Marker({
					        map: map,
					        position: new kakao.maps.LatLng(lat,lng)
					    });
					    
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					    kakao.maps.event.addListener(marker, 'click', makeLinkListener(attrNo));
					    		
					    var attrNo = result[i].no;
					    
					    var infowindow = new kakao.maps.InfoWindow({
					        content: result[i].name
					    });	
					    
					    
						function makeOverListener(map, marker, infowindow) {
						    return function() {
						        infowindow.open(map, marker);
						    };
						}
	
						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
						    return function() {
						        infowindow.close();
						    };
						}
					    
					    function makeLinkListener(attrNo) {
					    	return function(){
					        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
					        // 마커의 이미지를 클릭 이미지로 변경합니다
					        if (!selectedMarker || selectedMarker !== marker) {
					        	window.location = 'http://localhost/attr/detail.nadri?no='+attrNo
					        }
					        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
					        selectedMarker = marker;
					    	}
					    };
					}// for문 끝
				}
			}); // ajax 끝

		}); // function끝
		</script>
	</div>
</div>