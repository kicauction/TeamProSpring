<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
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
<script>
function handleMemoChange() {
    var select = document.getElementById("memoSelect");
    var input = document.getElementById("customMemoInput");
    var selectedValue = select.value;

    if (selectedValue === "직접입력") {
        input.style.display = "block";
        input.value = "";  // 직접 입력을 위해 input을 비웁니다.
    } else {
        input.style.display = "none";
        input.value = selectedValue;  // select의 값을 input에 설정합니다.
    }
}

// 서버로 데이터 전송하기 전에 호출되는 함수
function prepareAndSendData() {
    var memo = document.getElementById("customMemoInput").value;

    // 서버에 데이터 전송하는 로직
    // 예: window.location.origin + "${pageContext.request.contextPath}/board/checkoutpro?num=${board.pnum}&pnum=${board.pnum}&memo=" + memo;
}

</script>


<div class="wrap">

	<div id="mypage">


		<div class="center_cover">
			<ul class="center_menu">
				<li>
					<div class="order_title_table">
						마이페이지
						<p class="en">MYPAGE</p>
					</div>
				</li>
				<li>
					<div class="guide_category">
						<div class="item">
							<p class="tit">경매내역</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/board/buyList">입찰
									중 / 입찰완료 상품</a> <a
									href="${pageContext.request.contextPath}/jumun/myList">판매등록상품</a>
								<a href="${pageContext.request.contextPath}/jumun/jumunList">찜한상품</a>
										<a href="${pageContext.request.contextPath}/jumun/endList">구매완료상품</a>
							</p>
						</div>


						<div class="item">
							<p class="tit">회원정보</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/member/tier"
									title="">나의등급</a> <a
									href="${pageContext.request.contextPath}/member/memberinfo">회원정보
									보기 / 수정</a> <a
									href="${pageContext.request.contextPath}/member/memberDeleteForm">회원탈퇴</a>
							</p>
						</div>
						<div class="item">
							<p class="tit">고객센터</p>
							<p class="txt">
								<a
									href="${pageContext.request.contextPath}/notice/noticeList?boardid=1">공지사항</a>
								<a
									href="${pageContext.request.contextPath}/notice/noticeList?boardid=2">자주묻는질문</a>
								<a
									href="${pageContext.request.contextPath}/notice/noticeList?boardid=3">1:1문의</a>
								<a href="${pageContext.request.contextPath}/notice/mynotice">나의
									1:1 문의글</a>
							</p>
						</div>
					</div>
				</li>
			</ul>
			<ul class="mypage_title">
					<li class="mypage_info_box">
					<div class="item">
						<p class="txt" style="margin-bottom: 5px;">WELCOME</p>
						<p class="txt">
							아이디<br><span class="num" style="font-weight:bold;">${amem.id }</span>
						</p>
						


					</div>
					
						<div class="item">
					
						<p class="txt" style="margin-top: 18px; ">
							등급<br>  <span class="num" style="font-weight:bold;">${Tier}</span>

						
						</p>
					</div>
					<div class="item">
					
						<p class="txt" style="margin-top: 18px;">
							마일리지<br>  <span class="num" style="font-weight:bold;"><fmt:formatNumber value="${amem.mile}" pattern="#,##0" />원</span>

						
						</p>
					</div>
					<div class="item">
						<p class="txt" style="position: relative;">
							누적구매금액<br> <a href="/mypage/my_coupon"> <span class="num" style="font-weight:bold;"><fmt:formatNumber value="${sum2}" pattern="#,##0" /></span>
								<span class="sb" style="font-size:18px; font-weight: bold;">원</span>
							</a>
						</p>
						<p class="txt" style="margin-top: 18px; position: relative;">
							입찰보증금<br> <a href=""> <span
								class="num" style="font-weight:bold;"><fmt:formatNumber value="${amem.money}" pattern="#,##0" /></span><span class="sb" style="font-size:18px; font-weight: bold;">원</span>
							</a> 
						</p>
					</div>
					<div class="item">
						<p class="txt">충전</p>
						<p class="cash_img">
							<a href="${pageContext.request.contextPath}/member/moneyInput"> <img
								src="${pageContext.request.contextPath}/image/renew220916/cash_img01.png"
								alt="입찰보증금충전" style="margin-left: 5px;">
							</a>
						</p>
					</div>
				</li>





				<li>
					<table class="mypage_table_head">
						<caption>입찰보증금 충전</caption>
						<tr>
							<td colspan="2"
								style="border-bottom: none; letter-spacing: -1px;"
								class="retire"><span></span></td>
						</tr>
					</table>
					<div>
						&nbsp;<br>&nbsp;
					</div>
					<form class="validation-form" novalidate action="moneyInputPro">

						<table class=""
							style="width: 30%; margin: auto; margin-top: 50px; font-size:18px;">
							<colgroup>
								<col width="40%">
								<col width="60%">
							</colgroup>
							<tbody>

								<tr>
									<th>충전금액 입력:</th>
									<td style="height: 25px;"><input type="number"
										class="form-control" id="pass" placeholder="금액입력" value=""
										name="money" required></td>
								</tr>



								<!--
				
					-->
							</tbody>
						</table>
					</form>
				</li>
				<li>
				<div class="box_section"
						style="padding: 40px 30px 50px 30px; margin: auto; margin-bottom: 50px; width:700px;">
						<!-- 결제 UI -->
						<div id="payment-method"></div>
						<!-- 이용약관 UI -->
						<div id="agreement"></div>
						<!-- 쿠폰 체크박스 -->
						<div style="padding-left: 25px">
							<div class="checkable typography--p">
								<label for="coupon-box"
									class="checkable__label typography--regular"><input
									id="coupon-box" class="checkable__input" type="checkbox"
									aria-checked="true" /><span
									class="checkable__label-text">5,000원
										쿠폰 적용</span></label>
							</div>
						</div>
						<!-- 결제하기 버튼 -->
						<div class="result wrapper" >
							<button class="button "id="payment-button"
								style="background-color:#DC3224; border:none; 
								color:white; height:50px; 
								width:200px; margin-left: 250px;
								font-size:18px;" >충전하기</button>
						</div>
					</div> 
