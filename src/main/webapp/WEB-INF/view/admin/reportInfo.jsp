<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Info</title>
</head>
<body>
    <div class="container">
        <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
                <h4 class="mb-3">게시판</h4>
                <table class="table">
                    <tr>
                        <td>내용:</td>
                    </tr>
                    	<c:forEach var="report" items="${reportlist}">
                        <tr>
                            <td>${report.content}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" class="text-right">
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/ReportForm?num=${board.pnum}">신고</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
