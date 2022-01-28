<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-3 order-md-last detail">
	<form id="attr-option" action="#" method="post">
		<div class="rounded mb-3 p-4" style="background-color:#f5f6f7;">
			<h5><strong>티켓구매</strong></h5>
			
			<div class="border p-4 mt-3" style="background-color:white;">
				<div class="mb-3">
				<!-- forEach -->
					<strong>날짜</strong>
					<input type="Date" name="attdate" id="startdate">
				</div>
				<div class="optionselect border rounded p-3">
					<div class="row mb-2">
						<div class="col">
							<h5><strong>대인 주간권</strong></h5>
						</div>
					</div>
					<div class="row text-end">
						<div class="col-8">
							<a style="font-size:18px;">1인 0000원</a>
						</div>
						<div class="col-4">
							<h5>
							<i class="bi bi-arrow-left-circle"></i>
							&nbsp;0&nbsp;
							<i class="bi bi-arrow-right-circle"></i>
							</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="mt-3 text-end">
				<button class="btn btn-primary btn-lg">결제하기</button>
			</div>					
		</div>
	</form>

	<div class="input-group text-center border rounded p-4 ">
	모달창으로 발급가능한 쿠폰 띄우기
	</div>
</div>