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
	<div class="mb-3 p-3">
	<ul class="nav justify-content-center">
		<li class="nav-item">
			<a class="nav-link active" aria-current="page" href="userlist.nadri">전체</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="list.nadri?csType=사이트이용">사이트이용</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="list.nadri?csType=프로모션">프로모션</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="list.nadri?csType=예약/취소/환불">예약/취소/환불</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="list.nadri?csType=쿠폰/포인트">쿠폰/포인트</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="list.nadri?csType=기타">기타</a>
		</li>
	</ul>
	
	</div>
	
	<div class="row mb-3">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th style="width: 6%;">번호</th>
						<th style="width: 10%;">유형</th>
						<th style="width: 64%;">제목</th>
						<th style="width: 10%;">작성자</th>
						<th style="width: 10%;">날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty csBoards }">
						<div class="text-center" colspan="5"><h1>문의 사항이 없습니다.</h1></div>
					</c:when>
					<c:otherwise>
						<c:forEach var="csBoard" items="${csBoards }" varStatus="loop">
								<tr>
									<td>${loop.count }</td>
									<td>${csBoard.csType }</td>
									<td><a href="#">${csBoard.title }</a> ${csBoard.replyCheck }</td>
									<td>${csBoard.userName }</td>
									<td><fmt:formatDate value="${csBoard.createdDate }" pattern="yyyy-MM-dd"/></td>
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
			<a href="insert.nadri" class="btn btn-primary">문의사항 등록</a>
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