<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							찜 목록 <img
								src="${pageContext.request.contextPath}/image/integ/20150918_10.png">
							<span class="mth_left" style="width: 70%; line-height: 30px;">
								총 <strong>0</strong> 건의 자료가 조회되었습니다.
							</span>
							<div class="mth_right" style="width: 30%; padding: 2px 0px;">
								<!-- <button type="button" class="btn_choice_all">종료마감순</button><button type="button" class="btn_choice_free">최종입찰순</button> -->
								<div id="select_boxview" style="margin: 0;">
									<label for="color">5개씩 보기</label><select name="search_limit"
										title="select color">
										<option value="5" selected="selected">5개씩 보기</option>
										<option value="10">10개씩 보기</option>
										<option value="50">50개씩 보기</option>
									</select>
								</div>
							</div>
							<span
								style="border: 1px dashed #999; width: 100%; padding: 3px 8px; box-sizing: border-box; font-size: 13px; line-height: 22px; font-weight: normal;">
								'내 입찰가'가 '현재가'와 동일하지만, 최고입찰자가 아닌이유는 출품자가 설정한 최저낙찰금액에 도달하지 못한
								경우이거나,<br> 내 입찰가(자동)가 타인이 설정한 최고가 입찰금보다 낮아서 입찰에 실패한 경우
								등입니다. 기타 사유도 있을 수 있습니다.<br> <strong style="color: red">최고가
									입찰자 칸에 "본인"이라고 표시되어야만 입찰에 성공한 것입니다.</strong><br> 입찰에 성공했더라도 타인이 더
								높은 금액으로 재입찰을 할 경우 낙찰이 되지 않으니 수시로 경과를 확인하여 재입찰하시기 바랍니다. <br>
								낙찰이 되어도 출품자의 권한으로 낙찰을 취소시키는 경우도 있습니다. 이때, 이미 낙찰금액을 결제하였다면 전액
								환불해드리니 안심하셔도 됩니다.
							</span>
						</caption>




						<li class="nrlayer_inner_body">

							<table class="nauc_head_table_renew">
								<colgroup>
									<col width="69">
									<col width="182">
									<col width="53">
									<col width="124">
									<col width="60">
								</colgroup>
								<tbody>
									<tr>
										<td colspan="2" class="kingcrab_renew"><input
											type="checkbox" class="upper_img_chkbox_head"
											id="table-checkbox" name="check_all">상품정보</td>
										<td colspan="2">경매현황</td>
										<td>관리</td>
									</tr>
								</tbody>
							</table>
							<table class="nauc_body_table_renew">
								<colgroup>
									<col width="69">
									<col width="182">
									<col width="53">
									<col width="124">
									<col width="60">
								</colgroup>
								<tbody>
									<c:forEach var="j" items="${li}">
										<tr>
											<td rowspan="3" class="ichinami"><a
												href="${pageContext.request.contextPath}/board/boardInfo?num=${j.pnum}"
												target="_blank">  <img
														 src="${pageContext.request.contextPath}/image/board/${j.file1}"
                        style="width: 65px; height: 70px; " alt="" >
												
											</a><br>
												<a href="${pageContext.request.contextPath}/board/boardInfo?num=${j.pnum}">원문보기</a>
											</td>
											<td class="hcr_td_first"
												alt=""
												title="yhauc" id="" qty="1" style="text-align:center;">물품번호 : ${j.pnum}</td>
											<td>현재가</td>
											<td class="hcr_td_third" id="x1095617422_current_prices"><fmt:formatNumber value="${j.buy}"
									pattern="#,##0" /> 원</td>
											<td rowspan="3">
												<div class="tdposition_renew" style="position: relative;">
													<a
														href="${pageContext.request.contextPath}/jumun/jumunDeletePro?pnum=${j.pnum}"
														target="_blank"><span class="nebada_renew_sec"
														style="">찜삭제</span></a>
												</div>
											</td>
										</tr>
										<tr>
											<td rowspan="2" class="hcr_td_second"><a
												href=""
												target="_blank"><p id="trans_goods_name_0" class="sana" style="text-align:center;"
														alt="0">상품명 : ${j.pname}</p></a></td>
											<td>입찰수</td>
											<td class="hcr_td_third" id="x1095617422_bids">${j.maxid}</td>
										</tr>
										<tr>
											<td>남은시간</td>
											<td class="hcr_td_5th" id="x1095617422_endtimes"><div class="remaining-time" id="remainingTime-${j.pnum}"></div></td>
										</tr>
								</tbody>
								</c:forEach>
							</table>
						</li>
						<li class="paging"><table border="0" cellpadding="0"
								cellspacing="0" class="paging_comm" align="center"
								style="margin: 0 auto;">
								<tbody>
									<tr>
										<td><a
											href="https://japaning.co.kr/mypage/bid_list/1?search_limit=5"
											title="이전" class="btn_page btn_prev"> </a> <a
											href="https://japaning.co.kr/mypage/bid_list/1?search_limit=5"
											title="page 1" class="btn_page _current">1</a> <a
											href="https://japaning.co.kr/mypage/bid_list/1?search_limit=5"
											title="다음" class="btn_page btn_next"> </a></td>
									</tr>
								</tbody>
							</table> <script>
    // Ajax 호출하여 남은 시간 업데이트
    function updateRemainingTime(pnum, regdate) {
        if (!regdate) {
          	$("#remainingTime-" + pnum).html("즉시구매 된 상품입니다.");
            return;
        }

        var currentTime = new Date().getTime();
        var expirationTime = new Date(regdate).getTime() + (7 * 24 * 60 * 60 * 1000); // 7일을 밀리초로 변환

        var remainingTime = expirationTime - currentTime;
        if (remainingTime <= 0) {
            $("#remainingTime-" + pnum).text("시간이 만료된 상품입니다.");
            return;
        }

        var days = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
        var hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

        $("#remainingTime-" + pnum).text(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초");
    }

    // 페이지 로드 후 초기 업데이트
    $(document).ready(function() {
        <c:forEach var="b" items="${li}">
            updateRemainingTime(${b.pnum}, "${b.regdate}");
        </c:forEach>
    });

    // 일정 간격으로 업데이트
    setInterval(function() {
        <c:forEach var="b" items="${li}">
            updateRemainingTime(${b.pnum}, "${b.regdate}");
        </c:forEach>
    }, 1000); // 1초마다 업데이트
</script></li>
</table>
			</ul>
		</div>


	</div>
</div>
</html>
