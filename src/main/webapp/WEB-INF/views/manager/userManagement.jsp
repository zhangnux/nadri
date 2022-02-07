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

	.container-fluid
	{
    position:fixed;
    padding:0;
    margin:0;

    top:0;
    left:0;

    width: 100%;
    height: 100%;
	}
	
	.vGraph{ padding:20px 0;}
	.vGraph ul{ 
		margin:0; padding:0; height:264px; 
		border:1px solid #ddd; 
		border-top:0; 
		border-right:0; 
		font-size:11px; 
		font-family:Tahoma, Geneva, sans-serif; 
		list-style:none;
	}
	.vGraph ul:after{ 
		content:""; 
		display:block; 
		clear:both;
	}
	.vGraph li{ 
		float:left; 
		display:inline; 
		width:14%; 
		height:100%; 
		margin:0 3%; 
		position:relative; 
		text-align:center; 
		white-space:nowrap;
	}
	.vGraph .gTerm{ 
		position:relative; 
		display:inline-block; 
		width:100%; 
		height:20px; 
		line-height:0px; 
		margin:0 -100% -20px 0; 
		padding:280px 0 0 0; 
		vertical-align:bottom; 
		color:#767676; 
		font-weight:bold;}
	.vGraph .gBar{ 
		position:relative; 
		display:inline-block; 
		width:100%; 
		margin:-1px 0 0 0; 
		border:1px solid #ccc; 
		border-bottom:0; 
		background:#e9e9e9; 
		vertical-align:bottom;
	}
	.vGraph .gBar span{ 
		position:absolute; 
		width:100%; 
		top:-20px; 
		left:0; 
		color:#767676;
	}
	#table-user th{
		height: 40px;
		background-color: #E9E9E9;
	}
	#table-user td {
		height: 50px;
	}
	#table-user tr {
		border-bottom: 1px solid #C0C0C0;
		font-size: 15px;
	}
	.pie-chart2 {
		display:inline-block;
		position:relative;
		width: 200px;
		height: 200px;
		border-radius: 50%;
	}
	.pie-chart2  .center{
		position:absolute;
		width:165px; 
		height: 165px;
		background :#fff;
		border-radius: 50%;
		top: 18px;
		left:18px;
	}
	#page a {
		border: 0;
	}
	
	
	.page {
		padding: 10px;
	}
	a[aria-label] {
		font-size: 28px;
		padding: 0px;
	}
