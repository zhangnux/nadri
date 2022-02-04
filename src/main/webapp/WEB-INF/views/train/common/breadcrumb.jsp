<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/tags.jsp" %>
<style>
	.breadcrumb a {
		text-decoration: none;
		color: black;
		
	}
	.breadcrumb li.active a {
		color: #7E5C5E;
		font-weight: bold;
	}
	.breadcrumb {
		font: message-box;
	}
</style>
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);"
	aria-label="breadcrumb" class="text-end">
  <ol class="breadcrumb justify-content-end fs-5" data-page="${menu }">
    <li class="breadcrumb-item" id="home"><a href="/home.nadri">홈</a></li>
 	<c:if test="${not empty menu1 }">
	    <li class="breadcrumb-item ${active eq 'menu1' ? 'active' : '' }">
	    	<a href="/train">검색</a>
	    </li>
 	</c:if>
 	<c:if test="${not empty menu2 }">
		<li class="breadcrumb-item ${active eq 'menu2' ? 'active' : '' }">
			<a href="/train">조회</a>
		</li>
 	</c:if>
 	<c:if test="${not empty menu3 }">
		<li class="breadcrumb-item ${active eq 'menu3' ? 'active' : '' }">
			<a href="#">예약</a><!-- 예약 리스트 페이지로 이동 -->
		</li>
 	</c:if>
 	<c:if test="${not empty menu4 }">
		<li class="breadcrumb-item ${active eq 'menu4' ? 'active' : '' }">
			<a href="#">발권/취소/변경</a><!-- 예약 리스트 페이지로 이동 -->
		</li>
 	</c:if>
    <%-- <li class="breadcrumb-item ${menu eq 'booking' ? 'active' : '' }"><a href="#">예약</a></li>
    <li class="breadcrumb-item ${menu eq 'payment' ? 'active' : '' }"><a href="#">결제</a></li> --%>
  </ol>
</nav>