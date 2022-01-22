<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="common/mainhead.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%@ include file="common/mainnav.jsp" %>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../resources/images/nadri-main.jpg');background-attachment: local">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1 class="text-warning fw-bold" id="enfont">Nadri.</h1>
                            <span class="subheading">국내 여행 정보 사이트, 나드리</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                    <div class="post-preview">
                            <h2 class="post-title">${message }</h2>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                </div>
            </div>
        </div>
        
        <!-- Footer-->
		<%@ include file="common/footer.jsp" %>
    </body>
</html>
