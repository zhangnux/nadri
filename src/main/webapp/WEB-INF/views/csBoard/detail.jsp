<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>나드리::문의사항</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
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
						<td colspan="2">[${csBoard.csType }]  <strong> ${csBoard.title } </strong> [${csBoard.replyCheck }]</td>
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
				<a href="modify.nadri?no=${csBoard.no }" class="btn btn-primary">수정</a>
				<a href="delete.nadri?no=${csBoard.no }" class="btn btn-danger">삭제</a>
	</div>
	<div class="row mb-3 ms-2 me-2" style="border-bottom: 1px solid;">
		<div class="col">
			<h2>답변</h2>
		</div>
	</div>
	
	<input type="hidden" name="no" value="${csBoard.no }"/>
	
	<c:if test="${!empty LOGIN_MANAGER }">
		<div class="row mb-3 p-3">
			<div class="col">
				<form action="" class="border bg-light p-3">
					<input type="hidden" name="no" value="${csBoard.no }"/>
					<div class="mb-3">
	 					<textarea class="form-control" rows="5" id="replyContent" name="replyContent"></textarea>
					</div>
					<div class="d-flex justify-content-end">
						<button type="button" id="btn-add-answer" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<div class="row m-3">
		<div class="col" id="manager-answer">

		</div>
	</div>

<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">
//로딩 완료시점에 자동실행
	
	// 만약 답변이 있으면 실행
	
	getReply();
	
	$("#btn-add-answer").click(function(){
		var $replyBox = $("#manager-answer").empty();
		
		// 데베에 있으면 안되게??
		

		// 내용 유무 확인
		if($("#replyContent").val().trim()==""){
			alert("내용을 입력해주세요");
			return false;
		}

		var formData = new FormData();
		var no = $(":input[name=no]").val();
		// 답변 내용 조회
		var replyContent = $(":input[name=replyContent]").val();
		
		formData.append("no", no);
		formData.append("replyContent", replyContent);
	
		$.ajax({
			type:"post",				// 첨부파일이 업로드 되기 때문에 post 방식으로 지정한다.
			url:"/rest/csboard/reply/insert.nadri",
			data: formData,
			processData: false,			// processData를 false로 지정하면 name=value&name=value의 형태가 아닌 다른 방식으로 전달된다.
			contentType: false,			// contentType를 false로 지정하면 기본값으로 지정된 "application/x-www-form-urlencoded"가 적용되지 않는다.
			success: function(data) {
				getReply();
				}
			});
		});
	
		function getReply() {
			var $replyBox = $("#manager-answer").empty();
			
			$.ajax({
				type: "get",
				url : "/rest/csboard/reply/show.nadri",
				data: {no: $(":input[name=no]").val()},
				dataType: 'json',
				success: function(reply) {
					var htmlContent = '';
					htmlContent += '<div class="row mb-2 border-bottom">';
					htmlContent += '	<div class="col-3 p-3 border-end">';
					htmlContent += '		<div id="username" class="mb-3"><strong>관리자</strong></div>';
					htmlContent += '		<div>'+reply.replyCreatedDate+'</div>';
					htmlContent += '	</div>';
					htmlContent += '	<div class="col-9 p-3">';
					htmlContent += '		<div class="row">';
					htmlContent += '			<div class="col gap-3 d-flex justify-content-end">';	
					htmlContent += '				<a href="">수정</a>';
					htmlContent += '				<a href="">삭제</a>';
					htmlContent += '			</div>';
					htmlContent += '		</div>';
					htmlContent += '		<div class="row">';	
					htmlContent += '		<p>'+reply.replyContent+'</p>';
					htmlContent += '		</div>';
					htmlContent += '	</div>';
					htmlContent += '</div>';
					
					$replyBox.append(htmlContent);
				}
				
			});
		}

</script>
</body>
</html>