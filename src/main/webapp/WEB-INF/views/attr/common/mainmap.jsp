<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>			
<div class="mt-5 mb-2 text-center"><h1><strong>내 주변 액티비티</strong></h1></div>
<div class="row mb-5 text-center">
	<div id="map" style="width:400px;height:400px;" class="col-auto mt-3"></div>
<div class="col-8"><div class="row" id="lists"><%-- list 들어가는 곳 --%></div></div>
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
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		$.ajax({
			url:"attlist",
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
				    
				    var attrNo = result[i].no;
				    
				    var infowindow = new kakao.maps.InfoWindow({
				        content: result[i].name
				    });	
				    
				    
					function makeOverListener(map, marker, infowindow) {
					    return function() {
					        infowindow.open(map, marker);
					    };
					}
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				    kakao.maps.event.addListener(marker, 'click', makeLinkListener(attrNo));
				    		
				    

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

		kakao.maps.event.addListener(map, 'bounds_changed', function() {             			    
		    // 지도 영역정보를 얻어옵니다 
		    var bounds = map.getBounds();			    
		    // 영역정보의 남서쪽 정보를 얻어옵니다 
		    var swLatlng = bounds.getSouthWest();			    
		    // 영역정보의 북동쪽 정보를 얻어옵니다 
		    var neLatlng = bounds.getNorthEast();
		    
		    var swlat = swLatlng.getLat();
		    var swlng = swLatlng.getLng();
		    var nelat = neLatlng.getLat();
		    var nelng = neLatlng.getLng();
		    
		    var datas = {swlat:swlat, swlng:swlng, nelat:nelat, nelng:nelng}
		    ListInMap(datas);
		});
		
		function ListInMap(datas){
			$.ajax({
				type:"get",
				url:"maplist",
				data:datas,
				success:function(result){
					var htmls = '';
					if(result.length==0){
						htmls += '<div class="col mt-4">';
						htmls += '<h4><strong>일치하는 결과가 없습니다.</strong></h4>';
						htmls += '</div>';
					}else{
						$(result).each(function(){
							htmls += '<div class="col-3 mt-3">';	
							htmls += '<div class="card h-100 shadow" onclick="location.href=\'detail.nadri?no='+this.no+'\';">';
							htmls += '<img src="../resources/images/att/'+this.thumbnail+'" class="card-img-top" style="height:200px;">';
							htmls += '<div class="card-body">';
							htmls += '	<p class="card-text">'+this.place+' / '+this.category+'</p>';								
							htmls += '	<h5 class="card-title"><strong>'+this.name+'</strong></h5>';								
							htmls += '	<p class="card-text">'+this.content+'</p>';															
							htmls += '<p class="card-text"><span style="color:gold;">★</span>'+this.star+' / 5.0</p>';																					
							htmls += '</div>';															
							htmls += '</div>';															
							htmls += '</div>';															
						}) // each끝
					} // if 끝
					$("#lists").html(htmls);
				}
			}) // ajax 끝
		}
		
	}); // function끝
	</script>
	</div>
</div>