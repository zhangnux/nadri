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
<c:set var="menu" value="notice"/>
<%-- <%@ include file="../manager/common/navbar.jsp" %> --%>
<div class="container">
	<div class="row mb-3 p-3">
		<div class="col">
			<h1>공지사항</h1>
		</div>
	</div>
	<div class="row mb-3 p-3">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty noticeBoards }">
						<tr>
							<td class="text-center" colspan="6">등록된 공지가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>                            
						<c:forEach var="noticeBoard" items="${noticeBoards }" varStatus="loop">
							<tr>
								<td>${loop.count }</td>
								<td><a href="detail.nadri?no=${noticeBoard.no }">${noticeBoard.title }</a></td>
								<td><fmt:formatDate value="${noticeBoard.createdDate }" pattern="yyyy-MM-dd" /></td>
								<td>${noticeBoard.viewCount }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3 p-3">
		<div class="col d-flex justify-content-end">
			<a href="insert.nadri" class="btn btn-primary">공지 등록</a>
		</div>
	</div>
	<div class="row mb-3 p-3">
		<div class="col d-flex justify-content-center">
			<form action="list.nadri" class="row row-cols-lg-auto g-3 align-items-center" method="get">
				<input type="hidden" name="page" value="1" />
				<div class="col-12">
					<select class="form-select" name="opt">
						<option value="제목" ${'제목' eq param.opt ? 'selected' : ''}>제목</option>
						<option value="내용" ${'내용' eq param.opt ? 'selected' : ''}>내용</option>
						<option value="제목+내용" ${'제목+내용' eq param.opt ? 'selected' : ''}>제목+내용</option>
					</select>
				</div>
				<div class="col-12">
					<input type="text" class="form-control" name="value" value="${param.value }">
				</div>
				<div class="col-12">
					<button type="submit" class="btn btn-outline-primary btn-sm" id="btn-search-notice">검색</button>
				</div>
			</form>
		</div>
	</div>
	
		<c:if test="${pagination.totalRecords gt 0 }">
		<!-- 페이지 내비게이션 표시 -->
		<div class="row mb-3">
			<div class="col">
				<nav>
		  			<ul class="pagination justify-content-center">
		    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		      				<a class="page-link" href="list.nadri?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    			</li>
	
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="list.nadri?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
	
		    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="list.nadri?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
		    			</li>
		  			</ul>
				</nav>
			</div>
		</div>
	</c:if>
</div>
</body>
</html>