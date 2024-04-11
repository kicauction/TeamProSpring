<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<div id="mypage">
<style media="screen">
.btn_vietnam {
  width: 100%;
}
</style>




<div class="basket_title">
  <div class="basket_title_cover">
    주문완료
  </div>
</div>
<div class="basket_menu">
  <div class="basket_notice">
    <div class="bn_img">
      <img src="${pageContext.request.contextPath}/image/renew220916/notice.png" alt="알림">
    </div>
    <div class="bn_txt">
     상품이 현지의 당사 물류센터에 도착전, 무게와 기타 경비등을 추정하여 결제를 진행합니다.<br>
     상품의 실무게 측정후 추가 입금액 또는 환불금이 발생할 수 있습니다.
    </div>
  </div>
  <ul>
    <li>
      <span>1</span>
      장바구니
    </li>
    <li>
      <span>2</span>
      예상비용결제
    </li>
    <li class="on">
      <span>3</span>
      주문완료
    </li>
    <li>
      <span>4</span>
      실비정산
    </li>
    <li>
      <span>5</span>
      결제완료
    </li>
  </ul>
</div>
<div class="complete basket">
  고객님의 주문접수가 완료되었습니다.
  <p>저희 재팬잉을 이용해 주셔서 감사합니다.</p>
</div>


