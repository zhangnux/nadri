<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../../common/tags.jsp" %>
<div class="row mb-3 border">
	<div class="col">
		<form action="" method="post" >
			<div class="row ">
				<div class="col-3">
				<!-- 지역 -->
					<select class="form-select" aria-label="Default select example">
					  	<option selected>어디로 떠나세요?</option>
					  	<option value="1">서울</option>
					  	<option value="2">제주</option>
					  	<option value="3">부산</option>
					  	<option value="4">인천</option>
					  	<option value="5">강원도</option>
					  	<option value="6">충청도</option>
					  	<option value="7">경상도</option>
					  	<option value="8">전라도</option>
					</select>
				</div>
				<div class="col ">
					<!--당일 날짜 -->	
					<input type="Date" name="" id="">
				</div>
				<div class="col ">
					<!-- 날짜 -->	
					<input type="Date" name="" id="">
				</div>
				<div class="col">
					<!-- 인원 -->
					<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					  인원
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					    <li><a class="dropdown-item" href="#">Action</a></li>
					    <li><a class="dropdown-item" href="#">Another action</a></li>
					    <li><a class="dropdown-item" href="#">Something else here</a></li>
					  </ul>
					</div>
				</div>
				<div class="col">
					<!-- 검색 -->
					<button class="btn btn-primary" type="submit">검색</button>
				</div>
			</div>
		</form>
	</div>
</div>