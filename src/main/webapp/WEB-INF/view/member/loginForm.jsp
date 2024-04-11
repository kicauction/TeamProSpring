<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.lo {
	background: black;
	color: white;
	padding: 10px 40px 10px 40px;
}

.nlogin {
	position: relative;
	border: 5px solid #ddd; /* 테두리 스타일 정의 */
	margin-bottom: 100px; /* 푸터 높이에 맞춰 조정 */
	
}

.tem {
	margin-bottom: 400px;
}
</style>

<body>
	<div class="tem"></div>
	<div class="main-content">
		<form class="validation-form" novalidate action="loginPro">

			<div class="nlogin" style="margin-top: -280px;">
				<ul>
					<li class="nl_sitename">로그인</li>
					<li><input type="text" class="nlogin_input"
						placeholder="아이디를 입력하세요." name="id" id="id" maxlength="50"
						style="IME-MODE: disabled;"></li>
					<li><input type="password" class="nlogin_input"
						placeholder="비밀번호를 입력하세요." style="margin: 13px 0 25px 0;"
						name="pass" id="pass"  maxlength="20"></li>


					<li><button class="lo" type="submit"
							style="width: 100%; height: 40px; font-size: 15px;">로그인</button></li>


					<li class="nl_bottom"><span  class="nl_bottom_left"><a
							href="../member/agree">회원가입</a></span><span
						class="nl_bottom_right"><a href="${pageContext.request.contextPath}/member/findIdForm">아이디 찾기 / </a><span
							class="nl_bottom_dummy"></span><a
							href="${pageContext.request.contextPath}/member/findIdForm">비밀번호 찾기</a></span></li>
					<li style="margin-top: 20px;"><span class="nl_social_bg">&nbsp;</span><span
						class="nl_social_txt">소셜 아이디로 로그인</span><span class="nl_social_bg">&nbsp;</span></li>
					<li><a href="javascript:;" onclick="sns_href('/auth/kakao')"><span
							class="nl_social_kakao">카카오</span></a> <a href="javascript:;"
						onclick="sns_href('/auth/google')"><span
							class="nl_social_google">구글</span></a></li>
					<!--<li>
				<a href="javascript:;" onclick="sns_href('/auth/naver')"><span class="nl_social_naver">네이버</span></a>
				<a href="javascript:;" onclick="sns_href('/auth/facebook')"><span class="nl_social_facebook">페이스북</span></a>
			</li>-->
				</ul>
			</div>

			<input type="hidden" id="sns_login" value="true">
		</form>
	</div>
</body>