<script>
    const button = document.getElementById("payment-button");
    const coupon = document.getElementById("coupon-box");
    const inputAmount = document.getElementById("pass"); // 금액 입력 필드
    const generateRandomString = () =>
      window.btoa(Math.random()).slice(0, 20);
    // 결제위젯 초기화
    const widgetClientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    const customerKey = generateRandomString();
    const paymentWidget = PaymentWidget(widgetClientKey, customerKey);

    // 결제 UI 렌더링
    let paymentMethodWidget = paymentWidget.renderPaymentMethods(
      "#payment-method",
      { value: parseInt(inputAmount.value) || 0 }, // 사용자 입력 값으로 초기 금액 설정
      { variantKey: "DEFAULT" }
    );
    // 쿠폰 체크박스 변경 시 금액 업데이트
    coupon.addEventListener("change", function () {
      updatePaymentAmount();
    });
    // 금액 입력 필드 변경 시 금액 업데이트
    inputAmount.addEventListener("input", function () {
      updatePaymentAmount();
    });
    // '결제하기' 버튼 클릭 시 로직
    button.addEventListener("click", function () {
      const amount = parseInt(inputAmount.value) || 0; // 입력 필드에서 금액을 읽어옴
      if (coupon.checked) {
        amount -= 5000; // 쿠폰 적용 시
      }
      // 결제 요청
      paymentWidget.requestPayment({
        orderId: generateRandomString(),
        orderName: "KIC AUCTION 입찰보증금",
        amount: amount,
        successUrl: window.location.origin + "${pageContext.request.contextPath}/member/moneyInputPro?money=" + amount,
        failUrl: window.location.origin + "${pageContext.request.contextPath}/order/fail",
        customerEmail: "customer123@gmail.com",
        customerName: "옥션",
        customerMobilePhone: "01012341234",
      });
    });
    // 금액 업데이트 함수
    function updatePaymentAmount() {
      let amount = parseInt(inputAmount.value) || 0; // 입력 필드에서 금액을 읽어옴
      if (coupon.checked) {
        amount -= 5000; // 쿠폰 적용 시
      }
      paymentMethodWidget.updateAmount(amount); // 결제 위젯의 금액을 업데이트
    }
</script>


				</li>


			</ul>
		</div>


	</div>
</div>
</html>
