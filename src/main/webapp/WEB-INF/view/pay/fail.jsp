<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
    <link
      rel="icon"
      href="https://static.toss.im/icons/png/4x/icon-toss-logo.png"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tossStyle.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>토스페이먼츠 샘플 프로젝트</title>
    
<script>
  const urlParams = new URLSearchParams(window.location.search);

  const codeElement = document.getElementById("code");
  const messageElement = document.getElementById("message");

  codeElement.textContent = "에러코드: " + urlParams.get("code");
  messageElement.textContent = "실패 사유: " + urlParams.get("message");
</script>
</head>
<body>
<div class="result wrapper">
      <div class="box_section">
        <h2 style="padding: 20px 0px 10px 0px">
          <img
            width="25px"
            src="https://static.toss.im/3d-emojis/u1F6A8-apng.png"
          />
          결제 실패
        </h2>
        <p id="code"></p>
        <p id="message"></p>
      </div>
    </div>
  </body>
</body>
</html>