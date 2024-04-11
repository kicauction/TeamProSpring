<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<style>
.list {
	list-style: none;
	margin: 0;
	padding: 0;
	
}

.list {
	margin: 2px 2px auto; /* 상하 0, 좌우 10px 간격 지정 */
	margin-left: 6px;
	padding: 0 0px;
	border-radius: 5px;
	float: left;
	position: relative;
	text-align: center; /* 내용 중앙 정렬 */
}
.remaining-time {

	font-weight: bold; /* 굵기 설정 */
	font-size: 15px; /* 크기 설정 */
	color: red; /* 글자 색상 설정 */
}
.now_best{
margin-bottom:700px;
}
.product{
	font-weight: bold; /* 굵기 설정 */
	font-size: 15px; /* 크기 설정 */
	color: black; /* 글자 색상 설정 */
}
</style>


<body>
	<div class="wrap">
		<div class="main">
			<!-- 상단 슬라이드 사진 start -->

			<div
				class="main-rolling mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
				<ul class="swiper-wrapper" id="swiper-wrapper-2c1ef87784aa5cfe"
					aria-live="off"
					style="transition-duration: 0ms; transform: translate3d(-2113.54px, 0px, 0px);">
					<li
						class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev"
						data-swiper-slide-index="0" role="group" aria-label="1 / 10">
						<a href="" target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
								<div class="main_roll_tit">당신의 음악생활을 도와드리는</div>
								<div class="main_roll_txt">MUSICAL INSTRUMENTS</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/art.png"
									alt="골프클럽">
							</div>
					</a>
					</li>
					<li
						class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
						data-swiper-slide-index="1" role="group" aria-label="2 / 10">
						<a
						href="/hey/search?keyword=%ED%94%BC%EA%B7%9C%EC%96%B4&amp;type=buy
"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
								<div class="main_roll_tit">스타일리쉬 감성 가전제품</div>
								<div class="main_roll_txt">STYLISH APPLIANCES</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/ell.png"
									alt="피규어">
							</div>
					</a>
					</li>
					<li
						class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
						data-swiper-slide-index="2" role="group" aria-label="3 / 10">
						<a href="" target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
								<div class="main_roll_tit">정교함의 극치! 프라모델</div>
								<div class="main_roll_txt">HIGH END QUALITY PLAMODEL</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/pramodel.png"
									alt="프라모델">
							</div>
					</a>
					</li>
					<li class="swiper-slide swiper-slide-duplicate"
						data-swiper-slide-index="3" role="group" aria-label="4 / 10">
						<a
						href="/hey/search?keyword=%EC%BA%A0%ED%95%91%EC%9A%A9%ED%92%88&amp;type=buy
"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
								<div class="main_roll_tit">골동품 고서화 엔티크</div>
								<div class="main_roll_txt">ENTIQUE CURIOUS GOODS</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/goods.png"
									alt="캠핑용품">
							</div>
					</a>
					</li>
					<li class="swiper-slide swiper-slide-duplicate"
						data-swiper-slide-index="4" role="group" aria-label="5 / 10">
						<a
						href="/hey/search?keyword=%EB%82%9A%EC%8B%9C%EC%9A%A9%ED%92%88&amp;type=buy"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
								<div class="main_roll_tit">유명브랜드 신발</div>
								<div class="main_roll_txt">BRAND SHOES</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/shoes.png"
									alt="낚시용품">
							</div>
					</a>
					</li>
					<li class="swiper-slide" data-swiper-slide-index="1" role="group"
						aria-label="4 / 10"><a
						href="/hey/search?keyword=%EC%BA%A0%ED%95%91%EC%9A%A9%ED%92%88&amp;type=buy
"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
							<div class="main_roll_tit">당신의 음악생활을 도와드리는</div>
								<div class="main_roll_txt">MUSICAL INSTRUMENTS</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/art.png"
									alt="캠핑용품">
							</div>
					</a></li>
					<li class="swiper-slide" data-swiper-slide-index="2" role="group"
						aria-label="4 / 10"><a
						href="/hey/search?keyword=%EC%BA%A0%ED%95%91%EC%9A%A9%ED%92%88&amp;type=buy
"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
								<div class="main_roll_tit">스타일리쉬 감성 가전제품</div>
								<div class="main_roll_txt">STYLISH APPLIANCES</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/ell.png"
									alt="캠핑용품">
							</div>
					</a></li>

					<li class="swiper-slide" data-swiper-slide-index="3" role="group"
						aria-label="4 / 10"><a
						href="/hey/search?keyword=%EC%BA%A0%ED%95%91%EC%9A%A9%ED%92%88&amp;type=buy
