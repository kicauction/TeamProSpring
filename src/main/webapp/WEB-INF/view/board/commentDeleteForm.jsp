<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 삭제</title>
</head>
<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3 center">댓글 삭제</h4>

                <!-- 추가된 부분: 현재 댓글의 내용 표시 -->
                <c:if test="${comment ne null}">
                    <p>댓글 내용: ${comment.content}</p>
                </c:if>

                <form class="validation-form" novalidate action="${pageContext.request.contextPath}/board/commentDeletePro" method="post">
                    <input type="hidden" name="ser" value="${ser}">
                    <!-- commentId 대신 userid를 전송할 수 있도록 사용자의 ID를 입력받는 필드를 추가합니다. -->
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="userid">사용자 ID</label>
                            <input type="text" class="form-control" id="userid" readonly name="userid" 
                            value="${amem.id}" required >
                        </div>
                    </div>

                    <input type="hidden" name="boardnum" value="${board.pnum}">
                    <!-- 댓글의 작성자를 확인하기 위해 boardnum을 서버로 전송합니다. -->

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="pass">비밀번호</label>
                            <input type="password" class="form-control" id="pass" placeholder="" value="${pass}" name="pass" >
                            <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        </div>
                    </div>

                    <div class="mb-4"></div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit">삭제</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        window.addEventListener('load', () => {
            const forms = document.getElementsByClassName('validation-form');
            Array.prototype.filter.call(forms, (form) => {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    </script>
</body>
</html>


