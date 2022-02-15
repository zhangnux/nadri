<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/head.jsp" %>
    <title>나드리::기차</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	#table-result {
		width: 100%;
		height: 45px;
	}
	#table-result td, th{
		border: 1px solid #E0E0E0;
		height: 45px;
	}
	
</style>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
		<div class="row my-5">
		<div class="col">
			<h2>결제완료</h2>
		</div>
	</div>
	<c:set var="menu4" value="reservationList"/>
	<c:set var="menu7" value="finish"/>
	<c:set var="active" value="menu7"/>
	<%@ include file="common/breadcrumb.jsp" %>
	<hr>
	<div class="border pt-4 pb-2 ps-4 my-3" style="font-size: 15px;">
		<ul id="explanation">
			<li>
				결제가 완료되었습니다.
			</li>
			<li class="mt-2">
				결제가 완료된 티켓을 발급해 주시길 바랍니다.
			</li>
		</ul>
	</div>
	<div>
		<table class="border" id="table-result">
			<tbody>
				<tr>
					<th class="text-center" style="width: 17%; background-color: #E6ECF3;">결제금액</th>
					<td class="ps-4 text-start"><fmt:formatNumber value="${totalPrice}" pattern="##,###"/> 원</td>
				</tr>
				<tr>
					<th class="text-center" style="width: 17%; background-color: #E6ECF3;">결제일시</th>
					<td class="ps-4 text-start"><fmt:formatDate value="${soldDate }" pattern="yyyy.MM.dd HH:mm"/></td>
				</tr>
				<tr>
					<th class="text-center" style="width: 17%; background-color: #E6ECF3;">결제수단</th>
					<td class="ps-4 text-start">카카오페이</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="text-end mt-5">
		<a href="/train/reservationList.nadri" style="border-radius: 0; border: 1px solid black; padding: 8px 15px; text-decoration: none; color: black;">승차권조회</a>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>