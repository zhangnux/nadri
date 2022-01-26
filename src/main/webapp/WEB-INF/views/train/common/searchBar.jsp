<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/tags.jsp" %>
<style>
	#search:hover {
		background-color: #A48284;
	}

	input:focus {
		outline: none;
	}
	div.div-show-station {
		position: relative;
	}
	.fa-train {
		position: absolute;
		top: 33%;
		right: 32%;
		color: #7E5C5E;
	}
	.bi-arrow-repeat {
		opacity: 0.3;
		font-size: 40px;
		color: #7E5C5E;
	}
	div.div-show-station input, div.passenger input {
		height: 40px;
		width: 100px;
		font-size: 18px;
	}
	div.time input, select {
		border-radius: 0;
		border: 1px solid #949494;
		height: 36px;
	}
	
	#modal-station li {
		text-decoration: none;
		display: inline-block;
		padding: 4px 14px;
	}
	.station-table span {
		width: 100px;
		display: inline-block;
		text-align: center;
		height: 30px;
		background-color: #A0A0A0;
		border: 1px solid #808080;
		color: white;
	}
	span[data-station-id] {
		background-color: #B7D5FC;
		border: 1px solid #A6CAF9;
		color: black;
	}
	.station-table td {
		float: left;
	}
	
	#trainBooking .dropdown-menu li {
		display: flex; 
		justify-content: space-between; 
		margin: 8px;
	}
	
	#trainBooking .dropdown-menu span, span[data-station-id], #word-Menu span, .div-show-station span{
		cursor: pointer;
	}
	.bi-plus-circle, .bi-dash-circle {
		color: #644043; 
		font-size: 18px;
	}
