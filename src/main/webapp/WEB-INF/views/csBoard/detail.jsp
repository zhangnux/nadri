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
	<div class="row mb-3 p-3">
		<div class="col">
			<h1>Q&A</h1>
		</div>
	</div>
	<div class="row mb-3 ps-3 pe-3">
		<div>
			<table class="table" style="border: 1px solid">
				<tbody>
					<tr>
						<td colspan="2">Q&A</td>
					</tr>
					<tr>
						<td colspan="2">[${csBoard.csType }]  <strong> ${csBoard.title } </strong> ${csBoard.replyCheck }</td>
					</tr>
					<tr>
						<td style="text-align: left; width: 8%;">${csBoard.userName }</td>
						<td style="text-align: left; width: 92%;"><fmt:formatDate value="${csBoard.createdDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<td colspan="2" style="height: 200px; text-align: left;">${csBoard.content }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end ms-3 me-3">
		<c:choose>
			<c:when test="${!empty LOGIN_MANAGER }">
				<a href="list.nadri" class="btn btn-secondary">목록</a>
			</c:when>
			<c:when test="${!empty LOGIN_USER }">
				<a href="userlist.nadri" class="btn btn-secondary">목록</a>
			</c:when>			
		</c:choose>
			<a href="delete.nadri?no=${csBoard.no }" class="btn btn-danger">삭제</a>
			<a href="modify.nadri?no=${csBoard.no }" class="btn btn-primary">수정</a>
	</div>
	<div class="row mb-3 ms-2 me-2" style="border-bottom: 1px solid;">
		<div class="col">
			<h2>답변</h2>
		</div>
	</div>
	<!-- 댓글입력은 매니저만 보이게 restcontroller-->
	<c:if test="${!empty LOGIN_MANAGER }">
		<div class="row mb-3 p-3">
			<div class="col">
				<form action="" class="border bg-light p-3">
					<div class="mb-3">
	 					<textarea class="form-control" rows="5" name="content"></textarea>
					</div>
					<div class="d-flex justify-content-end">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<!-- c:if로 -->
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<tr>
					<td rowspan="2">
						<p>관리자</p>
						<p></p>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>
	</div>


</div>
<script type="text/javascript">


</script>
</body>
</html>