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
<style>
	html, body {
		width: 100%;
		height: 100%;
	}

	.container-fluid {
	    position:fixed;
	    padding:0;
	    margin:0;
	
	    top:0;
	    left:0;
	
	    width: 100%;
	    height: 100%;
	}

</style>
<body>
<c:set var="menu" value="notice"/>
<div class="container-fluid bg-light">
	<div class="row">
		<div class="col-2" style="position: fixed; height: 100%; min-width: 280px;">
			<%@ include file="../manager/common/navbar.jsp" %>
		</div>
		<div class="col-10" style="margin-left: 310px;">
			<div class="row">
				<div class="col-auto pt-5 fw-bold">
					<h1><Strong>공지사항</Strong></h1>
				</div>
			</div>
			<div class="row">
				<div class="col m-4">
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
									<td class="text-center" colspan="4">등록된 공지가 없습니다.</td>
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
			<div class="row m-3">
				<div class="col d-flex justify-content-end">
					<a href="insert.nadri" class="btn btn-primary">공지 등록</a>
				</div>
			</div>
			<div class="row m-3">
				<div class="col d-flex justify-content-center">
					<form id="form-search" action="list.nadri" class="row row-cols-lg-auto g-3 align-items-center" method="get">
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
	</div>
</div>
<script type="text/javascript">
	// 페이지내비게이션의 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$(".pagination a").click(function(event) {
		event.preventDefault();
		// 클릭한 페이지내비게이션의 페이지번호 조회하기
		var pageNo = $(this).attr("data-page");
		// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
		$(":input[name=page]").val(pageNo);
		
		// 검색폼에 onsubmit 이벤트 발생시키기
		$("#form-search").trigger("submit");
	})
</script>
</body>
</html>