</style>
<div class="row">
	<div class="col">
		<form action="train/list.nadri" method="post" id="trainSearch" style="border: 2px solid #7E5C5E;">
			<!-- 경로 선택 -->
			<div class="row">
				<div class="my-3 ms-4 col-md-2 div-show-station" id="departure" style="cursor: pointer;">
					<label style="display: block; font-size: 14px; cursor: pointer;">출발지</label>
					<input class="not" type="text" style="border: none;" name="departureStation" data-station-id="" placeholder="출발역">
				</div>
				<div class="m-3 col-md-1 div-show-station" style="width: 40px; padding: 0;">
					<span id="recycle">
						<i class="bi bi-arrow-repeat"></i>
						<i class="fa fa-train" aria-hidden="true"></i>
					</span>
				</div>
				<div class="m-3 col-md-2 div-show-station" id="arrival" style="cursor: pointer;">
					<label style="display: block; font-size: 14px; cursor: pointer;">도착지</label>
					<input class="not" type="text" style="border: none;" name="arrivalStation" data-station-id="" placeholder="도착역">
				</div>
				<div class="col-md-6 text-end" style="margin: auto; font-size: 18px;">
					<input type="radio" value="편도" name="way" checked="checked"> 편도
					<input class="ms-3" type="radio" value="왕복" name="way"> 왕복
				</div>
			</div>
			<hr class="ms-3 my-0">
			<!-- 가는 열차  -->
			<div class="row" id="go">
				<div class="col-md-1" style="display: flex; align-items: center; justify-content: center; width: 140px;">
					<span id="one"><i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i>출발일</span>
					<span style="display: none"><i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i>가는열차</span>
				</div>
				<div class="m-3 px-4 col-md-3" style="border-left: 1px solid; border-left-color: #ced4da;
					border-right: 1px solid; border-right-color: #ced4da; ">
					<label style="display: block; font-size: 16px; color: gray;">출발시간</label>
					<div class="time">
						<input type="text" class="datepicker" readonly="readonly" name="dpDate1">
						<select name="dpTime1" style="width: 50px;">
							<c:forEach var="time" begin="0" end="23">
								<c:choose>
									<c:when test="${time lt 10}">
										<option value="${time }">0${time }</option>
									</c:when>
									<c:otherwise>
										<option value="${time }">${time }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<span>시</span>
					</div>
				</div>
				<!-- 승객 수 입력 -->
				<div class="col-md-6 passenger" id="dropdownMenuClickableInside" data-bs-toggle="dropdown" 
					  data-bs-auto-close="outside" aria-expanded="false">
					  <div class="m-3" style="display: inline-block;">
						<label style="display: block; font-size: 16px; color: gray;">승객</label>
						<input type="text" style="border: none;" name="count1" readonly="readonly" value="1">명
					  </div>
				</div>
			  	<ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableInside" style="width: 250px; border-top: 2px solid #7E5C5E; border-radius: 0;">
				    <li>
				    	<div>어른<p style="font-size: 14px; color: gray;">만 13세 이상</p></div>
					    <div class="adult">
					    	<span><i class="bi bi-dash-circle"></i></span>
					    	<input name="adNo1" value="1" style="width: 15px; border: none;">
					    	<span><i class="bi bi-plus-circle"></i></span>
					    </div>
			    	</li>
				    <li>
				    	<div>어린이</div>
					    <div class="childern">
					    	<span><i class="bi bi-dash-circle"></i></span>
					    	<input name="cdNo1" value="0" style="width: 15px; border: none;">
					    	<span><i class="bi bi-plus-circle"></i></span>
					    </div>
			    	</li>
				</ul>
				<div class="col-md-1 p-0 text-end" style="width: 146px;">
					<!-- 검색 버튼 -->
					<div id="search" class="h-100" style="text-align-last:center; display:inline-block; cursor:pointer;
						width: 90px; background-color: #7E5C5E;">
						<i class="bi bi-search" style="font-size: 30px; color: white; display:flex; padding: 30px;"></i>
					</div>
				</div>
			</div>
			<hr class="ms-3 my-0" style="display: none;">
			<!-- 오는 열차 -->
			<div class="row" style="display: none;" id="come">
				<div class="col-md-1" style="display: flex; align-items: center; justify-content: center; width: 140px;">
					<i class="bi bi-circle-fill mx-2" style="font-size: 5px; color: #4A4A4A;"></i><span>오는열차</span>
				</div>
				<div class="m-3 px-4 col-md-3" style="border-left: 1px solid; border-left-color: #ced4da; border-right: 1px solid; border-right-color: #ced4da;">
					<label style="display: block; font-size: 16px; color: gray;">출발시간</label>
					<div class="time">
						<input type="text" class="datepicker" disabled readonly="readonly" name="dpDate2">
						<select name="dpTime2" disabled style="width: 50px;">
							<c:forEach var="time" begin="0" end="23">
								<c:choose>
									<c:when test="${time lt 10}">
										<option value="${time }">0${time }</option>
									</c:when>
									<c:otherwise>
										<option value="${time }">${time }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<span>시</span>
					</div>
				</div>
				<div class="col-md-6 passenger" id="dropdownMenuClickableInside" data-bs-toggle="dropdown" 
					  data-bs-auto-close="outside" aria-expanded="false">
					  <div class="m-3"  style="display: inline-block;">
						<label style="display: block; font-size: 16px; color: gray;">승객</label>
						<input type="text" disabled style="border: none;" name="count2" readonly="readonly" value="1">명
					  </div>
				</div>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuClickableInside" style="width: 250px; border-top: 2px solid #7E5C5E; border-radius: 0;">
				  <li>
				  		<div>어른<p style="font-size: 14px; color: gray;">만 13세 이상</p></div>
				   		<div id="adult">
				   		<span><i class="bi bi-dash-circle"></i></span>
				   		<input name="adNo2" value="1" disabled style="width: 15px; border: none;">
				   		<span><i class="bi bi-plus-circle"></i></span>
				   		</div>
				 	</li>
					<li>
				  		<div>어린이</div>
				   		<div>
				   		<span><i class="bi bi-dash-circle"></i></span>
				   		<input name="cdNo2" value="0" disabled style="width: 15px; border: none;">
					    <span><i class="bi bi-plus-circle"></i></span>
						</div>
				   	</li>
				</ul>
			</div>
		</form>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-station">
 	<div class="modal-dialog modal-lg">
   		<div class="modal-content">
     		<div class="modal-header">
       			<h6 class="modal-title">역명 조회</h6>
       			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
     		</div>
    		<div class="modal-body">
    			<div>
    				<ul class="border" id="word-Menu">
   						<li><span id="45207">가</span></li>
   						<li><span id="45795">나</span></li>
   						<li><span id="46971">다</span></li>
   						<li><span id="47559">라</span></li>
   						<li><span id="48147">마</span></li>
   						<li><span id="49323">바</span></li>
   						<li><span id="50499">사</span></li>
   						<li><span id="51087">아</span></li>
   						<li><span id="52263">자</span></li>
   						<li><span id="52851">차</span></li>
   						<li><span id="53439">카</span></li>
   						<li><span id="54027">타</span></li>
   						<li><span id="54615">파</span></li>
   						<li><span id="55203">하</span></li>
    				</ul>
    			</div>
       			<div class="card" style="text-align: center">
       				<!-- <div class="card-header"><strong id="movie-title"></strong></div> -->
       				<table class="station-table" style="margin: 24px;">
       					<tbody style="display: table-row-group;">
       						<tr style="display: table-row;">
       							
       						</tr>
       					</tbody>
       				</table>
       			</div>
     		</div>
   		</div>
 	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("input[name=way]").change(function() {
			let check = $("#come input").prop('disabled')

			$("#come input").prop('disabled', !check)
			$("#come select").prop('disabled', !check)
		})
		
		
		// 누르면 왕복 검색창이 생김
		$("input[value=왕복]").click(function() {
			$("#go").nextAll().show()
			$("#one").hide().next().show()
		}) 
		
		// 왕복 검색창 없어짐
		$("input[value=편도]").click(function() {
			$("#go").nextAll().hide()
			$("#one").show().next().hide()
		})
		
		// modal에서 단어에 따른 기차역 리스트 출력
		$("#word-Menu span").click(function() {
			let no = $(this).attr('id')
			getStationMenu(no);
		})
		
		// 출발역과 도착역 값을 바꿔줌
		$("#recycle").click(function() {
			let $inputBox = $(this).parents('div')
			let arrival = $inputBox.find("input[name=arrivalStation]").val()
			let departure = $inputBox.find("input[name=departureStation]").val()
			$inputBox.find("input[name=departureStation]").val(arrival)
			$inputBox.find("input[name=arrivalStation]").val(departure)
		})
		
		var stationModal = new bootstrap.Modal(document.getElementById('modal-station'), {
			keyboard: false
		});
		
		// 입력한 단어에 따라 기차역 목록을 불러오는 함수
		function getStationMenu(no) {
			let $tr = $(".station-table tr").empty()
			
			$.getJSON("/api/train/station/"+ no, function(response) {
				if (response.status == 'OK') {
					if (response.items.length === 0) {
						let st = "<td style='text-align: center; float:none;'>등록된 기차역이 존재하지 않습니다.</td>"
						$tr.append(st)
					} else {
						$.each(response.items, function(index, station) {
							let st = "<td>"
							
							if (station.isUsed == 'N') {
								st += "<span>" + station.name + "</span>"
							} else (
								st += "<span data-station-id=" + station.id + ">" + station.name + "</span>"
							)
								st += "</td>"
							$tr.append(st)
						})
					}
					stationModal.show()
				}
			})
		}
		
		// 출발역 div에서 클릭했을 때
		$("div#departure").click(function (e) {
			if (!$(e.target).hasClass("not")) {
				$('.station-table').attr('id', 'departureStation')	
				getStationMenu(45207);
			}
		});

		// 도착역 div에서 클릭했을 때
		$("div#arrival").click(function (e) {
			if (!$(e.target).hasClass("not")) {
				$('.station-table').attr('id', 'arrivalStation')	
				getStationMenu(45207);
			}
		});
		
		// 기차역 클릭시 역 입력값에 값을 할당해준다.
		$(".station-table").on("click", "span[data-station-id]", function(event) {
			event.preventDefault();
			let target = $(this).closest('table').attr('id')
			stationModal.hide()
			$("input[name="+ target +"]").val($(this).text()).attr('data-station-id' ,$(this).attr('data-station-id'))
		})
		
		// 승객 인원 - 버튼
		$(".bi-dash-circle").parent().click(function() {
			let val1 = parseInt($(this).next().val())
			let val2 = parseInt($(this).closest('li').siblings().find('input').val())
			console.log(val1+val2)
			let target = $(this).closest('ul').prev().find('input')
			
			if (val1 != 0) {
				$(this).next().val(val1-1)
				target.val(val2+val1-1)
			}
		})
		
		// 승객 인원 + 버튼
		$(".bi-plus-circle").parent().click(function() {
			let val1 = parseInt($(this).prev().val())
			let val2 = parseInt($(this).closest('li').siblings().find('input').val())
			console.log(val1+val2)
			let target = $(this).closest('ul').prev().find('input')
			let val = target.val()
			if (val >= 9) {
				alert("10명 이상은 선택할 수 없습니다.")
				target.val(9)
			} else {
				$(this).prev().val(++val1)
				target.val(val1+val2)
			}
		})
		
		// 날짜 ui 설정
		$(function() {
		    $(".datepicker").datepicker({
		    	dateFormat: 'yy/mm/dd',
			    minDate: 'D',
		    });
		});	
	
	})
</script>