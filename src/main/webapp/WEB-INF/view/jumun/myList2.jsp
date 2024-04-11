<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<main>
    <div class="container">
    <h2 class="my-4">판매등록 상품</h2>
    
    <form action="${pageContext.request.contextPath}/jumun/myList" method="post">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">물품번호</th>
                    <th scope="col">이미지</th>
                    <th scope="col">물품명</th>
                 
               
                    <th scope="col">현재가</th>
                    <th scope="col">입찰횟수</th>
                    <th scope="col">마감일</th>
                 
                </tr>
            </thead>
            <tbody>
                <c:forEach var="j" items="${li}">
                    <tr>
                        <td>${j.pnum}</td>
                      <td>    <a href="boardInfo?num=${j.pnum}"> <img
                        src="${pageContext.request.contextPath}/image/board/${j.file1}"
                        style="width: 80px; height: 50px;" alt=""></a></td>
                        <td>${j.pname}</td>
                        <td>${j.price}</td>
                        <td>${j.readcnt}</td>
                  <td><fmt:formatDate value="${j.regdate}"
										pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /></td>
                  
                    </tr>
                </c:forEach>
            </tbody>
        </table>
             
    </form>
</div>
</main>
</body>
</html>