"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
							<div class="main_roll_tit">정교함의 극치! 프라모델</div>
								<div class="main_roll_txt">HIGH END QUALITY PLAMODEL</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/pramodel.png"
									alt="캠핑용품">
							</div>
					</a></li>
					<li class="swiper-slide" data-swiper-slide-index="4" role="group"
						aria-label="5 / 10"><a
						href="/hey/search?keyword=%EB%82%9A%EC%8B%9C%EC%9A%A9%ED%92%88&amp;type=buy"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
									<div class="main_roll_tit">골동품 고서화 엔티크</div>
								<div class="main_roll_txt">ENTIQUE CURIOUS GOODS</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/goods.png"
									alt="낚시용품">
							</div>
					</a></li>
					<li class="swiper-slide" data-swiper-slide-index="5" role="group"
						aria-label="6 / 10"><a
						href="/hey/search?keyword=%EC%95%85%EA%B8%B0&amp;type=buy"
						target="_self" data-b_type="slider" data-b_loc="1"
						data-b_sloc="24">
							<div class="main_roll_text">
									<div class="main_roll_tit">유명브랜드 신발</div>
								<div class="main_roll_txt">BRAND SHOOES</div>
							</div>
							<div class="main_roll_img">
								<img src="${pageContext.request.contextPath}/image/shoes.png"
									alt="악기">
							</div>
					</a></li>



				</ul>
				<div class="swiper-pagination"></div>
				<span class="swiper-notification" aria-live="assertive"
					aria-atomic="true"></span>
			</div>
		</div>
		<script>
			var main_rolling = new Swiper(".main-rolling ", {
				autoplay : {
					delay : 3500,
					disableOnInteraction : false,
				},
				centeredSlides : true,
				slidesPerView : "auto",
				spaceBetween : 0,
				loop : true,
				loopAdditionalSlides : 1,
				speed : 3000,
			});
		</script>
		<!-- 상단 슬라이드 사진 end -->

		<!-- 중단 영역 스타트 -->

		<div class="conent_box">
			<div class="main_show_up_list">
				<h3 class="hd3">경매 카테고리</h3>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/board/products?boardid=1"
						target="_self" data-b_type="img" data-b_idx="712">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/ele.png"
									alt="악기">
							</div>
							<div class="msul_text">
								<div class="msul_txt">생활을 풍요롭게 하는 기술의 선물</div>
								<div class="msul_tit">가전</div>
							</div>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/board/products?boardid=2"
						target="_self" data-b_type="img" data-b_idx="713">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/cloths.png"
									alt="악기" alt="J-POP">
							</div>
							<div class="msul_text">
								<div class="msul_txt">개성을 표현하는 캔버스</div>
								<div class="msul_tit">의류</div>
							</div>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/products?boardid=3"
						target="_self" data-b_type="img" data-b_idx="714">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/pra.png"
									alt="악기" alt="카메라 렌즈">
							</div>
							<div class="msul_text">
								<div class="msul_txt">손끝에서 탄생하는 무한한 상상력</div>
								<div class="msul_tit">프라모델</div>
							</div>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/products?boardid=4"
						target="_self" data-b_type="img" data-b_idx="715">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/entique.png"
									alt="악기" alt="명품 시계">
							</div>
							<div class="msul_text">
								<div class="msul_txt">시간이 흘러도 변치않는 품격</div>
								<div class="msul_tit">골동품</div>
							</div>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/board/products?boardid=5"
						target="_self" data-b_type="img" data-b_idx="716">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/music.png"
									alt="악기" alt="PS 5">
							</div>
							<div class="msul_text">
								<div class="msul_txt">가슴속 깊은곳 연주자의 꿈</div>
								<div class="msul_tit">악기</div>
							</div>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/products?boardid=6"
						target="_self" data-b_type="img" data-b_idx="717">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/watch.png"
									alt="악기" alt="닌텐도 스위치">
							</div>
							<div class="msul_text">
								<div class="msul_txt">시간을 초월하는 우아함의 상징</div>
								<div class="msul_tit">명품 시계</div>
							</div>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/products?boardid=7"
						target="_self" data-b_type="img" data-b_idx="718">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/ring.png"
									alt="악기" alt="애니 DVD">
							</div>
							<div class="msul_text">
								<div class="msul_txt">작은 디테일에서 발견하는 자신만의 스토리</div>
								<div class="msul_tit">악세사리</div>
							</div>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/products?boardid=8"
						target="_self" data-b_type="img" data-b_idx="719">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/fishing.png"
									alt="악기" alt="펜더 기타">
							</div>
							<div class="msul_text">
								<div class="msul_txt">일상을 벗어나 자유를 만끽하는 순간</div>
								<div class="msul_tit">레저</div>
							</div>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/allList"
						target="_self" data-b_type="img" data-b_idx="720" ">
							<div class="msul_img">
								<img src="${pageContext.request.contextPath}/image/banner.png"
									alt="레고 월드">
							</div>
							<div class="msul_text" style="background-color:rgba(166, 166, 166, 0.8); ">
								<div class="msul_tit">실시간 경매</div>
								<div class="msul_txt">
									흥미로운 상품을<br>찾아 보세요!
								</div>
							</div>
					</a></li>
				</ul>
			</div>

			<script>
				var swiper = new Swiper(".spex_roll", {
					slidesPerView : 9,
					loop : true,
					autoplay : {
						delay : 2500,
						disableOnInteraction : true,
					},
					navigation : {
						nextEl : ".special_ex .swiper-button-next",
						prevEl : ".special_ex .swiper-button-prev",
					},
				});
			</script>
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
			<!-- 하단 영역 스타트 -->

		</div>




		<!-- 배너 끝 -->
		<!-- 페이지 내용 끝 -->
	</div>
</html>