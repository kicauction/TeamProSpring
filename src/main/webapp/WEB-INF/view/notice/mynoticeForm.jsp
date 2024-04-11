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
							마일리지<br>  <span class="num" style="font-weight:bold;">${sum }원</span>

						
						</p>
					</div>
					<div class="item">
						<p class="txt" style="position: relative;">
							쿠폰<br> <a href="/mypage/my_coupon"> <span class="num">2</span>
								<span class="sb">개</span>
							</a> <a href="/coupon" class="coupon_down">쿠폰다운로드</a>
						</p>
						<p class="txt" style="margin-top: 18px; position: relative;">
							입찰보증금<br> <a href="/mypage/my_auction_ticket"> <span
								class="num">0</span> <span class="sb">원</span>
							</a> <a href="/mypage/pay_return" class="refund">환불</a>
						</p>
					</div>
					<div class="item">
						<p class="txt">충전</p>
						<p class="cash_img">
							<a href="/mypage/auction_pay_add"> <img
								src="${pageContext.request.contextPath}/image/renew220916/cash_img01.png"
								alt="입찰보증금충전" style="margin-left: 5px;">
							</a>
						</p>
					</div>
				</li>

<form  id="frm" action="noticePro" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="bo_id" value="">
			<input type="text" style="display: none;">
			<li style="margin-bottom:20px">
				<table class="mypage_table_head">
					 <c:if test="${amem.adminchk!=1 || boardid eq '3'}">
						 <caption>
						1 : 1 문의게시판
						<img src="${pageContext.request.contextPath}/image/integ/20150918_10.png">
						<span class="mth_left">
							1:1 친절상담은 KIC AUCTION에 대한 문의내용이나 요청사항을 처리해 드리는 질문답변 게시판입니다.<br>
							최대한 상세히 문의해 주시면 좀더 정확한 답변을 드릴 수 있습니다.
						</span>
					
					</caption>
					
						 </c:if>
						 
					
				</table>
				<table class="indiv_table" style="margin-top:12px;">
					<colgroup>
					<col width="20%;">
					<col width="">
					</colgroup>
					<tbody><tr>
						<th>제목</th>
						<td>
						<input type="text" class="input_mtmtitle" name="subject" id="qna_title" maxlength="40" value=""></td>
					</td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="pass" class="input_mtmtitle"  style="width:10%;" name="pass" id="qna_title" maxlength="40" value=""></td>
					</tr>
								<tr>
						<th>내용</th>
						<td>
							<div name="qna_7" style="display:none;">
							</div>
							<textarea class="input_mtmstate" name="content" id="qna_contents" title="질문내용"></textarea>
						<div class="form-group">
				<label for="file">파일:</label> <input type="file"
					class="form-control" placeholder="Enter file1" id="file"
					name="f">
			</div>
						</td>
					</tr>
				
					
					<tr>
						<td colspan="2" class="austria" style="border-bottom:none;"><button type="submit" class="btn_luxemberg cursor_p" ">문의하기</button></td>
					</tr>
				</tbody></table>
			</li>
		</form>


			</ul>
		</div>


	</div>
</div>
</html>
