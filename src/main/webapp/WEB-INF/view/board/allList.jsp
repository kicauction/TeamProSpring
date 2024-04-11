<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<style>
.uls {
	list-style: none;
	margin: 0;
	padding: 0;
}


.lis {
	margin: 10px 10px; /* 상하 0, 좌우 10px 간격 지정 */
	padding: 0 10px;
	float: left;
	position: relative;
	text-align: left; /* 내용 중앙 정렬 */
	border: 1px solid #ddd; /* 기본 테두리 스타일 */
	transition: background-color 0.3s ease; /* 배경색 변화를 부드럽게 만듦 */
	height: 390px;
}

li:hover {
	background-color: rgba(0, 0, 0, 0.1); /* 마우스를 가져다 대면 배경색이 흐릿하게 변함 */
}
</style>
</head>
<div id="mypage">




	<script type="text/javascript" src="/js/jquery.alerts.js"></script>
	<link rel="stylesheet" href="/css/jquery.alerts.css" type="text/css">




	<div class="content sub ">
		<div class="new_catagory">
			<div class="tab_cont">
				<div class="cata_menu one on">
					<div class="menu_guide_sub"></div>
					<div class="menu_detail">
						<div class="mdbox_in">
							<div class="md_in md_tit">카테고리</div>
							<div class="md_in">
								<div>
									<a href="${pageContext.request.contextPath}/board/allList">
										<span class="zozo_category" alt="wrist-watch"> 전체상품 </span> <span
										id="zozo_wrist-watch"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=1">
										<span class="zozo_category" alt="wrist-watch"> 가전 </span> <span
										id="zozo_wrist-watch"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=2">
										<span class="zozo_category" alt="wrist-watch"> 의류 </span> <span
										id="zozo_wrist-watch"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=3">
										<span class="zozo_category" alt="table-clocks"> 프라모델 </span> <span
										id="zozo_table-clocks"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=4">
										<span class="zozo_category" alt="wall-clock"> 골동품 </span> <span
										id="zozo_wall-clock"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=5">
										<span class="zozo_category" alt="wrist-watch"> 악기 </span> <span
										id="zozo_wrist-watch"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=6">
										<span class="zozo_category" alt="wrist-watch"> 명품시계 </span> <span
										id="zozo_wrist-watch"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=7">
										<span class="zozo_category" alt="table-clocks"> 악세사리 </span> <span
										id="zozo_table-clocks"></span>
									</a>
								</div>
							</div>
							<div class="md_in">
								<div>
									<a
										href="${pageContext.request.contextPath}/board/products?boardid=8">
										<span class="zozo_category" alt="wall-clock"> 레저 </span> <span
										id="zozo_wall-clock"></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>



	<!-- 페이징 시 스크롤 위치 처리용 -->
	<div id="list_topper"></div>




	<div class="shop_box_de">
		<input type="hidden" name="sort" id="sort" value="">
		<div class="shop_one">
			<div class="one_first">
				<span style="font-size: 20px; font-weight: bold;">전체상품</span>

			</div>

			<div class="shop_sel_box">


				<div class="shop_top">
					<div class="shop_sel_first"></div>

					<div class="shop_sel_sec"></div>
					<div class="shop_sel_thir" style="">
						<ul style="margin-left: 330px;">

							<li class="seth_btn">
							<a href="${pageContext.request.contextPath}/board/boardForm"
								style="width:150px; background-color:black; color:white; font-weight:bold; ">판매글 등록</a></li>
						</ul>

					</div>
				</div>

				<div class="shop_bottom">

					<div class="under_box">
						<select class="" id="sort_opt" style="width: 100px; height: 30px">
							<option value="0" id="sort_opt_0" selected=""
								style="text-align: center;">선택</option>
							<option value="1" id="sort_opt_1" style="text-align: center;">조회순</option>
							<option value="2" id="sort_opt_2" style="text-align: center;">가격높은순</option>
							<option value="3" id="sort_opt_3" style="text-align: center;">낮은가격순</option>

						</select>


						<script>
  // 함수: 쿠키 설정
  function setCookie(name, value, days) {
    var expires = "";
    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
  }

  // 함수: 쿠키 가져오기
  function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
  }

  // 페이지 로드 시 실행
  window.onload = function() {
    // 쿠키에서 선택한 옵션 값을 가져옴
    var selectedOption = getCookie("selectedOption");
    // 쿠키에 저장된 값이 있다면 해당 옵션을 선택 상태로 변경
    if (selectedOption) {
      document.getElementById("sort_opt").value = selectedOption;
    }
  };

  // 셀렉트 박스 변경 이벤트 처리
  document.getElementById("sort_opt").addEventListener("change", function() {
    // 선택한 옵션의 값을 쿠키에 저장
    var selectedValue = this.value;
    setCookie("selectedOption", selectedValue, 30); // 쿠키 유효 기간: 30일
    // 선택한 옵션에 해당하는 링크로 페이지 이동
    switch (selectedValue) {
      case "1":
        window.location.href = "${pageContext.request.contextPath}/board/cntList?pname=readcnt";
        break;
      case "2":
        window.location.href = "${pageContext.request.contextPath}/board/cntList?pname=priced";
        break;
      case "3":
        window.location.href = "${pageContext.request.contextPath}/board/cntList?pname=price";
        break;
      default:
        break;
    }
  });
</script>





					</div>
				</div>
			</div>

		</div>
	</div>

	<table>

		<tbody>


			<tr>
				<td id="contents">
					<div class="shop_list one new">
						<c:forEach var="b" items="${li}">
							<ul class="uls">
								<li class="lis">
									<div class="remaining-time" id="remainingTime-${b.pnum}"
										style="margin-top: 13px; font-size: 15px; font-weight: bold; color: black; text-align: center;"></div>

									<div class="shop_img" style="text-align: center;">

										<a href="boardInfo?num=${b.pnum}"> <img
											src="${pageContext.request.contextPath}/image/board/${b.file1}"
											style="width: 200px; height: 200px; margin-top: 20px;"></a>
									</div> &nbsp;<br>
									<div
										style="font-size: 15px; color: black; font-weight: bold; text-align: center;">&nbsp;${b.pname }</div>&nbsp;<br>

									<div style="font-size: 15px; color: black;">
										&nbsp;&nbsp;입찰시작가: <span style="font-weight:bold;">
										<fmt:formatNumber value="${b.price}" pattern="#,##0" />
										원</span>
									</div>

									<div style="font-size: 15px; color: black;">
										&nbsp;&nbsp;현재입찰가:  <span style="font-weight:bold; color:blue;">
										<fmt:formatNumber value="${b.buy}" pattern="#,##0" />
										원</span>
									</div>
									<div style="font-size: 15px; color: black;">
										&nbsp;&nbsp;즉시구매가: <span style="font-weight:bold; color:red;">
										<fmt:formatNumber value="${b.prompt}" pattern="#,##0" />
										원</span>
									</div>

									<div style="font-size: 15px; color: black;">
										&nbsp;&nbsp;판매자:${b.userid }<br>
										<div style="text-align: center;">
											<a
												href="${pageContext.request.contextPath}/jumun/jumunAdd?pnum=${b.pnum}"><i
												class="material-icons">favorite</i></a>
										</div>
									</div>
								</li>

							</ul>
						</c:forEach>
					</div>



				</td>
			</tr>

		</tbody>
	</table>
	<script>
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
</script>

</div>