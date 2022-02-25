<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css">	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
<style>
.detail {
	top: 40%;
	right: 6%;
	padding: 0;
}
.card:hover{
	transform:scale(1.01);
	overflow: hidden;
	filter: brightness(95%);
	transition: all 0.3s;
}
/* component */

.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#fc0;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#f90;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;
  margin:4em;
  max-width:30em;
  padding:2em;
}

#thumb {
    display: block;
    overflow: hidden;
}

</style>
</head>
<body>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<%@ include file="common/detailside.jsp"%>
			<div class="col-8 mt-3 mb-5">
				<div class="mb-3">
					<strong>
						<i class="bi bi-map"></i>
							<a href="list.nadri" style="text-decoration: none; color: black;">전국</a>
							<a href="list.nadri?place=${detail.place }" style="text-decoration: none; color: black;">
							>&nbsp;${detail.place }</a>
					</strong>
				</div>
				<div>
					<h2 class="text-center">
						<strong>${detail.name }</strong>
					</h2>
				</div>
				<div class="border-bottom mb-4 mt-4 pb-4 text-center">
					<c:choose>
						<c:when test="${empty star }">
							0.0/5.0
						</c:when>
						<c:otherwise>
							<span style="color:gold;">★</span>&nbsp;${star }/5.0 
						</c:otherwise>
					</c:choose>
					(${count })</div>

				<!-- forEach -->
				<c:choose>
					<c:when test="${empty detail.detail }">
						<div class="mt-5"></div>
					</c:when>
					<c:otherwise>

						<div class="mb-3 p-4">
							<h5>
								<strong>${detail.category } 안내</strong>
							</h5>
							${detail.detail }
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty detail.photo }">
					</c:when>
					<c:otherwise>
						<div>
							<img src="../../../resources/images/att/${detail.photo }"
								style="width: 850px;">
						</div>
					</c:otherwise>
				</c:choose>
				<%--
				<div class="border-top mt-5 pt-4">
					<h5 class="mb-3">
						<strong>위치 안내</strong>
					</h5>
					<div>지도 넣기

				<!-- forEach -->
				<script>

				</script>
				<!--  -->

					</div>
				</div>

				<!-- 후기 -->
				
				<div class="border-top mt-5 pt-4 mb-2">
					<h5>
						<strong>후기 사진</strong>
					</h5>
					<div class="row mt-4">
					
							<div class="col">
								<img src="../../../resources/images/att/review/reviewtest.jpg" style="width:130px;height:130px;object-fit:cover">
							</div>
					
					</div>
				</div>
				 --%>
				 
				<div class="border-top mt-5 mb-5 pt-4">
					<h5>
						<strong>후기</strong>
					</h5>
					<div class="row">
						<div class="col-3 text-end">
							<div class="mt-3" style="font-size:60px;">					
								<c:choose>
									<c:when test="${empty star }">
										<strong>0.0</strong>
									</c:when>
									<c:otherwise>
										<strong><span style="color:gold;">★</span>&nbsp;${star }</strong>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="col-6 ms-3 p-2 mt-4">
						<span style="color:black;font-size:30px;"><strong>후기 ${count }개</strong></span>
						</div>
					</div>
					
					<div id="review"><%-- 리뷰 출력되는 곳(ajax) --%></div>
					<c:choose>
						<c:when test="${not empty LOGIN_USER && userReviewCount==0 }">
							<form name="reviewform" class="border rounded p-4 mb-4" enctype="multipart/form-data">
							<div class="row">
								<div class="col-auto mt-2">
									<h5>
										<strong>후기 작성</strong>
									</h5>
								</div>
								<div class="col-auto star-rating">
									  <input type="radio" id="5-stars" name="star" value="5" />
									  <label for="5-stars" class="star">&#9733;</label>
									  <input type="radio" id="4-stars" name="star" value="4" />
									  <label for="4-stars" class="star">&#9733;</label>
									  <input type="radio" id="3-stars" name="star" value="3" />
									  <label for="3-stars" class="star">&#9733;</label>
									  <input type="radio" id="2-stars" name="star" value="2" />
									  <label for="2-stars" class="star">&#9733;</label>
									  <input type="radio" id="1-star" name="star" value="1" />
									  <label for="1-star" class="star">&#9733;</label>
								</div>
							</div>
							<div class="row">
								<div class="col-11 form-floating">
								  <textarea class="form-control" id="textarea" name="content"
								  			style="height: 200px;resize: none;" maxlength="500"></textarea>
								  <label for="floatingTextarea2">500자까지 작성 가능합니다.</label>
								</div>	
							</div>
							<div class="row mt-2">
								<div class="col">
									<input type="file" name="upfiles" accept=".gif, .jpeg, .jpg, .png">
								</div>
							</div>
							<div class="row mt-2">
								<div class="col">
									<input type="file" name="upfiles" accept="image/gif, image/jpeg, image/png">
								</div>
								<div class="col-1 d-flex flex-column bd-highlight mb-3">
									<%--
									<button type="button" class="btn btn-outline-danger mb-2" style="height:50px;width:50px" id="photo-review">
										<i class="bi bi-images"></i>
									</button>
									 --%>
									<button type="button" class="btn btn-outline-primary" style="height:50px;width:50px" id="register-review">
										<i class="bi bi-pencil-square"></i>
									</button>
								</div>																				
							</div>
							<input type="hidden" name="attNo" value=${param.no }>
							</form>
						</c:when>
					</c:choose>

				<div class="row mt-5 mb-3">
					<h3>
						<strong>${detail.place }의 다른 즐길거리</strong>
					</h3>
				</div>
				<div class="row">
	            <c:forEach var="rd" items="${random }">
				  <div class="col">
				    <div class="card h-100 shadow" onclick="location.href='detail.nadri?no=${rd.no}&page=1';">
				      <img src="../resources/images/att/${rd.thumbnail }" class="card-img-top" style="height:200px;">
				      <div class="card-body">
				      	<p class="card-text">${rd.place } / ${rd.category }</p>
				        <h5 class="card-title"><strong>${rd.name }</strong></h5>
				        <p class="card-text">${rd.content }</p>
				        <p class="card-text"><span style="color:gold;">★</span> ${rd.star } / 5.0　후기 ${rd.count }개</p>
				        <c:choose>
				        	<c:when test="${rd.price==0 }">
				        		<p class="text-end"><strong>옵션 별 상이</strong></p>
				        	</c:when>
				        	<c:when test="${rd.discountPrice==0 }">
				        		<p class="card-text text-end"><strong>
				        			<fmt:formatNumber value="${rd.price }" pattern="###,###" />원
				        		</strong></p>
				        	</c:when>
				        	<c:otherwise>
				        		<div class="card-text text-end">
				        			<span class="text-decoration-line-through">
				        				<fmt:formatNumber value="${rd.price }" pattern="0,000" />원
				        			</span>
				        			<span style="color:red"><strong>&nbsp;
				        				<fmt:formatNumber value="${rd.discountPrice }" pattern="0,000" />원
				        			</strong></span>
				        		</div>
				        	</c:otherwise>
				        </c:choose>
				      </div>
				    </div>
				  </div>
				</c:forEach>
				</div>
			<a style="display:scroll;position:fixed;bottom:2%;right:100px; text-decoration-line : none; color:black;"
				href="javascript:window.scrollTo(0,0);"><i class="bi bi-arrow-up-square">
				</i><strong>위로</strong>
			</a>
			
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
<script type="text/javascript">
/*
// 썸네일
function setThumbnail(event) {
    for (var image of event.target.files) {
      var reader = new FileReader();

      reader.onload = function(event) {
        var img = document.createElement("img");
        img.setAttribute("src", event.target.result);
        document.querySelector("#thumb").appendChild(img);
      };

      console.log(image);
      reader.readAsDataURL(image);
    }
  }
*/
// 로딩 완료시점에 자동실행
$(function() {

	$('input[name=upfiles]').change(function(){
		var imgFile = $('input[name=upfiles]').val();
		var fileForm = /(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/;
		var maxSize = 5 * 1024 * 1024;
		var fileSize = this.files[0].size;
	    if(!imgFile.match(fileForm)) {
	    	alert("이미지 파일만 업로드 가능");
	    	$(this).val('');
	        return;
	    } else if(fileSize > maxSize) {
	    	alert("파일 사이즈는 5MB까지 가능");
	    	$(this).val('');
	        return;
	    }
	})
	
	/* 리뷰불러오기 */
	var currentPage = '${param.page}'
	var no = '${param.no}'
	var id = '${LOGIN_USER.id }'
	getReviewList();
 	
	function getReviewList(){
		$.ajax({
			type:'POST',
			url: '/attr/review',
			data: {"no":no, "page":currentPage, "id":id},
			success: function(result) {
				var list = result.reviewList;
               	var htmls = "";
				if(list.length == 0){
					htmls += '<div class="row p-4 mb-5 text-center">'
					htmls += '<br><strong>등록된 후기가 없습니다.</strong></br>'
				} else {
                    $(list).each(function(){	
						htmls += '<div class="row p-4 border-bottom">'
						htmls += '<div class="col-3">'
						switch(this.star){
						case 1: htmls += '<a style="color:gold;">★☆☆☆☆&nbsp;</a>'; break;
						case 2: htmls += '<a style="color:gold;">★★☆☆☆&nbsp;</a>'; break;
						case 3: htmls += '<a style="color:gold;">★★★☆☆&nbsp;</a>'; break;
						case 4: htmls += '<a style="color:gold;">★★★★☆&nbsp;</a>'; break;
						case 5: htmls += '<a style="color:gold;">★★★★★&nbsp;</a>'; break;
						}
						htmls += this.star+'　'+this.userId+'</div>'
						if(id == this.userId){
							htmls += '<div class="col-9 text-end" id="icons">'
							htmls += '	<i class="bi bi-pencil-square" id="reviewmodify" data-review-no="'+this.no+'"></i>&nbsp;'
							htmls += '	<i class="bi bi-trash-fill" id="reviewdelete" data-review-no="'+this.no+'"></i>'
							htmls += '</div>'
						}
						htmls += '<div>'+this.date+'</div>'
						htmls += '<div class="col-12 mt-2" id="content'+this.no+'">'+this.content+'</div>'
						htmls += '<div class="row mt-2">'
						if(this.pic.length>0){
							var picNumber = this.pic.length;
							for(var i=0;i<picNumber;i++){
								htmls += '<div class="col-2" class="'+this.no+'">'
								htmls += '<a href=\"../../../resources/images/att/review/'+this.pic[i]+'" data-fancybox>'
								htmls += '<img src=\"../../../resources/images/att/review/'+this.pic[i]+'" style="width:100px;height:100px;object-fit:cover" data-bs-toggle="modal" data-bs-target="#exampleModalToggle"></a>'
								htmls += '</div>'
							}
						}
						htmls += '</div>'
						htmls += '</div>'
                     
                	});	//each end
                	
    				var pagination = result.pagination;
    				if(pagination.totalRecords > 0){
    					htmls += '<div class="row mb-3 mt-4">'
    					htmls += '<div class="col">'
    					htmls += '<nav>'
						htmls += '<ul class="pagination justify-content-center">'
						htmls += '<li class="page-item '+(pagination.existPrev ? '' : 'disabled')+'">'
						htmls += '<a class="page-link" href="detail.nadri?no='+no+'&page='+pagination.prevPage+'" data-page="'+pagination.prevPage+'">이전</a>'
						htmls += '</li>'
						var currentPage = pagination.currentPage;
						var beginPage = pagination.beginPage;
						var endPage = pagination.endPage;
						for(var num=beginPage; num <= endPage; num++){
							htmls += '<li class="page-item '+ (pagination.currentPageNo == num ? 'active' : '' ) + '">'
							htmls += '<a class="page-link" href="detail.nadri?no='+no+'&page='+num+'" data-page="'+num+'">'+num+'</a>'
							htmls += '</li>'	
						}   			

					htmls += '<li class="page-item '+(pagination.existNext ? '' : 'disabled')+'">'
					htmls += '<a class="page-link" href="detail.nadri?no='+no+'&page='+pagination.nextPage+'" data-page="'+pagination.nextPage+'">다음</a>'
					htmls += '</li>'
					htmls += '</ul>'
					htmls += '</nav>'
					htmls += '</div>'
					htmls += '</div>'
					
    				}		
                	
				}
				$("#review").html(htmls);
			}	   // Ajax success end
		});	// Ajax end
	}

	
	/* 리뷰 페이지 변경 */
	 $("#review").on('click', '.page-link', function(event){
		 event.preventDefault();
		 currentPage = $(this).attr("data-page")
	  	 getReviewList();
	 });
	
	/* 후기등록 */
	$("#register-review").click(function(){
		var textarea = document.getElementById("textarea");
		var form = document.reviewform;

		// 별점 여부 확인
		var star = document.getElementsByName("star");
		var starvalue = null;
		for(var i=0;i<star.length;i++){
			if(star[i].checked == true){ 
				starvalue = star[i].value;
			}
		}
		if(starvalue == null){
            alert("별점을 선택하세요"); 
			return false;
		}
		
		// 내용 유무 확인
		if(textarea.value.trim()==""){
			alert("내용을 입력해주세요");
			return false;
		}
		
		var doubleCheck = confirm("등록하시겠습니까?")		
		if(doubleCheck){
			form.action="addreview";
			form.method="post";
			form.submit();
		} else{}	
	})
		
	/* 후기 삭제 */
	$("#review").on('click', '#reviewdelete', function(){
		var reviewNo = $(this).data("review-no");
		var doubleCheck = confirm("삭제하시겠습니까?")		
		if(doubleCheck){
			$.ajax({
				url: "delete",
				type:"post",
				data:{reviewNo:reviewNo},
				success:function(){
					document.location.reload();
				},
				error:function(error){
					console.log(error);
				}
			})
		} else{}
	});
	
	/* 후기 수정 */
	$("#review").on('click','#reviewmodify', function(){
		var reviewNo = $(this).data("review-no");
		editReview(reviewNo);
		$('#reviewmodify').hide();
		$('#reviewdelete').hide();
	})

	function editReview(reviewNo){
		var htmls="";
		htmls += '<textarea class=\"form-control\" name="content" id="editContent" maxlength="500" rows=\"4\" style="resize: none">'+$('div#content'+reviewNo).text()+'</textarea>';
		htmls += '<div class="text-end mt-2">';
		htmls += '	<button class="btn btn-primary" id="saveModify">저장</button>';
		htmls += '	<a class="btn btn-secondary" id="cancelModify">취소</a>';
		htmls += '</div>';
		$('#content'+reviewNo).html(htmls);
	}
	
	$("#review").on('click', '#saveModify', function(){
		var content = $("#editContent").val();
		var no = $("#reviewmodify").data("review-no");
		$.ajax({
			url: "modify",
			type:"post",
			data:{reviewNo:no, content:content},
			success:function(){
				getReviewList();
			},
			error:function(error){
				console.log(error);
			}
		})
	})
	
	$("#review").on('click','#cancelModify', function(){
		getReviewList();
	})


});
</script>
</body>
</html>