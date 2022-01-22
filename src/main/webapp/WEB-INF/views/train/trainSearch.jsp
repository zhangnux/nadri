<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="../common/mainhead.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/mainnav.jsp" %>
<header class="masthead" style="background-image: url('../resources/images/nadri-train.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning">메뉴명 영어입력</h1>
                    <span class="subheading">문구입력</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- ★ -->
<div class="container">
	<div class="row">
		<div class="col">
			<h2>기차표</h2>		
		</div>
	</div>
	<c:set var="menu1" value="search"/>
	<c:set var="active" value="menu1"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="row">
		<div class="col">
			<form action="" method="post">
				<div>
					<input >
				</div>
			</form>
		</div>
	</div>
</div>
<!--  -->

<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	
</script>
</body>
</html>