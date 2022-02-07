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
<body>
<div class="container">
	<div class="row mb-3 p-3">
		<div class="col">
			<h1>Q&A</h1>
		</div>
	</div>
	<div class="row mb-3 ps-3 pe-3">
		<div>
			<table class="table" style="border: 1px solid">
				<tbody>
					<tr>
						<td colspan="2">Q&A</td>
					</tr>
					<tr>
						<td colspan="2">[${csBoard.csType }]  <strong> ${csBoard.title } </strong> ${csBoard.replyCheck }</td>
					</tr>
					<tr>
						<td style="text-align: left; width: 8%;">${csBoard.userName }</td>
						<td style="text-align: left; width: 92%;"><fmt:formatDate value="${csBoard.createdDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<td colspan="2" style="height: 200px; text-align: left;">${csBoard.content }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end ms-3 me-3">
		<c:choose>
			<c:when test="${!empty LOGIN_MANAGER }">
				<a href="list.nadri" class="btn btn-secondary">목록</a>
			</c:when>
			<c:when test="${!empty LOGIN_USER }">
				<a href="userlist.nadri" class="btn btn-secondary">목록</a>
			</c:when>			
		</c:choose>
			<a href="delete.nadri?no=${csBoard.no }" class="btn btn-danger">삭제</a>
			<a href="modify.nadri?no=${csBoard.no }" class="btn btn-primary">수정</a>
	</div>
	<div class="row mb-3 ms-2 me-2" style="border-bottom: 1px solid;">
		<div class="col">
			<h2>답변</h2>
		</div>
	</div>
	<!-- 댓글입력은 매니저만 보이게 restcontroller-->
	<c:if test="${!empty LOGIN_MANAGER }">
		<div class="row mb-3 p-3">
			<div class="col">
				<form action="" class="border bg-light p-3">
					<div class="mb-3">
	 					<textarea class="form-control" rows="5" name="content"></textarea>
					</div>
					<div class="d-flex justify-content-end">
						<button type="button" id="btn-add-answer" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<!-- c:if로 -->
	<div class="row mb-3">
		<div class="col">
			<table class="table" id="answer-table">
				<tr>
					<td rowspan="2">
						<p>관리자</p>
						<p>2022/02/06</p>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
				</tr>
			</table>
		</div>
	</div>


</div>
<script type="text/javascript">
	$("#btn-add-answer").click(function() {
		
		// 답변 내용 조회
		var content = $(":input[name=content]").val();
		
		//
		
	
		$.ajax({
			type:"post",				// 첨부파일이 업로드 되기 때문에 post 방식으로 지정한다.
			url:"/reply/insert.nadri",
			data: 
			processData: false,			// processData를 false로 지정하면 name=value&name=value의 형태가 아닌 다른 방식으로 전달된다.
			contentType: false,			// contentType를 false로 지정하면 기본값으로 지정된 "application/x-www-form-urlencoded"가 적용되지 않는다.
			success: function(data) {
				// data <--- {no:100, content:"답변내용", createDated:"2022-02-04", .....}
					var htmlContent = "<tr>"
					htmlContent += "<td rowspan='2'><p>관리자</p><p>2022/02/06</p></td>";
					htmlContent += "";
					htmlContent += "";
					htmlContent += "";
					htmlContent += "";
					htmlContent += "";
					htmlContent += "";
					htmlContent += "</th>";
	
					$("answer-table tbody").prepend(htmlContent);	
			}
		});
	
	});

</script>
</body>
</html>