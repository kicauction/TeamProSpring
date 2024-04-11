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
                <h4 class="mb-3">1대1문의 내용</h4>
                <table class="table">
                    <tr>
                        <td>내용:</td>
                   </tr>
                    	
                        <tr>
                            <td>${answerinfo.content}</td>
                        </tr>
                   
                   
                </table>
            </div>
        </div>
    </div>
</body>
</html>