</style>
<body>
<c:set var="menu" value="user"/>
<div class="container-fluid bg-light">
<div class="row">
	<div class="col-2" style="position: fixed; height: 100%;">
		<%@ include file="common/navbar.jsp" %>
	</div>
	<div class="col-10" style="margin-left: 310px;">
		<div class="row mt-5" >
			<div class="col border mx-3" style="background-color: white; align-self: self-start;">
				<!-- 엔터키 누르면 왜 넘어감? -->
				<form action="#" method="get" id="form-search-user">
					<input name="page" type="hidden" value="1">
					<ul>
						<li class="py-3">
							<span class="me-5" >회원</span>
							<input type="checkbox" name="delete" value="Y">
							<label class="px-1">탈퇴회원</label>
						</li>
						<li class="py-3">
							<span class="me-3" >수신여부</span>
							<input type="checkbox" name="email" value="Y">
							<label class="px-1">이메일</label>
							<input type="checkbox" name="sms" value="Y">
							<label class="px-1">SMS</label>
						</li>
						<li class="py-3">
							<span class="me-4" >검색어</span>
							<select name="option" style="padding: 2px; border-radius: 0;">
								<option value="id">아이디</option>
								<option value="name">이름</option> 
							</select>
							<input type="text" name="keyword" style="border-radius: 0; border: 1px solid black; padding: 3px 3px;">
							<button type="button" class="btn btn-outline-dark btn-search" 
							style="border-radius: 0; vertical-align: bottom; padding:6px; font: -webkit-small-control; width: 62px;">검색</button>
						</li>
					</ul>
				</form>
			</div>
			<div class="col mx-3 border px-5 py-3" style="background-color: white;">
				<div class="row">
					<div class="col text-center" style="font-size: 20px; font-weight: bold;">
						연령별/성별 회원 현황
					</div>
				</div>
				<div class="row">
					<div class="col vGraph mt-3">
						<ul>
							<c:forEach var="rate" items="${ageRate }">
								<li><span class="gTerm">${rate.age }~${rate.age+9 }</span><span class="gBar" style="height:${rate.count }%"><span>${rate.count }%</span></span></li>
							</c:forEach>
						</ul>
					</div>
					<div class="col p-3 text-center">
					    <ul style="list-style: none;" class="text-end">
	   						<li class="m-2">
		    					<em class="color me-2" style="border: 1px solid black; background-color: #659ED7; padding: 0.2px 35px">
		    					</em>
		    					<span>남성</span>
	   						</li>
	   						<li class="m-2">
		    					<em class="color me-2" style="border: 1px solid black; background-color: #CD868B; padding: 0.2px 35px">
		    					</em>
		    					<span>여성</span>
	   						</li>
	   					</ul>
						<div class="pie-chart2" style="background: conic-gradient(#CD868B 0% ${genderRate[0]}%, #659ED7 ${genderRate[0]}% ${genderRate[1]}%);">
							<span class="center"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex flex-column flex-shrink-0 p-3 border mt-4" >
			<table class="text-center" id="table-user">
				<thead>
					<tr>
						<th width="5%">No.</th>
						<th width="10%">아이디</th>
						<th width="5%">이름</th>
						<th width="15%">생년월일</th>
						<th width="15%">이메일</th>
						<th width="15%">연락처</th>
						<th width="5%">포인트</th>
						<th width="15%">가입일자</th>
						<th width="15%">탈퇴일자</th>
					</tr>
				</thead>
				<tbody id="tbody-user">
					<c:forEach var="user" items="${userList }"> 
						<tr>
							<td style="cursor: pointer; color: #7E5C5E;"><strong>${user.no }</strong></td>
							<td class="td-userInfo">${user.id }</td>
							<td>${user.name }</td>
							<td><fmt:formatDate value="${user.birth }" pattern="yyyy년MM월dd일"/></td>
							<td>${user.email }</td>
							<td>${user.tel }</td>
							<td><fmt:formatNumber value="${user.point }" pattern="##,###"/></td>
							<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy년MM월dd일"/></td>
							<c:choose>
								<c:when test="${empty user.deletedDate}">
									<td> - </td>
								</c:when>
								<c:otherwise>
									<td><fmt:formatDate value="${user.deletedDate }" pattern="yyyy년MM월dd일"/></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav aria-label="Page navigation example" style="text-decoration: none;" id="page">
				<ul class="pagination justify-content-center mt-4">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<!-- total = 5 -->
					<!-- page의 블록은 3 -->
					<c:forEach var="count" begin="1" end="${total }">
						<c:choose>
							<c:when test="${count <= 3 }">
								<li class="page-item ${count eq 1? 'active' : '' }"><a class="page-link page" href="#">${count }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" style="display: none;"><a class="page-link page" href="#">${count }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
	$(function() {
		
		function addCommas(nStr) {
		    nStr += '';
		    x = nStr.split('.');
		    x1 = x[0];
		    x2 = x.length > 1 ? '.' + x[1] : '';
		    var rgx = /(\d+)(\d{3})/;
		    while (rgx.test(x1)) {
		        x1 = x1.replace(rgx, '$1' + ',' + '$2');
		    }
		    return x1 + x2;
		}
		
		// 처음 설정
		if ($(".page-item:visible").eq(1).text() == 1) {
			$("[aria-label=Previous]").css('color', 'gray')
		}
		
		// 처음부터 실행되는 이유
		let searchUser = function(no) {
			$("#tbody-user").empty()
			let deleted = $("[name=delete]:checked").val()
			let email = $("[name=email]:checked").val()
			let sms = $("[name=sms]:checked").val()
			let option = $(":selected").val()
			let keyword = $("[name=keyword]").val()
			
			$.getJSON('/rest/admin/userSearch.do',
				{option: option, keyword: keyword, email: email, sms:sms, deleted:deleted, pageNo:no},	
				function(response){
					console.log(response.items)
					response.items
					$.each(response.items, function(index, user) {
						let userList;
						userList = '<tr>'
						userList += '<td style="cursor: pointer; color: #7E5C5E;"><strong>' + user.no + '</strong></td>'
						userList += '<td>' + user.id + '</td>'
						userList += '<td>' + user.name + '</td>'
						userList += '<td>' + user.birth + '</td>'
						userList += '<td>' + user.email + '</td>'
						userList += '<td>' + user.tel + '</td>'
						userList += '<td>' + addCommas(user.point) + '</td>'
						userList += '<td>' + user.createdDate + '</td>'
						if (user.deleteCheck == 'Y') {
							userList += '<td>' + user.deletedDate + '</td>'
						} else {
							userList += '<td></td>'
						}
						userList += '</tr>'
						$("#tbody-user").append(userList)		
					})
				}
			)
		}
		
		$("[aria-label=Next]").click(function() {
			// visible된 값을 끝값
			// active된 값이 3*n 안에 들때 그 n값이 1이면 next는 n*3 n+1*3 인 것을 visible시킨다.
			let lastBlock = $(".page-item:visible").eq(3).text() // 3
			let block = ($(".page-item:visible").eq(3).text()/3) + 1 // 1
			// 다음 블록이 있다면
			if ($("li:has(.page)").eq(lastBlock).length != 0) {
				$("[aria-label=Previous]").css('color', 'blue')
				$("li:has(.page)").hide()
				$("li:has(.page)").slice(lastBlock, block*3).show()
				searchUser($("li:has(.page)").eq(lastBlock).text())
				$(".page-item").removeClass('active')
				$("li:has(.page)").eq(lastBlock).addClass('active')
				if ($("li:has(.page)").eq(block*3-1).length == 0) {
					$(this).css('color', 'gray')
				}
			} 
		})

		$("[aria-label=Previous]").click(function() {
			// visible된 값을 첫번째 값
			// active된 값이 3*n 안에 들때 그 n값이 1이면 next는 n*3 n+1*3 인 것을 visible시킨다.
			// block의 첫번째 값
			let firstBlock = $(".page-item:visible").eq(1).text() // 4
			// 다음 block 값
			// 1 4/3 2 7/3 
			let block = (Math.floor($(".page-item:visible").eq(1).text()/3)-1) // 0
			if (block != -1) {
				$("[aria-label=Next]").css('color', 'blue')
				$("li:has(.page)").hide()
				$("li:has(.page)").slice(block*3, firstBlock-1).show()
				searchUser($("li:has(.page)").eq(firstBlock-2).text())
				$(".page-item").removeClass('active')
				$("li:has(.page)").eq(firstBlock-2).addClass('active')
				if ($("li:has(.page)").eq(block*3).text() == 1) {
					$(this).css('color', 'gray')
				}
			} 
		})
		
		
		$("li:has(.page)").click(function() {
			searchUser($(this).text())
			$(".page-item").removeClass('active')
			$(this).addClass('active')
		})
		
		// 엔터키를 눌렀을 때 
		$("#form-search-user").keypress(function(k) {
			if (k.keyCode === 13) {
				searchUser(1)
			}
		})
		// 검색 버튼을 눌렀을 때
		$(".btn-search").click(function(){
			searchUser(1)
		})
		
	})
</script>
</html>