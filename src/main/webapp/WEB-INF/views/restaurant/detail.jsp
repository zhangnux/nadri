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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	
	#rt-img{
		height: 500px;
		width: 800px;
	}
	
	#restaurant-detail{
		border-top: 1px solid;
	}
	
	#review{
		border-top: 1px solid;
		
	}
	
	#review-insertform{
		border: 1px solid;
	}
	
</style>
<body>
<%@ include file="../common/navbar.jsp" %>

<!-- ★ -->
<div class="container">
	
	<div class="row mb-3 p-3">
		<div class="col">
			<h2>예약</h2>
		</div>
	</div>
	

	<div id="restaurant-detail" class="row mb-3">
		<div class="col-9 p-1">
			<img id="rt-img" alt="picture" src="../../resources/images/restaurants/${restaurant.picture }">
			<h1 class="p-3"><strong>${restaurant.name }</strong></h1>
			<p>서울 청담에 위치한 분위기 좋은 레스토랑</p>
		</div>
		<div class="col-3 border p-1">
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
					<a href="checkout.nadri?no=122" class="btn btn-primary">book now</a>
				</div>
			</form>
		</div>
	</div>
	


</div>

<div class="container" id="review">
		<!--
		리뷰 
		수정 삭제는 로그인된 유저 정보 받아와서 일치하면 보이게
	-->
	
	<div class="row mb-3">
		<div class="col p-3">
			<h3>리뷰(0개)</h3>
		</div>
	</div>
	<div class="row mb-3" id="review-insertform">
		<div class="col">
			<form id="review-insert" action="" method="get">
				<div class="mb-3">
					<label class="form-label">별점</label>
					<select class="form-select">
						<option value="5">5점</option>
						<option value="4.5">4.5점</option>
						<option value="4">4점</option>
						<option value="3.5">3.5점</option>
						<option value="3">3점</option>
						<option value="2.5">2.5점</option>
						<option value="2">2점</option>
						<option value="1.5">1.5점</option>
						<option value="1">1점</option>
					</select>
				</div>
				<div class="mb-3">
  					<label for="exampleFormControlTextarea1" class="form-label">댓글 내용</label>
 					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>
				<div class="mb-3">
					<button class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<tbody>
					<tr>
						<td>별점</td>
						<td>리뷰내용</td>
						<td>작성 날짜</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</div>
<!--  -->

<%@ include file="../common/footer.jsp" %>
</body>
</html>