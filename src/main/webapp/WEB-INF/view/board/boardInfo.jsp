<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="/js/jquery.alerts.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/common/css/jquery.alerts.css"
	type="text/css">


<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
}

.close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

#remainingTime {
	font-size: 18px;
	text-align: center;
	color: black;
	font-weight: bold;
	background-color: yellow;
	color: black;
	padding: 5px;
	border-radius: 10px;
}
</style>
<script>
    function updateRemainingTime(regdate) {
        var loggedInUserId = "${amem.id}";
        var boardBuyId = "${board.buyid}";
        var boardEndValue = "${board.end}"; // 서버에서 받은 board.end 값

        // 즉시구매된 상품이거나 board.end 값이 "1"이면 결제하기 버튼 숨김
        if (!regdate || boardEndValue === "1") {
            $("#remainingTime").html("즉시구매 된 상품입니다.");
            $(".det_btns a").hide(); // 입찰 및 즉시구매 버튼 숨기기

            // 즉시구매된 상품이고 로그인한 사용자가 입찰자와 같은 경우 결제 버튼 표시
            if (boardEndValue !== "1" && loggedInUserId === boardBuyId) {
                $("#paymentButton").show();
            } else {
                $("#paymentButton").hide();
            }
            return;
        }
        var currentTime = new Date().getTime();
        var expirationTime = new Date(regdate).getTime() + (7 * 24 * 60 * 60 * 1000);

        var remainingTime = expirationTime - currentTime;
        if (remainingTime <= 0) {
            $("#remainingTime").text("시간이 만료된 상품입니다.");
            
            $(".det_btns a").hide();
            
            // 비로그인시 결제버튼 감추기
            $("#paymentButton").hide();
            return;
        }
        
        // 남은 시간 표시 및 버튼 숨김 로직
        $(".cart button").show();
        var days = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
        var hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((remainingTime % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

        $("#remainingTime").text(days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초");
        $("#paymentButton").hide(); // 남은 시간이 표시되는 경우 결제 버튼 감추기
    }

    $(document).ready(function() {
        updateRemainingTime("${board.regdate}");
    });

    setInterval(function() {
        updateRemainingTime("${board.regdate}");
    }, 1000); // 1초마다 업데이트
</script>

<script>
	window.onload = function() {
		// 시작 시간을 파싱합니다. 예시: "2023-03-01T12:00:00"
		var startDate = new Date("${board.idate}");

		// 시작 시간에 7일을 더합니다.
		var endDate = new Date(startDate.getTime() + 7 * 24 * 60 * 60 * 1000);

		// 종료 시간을 "yyyy년 MM월 dd일 HH시 mm분 ss초" 형태로 포맷합니다.
		var endDateStr = endDate.getFullYear() + "년 "
				+ (endDate.getMonth() + 1) + "월 " + endDate.getDate() + "일 "
				+ endDate.getHours() + "시 " + endDate.getMinutes() + "분 "
				+ endDate.getSeconds() + "초";

		// 포맷된 종료 시간을 웹 페이지에 표시합니다.
		document.getElementById("endTime").innerHTML = endDateStr;
	};
</script>
<script> 
		let count = ${count}
		function enterkey(pnum, userid) {
		   if(window.event.keyCode==13) {
		      commentPro(pnum, userid)
		   }
		}
		function commentPro(pnum, userid) {
		   count = count+1
		   let comment = document.querySelector("#comment").value
		   //alert(comment)
		   const xhttp = new XMLHttpRequest()
		   let url = "${pageContext.request.contextPath}/board/boardCommentPro?comment="
		         +comment+"&boardnum="+pnum+"&count="+count+"&userid="+userid
		   xhttp.open("GET",url,true)
		   xhttp.send()
		   xhttp.onreadystatechange = function() {      
		      if(this.readyState ==4 && this.status==200) {
		     
		      
		   let commentList = document.querySelector("#commentList")
		   commentList.innerHTML = this.responseText + "<br>" + commentList.innerHTML
		   location.reload(true);
		      }      
		}
		   document.querySelector("#comment").value=""
		   }
	
	
		</script>

</head>
<body>

	<div id="mypage">



		<form action="" id="detail_frm" method="post" accept-charset="utf-8">
			<div class="pro_detail_box">
				<div class="pro_d_img">
					<div id="sec_img">
						<div class="img_k">
							<img
								src="${pageContext.request.contextPath}/image/board/${board.file1}"
								id="big_img" alt="">
						</div>

					</div>

				</div>

				<div class="pro_d_info">

					<!--161208 경매용어 레이어-->

					<!--경매용어 레이어 fin.-->
					<div class="pro_d_top">
						<span class="prd_id">상품번호 : ${board.pnum }</span> <span
							class="id_number"></span> <a class="btn btn-primary"
							style="font-size: 13px;"
							href="${pageContext.request.contextPath}/admin/ReportForm?num=${board.pnum}">게시물신고</a>

					</div>

					<div class="pro_d_tit" id="trans_after_subject">${board.pname}</div>
					<div class="pro_d_detail">
						<div class="pro_dd_up">
							<div class="item top first">
								<span class="pro_dd_tit">입찰건수</span> <span class="pro_dd_nbig"
									style="font-size: 15px;"> <a class="btn btn-primary"
									onclick="openModal('${board.pnum}')" href="#"> ${maxbuy}
										기록보기</a>
								</span>
							</div>
							<div class="item top sec">
								<span class="pro_dd_tit">남은시간</span>
								<div id="remainingTime"></div>

								<!-- <span class="pro_dd_nbig">2일 +10:56:14</span> -->
							</div>

							<div class="item bottom first">
								<span class="pro_dd_tit">시작시간</span> <span class="pro_dd_gray"><fmt:formatDate
										value="${board.idate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /></span>
							</div>
							<div class="item bottom sec">
								<span class="pro_dd_tit">종료시간</span> <span class="pro_dd_gray"
									id="endTime"></span>
							</div>
						</div>
						&nbsp;

						<div class="pro_dd_up">
							<div class="item top first">
								<span class="pro_dd_tit">시작가격</span> <span class="pro_dd_gray"
									style="font-size: 20px; color: black; font-weight: bold;"><fmt:formatNumber
										value="${board.price}" pattern="#,##0" /> 원</span>
							</div>
							<div class="item top sec">
								<span class="pro_dd_tit">즉시구매가</span> <span class="pro_dd_nbig"
									style="font-size: 20px; color: red; font-weight: bold;"><fmt:formatNumber
										value="${board.prompt}" pattern="#,##0" /> 원</span>
							</div>


							<div class="item bottom first">
								<span class="pro_dd_tit">현재가</span> <span class="pro_dd_gray"
									style="font-size: 20px; color: blue; font-weight: bold;"><fmt:formatNumber
										value="${board.buy}" pattern="#,##0" /> 원</span>
							</div>
							<div class="item bottom sec">
								<span class="pro_dd_nbig" style="font-size: 12px;"> ※
									현재가와 상관없이 낙찰이 되며 경매가 종료됩니다. ※</span>
							</div>
							<div class="item bottom ">현재 입찰자 ID : ${board.buyid }</div>
						</div>
						<div class="pro_dd_btn">


							<script>
				function Popup() {
				    // 이전 입찰 또는 즉시구매가 가져오기
				   
				    var currentBid = ${board.buy};
				    var startPrice = currentBid ? currentBid : ${board.price};
				    var promptPrice = ${board.prompt};
				    // 숫자를 3자리마다 쉼표로 포맷팅
				    var formattedStartPrice = startPrice.toLocaleString();
				    var formattedPromptPrice = promptPrice.toLocaleString();
				    // 두 번째 입찰부터는 이전 입찰가를 기준으로 범위 설정
				    var bidRangeStart = currentBid ? currentBid : ${board.price};
				    var buyAmount = prompt("구매 또는 입찰하려는 금액을 입력하세요.\n" + formattedStartPrice + 
				    		"~" + formattedPromptPrice + "사이의 금액을 입력하세요", "0");
				    if (buyAmount !== null) {
				        // 입력값이 숫자인지 확인
				        if (!isNaN(buyAmount)) {
				            // 입력값이 범위에 있는지 확인
				            if (parseInt(buyAmount) >= parseInt(bidRangeStart) && parseInt(buyAmount) <= parseInt(promptPrice)) {
				                // 올바른 범위에 속한 경우 서버로 전송
				                window.location.href = "${pageContext.request.contextPath}/board/buyPro?pnum=${board.pnum}&buy=" 
				                		+ buyAmount + "&buyid=${amem.id}";
				            } else {
				                alert("입력한 금액이 올바른 범위에 속하지 않습니다.");
				            }
				        } else {
				            alert("숫자를 입력하세요.");
				        }
				    }
				}

			function buyNow() {
			    if (confirm("즉시구매를 하시겠습니까?")) {
			        var pnum = ${board.pnum};
			        var userid = "${amem.id}";
			        var prompt= ${board.prompt};
			
			        $.ajax({
			            type: "POST",
			            url: "${pageContext.request.contextPath}/board/buyNowPro",
			            data: {
			                "pnum": pnum,
			                "userid": userid,
			                "prompt": prompt
			            },
			            success: function(response) {
			                // 성공 처리
			                alert(response);
			                window.location.reload();
			            },
			            error: function(error) {
			                console.error("Error during buyNowPro request:", error);
			            }
			        });
			    }
			}
	</script>


							<div class="pro_dd_btn_box det_btns"></div>


							<c:if test="${sessionScope.id==null}">

								<div class="pro_dd_btn_txt" style="font-size: 15px;">
									경매참여 희망 시 로그인이 필요합니다. <a
										href="${pageContext.request.contextPath}/member/loginForm"
										style="color: red;"> > 로그인 하러가기 < </a>
								</div>

							</c:if>
						</div>

						<c:if test="${sessionScope.id!=null}">


							<div class="pro_dd_btn_box det_btns">
							
								<a class="black" onclick="Popup()" id="auction_send"
									title="바로입찰" href="javascript:;" style="font-weight: bold;">입찰하기</a>
									
									
								<a class="red" onclick="buyNow()"
									style="background-color: red; font-weight: bold; border: 0px solid red; color: white;"
									onclick=";" href="javascript:;" rel="btn_compare"> 즉시구매 </a>
							</div>




							<!-- 기존의 <button> 태그를 사용하지 않고 <a> 태그만 사용 -->
							<a
								href="${pageContext.request.contextPath}/board/checkout?num=${board.pnum}"
								id="paymentButton"
								style="text-align: center; font-size: 15px; margin-left: 240px; height: 20px; width: 
								200px; display: inline-block; background-color: red; color: white; text-decoration:
								 none; padding: 10px 20px; font-weight: bold; border-radius: 5px;">결제하기</a>


							<div class="pro_dd_btn_txt">입찰 및 낙찰시에는 취소가 되지 않으니 상품 문의 시에는
								입찰전 고객센터를 통해 문의후 입찰 부탁드립니다.</div>
						</c:if>
					</div>


					<div class="pro_dd_price">
						<!-- <div class="item top" id="select_quantity"> -->


						<div class="pro_dd_re">
							<div class="pro_dd_re_chart">
								<div class="item first">
									<span class="rec_tit">제품상세</span> <span class="gray"><span
										id="trans_after_status">${board.subject }</span></span>
								</div>
								<div class="item">
									<span class="rec_tit">판매자 정보</span> <span class="gray"></span>
								</div>
								<div></div>
								<div></div>
								<div class="item first">
									<span class="rec_tit">반품가능여부</span> <span class="gray"><span
										id="trans_after_return_info">반품 불가</span></span>
								</div>
								<div class="item">
									<span class="rec_tit"> <img
										src="${pageContext.request.contextPath}/image/renew220916/id_icon.png"
										alt="아이콘">아이디
									</span> <span> <span class="black">${board.userid } </span>
									</span> <span> <span class="black">신고 횟수 ${reportcount}</span>
									</span>
								</div>



							</div>
						</div>




					</div>



				</div>
			</div>
		</form>

	</div>



	<div class="pro_content">
		<!-- 상품상세정보 -->
		<a id="tab1"></a>
		<div class="pro_con_menu">
			<ul>
				<li><a class="on" onclick="javascript:move_scroll('#tab2');">상품상세정보</a>
				</li>
				<li><a onclick="javascript:move_scroll('#tab2');">판매자 질문/답변</a></li>

			</ul>
		</div>
		<div class="pro_con_in">
			<div class="pro_de_info">
				<div class="pro_de_info_txt">
					<span class="pro_de_tit"> 해당 상품은 판매자가 직접 발송되는 상품입니다. </span><br>
					<br> <span class="pro_de_txt"> 배송기간은 주문후 7~14일(영업일
						기준)정도 소요될 수 있습니다.<br> (도서산간의 경우 배송이 2~3일 더 지연될 수 있습니다)<br>

					</span><br> <span class="blue"> 당 사이트의 결제금액에는 관부가세가 포함되어 있지
						않습니다. </span>
				</div>
				<div class="pro_de_right">
					<div class="up">
						<span><img src="/images/renew220916/up_icon.png" alt=""></span>
						<span> 이 제품은 경매를 통하여 유통되는 제품입니다.<br> 이 제품은 '전기용품 및
							생활용품 안전관리법'에 따른 안전관리<br> 대상 제품입니다.
						</span>
					</div>
					<div class="down">
						<span><img src="/images/renew220916/down_icon.png" alt=""></span>
						<span> 아래의 글이나 이미지는 판매자가 직접 판매상품을 올려놓고<br> 설명해 놓은것으로,
							실물과 다르거나 내용이 정확하지 않을 수<br> 있으니 반드시 <span class="red">판매자
								문의</span>를 통해 확인하시기 바랍니다.<br> 다른 문의에 대해 궁금한 사항은 <span class="red">고객센터,
								게시판</span> 등을 통해 문의후 입찰해<br> 주시기 바랍니다.
						</span>
					</div>
				</div>
			</div>



			<div id="myModal" class="modal">
				<div class="modal-content">
					<span class="close-btn" onclick="closeModal()">&times;</span>

					<table class="table table-bordered">
						<thead>
							<tr>
								<th>일시</th>
								<th>입찰자</th>
								<th>입찰금액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ab" items="${ab}">
								<tr>
									<td><fmt:formatDate value="${ab.buydate}"
											pattern="yyyy년 MM월 dd일 HH시 mm분 " /></td>
									<td>${ab.buyid}</td>
									<td><fmt:formatNumber value="${ab.buy}" pattern="#,##0" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
			<script>
		  // 모달 열기
	    function openModal() {
	        document.getElementById('myModal').style.display = 'block';
	    }

	    // 모달 닫기
	    function closeModal() {
	        document.getElementById('myModal').style.display = 'none';
	    }
	    //--end
	    
	    
	    

function checkInput(pnum) {
    var commentInput = document.getElementById("comment");
    var saveButton = document.getElementById("saveButton");

    // 값이 있을 때 버튼 활성화, 없을 때 비활성화
    if (commentInput.value.trim() !== "") {
        saveButton.removeAttribute("disabled");
    } else {
        saveButton.setAttribute("disabled", "disabled");
    }
}
function checkAndShowLoginForm() {
    if (${sessionScope.id == null}) {
        if (confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")) {
            window.location.href = "${pageContext.request.contextPath}/member/loginForm";
        } else {
            // 아무 동작 없이 확인 창이 닫힘
        }
    }
}
function reserv(ser, index) {
	   
	   fetch('${pageContext.request.contextPath}/board/reservComm?ser='+ser)
	   .then(response => response.text())
	    .then(data => {
	        // 서버에서 받은 데이터(data)를 사용하여 작업 수행
	        document.querySelector("#r"+index).innerHTML=data // 새로고침하지않아도 데이터가 업데이트가됨
	        
	        
	    })
	    .catch(error => {
	        // 오류가 발생한 경우 처리
	        console.error('Fetch error:', error);
	    });
}
</script>
			<table>
				<tbody>
					<tr>
						<td id="translate_detail"
							style="font-size: 15px; overflow: hidden; color: #000000; text-align: center;"><span
							id="trans_after_content"> <img
								src="${pageContext.request.contextPath}/image/board/${board.file1}"
								width="680px" height="680px" alt="Product Image"><br>

								${board.content}




								<ul style="MARGIN-TOP: 50PX;">
									<table class="KOSI">
										<caption>배송방법과 배송료</caption>
										<colgroup>
											<col width="200PX;">
											<col width="">
										</colgroup>
										<tbody style="text-align: left;">
											<tr id="">
												<td>배송 부담</td>
												<td id="">낙찰자</td>
											</tr>
											<tr id="">
												<td>발송원</td>
												<td id="">판매자가 직접 발송</td>
											</tr>
											<tr id="">
												<td>발송 개시</td>
												<td id="">지불절차로부터 3～7일 만에 발송</td>
											</tr>

											<tr id="DPRICE_TR">
												<td>배송비</td>
												<td id="DPRICE">3,000원</td>
											</tr>
										</tbody>
									</table>
								</ul>
						</span></td>
					</tr>

				</tbody>

			</table>


		</div>
		<!-- //상품상세정보 -->

		<!-- 판매자 질문/답변 -->
		<div class="pro_de_in">
			<div class="pro_qna_box">
				<div class="pro_qna_btn">
					입찰자들의 판매자 문의를 실시간으로 보여드립니다.<br> 단순 참조용 정보이므로 자세한
					문의사항이 있을 경우 1:1게시판을 통해 문의해 주시기 바랍니다.
					<ul>
						<li></li>
					</ul>
				</div>
				<!--댓글작성  -->
				<div class="example-div">
					
					<div class="col-sm-1"></div>
				</div>
				<!--댓글작성  -->


				<div class="pro_qna mk" id="commentList">

					<ul>
					<li><span class="de_in_menu"> <span class="tit_gray">작성자</span>
					<input type="hidden"
						id="hiddenUserId" name="userid" value="${amem.id}">
									<span class="tit_name">${amem.id} 님</span> <br>
				</span>
				
				 <div class="col-sm-10">
						<input type="text" class="form-control"  id="comment"
							style="width:500px; height:30px;"
							onclick="checkAndShowLoginForm()"
							onkeyup="checkInput('${board.pnum}')">
						<button class="btn btn-primary" id="saveButton"
							style="background-color:#DC3224; color:white; border:none; height:30px;"
							onclick="commentPro('${board.pnum}')" disabled>문의작성</button>
					</div>
							</li>
					
					
					
						<c:set var="sercount" value="${count}" />
						<c:forEach var="c" items="${commentLi}">
							<li><span class="de_in_menu"> <span class="tit_gray">작성자</span>
									<span class="tit_name">${c.userid} 님</span> <span
									class="tit_date">${c.regdate}</span><br>
									<button type="button"
										onclick="reserv('${c.ser}', '${status.index}')">
										추천 [<span id="r${status.index}">${c.upcnt}</span>]
									</button>
							</span> <span class="de_in_text"> ${c.content} </span>
							<form
								action="commentDeletePro"
								method="post">
								<input type="hidden" name="ser" value="${c.ser}">
								<button type="submit" style="background-color:#DC3224; color:white; border:none; height:30px;">삭제</button>
								
							</form>
							</li>
						</c:forEach>
					</ul>


				</div>

			</div>

			<!-- 이 상품과 비슷한 상품 추가 -->



			<!-- 이 상품과 비슷한 상품 추가 -->
		</div>
		<!-- //상품고시 -->

	</div>








	<!-- 즉시구매 안내 레이어 팝업 -->








</body>

</html>
