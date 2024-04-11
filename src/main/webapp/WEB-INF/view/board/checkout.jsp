<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="mypage">


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
				input.value = ""; // 직접 입력을 위해 input을 비웁니다.
			} else {
				input.style.display = "none";
				input.value = selectedValue; // select의 값을 input에 설정합니다.
			}
		}

		// 서버로 데이터 전송하기 전에 호출되는 함수
		function prepareAndSendData() {
			var memo = document.getElementById("customMemoInput").value;

			// 서버에 데이터 전송하는 로직
			// 예: window.location.origin + "${pageContext.request.contextPath}/board/checkoutpro?num=${board.pnum}&pnum=${board.pnum}&memo=" + memo;
		}
	</script>
	<style media="screen">
.btn_vietnam {
	width: 100%;
}

.wrapper {
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
</style>



	<div class="basket_title">
		<div class="basket_title_cover">배송정보입력</div>
	</div>
	<div class="basket_menu">
		<div class="basket_notice">
			<div class="bn_img">
				<img src="${pageContext.request.contextPath}/image/renew220916/notice.png" alt="알림">
			</div>
			<div class="bn_txt">
				상품이 현지의 당사 물류센터에 도착전, 무게와 기타 경비등을 추정하여 결제를 진행합니다.<br> 상품의 실무게
				측정후 추가 입금액 또는 환불금이 발생할 수 있습니다.
			</div>
		</div>
		<ul>
			<li class="on"><span>1</span> 배송정보입력</li>
			<li ><span>2</span> 주문완료</li>
			
		</ul>
	</div>


	<div class="basket_box">
		<div class="basket_box_left">
			<div style="margin-top: 80px;">
				<form action="checkoutpro" name="" id="order_frm" method="post"
					accept-charset="utf-8">
					<div id="order">
						<ul class="order_title">
							<li>
								<table class="order_goods_table_head">
									<tbody>
									</tbody>
									<colgroup>
										<col width="120px;">
										<col width="120px;">
										<col width="">
										<!-- <col width="90px;" /> -->
										<col width="120px;">
										<col width="140px;">
										<col width="120px;">
									</colgroup>
									<tbody>
										<tr>
											<td>상품번호</td>
											<td>등록일자</td>
											<td>상품정보</td>
											<!-- <td>단가(세별)</td> -->
											<td>입찰자</td>
											<td>상품가</td>
											<td style="background: #FBFBFB;">진행상태</td>
										</tr>
									</tbody>
								</table>
								<table class="order_goods_table_body">
									<tbody>
									</tbody>
									<colgroup>
										<col width="120px;">
										<col width="120px;">
										<col width="">
										<!-- <col width="90px;" /> -->
										<col width="120px;">
										<col width="140px;">
										<col width="120px;">
									</colgroup>


									<tbody>

										<tr>

											<td><span style="color: #ED564D;">${board.pnum }
													<input type="hidden" name="num" value="${board.pnum }">
													<input type="hidden" name="pnum" value="${board.pnum }">
													<input type="hidden" name="end" value="1">
											</span></td>
											<td><fmt:formatDate value="${board.idate}"
													pattern="yyyy년 MM월 dd일 HH시" /></td>
											<td class="china"><span class="china_bk"> <span
													class="cbi"> <a href="boardInfo?num=${board.pnum}">
															<img
															src="${pageContext.request.contextPath}/image/board/${board.file1}">
													</a>
												</span>
											</span> <span class="china_sh"> <a href="" target="_blank">
														${board.pname } </a> <!--
			      								      					--> <span class="in"> 판매자 :
														${board.userid } </span>
											</span> <span class="china_nj"> ${board.subject}</span></td>
											<!-- <td><strong>4,164</strong> 円</td> -->
											<td>${board.buyid }</td>
											<td><strong style="color: #ED564D;"><span>
														<fmt:formatNumber value="${board.buy}" pattern="#,##0" />
												</span>원</strong></td>
											<td>결제대기</td>
										</tr>
									</tbody>
								</table>
							</li>

							<li style="height: 15px;"></li>

							<li>
								<table class="order_location_table_head">
									<tbody>
									</tbody>
									<colgroup>
										<col width="50%;">
										<col width="50%;">
									</colgroup>
									<tbody>
										<tr>
											<td>주문하신 분</td>
											<td style="background: #FBFBFB;">결제정보</td>
										</tr>
									</tbody>
								</table>

								<table class="order_location_table_body">
									<tbody>
									</tbody>
									<colgroup>
										<col width="60%;">
										<col width="40%;">
									</colgroup>
									<tbody>
										<tr>
											<td>
												<table class="order_info_table">
													<tbody>
													</tbody>
													<colgroup>
														<col width="28%;">
														<col width="">
													</colgroup>
													<tbody>
														<tr>
															<th>이름<input type="hidden" name="id"
																value="${amem.id }"></th>
															<td><input type="text" class="input_name"
																maxlength="10" value="${amem.name }" name="name"></td>
														</tr>

														<tr>
															<th>주소</th>
															<td><input type="text" class="input_add"
																name="user_zipcode" id="user_zipcode"
																readonly="readonly" value=""> &nbsp;
																<button type="button" class="btn_addno cursor_p"
																	onclick="goPopup()">우편번호 찾기</button> <br> <input
																type="text" class="input_addlong"
																style="margin-top: 3px;" name="user_address"
																id="user_address" readonly="readonly" value="">
																<br> <input type="text" class="input_addlong"
																style="margin-top: 3px;" name="user_address_detail"
																id="user_address_detail" value=""> <!-- 합쳐진 주소를 저장할 숨겨진 필드 -->
																<input type="hidden" name="address" id="full_address">
															</td>


														</tr>



														<tr>
															<th>휴대전화</th>
															<td><input type="hidden" name="tel"
																value="${amem.tel }">${amem.tel }</td>
														</tr>
														<tr>
															<th>배송매모</th>
															<td><input type="text" class="input_add" name="memo"
																style="width: 200px;" value="부재 시 문앞에 놓아주세요."></td>
														</tr>
														<tr>
															<td colspan="2"
																style="border-bottom: none; letter-spacing: -1px;">※
																휴대전화번호는 마이페이지 &gt; 개인정보수정을 통해서만 <span
																style="color: red;">변경이 가능합니다.</span>
															</td>
														</tr>
													</tbody>
												</table>
											</td>


											<td style="padding: 0 120px 30px 120px;">
												<table class="order_amount_table">
													<tbody>
													</tbody>
													<colgroup>
														<col width="50%;">
														<col width="50%;">
													</colgroup>
													<tbody>
														<tr>
															<td colspan="2" class="oat_title">결제 금액</td>
														</tr>
														<tr>
															<td colspan="2" class="oat_line"></td>
														</tr>
														<tr>
															<td class="oat_order">보유 보증금</td>
															<td class="oat_orderprice"><strong id="total_won2"><fmt:formatNumber
																		value="${amem.money}" pattern="#,##0" /> </strong> ￦</td>
														</tr>
														<tr>
															<td class="oat_order">주문금액</td>
															<td class="oat_orderprice"><strong id="order_amount"><fmt:formatNumber
																		value="${board.buy}" pattern="#,##0" /> </strong> ￦</td>
														</tr>
														<tr>
															<td>보유마일리지</td>
															<td class="oat_price" style="color: #ED564D;"><span
																id="user_mileage"><strong><fmt:formatNumber
																			value="${amem.mile}" pattern="#,##0" /></strong></span> ￦</td>

														</tr>

														<tr style="display: none;">
															<td>입찰선납금 사용</td>
															<td class="oat_price">￦ <span id="use_prepay_prt"><b>0</b></span></td>
														</tr>
														<tr>
															<td style="padding-bottom: 10px;">마일리지 사용</td>
															<td class="oat_price"><input type="number"
																id="mileage_use" style="width: 80px;" name="sp" value="">
																￦</td>
														</tr>
														<tr>
															<td colspan="2" class="oat_line"></td>
														</tr>
														<tr>
															<td class="oat_order2">총 결제금액</td>
															<td class="oat_orderprice2"><span id="total_payment">
															</span> <!-- 숨겨진 입력 필드 추가 --> <input type="hidden" name="buy"
																id="buy_amount"></td>
														</tr>
														<tr>
															<td colspan="2" class="oat_btns" id="credit_ok">
																<button type="submit" class="btn_vietnam cursor_p"
																	id="buy_btn">결제하기</button>
															</td>
														</tr>
														<tr>
															<td colspan="2" class="oat_btns" style="display: none"
																id="credit_loading">
																<button type="button" class="btn_cambodia cursor_p"
																	onclick="alert('결제가 진행중입니다. \n잠시만 기다려주세요.');">결제진행중</button>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</li>

						</ul>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script>
document.addEventListener('DOMContentLoaded', function() {
    // 보유 마일리지 기반으로 최대 사용 가능 마일리지 설정 및 초기 총 결제금액 계산
    setMaxMileageAndCalculateTotal();
    
    // 마일리지 사용량 입력 필드의 입력 이벤트에 반응하여 총 결제금액 계산
    document.getElementById('mileage_use').addEventListener('input', calculateTotalPayment);
});

function setMaxMileageAndCalculateTotal() {
    var userMileageText = document.getElementById('user_mileage').innerText.replace(/\D/g, '');
    var userMileage = parseInt(userMileageText, 10);
    document.getElementById('mileage_use').max = userMileage;

    // 페이지 로딩 시 총 결제금액 초기 계산
    calculateTotalPayment();
}

function calculateTotalPayment() {
    var orderAmountText = document.getElementById('order_amount').innerText.replace(/\D/g, '');
    var orderAmount = parseInt(orderAmountText, 10);
    
    var mileageUse = parseInt(document.getElementById('mileage_use').value, 10) || 0;
    
    // 입력된 마일리지가 보유 마일리지보다 많으면 최대치로 설정
    var userMileageText = document.getElementById('user_mileage').innerText.replace(/\D/g, '');
    var userMileage = parseInt(userMileageText, 10);
    if (mileageUse > userMileage) {
        document.getElementById('mileage_use').value = userMileage;
        mileageUse = userMileage;
    }
    
    // 총 결제금액 계산 및 표시
    var totalPayment = orderAmount - mileageUse;
    document.getElementById('total_payment').innerText = totalPayment.toLocaleString() + ' ￦';
    document.getElementById('buy_amount').value = totalPayment; // 폼 제출을 위한 숨겨진 필드 업데이트
}
</script>
	
	
	

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 페이지 로딩 시 기본 주소 값 설정
			updateFullAddress();

			// 기타 이벤트 리스너 등록...
		});

		function goPopup() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 주소 검색 후 주소 정보 업데이트
							document.getElementById('user_zipcode').value = data.zonecode; // 우편번호 설정
							document.getElementById('user_address').value = data.roadAddress; // 도로명 주소 설정
							document.getElementById('user_address_detail').value = ''; // 상세 주소 초기화

							updateFullAddress(); // 합쳐진 주소 업데이트
						}
					}).open();
		}

		function updateFullAddress() {
			var zipcode = document.getElementById('user_zipcode').value;
			var address = document.getElementById('user_address').value;
			var detail = document.getElementById('user_address_detail').value;

			// 세 값 합치기 (사이에 공백 추가)
			var fullAddress = zipcode + ' ' + address
					+ (detail ? ' ' + detail : '');
			document.getElementById('full_address').value = fullAddress.trim(); // 합쳐진 주소 저장
		}

		// 상세 주소 입력 필드에서 키 입력 이벤트 처리
		document.getElementById('user_address_detail').addEventListener(
				'input', updateFullAddress);
	</script>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6131d8c1f47576cb59bf16e7bb564b01&libraries=services"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function goPopup() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 우편번호
							document.getElementById('user_zipcode').value = data.zonecode;
							// 사용자가 선택한 주소 (도로명 주소 또는 지번 주소)
							var fullAddress = data.userSelectedType === 'R' ? data.roadAddress
									: data.jibunAddress;
							document.getElementById('user_address').value = fullAddress;
							// 상세 주소 초기화
							document.getElementById('user_address_detail').value = '';
							// 상세 주소 입력 필드로 포커스 이동
							document.getElementById('user_address_detail')
									.focus();
						}
					}).open();
		}
	</script>

	<script>
		document.getElementById('search').addEventListener('click', function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색 결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분

					// 예를 들어, 사용자가 선택한 주소를 input 태그에 표시
					var addr = ''; // 주소 변수
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById('address').value = addr;
					// 선택된 주소 정보를 표시하거나 다른 처리를 할 수 있습니다.
				}
			}).open();
		});
	</script>



</div>