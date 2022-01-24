<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@ include file="../common/mainnav.jsp" %>
<header class="masthead" style="background-image: url('../resources/images/nadri-restaurant.jpg');background-attachment: local">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1 class="text-warning fw-bold">메뉴명 영어입력</h1>
                    <span class="subheading">문구입력</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- ★ -->

<div class="container">

	<!-- 
		옵션 선택하기
		별점순
		매출순
	 -->
	 <!-- 
	 	탭
	 	카테고리 : 한식, 일식, 양식, 기타
	  -->
	<div></div>
	
	<div class="row mb-3">
		<div class="col">
			<p>음식점 목록</p>
			<table class="table">
				<tbody>
					<tr>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>