<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="mypage">

	<form class="container input-form"
			action="boardUpdatePro"
			method="post" enctype="multipart/form-data">
<script>
function previewImage(input) {
    var file = input.files[0];
    if (file) {
      var reader = new FileReader();
      reader.onload = function (e) {
        document.getElementById("pic").src = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  }

</script>
<div class="basket_title">
	<div class="basket_title_cover">
		판매글 수정<br>
		<span style="font-size:13px;color:#777;">
			<!-- 추가설명란 -->
		</span>
		<input type="hidden" name="userid" value="${amem.id }">
		<input type="hidden"  name="pnum"  value="${board.pnum }">
   <input type="hidden"  name="originfile"  value="${board.file1 }">
	</div>
</div>
<li>
	<div id="contents">
		<table class="selfbuy">
			
			<colgroup>
				<col width="30%;">
				<col width="70%;">
			</colgroup>
			<tbody><tr>
				<td><span class="astros">
				<label for="fileInput">
    <img src="${pageContext.request.contextPath}/image/integ/20151022_02.png" id="pic" style="cursor: pointer;">
    <input type="file" accept="image/*" onchange="previewImage(this)" name="f" id="fileInput" style="display: none;">
</label>
				
				</span>
     
     
     
     </td>
				<td style="text-align:left;">
					<table class="callfor_table" style="width : 800px;">
						<colgroup>
							<col width="115px">
							<col width="285px">
							<col width="115px">
							<col width="285px">
						</colgroup>
						<!--
						<tr>
							<th style="border-top:1px solid #000;">상품판매 국가</th>
							<td colspan="3" style="border-top:1px solid #000;"><span style="margin:0 20px 0 0"><input type="radio" name="loc1" value="jp">일본</span><input type="radio" name="loc1" value="us">미국</td>
						</tr>
						-->
					
						<tbody>
							<tr>
							<th>&nbsp;&nbsp;상품명</th>
							<td><input type="text" class="input_kobe" name="pname" id="pname"  value="${board.pname }" style="width:220px;"></td>
							<th>&nbsp;&nbsp;카테고리</th>
							<td>
		<select class="form-control" id="boardCategory" name="boardid"  style="width: 100px; height:35px">
            <option value="1" style="text-align: center;">가전</option>
            <option value="2" style="text-align: center;">의류</option>
            <option value="3" style="text-align: center;">프라모델</option>
            <option value="4" style="text-align: center;">골동품</option>
            <option value="5" style="text-align: center;">악기</option>
            <option value="6" style="text-align: center;">명품시계</option>
            <option value="7" style="text-align: center;">악세사리</option>
            <option value="8" style="text-align: center;">레저</option>
            
        </select></td>
						</tr>
						<tr>
							<th>&nbsp;&nbsp;상세정보</th>
							<td><input type="text" class="input_kobe" name="subject" id="subject" value="${board.subject }" style="width:220px;"></td>
							<th>&nbsp;&nbsp;비밀번호</th>
							<td><input type="password" class="input_kobe" name="pass" id="pass" style="width:220px;"></td>
						</tr>
						<tr>
							<th>입찰시작가격</th>
							<td><input type="text" class="input_kobe" name="price" id="price" value="${board.price }" style="ime-mode:disabled;width:220px;" onblur="onlynumber_blur(this)" onkeydown="return onlyNumber3(event)" maxlength="20"></td>
							<th>즉시구매가격</th>
							<td><input type="text" class="input_kobe" name="prompt" id="prompt" value="${board.prompt }" style="ime-mode:disabled;width:220px;" onkeydown="return onlyNumber(event)" maxlength="20"></td>
							</tr>
						<tr>
							<th style="border-bottom:1px solid #E2E2E2;">&nbsp;&nbsp;제품설명</th>
							<td colspan="3" style="border-bottom:1px solid #E2E2E2;"><textarea class="input_chiba" name="content" id="content" style="width:622px;">${board.content }</textarea></td>
						</tr>

					

					</tbody></table>
				</td>
			</tr>
		</tbody></table>
	</div>
	<table>

		<tbody><tr>
			<td style="border-bottom:none;border-left:none;border-right:none;text-align:center;padding:25px 0 5px 0;">
			<button type="submit" id="self_send" style="cursor:pointer" class="kenya">수정하기</button>
			<button type="button" style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/board/products'" class="nairobi">취 소</button></td>
		</tr>
	</tbody></table>
</li>

</form>
<script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false); </script>

</div>