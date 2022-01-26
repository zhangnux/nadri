<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
::placeholder {
	font-size: 0.8em;
}
</style>
</head>
<body>
	<div class="container">
		<form>
		
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" class="form-control" placeholder="Enter username" id="uesrname">
			</div>
			
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" placeholder="Enter password" id="password">
			</div>
			
			<div class="form-group">
				<label for="email">Email</label>
				<input type="email" class="form-control" placeholder="Enter email" id="email">
			</div>
			
		</form>
			<button id="btn-save" class="btn btn-primary">회원가입</button>
	</div>
<script type="text/javascript">
	let index = {
			init: function() {
				$("#btn-save").on("click",()=>{	// function(){}이 아니라 ()=>{} this를 바인딩하기 위해
					this.save();
				});
			},	
			save:function(){
				//alert('user의 save함수 호출됨');
				let data = {
						username: $("#username").val(),
						password: $("#password").val(),
						email: $("#email").val()
				};
				
				//console.log(data);
				
				// ajax 호출시 default가 비동기 호출
				// ajax 통신을 이용해서 3개의 데이터를 json으로 변경해서 insert 요청
				// ajax가 통신 성공하고 서버가 json을 리턴해주면 자동으로 자바오브젝트로 변환
				$.ajax({
					type:"POST",
					url:"/api/user",
					data: JSON.stringify(data), // http body 데이터
					contentType:"application/json; charset=utf-8", // body데이터가 어떤 타입인지
					dataType:"json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든것이 String(문자열), json이라고 적으면 javascript 오브젝트
				}).done(function(resp){
					alert("회원가입이 완료되었습니다.");
					//alert(resp);
					location.href="http://localhost/home.nadri"
				}).fail(function(error){
					alert(JSON.stringify(error))
				});
			}
				
		}
		
	index.init();
	
</script>	
</body>
</html>