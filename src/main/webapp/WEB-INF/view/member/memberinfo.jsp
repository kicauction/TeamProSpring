<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
						<table class="mypage_table_head">
							<caption>
								개인정보 수정 <img
									src="${pageContext.request.contextPath}/image/integ/20150918_10.png">
								<p>
									안녕하세요! <br> KIC AUCTION은 회원님의 개인정보를 신중하게 보호하려 노력하고 있으며,
									회원님의 동의없이 정보가 유출되지 않습니다. 자세한 내용은 '개인정보취급방침'에서 확인해 주십시오.
								</p>
							</caption>
						</table>
						<table class="indiv_table">
							<colgroup>
								<col width="20%;">
								<col width="">
							</colgroup>
							<tbody>
								<tr>
									<th>아이디</th>
									<td style="height: 25px;">${amem.id }</td>
								</tr>
								<tr>
									<th>이름</th>
									<td style="height: 25px;">${amem.name }</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td style="height: 25px;">${amem.tel }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td style="height: 25px;">${amem.email }</td>
								</tr>

								<tr>
									<td colspan="2" style="height: 15px; padding: 0;"></td>
								</tr>

								<tr>
									<th>은행</th>
									<td style="height: 25px;">${amem.bank }</td>
								</tr>
								<tr>
									<th>계좌번호</th>
									<td style="height: 25px;">${amem.account }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td style="height: 25px;">${amem.address }</td>
								</tr>

								<tr>
									<td colspan="2" style="height: 15px; padding: 0;"></td>
								</tr>



								<tr>
									<td colspan="2" class="austria">
									
									<a href="${pageContext.request.contextPath}/member/memberUpdateForm" class="btn_luxemberg" style="text-decoration: none; color:white; display: inline-block; cursor: pointer;">회원정보수정</a>
									
											</td>
								</tr>
								<!--
					<tr>
						<td colspan="2" style="border-bottom:none;letter-spacing:-1px;" class="retire">회원탈퇴<span>이용해 주셔서 감사합니다.사이트 이용 중 불편한 점이 있으셨다면 더욱 좋은 서비스를 제공해드릴 수 있도록 노력하겠습니다.<button type="submit" class="btn_dutch">회원탈퇴</button></span></td>
					</tr>
					-->
							</tbody>
						</table>
					</li>



				</form>
			</ul>
		</div>


	</div>
</div>
</html>
