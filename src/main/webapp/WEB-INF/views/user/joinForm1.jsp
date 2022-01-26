<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<link href='https://www.myrealtrip.com/opensearch.xml' rel='search' title='마이리얼트립 검색' type='application/opensearchdescription+xml'>
<link href='https://d2yoing0loi5gh.cloudfront.net/assets/logo/ic-mobile-76-59c4321eae219afd9cebfb870646b877f48a5b63adab68a37604891800aed0da.png' rel='apple-touch-icon-precomposed'>
<link href='https://d2yoing0loi5gh.cloudfront.net/assets/logo/ic-mobile-76-59c4321eae219afd9cebfb870646b877f48a5b63adab68a37604891800aed0da.png' rel='apple-touch-icon'>
<link href='https://d2yoing0loi5gh.cloudfront.net/assets/logo/ic-mobile-76-59c4321eae219afd9cebfb870646b877f48a5b63adab68a37604891800aed0da.png' rel='apple-touch-icon' sizes='76x76'>
<link href='https://d2yoing0loi5gh.cloudfront.net/assets/logo/ic-mobile-120-0de06603ad3e4427cb29b5e4ef6833021cc52ea642ee76e843ed997209049bf5.png' rel='apple-touch-icon' sizes='120x120'>
<link href='https://d2yoing0loi5gh.cloudfront.net/assets/logo/ic-mobile-152-cc369a832b7a69d0c0b63c3914168b58e732a26729d72e976e7f729b923ee302.png' rel='apple-touch-icon' sizes='152x152'>
<script src="//static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<link rel="shortcut icon" type="image/x-icon" href="https://d2yoing0loi5gh.cloudfront.net/assets/favicon-e7fc64f202376533d86106e6f712ed41eee1e843dbc5de3b2765938656f8eb93.ico" />
<link rel="stylesheet" media="screen" href="https://dffoxz5he03rp.cloudfront.net/build/production/3bf38244ade1e08a3590751610972b28b757f454/vendor.css" />
<link rel="stylesheet" media="all" href="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/application_template-de4b46d803183faabde80789fd23fd7db887a0e61571b261fc5ad239dd577c77.css" />
<link rel="stylesheet" media="all" href="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/application-350a66230ef5223f7538cd87eb6de7d3914e4303ee278492258160fc34f1b871.css" />
<link rel="stylesheet" media="screen" href="https://dffoxz5he03rp.cloudfront.net/build/production/3bf38244ade1e08a3590751610972b28b757f454/application.css" />
<!--[if lte ie 9]>
<link rel="stylesheet" media="all" href="https://d2yoing0loi5gh.cloudfront.net/assets/kitty/ie-9d45c936e161a8a481c685c42ae102027b53773e47f535dce2b62fff5ba559f4.css" />
<![endif]-->
<body>
	<div class="container">
		<div class="row mb-3">
			<div class="col">
				<h1>회원가입 폼</h1>
			</div>
		</div>
	</div>
	<div class="EmailSignUp-module__container--vz1Yk">
		<form action="/users" method="post">
			<input type="hidden" name="authenticity_token" value="">
			<div class="SignUpInfo-module__container--KC8La">
				<div class="SignUpInfo-module__row--c3MxP">
					<label class="TextField-module__label--X5308" for="userName"><p>이름 *</p>
						<div class="">
							<input type="text"
								class="TextField-module__input--Yzl6Y TextField-module__medium--rlb82"
								id="userName" name="user[username]" placeholder="이름을 입력해주세요."
								value="">
						</div>
					</label>
				</div>
				<div class="SignUpInfo-module__row--c3MxP">
					<label class="TextField-module__label--X5308" for="userEmail"><p>이메일 *</p>
						<div class="">
							<input type="email"
								class="TextField-module__input--Yzl6Y TextField-module__medium--rlb82"
								id="userEmail" name="user[email]" placeholder="ID@example.com"
								value="">
						</div>
					</label>
				</div>
				<div class="SignUpInfo-module__row--c3MxP">
					<label class="TextField-module__label--X5308" for="userPassword"><p>비밀번호 *</p>
						<div class="">
							<input type="password"
								class="TextField-module__input--Yzl6Y TextField-module__medium--rlb82"
								id="userPassword" name="user[password]"
								placeholder="영문, 숫자, 특수문자 2가지 조합 6~15자" value="">
						</div>
					</label>
				</div>
				<div class="SignUpInfo-module__row--c3MxP">
					<label class="TextField-module__label--X5308"
						for="userPasswordConfirm"><p>비밀번호 확인 *</p>
						<div class="">
							<input type="password"
								class="TextField-module__input--Yzl6Y TextField-module__medium--rlb82"
								id="userPasswordConfirm" name="user[password_confirmation]"
								placeholder="비밀번호를 한번 더 입력해주세요." value="">
						</div>
					</label>
				</div>
			</div>
			<div class="SignUpAgree-module__container--MPv7Z">
				<label
					class="Checkbox-module__label--pxzwl Checkbox-module__medium--TfyGm"
					for="agreeAll"><input type="checkbox" id="agreeAll"
					class="Checkbox-module__input--YII_S Checkbox-module__medium--TfyGm"
					name="agreeAll" value="true"><strong>전체 약관 동의</strong></label>
				<ul class="SignUpAgree-module__agrees--DYhdP">
					<li class="SignUpAgree-module__row--TzGhz"><div
							class="SignUpAgree-module__item--LNbPp">
							<label
								class="Checkbox-module__label--pxzwl Checkbox-module__medium--TfyGm"
								for="agree_agreement"><input type="checkbox"
								id="agree_agreement"
								class="Checkbox-module__input--YII_S Checkbox-module__medium--TfyGm"
								name="agree_agreement" value="true"></label>
							<div class="SignUpAgree-module__label--qZxND">
								<div class="TermPopup-module__wrapper--UqnLw">
									<div role="button" tabindex="0">
										회원 가입 및 운영약관 동의 (필수)<img
											class="TermPopup-module__term-arrow--IAwia"
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
											alt="arrow">
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="SignUpAgree-module__row--TzGhz"><div
							class="SignUpAgree-module__item--LNbPp">
							<label
								class="Checkbox-module__label--pxzwl Checkbox-module__medium--TfyGm"
								for="agree_privacyUse"><input type="checkbox"
								id="agree_privacyUse"
								class="Checkbox-module__input--YII_S Checkbox-module__medium--TfyGm"
								name="agree_privacyUse" value="true"></label>
							<div class="SignUpAgree-module__label--qZxND">
								<div class="TermPopup-module__wrapper--UqnLw">
									<div role="button" tabindex="0">
										개인정보 수집 및 이용 (필수)<img
											class="TermPopup-module__term-arrow--IAwia"
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
											alt="arrow">
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="SignUpAgree-module__row--TzGhz"><div
							class="SignUpAgree-module__item--LNbPp">
							<label
								class="Checkbox-module__label--pxzwl Checkbox-module__medium--TfyGm"
								for="agree_location"><input type="checkbox"
								id="agree_location"
								class="Checkbox-module__input--YII_S Checkbox-module__medium--TfyGm"
								name="user[location_data_agree]" value="true"></label>
							<div class="SignUpAgree-module__label--qZxND">
								<div class="TermPopup-module__wrapper--UqnLw">
									<div role="button" tabindex="0">
										위치정보 이용약관 (선택)<img class="TermPopup-module__term-arrow--IAwia"
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
											alt="arrow">
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="SignUpAgree-module__row--TzGhz"><div
							class="SignUpAgree-module__item--LNbPp">
							<label
								class="Checkbox-module__label--pxzwl Checkbox-module__medium--TfyGm"
								for="agree_marketing"><input type="checkbox"
								id="agree_marketing"
								class="Checkbox-module__input--YII_S Checkbox-module__medium--TfyGm"
								name="agree_marketing" value="true"></label>
							<div class="SignUpAgree-module__label--qZxND">
								<div class="TermPopup-module__wrapper--UqnLw">
									<div role="button" tabindex="0">
										특가 항공권 및 할인 혜택 안내 동의 (선택)<img
											class="TermPopup-module__term-arrow--IAwia"
											src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxwYXRoIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjQ0VENERBIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTYgNGw0IDQuMDAyTDYuMDA1IDEyIi8+Cjwvc3ZnPgo="
											alt="arrow">
									</div>
								</div>
							</div>
						</div>
						<p class="SignUpAgree-module__subcription--O90m3">프로필 &gt; 알림
							설정에서 변경 가능</p>
						<div class="SignUpAgree-module__subscriptions--s1gwQ">
							<input type="checkbox" name="user[subscription_settings][email]"
								value="true"><input type="checkbox"
								name="user[subscription_settings][sms]" value="true"><input
								type="checkbox" name="user[subscription_settings][push]"
								value="true">
						</div></li>
				</ul>
				<ul class="SignUpAgree-module__notices--Ckoq5">
					<li class="SignUpAgree-module__notice--KcLZC">*선택 항목을 동의하지 않아도
						서비스를 이용하실 수 있습니다.</li>
					<li class="SignUpAgree-module__notice--KcLZC">*회원 가입 시 본인이 만
						14세 이상임에 동의하게 됩니다.</li>
				</ul>
			</div>
			<button type="submit"
				class="Button-module__button--nQweC Button-module__primary--loIc3 Button-module__large--vtisu Button-module__block--iT6b7 undefined"
				disabled="">회원가입</button>
		</form>
	</div>

</body>
</html>