<div class="basket_box">
  <div class="basket_box_left">
    <div>

			<div id="order">
				<ul class="order_title">
					<li>
						<table class="order_settle_table_body" style="border-top:1px solid #C6C6C6;">
							<tbody>
								<tr>
									<td>
										<table class="rebill_table">
											<tbody>
												</tbody><colgroup>
													<col width="15%;">
													<col width="35%">
													<col width="15%;">
													<col width="35%">
												</colgroup>
												<tbody><tr>
													<th>상품이름</th>
													<td> <strong>${board.pname }</strong></td>
													<th>판매자</th>
													<td>
														${board.userid }													</td>
												</tr>
												<tr>
													<th>상품가격</th>
													<td><strong>${board.price }</strong></td>
													<th>결제금액</th>
													<td><strong class="ronaldo"> </strong> (마일리지뺀 실결제금액,apay에 buy컬럼)원</td>
												</tr>
											
																								<tr>
													<th>주문일자</th>
													<td>(주문일자 가져오기 apay에 regdate컬럼)</td>
													<th>주문자명</th>
													<td>소성운</td>
												</tr>
																								<tr>
													<td colspan="4" class="neymars">
														<div class="messi">
															<ul>
																<li><strong>상품번호</strong> :&nbsp;&nbsp;${board.pnum}</li>
																<li><strong>상품제목</strong> :&nbsp;&nbsp;${board.pname }</li>
																
																<li><strong>상품주소</strong> :&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/board/boardInfo?num=${board.pnum}" target="_blank">${pageContext.request.contextPath}/board/boardInfo?num=${board.pnum}</a></li>
																
																<li><strong>상품금액</strong> :&nbsp;&nbsp; ${board.buy }
																<li><strong>결제금액</strong> :&nbsp;&nbsp; (마일리지뺀 실결제금액,apay에 buy컬럼)</li>
																<li><strong>마일리지</strong> :&nbsp;&nbsp;(위에꺼 가져오면 스크립트로 0.5 곱해서 처리)적립</li>
																
																																		<script language="javascript">
																	<!--
																	function insuView(asMallId, asOrderId){
																		//창을 화면의 중앙에 위치
																		iXPos = (window.screen.width - 700) / 2;
																		iYPos = (window.screen.height - 600) / 2;
																		window.open("https://gateway.usafe.co.kr/esafe/InsuranceView.asp?mall_id="+asMallId + "&order_id=" + asOrderId, "전자보증서", "width=700, height=600, scrollbars=yes, left=" + iXPos + ", top=" + iYPos);
																		}
																	-->
																	</script>
																	 <!-- (세입: 6,500円) -->
																</li>
																<li>&nbsp;</li>
																<li><strong style="font-weight:normal;color:#ED564D;">• 결제하실 금액은 우측상단의 결제금액 입니다.</strong></li>
															</ul>
														</div>
													</td>
												</tr>
																							</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</li>

          <li class="paging">
            <button type="button" class="camerun cursor_p" onclick="location.href='/mypage/latest';">주문확인</button>
            <button type="button" class="uganda cursor_p" onclick="location.href='/';">홈으로</button>
          </li>
				</ul>

			</div>


			<input type="hidden" name="price_1st" value="85560">
			<input type="hidden" name="price_2st" value="0">
			<input type="hidden" name="pay_method" value="">
			<input type="hidden" name="order_id" value="241604440624">
			<input type="hidden" name="order_name" value="소성운">
			<input type="hidden" name="order_title" value="신품미사용 애플순정iPhone12mini 레더 케이스MagSafe">
			<input type="hidden" name="order_count" value="1">

			<input type="hidden" name="goods_name_tmp" value="신품미사용 애플순정iPhone12mini 레더 케이스MagSafe">
			<input type="hidden" name="user_id_tmp" value="76225">

			<script>
				$.ajax({
					type: 'post',
					url: '/pay/unipass_send',
					dataType: 'json',
					data: { "order_id" : $('input[name=order_id]').val() },
					success: function(d,s) {
						if(d.result == '_false'){
							alert('수취인명, 전화번호, 개인통관고유부호가 일치하지 않을 경우 통관이 지연되어 물품 수령이 지연될 수 있습니다.');
						}
						if(d.result == '_false_company'){
							alert('사업자등록번호, 통관고유부호가 일치하지 않을 경우 통관이 지연되어 물품 수령이 지연될 수 있습니다.');
						}
					},
					cache: false
				});
			</script>
			<script>
			kakaoPixel('5860973385447195050').purchase('구매완료');
			</script>
			<script src="//wcs.naver.net/wcslog.js"></script>
			<script>
			var _nasa={};
			_nasa["cnv"] = wcs.cnv("1","1");
			</script>

			<!-- WIDERPLANET PURCHASE SCRIPT START 2016.5.24
			<div id="wp_tg_cts" style="display:none;"></div>
			<script>
			var wptg_tagscript_vars = wptg_tagscript_vars || [];
			wptg_tagscript_vars.push(
			(function() {
				return {
					wp_hcuid:$('input[name=user_id_tmp]').val(),  	/*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
							 *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
					ti:"28239",
					ty:"PurchaseComplete",
					device:"web"
					,items:[
						 {i:$('input[name=order_id]').val(), t:$('input[name=goods_name_tmp]').val(), p:$('input[name=price_1st]').val(), q:"1"} /* 첫번째 상품 - i:상품 식별번호(Feed로 제공되는 식별번호와 일치) t:상품명 p:단가 q:수량 */
					]
				};
			}));
			</script>
			<script async src="http://cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
			// WIDERPLANET PURCHASE SCRIPT END 2016.5.24 -->

			<!-- naver GTM -->
			<!-- daum GTM-->
			<!-- google -->
			<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

			ga('create', 'UA-109422312-2', 'auto');
			ga('send', 'pageview');

			ga('require', 'ecommerce', 'ecommerce.js');
			ga('ecommerce:addTransaction', {
			'id': '241604440624', // 시스템에서 생성된 주문번호. 필수.
			'affiliation': '소성운', // 제휴사이름. 선택사항.
			'revenue': '85560', // 구매총액. 필수.
			'shipping': '11160', // 배송비. 선택사항.
			'tax': '0' // 세금. 선택사항=할인금액
			});
						ga('ecommerce:addItem', {
			'id': '241604440624', //시스템에서 생성된 주문번호. 필수.
			'name': '신품미사용 애플순정iPhone12mini 레더 케이스MagSafe', // 제품명. 필수.
			'sku': 'https://jp.mercari.com/item/m77329200889', // SKU 또는 제품고유번호. 선택사항.
			'category': '없음', // 제품 분류.
			'price': '60450', // 제품 단가.
			'quantity': '1' // 제품 수량.
			});
						ga('ecommerce:send');
			</script>
		</div>

	</div>
</div>
</div>


<!-- <body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto text-center"> 
				<h2 class="mb-3" style="text-align:center">결제상세정보</h2><p>
				<form class="validation-form" novalidate action="">
					
               			<tbody>
							<tr>
								<td><div style="display: flex; align-items: flex-start;">
										<a href="boardInfo?num=${board.pnum}"> <img
											src="${pageContext.request.contextPath}/image/board/${board.file1}"
											style="width: 200px; height: 200px;" alt="">
										</a>
										<div
											style="margin-left: 80px; margin-top: 10px; font-weight: bold; text-align:left;">
											<div style="font-size: 30px;">${board.pname}</div>
											
											
											판매자:${board.userid}<br> 상품정보:${board.subject}<br>
											        <p id="orderId"></p>
     											 <p id="amount" style="font-size: 20px;"></p>
										@@@@@@@@@@@@@@@
										</div>
									</div></td>

							</tr>
						</tbody>
  
					
				</form>
				<a href="${pageContext.request.contextPath}/member/index"><button class="lo">메인으로</button></a>
			</div>
		</div>
	</div>
   
  
  </body> -->
</html>