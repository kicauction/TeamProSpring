<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
								<a href="${pageContext.request.contextPath}/board/buyList">입찰 중 / 입찰완료
									상품</a> <a href="${pageContext.request.contextPath}/jumun/myList">판매등록상품</a>
								<a href="${pageContext.request.contextPath}/jumun/jumunList">찜한상품</a>
										<a href="${pageContext.request.contextPath}/jumun/endList">구매완료상품</a>
							</p>
						</div>
						
						
						<div class="item">
							<p class="tit">회원정보</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/member/tier" title="">나의등급</a> <a
									href="${pageContext.request.contextPath}/member/memberinfo">회원정보 보기 / 수정</a> <a
									href="${pageContext.request.contextPath}/member/memberDeleteForm">회원탈퇴</a>
							</p>
						</div>
						<div class="item">
							<p class="tit">고객센터</p>
							<p class="txt">
								<a href="${pageContext.request.contextPath}/notice/noticeList?boardid=1">공지사항</a>
								<a href="${pageContext.request.contextPath}/notice/noticeList?boardid=2">자주묻는질문</a>
								<a href="${pageContext.request.contextPath}/notice/noticeList?boardid=3">1:1문의</a>
									<a href="${pageContext.request.contextPath}/notice/mynotice">나의 1:1 문의글</a>
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
				<table class="guide_table_head">
					<caption>
						KIC ACUTION 회원등급 혜택 <img src="/images/integ/20150918_10.png">
						<p>회원등급은 구매 실적에 따라 정해집니다.</p>
					</caption>
				</table>
				<table class="revcoupon">
					<colgroup>
						<col width="">
						<col width="480px;">
					</colgroup>
					<tbody><tr>
						<td class="rc_mark"><img src="/images/integ/ab_new.png">
							<p>소성운 님의 회원등급은 <strong>${Tier}</strong>입니다.</p>
					
						</td>
						<td class="rc_mark_txt">
							<div class="rmt">
								<ul>
									<li class="rmt_top">다음달 <strong>BEST</strong>등급 상향 조건
																				<p>구매건수 <strong>1건</strong>이 필요합니다.<span>(1개월 이전 구매상품에 대한 취소이력에 의해 일부 오차가 발생할 수 있습니다.)</span></p>
										<button type="button" onclick="popup_center('/cs/memgrade' , '등급별 혜택 상세보기' , '680' , '859')" class="btn_coupon_detailview cursor_p">등급별 혜택 상세보기</button>
									</li>
									<li class="rmt_line">&nbsp;</li>
									<li class="rmt_bot"><img src="/images/integ/20151023_03.png"> 산정기간<strong>2023년 08월 ~ 2024년 01월</strong><span><a href="/mypage/latest">나의 구매내역 보기</a><img src="/images/integ/20151023_04.png"></span><br>
										<img src="/images/integ/20151023_03.png"> 구매건수<strong>0건</strong><br>
										<img src="/images/integ/20151023_03.png"> 구매금액<strong>0원</strong>
									</li>
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="rc_standard">KIC AUCTION 회원등급 / 산정기준<span>( 회원등급 :<img src="/images/integ/ab_vvip_s.png"><img src="/images/integ/ab_vip_s.png"><img src="/images/integ/ab_top_s.png" style="margin:0;"><img src="/images/integ/ab_best_s.png" style="margin:0;"><img src="/images/integ/ab_new_s2.png">)</span></td>
					</tr>
					<tr>
						<td colspan="2" class="rc_stable">
							<table class="rcstable">
								<colgroup>
									<col width="17%">
									<col width="17%">
									<col width="17%">
									<col width="17%">
									<col width="13%">
									<col width="">
								</colgroup>
								<tbody><tr>
									<th>등급구분</th>
									<th style="color:#ED564D;">VVIP</th>
									<th style="color:#ED564D;">VIP</th>
									<th style="color:#82B399;">TOP</th>
									<th style="color:#62A7DA;">BEST</th>
									<th style="color:#777;">NEW</th>
								</tr>
								<tr>
									<td style="background:#FBFBFB">구매건수/구매금액</td>
									<td>50건 또는 1천만원 이상</td>
											<td>20~49건 또는 500만원 이상</td>
									<td>10~19건 또는 100만원 이상</td>
									<td>1~9건 </td>
											<td>실적이 없는 회원</td>
								</tr>
							</tbody></table>
							<br>
								- 등급은 최근 6개월 동안의 실적을 기준으로 매월 1일 조정되며, 구매실적은 2차결재(실비정산)시 인정됩니다.<br>&nbsp;&nbsp;<strong>합배송일 경우 1건의 주문으로 취급</strong>됩니다. <!--(선편은 출하일 관리자가 수동 등록 : 일본은 출하일로 부터 30일후, 미국은 50일후 수취확인 전환됨)--><br>- 등급별 혜택종류, 혜택규모, 지급방식 등은 내부정책에 의하여 수시로 변경될 수 있습니다.
						</td>
					</tr>
				</tbody></table>
			</li>

			
				



				
			</ul>
		</div>


	</div>
</div>
</html>
