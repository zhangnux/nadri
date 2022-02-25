<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
<style>
.card:hover{
	transform:scale(1.01);
	overflow: hidden;
	filter: brightness(95%);
	transition: all 0.3s;
}
#form-search{
	position:fixed;
	padding-top:120px;
}
.bg-dark{
	position:fixed;
	width:100%;
	z-index:99999;
}
#listcontent{
	padding-top:100px;
	padding-bottom:300px;
}
.col-12{
	padding-top:200px;
	padding-bottom:200px;
}
</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
	<div class="row">
<%@ include file="common/sidebar.jsp" %>	
		<div class="col-9 mt-5 tb-5" id="listcontent">
       
	       <c:choose>
			<c:when test="${empty category }">
					<div class="col col-12 text-center fw-bold"><h1>일치하는 상품이 없습니다.</h1></div>
			</c:when>
			<c:otherwise>
			<div class="row row-cols-1 row-cols-md-3 g-4">
	            <c:forEach var="cate" items="${category }">
				  <div class="col">
				    <div class="card h-100 shadow" onclick="location.href='detail.nadri?no=${cate.no}';">
				      <img src="../resources/images/att/${cate.thumbnail }" class="card-img-top" style="height:200px;">
				      <div class="card-body">
				      	<p class="card-text">${cate.place } / ${cate.category }</p>
				        <h5 class="card-title"><strong>${cate.name }</strong></h5>
				        <p class="card-text">${cate.content }</p>
				        <p class="card-text"><span style="color:gold;">★</span>&nbsp;${cate.star } / 5.0　후기 ${cate.count }개</p>
				        <c:choose>
				        	<c:when test="${cate.price==0 }">
				        		<p class="text-end"><strong>옵션 별 상이</strong></p>
				        	</c:when>
				        	<c:when test="${cate.discountPrice==0 }">
				        		<p class="card-text text-end"><strong>
				        			<fmt:formatNumber value="${cate.price }" pattern="###,###" />원
				        		</strong></p>
				        	</c:when>
				        	<c:otherwise>
				        		<div class="card-text text-end">
				        			<span class="text-decoration-line-through">
				        				<fmt:formatNumber value="${cate.price }" pattern="0,000" />원
				        			</span>
				        			<span style="color:red"><strong>&nbsp;
				        				<fmt:formatNumber value="${cate.discountPrice }" pattern="0,000" />원
				        			</strong></span>
				        		</div>
				        	</c:otherwise>
				        </c:choose>
				      </div>
				    </div>
				  </div>
				</c:forEach>
			</div>
			</c:otherwise>
			</c:choose>
			<a style="display:scroll;position:fixed;bottom:100px;right:100px; text-decoration-line : none; color:black;"
				href="javascript:window.scrollTo(0,0);"><i class="bi bi-arrow-up-square">
				</i><strong>위로</strong>
			</a>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>