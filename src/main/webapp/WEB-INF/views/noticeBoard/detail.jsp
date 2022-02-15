<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="../common/head.jsp"%>
    <title>나드리::공지사항</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1></h1>
		</div>
	</div>
	<div class="row mb-3 ps-3 pe-3">
		<div class="row">
			<div class="col mb-4"><h1><Strong>공지사항</Strong></h1></div>
		</div>
		<div class="row">
			<div class="col mb-2">
				<a href="http://localhost/home.nadri" style="text-decoration: none; color: black;">홈 ></a> 공지사항
			</div>
		</div>
		<div class="row border rounded">
			<div class="row mt-4 mb-3">
				<div class="col" style="font-size:20px;"><Strong>${noticeBoard.title }</Strong></div>
				<div class="col-auto">${noticeBoard.no }</div>
			</div>
			<div class="row">
				<div class="col-auto">관리자</div>
				<div class="col-auto"><fmt:formatDate value="${noticeBoard.createdDate }" pattern="yyyy-MM-dd" /></div>
				<div class="col-4 mb-2">조회수 ${noticeBoard.viewCount }</div>
				<hr>
			</div>
			<div class="row mb-2 mt-3">
				<div class="col ps-3 mb-4">${noticeBoard.content }</div>
			</div>
		</div>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end ms-3 me-3">
			<c:choose>
				<c:when test="${!empty LOGIN_MANAGER }">
					<a href="list.nadri" class="btn btn-secondary">목록</a>
					<a href="delete.nadri?no=${noticeBoard.no }" class="btn btn-danger">삭제</a>
					<a href="modify.nadri?no=${noticeBoard.no }" class="btn btn-primary">수정</a>
				</c:when>
				<c:when test="${!empty LOGIN_USER }">
					<a href="userlist.nadri" class="btn btn-secondary">목록</a>
				</c:when>			
			</c:choose>
	</div>

</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>