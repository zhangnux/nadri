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
<c:set var="menu" value="qna"/>
<%-- <%@ include file="../manager/common/navbar.jsp" %> --%>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="#">환불이 안 돼요</a></td>
						<td>홍길동</td>
						<td>2022/01/28</td>
						<td>4</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</div>
</body>
</html>