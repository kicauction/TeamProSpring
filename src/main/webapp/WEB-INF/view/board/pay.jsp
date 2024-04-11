<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<!-- Bootstrap CSS -->

<style>
.lo {
	background: black;
	color: white;
	padding: 10px 40px 10px 40px;
}

.input-form {
	max-width: 700px;
	margin: 10px auto; /* 상하 여백은 auto로 설정하여 중앙 정렬 */
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	text-align: center;
	color: black;
}

.input-formprod {
	max-width: 700px;
	margin: 10px auto; /* 상하 여백은 auto로 설정하여 중앙 정렬 */
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	text-align: center;
	color: black;
}

.input-formhead {
	max-width: 700px;
	margin: 10px auto; /* 상하 여백은 auto로 설정하여 중앙 정렬 */
	padding: 5px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	text-align: center;
	color: black;
}
</style>

</head>
<body>
	<script>
		function handleMemoChange() {
			var memoSelect = document.getElementById("memoSelect");
			var customMemoInput = document.getElementById("customMemoInput");

			// "직접입력"이 선택되면 입력 필드를 나타냄
			if (memoSelect.value === "직접입력") {
				customMemoInput.style.display = "block";
			} else {
				// 다른 선택지가 선택되면 입력 필드를 숨김
				customMemoInput.style.display = "none";
			}
		}
	</script>
	<div class="container">

		<div class="input-formhead col-md- mx-auto text-center">
			<h2 class="mb-3" style="text-align: center">주문/결제하기</h2>
		</div>
	</div>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto text-center">
				<form class="validation-form" novalidate action="paypro">
					<table class="no-border">



						<tbody>
							<tr>
								<td><span style="font-size: 25px; font-weight: bold;">배송지</span>
									&nbsp;<br>입찰자 정보<br>${amem.name}<br>${amem.tel }<br> <input
									type="text" style="width: 400px; height: 30px;"
									value="${amem.address }" name="address" /><br>&nbsp; 배송메모
									입력<br> <select id="memoSelect"
									style="width: 400px; height: 30px;" name="memo"
									onchange="handleMemoChange()">
										<option value="직접입력">선택안함</option>
										<option value="직접입력">직접입력</option>
										<option value="문앞에놓아주세요">문 앞에 놓아주세요</option>
										<option value="부재시연락주세요">부재 시 연락 주세요</option>
										<option value="배송전미리연락해주세요">배송 전 미리 연락해 주세요</option>
										<!-- 추가적인 선택지는 필요에 따라 추가할 수 있습니다 -->
								</select> <!-- 동적으로 나타날 입력 필드 --> <input type="text" id="customMemoInput"
									style="display: none; width: 400px; height: 100px;" name="memo"
									placeholder="배송메모를 입력해주세요"><br>&nbsp;</td>
							</tr>
						</tbody>

						<tbody>
							<tr>
								<td><span style="font-size: 25px; font-weight: bold;">낙찰상품</span><br>
									<div style="display: flex; align-items: flex-start;">
										<a href="boardInfo?num=${board.pnum}"> <img
											src="${pageContext.request.contextPath}/image/board/${board.file1}"
											style="width: 200px; height: 200px;" alt="">
										</a>
										<div
											style="margin-left: 80px; margin-top: 10px; font-weight: bold;">
											<div style="font-size: 30px;">${board.pname}</div>
											판매자:${board.userid}<br> 상품정보:${board.subject}<br>
											등록일시:
											<fmt:formatDate value="${board.idate}"
												pattern="yyyy년 MM월 dd일 HH시" />
											<br> <span
												style="color: blue; font-weight: bold; font-size: 20px;">
												<fmt:formatNumber value="${board.buy}" pattern="#,##0" />원
											</span>
										</div>
									</div></td>

							</tr>
						</tbody>


		<tbody>
    <tr>
        <td>
            <span style="font-size: 25px; font-weight: bold;">결제수단</span><br>

            <input type="radio" id="bankTransfer" name="paymentMethod" value="계좌이체" onclick="showBankInfo()">
            <label for="bankTransfer">계좌이체</label><br>

            <input type="radio" id="kakaoPay" name="paymentMethod" value="카카오페이" onclick="hideBankInfo()">
            <label for="kakaoPay">카카오페이</label><br>

            <input type="radio" id="naverPay" name="paymentMethod" value="네이버페이" onclick="hideBankInfo()">
            <label for="naverPay">네이버페이</label><br>

            <input type="radio" id="cardPayment" name="paymentMethod" value="카드결제" onclick="hideBankInfo()">
            <label for="cardPayment">카드결제</label>

            <!-- 추가적인 창 -->
            <div id="bankInfo" style="display: none;">
                계좌번호: <input type="hidden" type="text" >00은행<br>
                은행명: <input type="hidden" type="text" >000-00000-000000<br>
            </div>
        </td>
       
    </tr>
    <tr>
     <td>
        <span style="font-size: 25px; font-weight: bold;">마일리지 사용</span><br>
        </td>
    </tr>
   
</tbody>



					</table>
					 <button class="lo" type="submit">결제하기</button>
				</form>
			</div>
		</div>
	</div>

<script>
    function showBankInfo() {
        var bankInfo = document.getElementById("bankInfo");

        // 계좌이체를 선택하면 추가적인 창을 나타냄
        bankInfo.style.display = "block";
    }

    function hideBankInfo() {
        var bankInfo = document.getElementById("bankInfo");

        // 다른 결제수단을 선택하면 추가적인 창을 숨김
        bankInfo.style.display = "none";
    }
</script>
</body>
</html>