<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<style>
    .error {
        border: 1px solid red; /* 빨간색 테두리 */
        background-color: #ffcccc; /* 연한 빨간색 배경 */
    }
</style>


<div id="mypage">
		<form class="validation-form" novalidate action="memberPro" method="post" name="f" onsubmit="return validateForm()">
 	

		<div class="login_title">
			<div class="login_title_cover">
				<div class="order_title_table new">
					<div class="tit">회원가입</div>
					<ul>
						<li><span class="circle_btn"> <img
								src="${pageContext.request.contextPath}/image/renew220916/b_click.png" alt="">
						</span>약관동의</li>
						<li><span class="circle_btn"> <img
								src="${pageContext.request.contextPath}/image/renew220916/b_click.png" alt="">
						</span>개인정보 입력</li>
						<li><span class="circle_btn"> <img
								src="/images/renew220916/b_click_01.png" alt="">
						</span></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- <div id="mypage"> -->
		<div class="mypage_title new">
			<div class="login_table">
				<div class="lti_title">
					<div class="tit">개인정보 입력</div>
					<div class="txt">모든 항목은 필수입력 사항입니다. 올바른 정보가 아닐시 정상적인 서비스 이용이
						불가할 수도 있습니다.</div>
				</div>
				<ul class="newgaip_table">
					<li><span class="ngcolumn_icon">
					 <img src="${pageContext.request.contextPath}/image/renew220916/20200528_01.png" alt="">	
					 </span> <span class="ngcolumn_title"> 아이디 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1" placeholder="영문 또는 숫자 6~20자" name="id"
							value="" maxlength="20">
					</span></li>
					
						<li><span class="ngcolumn_icon">
					 <img src="${pageContext.request.contextPath}/image/renew220916/20200528_03.png" alt="">	
					 </span> <span class="ngcolumn_title"> 이름 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1" placeholder="" name="name"
							value="" maxlength="20">
					</span></li>
					
					<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_02.png" alt="" >
					</span> <span class="ngcolumn_title"> 비밀번호 </span> <span
						class="ngcolumn_subject"> <input type="password"
							class="input_box_rev1" placeholder="영문/숫자/특수문자 조합 6~20자"
							name="pass" id="password" maxlength="20" onkeyup="comparePasswords()">
					</span></li>
					
					<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_02_open.png" alt=""
							id="pw_chk_img2">
					</span> <span class="ngcolumn_title"> 비밀번호 확인 </span> <span
						class="ngcolumn_subject"> <input type="password"
							class="input_box_rev1" name="pass2"
							id="password_confirm"  maxlength="20" onkeyup="comparePasswords()">
					</span></li>

							<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_07.png" alt="">
					</span> <span class="ngcolumn_title"> 휴대전화번호 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1" placeholder="- 없이 입력" name="tel"
							id="mobile_auth"
							maxlength="11">
					</span> </li>

					<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_05.png" alt="">
					</span> <span class="ngcolumn_title"> 은행명 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1" 
							name="bank" id="" maxlength="8">
					</span>
						</li>
						
						<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_08.png" alt="">
					</span> <span class="ngcolumn_title"> 계좌번호 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1"  placeholder="- 없이 입력" name="account"
							>
					</span> </li>
						
					<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_06.png" alt="">
					</span> <span class="ngcolumn_title"> 이메일 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1" name="email" id="email"
							>
					</span>
						</li>
							
					<li><span class="ngcolumn_icon"> <img
							src="${pageContext.request.contextPath}/image/renew220916/20200528_01.png" alt="">
					</span> <span class="ngcolumn_title"> 주소 </span> <span
						class="ngcolumn_subject"> <input type="text"
							class="input_box_rev1" name="address" id=""
							>
					</span>
						</li>
					
					
				</ul>
				<div class="caspi">
					<button class="" type="submit"
							style="width: 100%; height: 40px; font-size: 15px; background-color:black; color:white;  font-weight: bold; ">회원가입</button>
				</div>
			</div>
		</div>
		<!-- </div> -->






	</form>
<script>
    function validateEmail(email) { //이메일 필드의 이메일 형식 지정
        var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        return re.test(String(email).toLowerCase());
    }

    function comparePasswords() {
        var pass = document.forms["f"]["pass"].value;
        var pass2 = document.forms["f"]["pass2"].value;

        if (pass !== pass2) {
            document.forms["f"]["pass"].classList.add("error");
            document.forms["f"]["pass2"].classList.add("error");
        } else {
            document.forms["f"]["pass"].classList.remove("error");
            document.forms["f"]["pass2"].classList.remove("error");
        }
    }


    function validateForm() { //필드의 모든값이 채워져야하는 조건
        let id = document.forms["f"]["id"].value;
        let name = document.forms["f"]["name"].value;
        let pass = document.forms["f"]["pass"].value;
        let pass2 = document.forms["f"]["pass2"].value;
        let tel = document.forms["f"]["tel"].value;
        let bank = document.forms["f"]["bank"].value;
        let account = document.forms["f"]["account"].value;
        let email = document.forms["f"]["email"].value;
        let address = document.forms["f"]["address"].value;

        if (id == "" || name == "" || pass == "" || pass2 == "" || tel == "" || 
        		bank == "" || account == "" || email == "" || address == "") {
            alert("모든 정보를 입력해주세요."); //필드가 하나라도 비었을 시 알림
            return false;
        }

        if (!validateEmail(email)) { //이메일 형식이 올바르지 않을 때 알림
            alert("유효하지 않은 이메일 형식입니다.");
            document.forms["f"]["email"].classList.add("error");
            return false;
        }

        comparePasswords();
        if (pass !== pass2) { //비밀번호가 일치하지 않을 때 알림
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        return true;
    }
</script>
</div>
</html>