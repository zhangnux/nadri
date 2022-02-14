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
	<script src="https://d3js.org/d3.v6.min.js"></script>
	<script src="../../resources/css/billboard.js"></script>
	<link rel="stylesheet" href="../../resources/css/billboard.css">
</head>
<style>
	html, body {
		width: 100%;
		height: 100%;
	}

	.container-fluid {
	    position:fixed;
   		overflow: auto;
	    padding:0;
	    margin:0;
	
	    top:0;
	    left:0;
	
	    width: 100%;
	    height: 100%;
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

	.border {
		background-color: white;
	}
	
	#page span {
		border: 0;
		border-radius: 3px;
	}
	#page .page-item.active .page-link {
		background-color: #7E5C5E;
		height: 40px;
		
	}
	.page-link {
		color: #9A565B;
	}
	.page {
		padding: 9px 12px;
		cursor: pointer;
	}
	
	span[aria-label] {
		padding: 4px 12px;
		font-size: 21px;
	}
	.bb svg {
    font: 15px sans-serif;
    }
    .bb-chart-arc text { 
    	font-size: 16px;
    }
    .bb-legend-item {
    	font-size: 15px;
    }
</style>
<body>
<c:set var="menu" value="user"/>
<div class="container-fluid bg-light">
	<div class="row">
		<div class="col-2" style="position: fixed; height: 100%; min-width: 280px;">
			<%@ include file="common/navbar.jsp" %>
		</div>
		<div class="col-10" style="margin-left: 310px;">
			<div class="pt-3 px-4 fw-bold">
				<h2><Strong>사용자 관리</Strong></h2>
			</div>
			<div class="row mt-3 mx-4" >
				<div class="col-4 border me-4" style="background-color: white; align-self: self-start;">
					<form action="/admin/userManagement.nadri" method="get" id="form-search-user">
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
				<div class="col border px-5 py-3" style="background-color: white;">
					<div class="row">
						<div class="col text-center" style="font-size: 20px; font-weight: bold;">
							연령별/성별 회원 현황
						</div>
					</div>
					<div class="row">
						<div class="col-5 mt-3">
		   					<div id="rotateXAxisTickText"></div>
						</div>
						<div class="col-1 my-5 text-center" style="border-left: 1px solid gray; padding: 0; margin-left: 50px;">
						</div>
						<div class="col-5 p-3 text-center">
		   					<div id="donutChart"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex flex-column flex-shrink-0 p-3 border mx-4 mt-3" style="height: 410px;">
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
								<td><fmt:formatDate value="${user.birth }" pattern="yyyy/MM/dd/"/></td>
								<td>${user.email }</td>
								<td>${user.tel }</td>
								<td><fmt:formatNumber value="${user.point }" pattern="##,###"/></td>
								<td><fmt:formatDate value="${user.createdDate }" pattern="yyyy/MM/dd/"/></td>
								<c:choose>
									<c:when test="${empty user.deletedDate}">
										<td> - </td>
									</c:when>
									<c:otherwise>
										<td><fmt:formatDate value="${user.deletedDate }" pattern="yyyy/MM/dd"/></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pb-2" id="pagination">
					<nav aria-label="Page navigation example" style="text-decoration: none;" id="page">
						<ul class="pagination justify-content-center mt-1">
			
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript">
	$(function() {
 		function chart() {
			$.ajax({
				type:'GET',
				url:'/rest/admin/chart',
				dataType:'json',
				success:function(response) {
					console.log(response)
					// 도넛 차트
					bb.generate({
						 data: {
						    columns: [
							["여자", response.genderRate[0]],
							["남자", response.genderRate[1]]
						    ],
						    type: "donut",
							colors:{
								"여자": "#CD868B", 
								"남자": "#659ED7" 
							}
						 },
						 donut: {
						    title: "성별 회원 현황",
						    padAngle: 0.06
						 },
						 bindto: "#donutChart"
					});
					
					// bar차트
					bb.generate({
						  data: {
						    x: "x",
						    columns: [
							["x", "10~19", "20~29", "30~39", "40~49", "50~"],
							["연령", response.ageRate[0].rate, response.ageRate[1].rate, response.ageRate[2].rate, response.ageRate[3].rate, response.ageRate[4].rate]
						    ],
						    type: "bar",
						    labels: {
						      colors: "white",
						      format: {
						    	연령: function(x) { return x +'%'}
						      },
						      centered: true
						    },
						    colors: {
						    	연령 : "#6BA2D8"
						    }
						  },
						  bar: {
						    width: {
						      ratio: 0.8
						    }
						    
						  },
						  axis: {
						    x: {
						      type: "category",
						      tick: {
						        rotate: 0,
						        multiline: false,
						        tooltip: true
						      },
						      height: 30,
						    }
						  },
						  bindto: "#rotateXAxisTickText"
					});
				}
			
			})
		
		}
 		chart()
 		pagination(1)
		
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
		
 		
 		function pagination(no) {
			let deleted = $("[name=delete]:checked").val()
			let email = $("[name=email]:checked").val()
			let sms = $("[name=sms]:checked").val()
			let option = $(":selected").val()
			let keyword = $("[name=keyword]").val()
			let countNo;
			$.getJSON('/rest/admin/userSearch.do',
				{option: option, keyword: keyword, email: email, sms:sms, deleted:deleted, pageNo:no},	
				function(response){
		 			$("#tbody-user").empty()
		 			$(".pagination").empty()
					
					console.log(response)
					if (response.userList.length == 0) {
						let userNone;
						userNone = '<tr>'
						userNone += '<td colspan="9">사용자 정보가 존재하지 않습니다.</td>'
						userNone += '</tr>'
						
						$("#tbody-user").append(userNone)
						
					} else {
						$.each(response.userList, function(index, user) {
							let userList;
							userList = '<tr>'
							userList += '<td style="cursor: pointer; color: #7E5C5E;"><strong>' + user.no + '</strong></td>'
							userList += '<td>' + user.id + '</td>'
							userList += '<td>' + user.name + '</td>'
							userList += '<td>' + moment(user.birth).format('yyyy/MM/DD') + '</td>'
							userList += '<td>' + user.email + '</td>'
							userList += '<td>' + user.tel + '</td>'
							userList += '<td>' + addCommas(user.point) + '</td>'
							userList += '<td>' + moment(user.createdDate).format('yyyy/MM/DD') + '</td>'
							if (user.deleteCheck == 1) {
								userList += '<td>' + moment(user.deletedDate).format('yyyy/MM/DD') + '</td>'
							} else {
								userList += '<td> - </td>'
							}
							userList += '</tr>'
							$("#tbody-user").append(userList)
						})
						// 페이지 네이션
						let page = response.pagination
						let pagination = "";
						
						if (page.existPrev) {
							pagination += '<li class="page-item" id="previous" data-prev-page="' + page.prevPage +'">'
						} else {
							pagination += '<li class="page-item disabled" id="previous" data-prev-page="">'
						}
						
						pagination += '<span class="page-link" aria-label="Previous">'
						pagination += '<span aria-hidden="true"><strong>&laquo;</strong></span>'
						pagination += '</span></li>'
						
						for (var i=page.beginPage; i<= page.endPage; i++) {
							if (i == page.pageNo) {
								pagination += '<li class="page-item active"><span class="page-link page" >' + i +'</span></li>'
							} else {
								pagination += '<li class="page-item"><span class="page-link page">' + i +'</span></li>'
							}
						}
						
						if (page.existNext) {
							pagination += '<li class="page-item" id="next" data-next-page="' + page.nextPage + '">'
						} else {
							pagination += '<li class="page-item disabled" id="next" data-next-page="">'
						}
						pagination += '<span class="page-link" aria-label="Next">'
						pagination += '<span aria-hidden="true"><strong>&raquo;</strong></span>'
						pagination += '</span></li>'
						$(".pagination").append(pagination)
					}
				}
			)
		
		}
 		
		$('ul').on('click', 'li:has(.page)', function() {
			pagination($(this).text())
		})
		
		// 엔터키를 눌렀을 때 
		$("#form-search-user").keypress(function(e) {
			e.preventDefault();
			if (e.keyCode == 13) {
				pagination(1)
			}

		})
		// 검색 버튼을 눌렀을 때
		$(".btn-search").click(function(){
			pagination(1)
		})
		
		$(".pagination").on('click', "#next", function() {
			console.log($(this).attr("data-next-page"))
			pagination($(this).attr("data-next-page"))
		})
		$(".pagination").on('click', "#previous", function() {
			console.log($(this).attr("data-prev-page"))
			pagination($(this).attr("data-prev-page"))
		})
		
	})
</script>
</html>