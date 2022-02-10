<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap" rel="stylesheet" type="text/css" />
<style>
html, body {
    font-family:'IBM Plex Sans KR', sans-serif;
}

#sidebar a.active {
	background-color: white;
	color: black;
	font-weight: bold;
}
#sidebar a {
	font-size: 19px;
	color: white;
}
</style>

<div id="sidebar" class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="height: 100%;">
	<span class="fs-1 text-center">Nadri</span>
    <hr>
	    <ul class="nav nav-pills flex-column text-end px-3" style="margin-block:auto;">
	      <li class="nav-item mt-3">
	        <a href="/admin/index.nadri" class="nav-link ${menu eq 'home' ? 'active' : ''}">
	          Home
	        </a>
	      </li>
	      <li class="nav-item mt-3">
	        <a href="/admin/userManagement.nadri" class="nav-link ${menu eq 'user' ? 'active' : ''}">
	        	사용자관리
	        </a>
	      </li>
	      <li class="nav-item mt-3">
	        <a href="#" class="nav-link ${menu eq 'statistics' ? 'active' : ''}">
	          통계
	        </a>
	      </li>
	      <li class="nav-item mt-3">
	        <a href="#" class="nav-link ${menu eq 'review' ? 'active' : ''}">
	          구매평
	        </a>
	      </li>
	      <li class="nav-item mt-3">
	        <a href="#" class="nav-link ${menu eq 'qna' ? 'active' : ''}">
	          문의
	        </a>
	      </li>
	      <li class="nav-item mt-3">
	        <a href="#" class="nav-link ${menu eq 'notice' ? 'active' : ''}">
	          공지사항
	        </a>
	      </li>
	      <li class="nav-item mt-3">
	        <a href="../coupon/coulist.nadri" class="nav-link ${menu eq 'notice' ? 'active' : ''}">
	          쿠폰관리
	        </a>
	      </li>
	    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://github.com/mdo.png" alt="" width="32" height="30" class="rounded-circle me-2">
        <strong class="fs-6">관리자</strong>
      </a>
      <ul class="dropdown-menu dropdown-menu-dark text-small" aria-labelledby="dropdownUser1">
        <li><a class="dropdown-item" href="/admin/logout.nadri">Sign out</a></li>
      </ul>
    </div>
</div>