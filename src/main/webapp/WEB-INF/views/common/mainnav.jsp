<%@page import="com.nadri.user.util.SessionUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="fs-1 link-warning fw-bold" href="/home.nadri" id="enfont">Nadri</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="#">항공권</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/train">기차</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/restaurant/main.nadri">음식점</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/lodging/main.nadri">숙소</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/attr/main.nadri">즐길거리</a></li>
                    </ul>
                </div>
                
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav ms-auto">
	      
	      	<!-- 로그인 안했을 때 -->
	      	
		    	<c:if test="${empty LOGIN_USER }">
		        	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/user/login.nadri">로그인</a></li>
		        	<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/user/insert.nadri">회원가입</a></li>
		    	</c:if>
		     <!-- 로그인 했을 때 -->
          <c:if test="${not empty LOGIN_USER }">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				${LOGIN_USER.id }
	          </a>
		          <div class="dropdown-menu dropdown-menu-end animate slideIn" aria-labelledby="navbarDropdown">
		          	<a class="dropdown-item" href="/user/detail.nadri">마이페이지</a>
		          	<a class="dropdown-item" href="/train/reservationList.nadri">기차예약조회</a>
		            <a class="dropdown-item" href="#">위시리스트</a>
		     	<div class="dropdown-divider"></div>
		            <a class="dropdown-item" href="/user/logout.nadri">로그아웃</a>
		          </div>
		    </li>
	      </c:if>
                 	
	      </ul>
  		</div>
			    
     </div>
 </nav>
 <script src="../../../resources/js/scripts.js"></script> 