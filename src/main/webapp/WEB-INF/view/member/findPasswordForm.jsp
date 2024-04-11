<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- head 부분 생략 -->
</head>
<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto text-center">
                <h2 class="mb-3" style="text-align:center">비밀번호 찾기</h2><p>
                <form class="validation-form" action="findPasswordPro" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" placeholder="아이디" name="id" required>
                        </div><p>
                        <div class="col-md-6 mb-3">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" placeholder="이름" name="name" required>
                        </div><p>
                        <div class="col-md-6 mb-3">
                            <label for="email">이메일</label>
                            <input type="email" class="form-control" id="email" placeholder="이메일" name="email" required>
                        </div><p>
                    </div><p>
                    <div class="mb-1"></div>
                    <button class="lo" type="submit">비밀번호 찾기</button>
                </form>
            </div>
        </div>
    </div>
    <!-- 기타 코드 생략 -->
</body>
</html>
