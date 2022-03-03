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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05a28d0efc0b752b59c9206aaecd6f2&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>나드리::즐길거리</title>
</head>
<style>
	html, body {
		width: 100%;
		height: 100%;
	}

	.container-fluid
	{
    position:fixed;
    overflow: auto;
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
	
	textarea{
	    border: none;
	    resize: none;		
	}
</style>
<body>
<div class="container-fluid bg-light">
	<div class="row">
		<div class="col-2" style="position: fixed; height: 100%;">
			<c:set var="menu" value="attrform"/>
			<%@ include file="../manager/common/navbar.jsp" %>
		</div>
		<div class="col-10 mt-5 mb-3" style="margin-left: 350px;">
			<div class="row">
				<div class="col">
					<h1><strong>액티비티 등록</strong></h1>
				</div>
			</div>
		</div>
		<form method="post" action="addcomplete" enctype="multipart/form-data">
			<div class="row p-3 border-top border-3 border-dark" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>유형 <span style="color:red;">*</span></strong></h5></div>
				<div class="col-auto">
					<select name="category">
						<option value="투어">투어</option>
						<option value="입장권">입장권</option>
						<option value="액티비티">액티비티</option>
						<option value="클래스">클래스</option>
					</select>
				</div>
			</div>
			<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>이름 <span style="color:red;">*</span></strong></h5></div>
				<div class="col-auto">
					<input type="text" maxlength="50" name="name" size="50" placeholder="50자 내외로 작성해주세요" class="essential">
				</div>
			</div>
			<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>주소 <span style="color:red;">*</span></strong></h5></div>
				<div class="col-auto">
					<input type="hidden" name="place">
					<input type="text" size="40" name="address" id="address" class="essential">
					<input type="hidden" name="lat">
					<input type="hidden" name="lng">
					<a type="button" id="reset" class="btn btn-outline-dark">초기화</a>
				</div>
			</div>
			<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>기간</strong></h5></div>
				<div class="col-auto">
					시작일 <input type="date" name="startDate" id="startDate">
				</div>
				<div class="col-auto">
					종료일 <input type="date" name="endDate" id="endDate">
				</div>
			</div>			
			<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>썸네일 <span style="color:red;">*</span></strong></h5></div>
				<div class="col-auto">
					<input type="file" name="thumbnail" accept="image/gif, image/jpeg, image/png">
				</div>
			</div>
			<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>소개요약 <span style="color:red;">*</span></strong></h5></div>
				<div class="col-auto">
					<textarea cols="100" rows="10" placeholder="상품 리스트에 출력 될 소개 메세지입니다. 150자 내외로 작성해주세요." name="content" maxlength="150" class="essential"></textarea>
				</div>
			</div>
			<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>소개사진</strong></h5></div>
				<div class="col-auto">
					<input type="file" name="photo" accept="image/gif, image/jpeg, image/png">
				</div>
			</div>		
			<div class="row border-top border-bottom p-3" style="margin-left: 350px; margin-right:50px;">
				<div class="col-2"><h5><strong>소개글</strong></h5></div>
				<div class="col-auto">
					<textarea cols="100" rows="15" placeholder="상품 상세정보에 출력 될 소개 메세지입니다. 2000자 내외로 작성해주세요." name="detail" maxlength="2000"></textarea>
				</div>
			</div>
			<div class="row p-3" style="margin-left: 350px;">
				<div class="col-2"><h5><strong>옵션여부 <span style="color:red;">*</span></strong></h5></div>			
				<div class="col-auto"><strong>
					  <input type="radio" name="optionstat" value="1" checked>
					  	<label for="one">단일상품</label>　
					  <input type="radio" name="optionstat" value="2">
					  	<label for="option">옵션상품</label>
				</strong></div>
			</div>
			<div id="option">
			    <div class="row p-3" style="margin-left: 350px;">
			    	<div class="col-2"></div>
					<div class="col-2"><h5><strong>가격(1매)</strong></h5></div>
				</div>
				<div class="row p-1" style="margin-left: 350px;">
					<div class="col-2"></div>
					<div class="col-2"><input type="number" name="price" min=0  class="essential"></div>
					<input type="hidden" name="option">
				</div>
			</div>
			<div class="row p-3 border-top border-3 border-dark mt-5" style="margin-left: 350px; margin-right:50px;">
				<div class="col-1">
					<button class="btn btn-outline-dark" id="formSubmit">등록</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">

var today = new Date();
var dd = today.getDate()+1;
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 	
today = yyyy+'-'+mm+'-'+dd;
document.getElementById("startDate").setAttribute("min", today);
document.getElementById("startDate").setAttribute("value", today);  

var tomorrow = new Date();
var dd = tomorrow.getDate()+2;
var mm = tomorrow.getMonth()+1; //January is 0!
var yyyy = tomorrow.getFullYear();
 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
tomorrow = yyyy+'-'+mm+'-'+dd;	
document.getElementById("endDate").setAttribute("min", tomorrow);
document.getElementById("endDate").setAttribute("value", tomorrow);  

$("#formSubmit").click(function(){
	var valid = true;
	$("[class*='essential']").each(function(){
		if($(this).val()==''){
			alert("필수 항목을 모두 채워주세요")
			valid = false;
			return false;
		}
	})
	return valid;
});

$("input:radio[name=optionstat]").click(function(){
	 
    if($("input:radio[name=optionstat]:checked").val() == 1){
    	var htmls=""
       	htmls += "<div class=\"row p-3\" style=\"margin-left: 350px;\">"
       	htmls += "<div class=\"col-2\"></div>"
       	htmls += "<div class=\"col-2\"><h5><strong>가격(1매)</strong></h5></div>"
       	htmls += "</div>"
       	htmls += "<div class=\"row p-1\" style=\"margin-left: 350px;\">"
       	htmls += "<div class=\"col-2\"></div>"
       	htmls += "<div class=\"col-2\"><input type=\"number\" name=\"price\" min=0 class=\"essential\"></div>"
       	htmls += "</div>"
       	$("#option").html(htmls);    	
    }else{
   		htmls=""
       	htmls += "<div class=\"row p-3\" style=\"margin-left: 350px;\">"
       	htmls += "<div class=\"col-2\"></div>"
       	htmls += "<div class=\"col-3\"><h5><strong>옵션명</strong></h5></div>"
       	htmls += "<div class=\"col-2\"><h5><strong>가격(1매)</strong></h5></div>"
       	htmls += "</div>"
       	htmls += "<div class=\"row p-1\" style=\"margin-left: 350px;\">"
       	htmls += "<div class=\"col-2\"></div>"
       	htmls += "<div class=\"col-3\"><input type=\"text\" name=\"option\" maxlength=\"40\" size=\"40\" class=\"essential\"></div>"
       	htmls += "<div class=\"col-2\"><input type=\"number\" name=\"price\" min=0 class=\"essential\"></div>"
       	htmls += "<div class=\"col-auto\"><i class=\"bi bi-plus-circle\"></i></div>"
       	htmls += "</div>"
       	$("#option").html(htmls);
    }
});

var optionAdd = 1;

$("#option").on("click",".bi-plus-circle",function(){
	if(optionAdd!=5){
		var htmls=""
	    htmls += "<div class=\"optionList\">"
	    htmls += "<div class=\"row p-3\" style=\"margin-left: 350px;\">"
	    htmls += "<div class=\"col-2\"></div>"
	    htmls += "<div class=\"col-3\"><h5><strong>옵션명</strong></h5></div>"
	    htmls += "<div class=\"col-2\"><h5><strong>가격(1매)</strong></h5></div>"
	    htmls += "</div>"
	    htmls += "<div class=\"row p-1\" style=\"margin-left: 350px;\">"
	    htmls += "<div class=\"col-2\"></div>"
	    htmls += "<div class=\"col-3\"><input type=\"text\" name=\"option\" maxlength=\"40\" size=\"40\"></div>"
	    htmls += "<div class=\"col-2\"><input type=\"number\" name=\"price\" min=0></div>"
	    htmls += "<div class=\"col-auto\"><i class=\"bi bi-plus-circle\"></i></div>"
	    htmls += "<div class=\"col-auto\"><i class=\"bi bi-dash-circle\"></i></div>"
	    htmls += "</div>"
	    htmls += "</div>"
		$("#option").append(htmls);
	    optionAdd++;
	}
});

$("#option").on("click",".bi-dash-circle",function(){
	$(this).parent().parent().parent().remove();
	optionAdd--;
});

$('input[type=file]').change(function(){
	var imgFile = $('input[type=file]').val();
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

var geocoder = new kakao.maps.services.Geocoder();

$("#address").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
            $("#address").val(data.address);
            $("#address").prop("readonly",true);
            $("input[name=place]").val(data.sido);
            var juso =  $("#address").val();
        	geocoder.addressSearch(juso, callback);  
        }
    }).open()
});

var callback = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		$("input[name=lat]").val(result[0].y);
		$("input[name=lng]").val(result[0].x);
	}
};
    	
$("#reset").click(function(){
	$("#address").val("");
	$("#address").prop("readonly",false);
})

</script>
</body>
</html>