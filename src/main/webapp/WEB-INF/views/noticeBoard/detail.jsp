<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
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
			<h1></h1>
		</div>
	</div>
	<div class="row mb-3 ps-3 pe-3">
		<div>
			<table class="table" style="border: 1px solid">
				<tbody>
					<tr>
						<td colspan="3">공지</td>
					</tr>
					<tr>
						<td colspan="3"><strong>${noticeBoard.title }</strong></td>
					</tr>
					<tr>
						<td style="text-align: left; width: 8%;">관리자</td>
						<td style="text-align: left; width: 10%;"><fmt:formatDate value="${noticeBoard.createdDate }" pattern="yyyy-MM-dd" /></td>
						<td style="text-align: left; width: 82%;">조회수: ${noticeBoard.viewCount }</td>
					</tr>
					<tr>
						<td colspan="3" style="height: 200px; text-align: left;">${noticeBoard.content }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end ms-3 me-3">
			<a href="list.nadri" class="btn btn-secondary">목록</a>
			<a href="delete.nadri?no=${noticeBaord.no }" class="btn btn-danger">삭제</a>
			<a href="#" class="btn btn-primary">수정</a>
	</div>

</div>
</body>
</html>