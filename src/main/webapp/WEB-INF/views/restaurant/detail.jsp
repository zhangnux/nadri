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
<body>
<%@ include file="../common/navbar.jsp" %>

<!-- ★ -->
<div class="container">
	
	<div class="row mb-3">
		<div class="col">
			<h2>예약</h2>
		</div>
	</div>
	

	<div class="row mb-3">
		<div class="col">
			<img alt="picture" src="${restaurant.picture}">
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<h3>${restaurant.name }</h3>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<p>${restaurant.content }</p>
		</div>
	</div>
	


</div>
<div class="container border">
		<!--
		리뷰 
		수정 삭제는 로그인된 유저 정보 받아와서 일치하면 보이게
	-->
	
	<div class="row mb-3">
		<div class="col">
			<h3>리뷰(0개)</h3>
			<a href="">리뷰쓰기</a>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<form id="review-insert" action="" method="get">
				<div class="mb-3">
  					<label for="exampleFormControlTextarea1" class="form-label">댓글 내용</label>
 					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>
				<div class="mb-3">
					<button class="btn-primary">등록</button>
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