<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    	<script type="text/javascript" async="" src="https://www.gstatic.com/recaptcha/releases/TDBxTlSsKAUm3tSIa0fwIqNu/recaptcha__ko.js" crossorigin="anonymous" integrity="sha384-J4V5G7w5jAc8f1tU/H2xIAqM562LvhzEesz4fCSg9ZlE1E0k8JuoV7XEr5jPkK7n"></script>
        <meta charset="utf-8" />
        <title>나드리</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
		<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="fs-1 link-warning fw-bold" href="home.nadri">Nadri</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">항공권</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">기차</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">음식점</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">숙소</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="attr.nadri">즐길거리</a></li>
                    </ul>
                </div>
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			      <ul class="navbar-nav ms-auto">
			      
		        <!-- 로그인 하지 않았을 때 -->
		        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">로그인</a></li>
                <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">회원가입</a></li>			      
			      
			      <!-- 로그인 했을 때 -->
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			            아이디를 띄워요
			          </a>
			          <!-- Here's the magic. Add the .animate and .slideIn classes to your .dropdown-menu and you're all set! -->
			          <div class="dropdown-menu dropdown-menu-end animate slideIn" aria-labelledby="navbarDropdown">
			            <a class="dropdown-item" href="#">마이페이지</a>
			            <a class="dropdown-item" href="#">위시리스트</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">로그아웃</a>
			          </div>
			        </li>
			        
                   	
			      </ul>
			    </div>
            </div>
        </nav>        
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('../resources/images/nadri-attr.jpg');background-attachment: local">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>Attractions</h1>
                            <span class="subheading">전국 각지의 즐길거리를 소개합니다</span>
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
		<%@ include file="../common/footer.jsp" %>
    </body>
</html>
