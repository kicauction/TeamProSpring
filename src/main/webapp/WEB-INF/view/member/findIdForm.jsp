<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<div id="mypage">

	<div class="login_title">
		<div class="login_title_cover">
			<div class="order_title_table new">
				<div class="tit">아이디, 비밀번호 찾기</div>
			</div>
		</div>
	</div>
	<!-- <div id="mypage"> -->
	<div class="mypage_title new">
		<div class="login_table">
			<ul class="login_tabs">
				<li data-class="idname" class="on">아이디 찾기</li>
				<li data-class="password" class="">비밀번호 찾기</li>
			</ul>
			<div class="login_find idname" style="display: block;">
				<form class="validation-form" action="findIdPro" method="post">
					<div class="login_table_inner">
						<div class="lti_title">
							가입하셨던 성함과 이메일을 기입해 주십시오.

							<div class="lti_input_box">
								<input type="text" class="input_login"
									placeholder="성함을 입력해 주십시오" name="name" required> <input
									type="text" class="input_login2" placeholder="이메일을 입력해 주십시오"
									name="email" required>
							</div>
						</div>&nbsp;<br>
						<button class="" type="submit"
							style="width: 100%; height: 40px; font-size: 15px; background-color:black; color:white; font-weight:bold;">ID 찾기</button>
					</div>
				</form>

			</div>


			<div class="login_find password" style="display: none;">
				<form class="validation-form" action="findPasswordPro" method="post">
					<div class="login_table_inner">
						<div class="lti_title">가입하셨던 아이디와 휴대전화번호를 기입해 주십시오.</div>

						<div class="lti_input_box">
							<input type="text" class="input_login"
								placeholder="아이디를 입력해 주십시오" name="id" required> <input
								type="text" class="input_login2" placeholder="이름을 입력해 주십시오"
								name="name" required> <input type="text"
								class="input_login2" placeholder="이메일을 입력해 주십시오" name="email"
								required>

						</div>
					</div>&nbsp;<br>
						<button class="" type="submit"
							style="width: 100%; height: 40px; font-size: 15px; background-color:black; color:white; font-weight:bold;">비밀번호 찾기</button>
					
				
				</form>
			</div>








			<div class="fiji">
				<p class="fiji_tit">비밀번호 찾기가 되지 않거나, 이메일로 비밀번호가 오지 않을 경우!</p>
				<p class="fiji_txt">
					임시 비밀번호는 회원정보상에 있는 회원님의 이메일로 임시 비밀번호가 발급되어 발송됩니다.<br> ( 재전송을
					할때마다 비밀번호는 매번 변경되오니 꼭 마지막 수신한 비밀번호를 이용해 로그인하여 주십시오.<br> 로그인
					이후에는 회원정보수정에서 새로운 비밀번호로 변경해 주십시오. )<br> 이메일 변경 등으로 임시 비밀번호 수신이
					어려운 경우에는 아래의 고객센터로 문의주시면 조치해 드리겠습니다.
				</p>
				<p class="fiji_center">
					고객센터&nbsp;&nbsp;<span class="tel">0000-0000</span>
				</p>
			</div>
		</div>
	</div>
	<!-- </div> -->

	<script>
		$(function() {
			$(".login_find").hide();
			$(".login_find:first").show();
			$(".login_btn").hide();
			$(".login_btn:first").show();

			$("ul.login_tabs li").click(function() {
				$("ul.login_tabs li").removeClass("on");
				$(this).addClass("on");
				$(".login_find").hide();
				$(".login_btn").hide();
				var activeClass = $(this).attr("data-class");
				$("." + activeClass).show();
			});
		});
	</script>

</div>
</html>