<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
        .content-preview {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .expanded {
            white-space: normal;
            overflow: visible;
            text-overflow: unset;
        }
    </style>
      <script>
    function checkFile(fileId, fileName) {
        // fileId와 fileName을 사용하여 서버에 파일 다운로드 요청
       
        window.open('${pageContext.request.contextPath}/single/temp.jsp?filename='+fileName, '', 'left=100,top=100,width=320,height=320')
    }
    
    
    
</script>

<script>
    function AnswerForm(num) {
        // AnswerForm 함수 내에서 팝업을 띄우는 로직을 추가
        var contextPath = '${pageContext.request.contextPath}';
        window.open(contextPath + '/admin/AnswerForm?num=' + num ,"_blank", "width=400, height=400");
    }
</script>


        
        
        
        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/main">관리자 페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/index">main</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/Reportlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                신고된 게시물
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/MemberList">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                회원관리
                            </a>
                             <a class="nav-link" href="${pageContext.request.contextPath}/admin/Question">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                1대1 문의
                            </a>
                          
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                       
                     <div>&nbsp;
                      <div>&nbsp;
                     </div>
                     </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                1대1문의
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디:</th>
                                            <th>제목:</th>
                                            <th>1대1문의내용:</th>
                                            <th>파일:</th>
                                            <th>문의날짜:</th>
                                            
                                        </tr>
                                    </thead>
                               
                                    <tbody>
            <c:forEach var="q" items="${QuestionList}">
        <tr>
            <td>${q.name}</td>
            <td>${q.subject}</td>
           <td class="content-preview" id="contentPreview_${q.content}">
           <a href="${pageContext.request.contextPath}/admin/answerinfo?num=${q.num}">${q.content}</a> 
            <td><a href="#" 
            onclick="checkFile('${q.id}', '${q.file1}')">${q.file1}</a></td>
            <td>${q.regdate}</td> 
            <td>
     <form action="${pageContext.request.contextPath}/admin/AnswerForm" method="post">
    <input type="hidden" name="answer" value="${q.num}">
    <button class="btn btn-danger" type="button" onclick="AnswerForm('${q.num}')">답변</button>
</form>

</td>
        </tr>
    </c:forEach>
            </tbody>
                                    
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    
    </body>
</html>
