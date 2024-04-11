<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script>
        window.onload = function() {
            var amemId = "${amem.id}";
            var noticeName = "${notice.name}";

            if (amemId !== noticeName) {
                var updateBtn = document.getElementById("updateBtn");
                var deleteBtn = document.getElementById("deleteBtn");

                updateBtn.style.display = "none";
                deleteBtn.style.display = "none";
            }
        };
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
							${noticeName} <img
								src="${pageContext.request.contextPath}/image/integ/20150918_10.png">
							<span class="mth_left"> &nbsp; </span>
							<div class="mth_right">
								<button type="button" class="btn_choice_all cursor_p"
									onclick="goBack()">목록보기</button>
							</div>
						</caption>
					</table>
					<table class="indiv_table">
						<colgroup>
							<col width="20%;">
							<col width="">
							<col width="20%;">
							<col width="20%;">
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="3" style="height: 25px;">${notice.subject }</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td style="height: 25px;">${notice.regdate}</td>
								<th>작성자</th>
								<td style="height: 25px;">${notice.name}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3" style="height: 25px;">${notice.content}</td>
							</tr>
							<tr>
							<th>답변</th>
							<td colspan="3" style="height: 25px;">${notice.answer}</td>
							</tr>
							 

						</tbody>
					

					</table>
					&nbsp;
					<table>
						<tr>
							 <td colspan="2" class="text-right">
            <a id="updateBtn" class="btn btn-primary"
               style="display: inline-block; padding: 10px 20px; background-color: #DC3224; color: #fff; text-decoration: none; border: none; border-radius: 5px; cursor: pointer;"
               href="${pageContext.request.contextPath}/notice/noticeUpdateForm?num=${notice.num}">수정</a>
            <a id="deleteBtn" class="btn btn-primary"
               style="display: inline-block; padding: 10px 20px; background-color: #DC3224; color: #fff; text-decoration: none; border: none; border-radius: 5px; cursor: pointer;"
               href="${pageContext.request.contextPath}/notice/noticeDeleteForm?num=${notice.num}">삭제</a>
        </td>
						</tr>
					</table>
				</li>






			</ul>
		</div>


	</div>
</div>
	<script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false); </script>

<script>
	function goBack() {
		window.history.back();
	}
</script>
</html>
