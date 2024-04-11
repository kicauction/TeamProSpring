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
						${noticeName}
						<img src="${pageContext.request.contextPath}/image/integ/20150918_10.png">
						<p>KIC AUCTION의 최신소식과 공지를 알려드립니다.</p>
					</caption>

				</table>
	
				<table class="mypage_table_head" style="margin-top:10px;">
					<colgroup>
					<col width="80px;">
					<col width="">
					<col width="130px;">
					<col width="180px;">
					<col width="130px;">
					</colgroup>
					<tbody>
					  <tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td style="background:#FBFBFB;">조회수</td>
					</tr>
				</tbody></table>
				<table class="board_table">
					<colgroup>
					<col width="80px;">
					<col width="">
					<col width="130px;">
					<col width="180px;">
					<col width="130px;">
					</colgroup>
										<tbody>
										<c:forEach var="n" items="${li}"><tr>
						<td style="color:red;font-weight:bold;text-align:center;">${noticeNum}</td><c:set var = "noticeNum" value="${noticeNum-1}"/>
						<td class="turkey"><a href="noticeInfo?num=${n.num}">${n.subject}</a></td>
						<td>${n.name }</td>
						<td><fmt:formatDate value="${n.regdate}"
										pattern="yyyy년 MM월 dd일" /></td>
      					
						<td>${n.readcnt}</td>
					</tr> </c:forEach>  
				
				</tbody></table>
			</li>&nbsp;<br>
					 <c:if test="${amem.adminchk==1 || boardid eq '3'}">
  <li><a class="" href="noticeForm" style="  display: inline-block;
    padding: 10px 20px;
    background-color: #DC3224;
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;">글쓰기</a></li>

</c:if>
			
					
					
					



			</ul>
		</div>


	</div>
</div>
</html>
