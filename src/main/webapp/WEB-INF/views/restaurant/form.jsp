<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>레스토랑 등록 폼</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<!-- 
				폼 입력요소에 <input type="file" />인 입력요소(첨부파일 업로드)가 있을 경우
				method는 반드시 post로 설정한다.
				enctype는 반드시 multipart/form-data로 설정한다.
			 -->
			<form class="border bg-light p-3" method="post" action="insert.nadri" enctype="multipart/form-data">
				<div class="mb-3">
					<label class="form-label">상호</label>
					<input type="text" class="form-control" name="name" />
				</div>
				<div class="mb-3">
					<label class="form-label">설명</label>
					<input type="text" class="form-control" name="content" />
				</div>
				<div class="mb-3">
					<label class="form-label">카테고리</label>
					<input type="text" class="form-control" name="category" />
				</div>
				<div class="mb-3">
					<label class="form-label">주소</label>
					<input type="text" class="form-control" name="address" />
				</div>
				<div class="mb-3">
					<label class="form-label">도시</label>
					<input type="text" class="form-control" name="city" />
				</div>
				<div class="mb-3">
					<label class="form-label">주차장</label>
					<input type="text" class="form-control" name="parking" />
				</div>
				<div class="mb-3">
					<label class="form-label">휴일</label>
					<input type="text" class="form-control" name="restDate" />
				</div>
				<div class="mb-3">
					<label class="form-label">전화번호</label>
					<input type="text" class="form-control" name="tel" />
				</div>
				<div class="mb-3">
					<label class="form-label">영업시간</label>
					<input type="text" class="form-control" name="openTime" />
				</div>
				<div class="mb-3">
					<label class="form-label">음식 사진</label>
					<input type="file" class="form-control" name="upfiles"/>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>

</div>
</body>
</html>