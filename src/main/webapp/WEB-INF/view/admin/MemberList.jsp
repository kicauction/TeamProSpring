<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                회원 관리
                            </a>   
                             <a class="nav-link" href="${pageContext.request.contextPath}/admin/Question">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                              1대1문의
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
                                회원관리
                            </div>
                            <div class="card-body">
                            <form action="${pageContext.request.contextPath}/deleteMembers" method="post" id="deleteForm">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디: </th>
                                            <th>이름:</th>
                                            <th>전화번호:</th>
                                            <th>이메일:</th>
                                            <th>주소:</th>
                                            <th>상태:</th>
                                            <th>정지사유:</th>
                                            
                                        </tr>
                                    </thead>
                               
                                    <tbody>
                                    <c:forEach var="ml" items="${memberList}">
                <tr>
                <td>
                        <input type="checkbox" class="selectedMembersCheckbox" name="selectedMembers" value="${ml.id}">
                    </td>
                    <td>${ml.id}</td>
                    <td>${ml.name}</td>
                    <td>${ml.tel}</td> 
                    <td>${ml.email} </td>
                   <td>${ml.address}</td>
                   <td>${ml.status}</td>
                   <td>${ml.banreason}</td>
                   
              <td>
    <form action="banreasonform" method="post">
        <input type="hidden" name="id" value="${ml.id}">
        <button class="btn btn-danger" type="submit" onclick="return confirm('정지하겠습니까?')">사용정지</button>
    </form>
</td>
<td>
    <form action="Unbanmember" method="post">
        <input type="hidden" name="id" value="${ml.id}">
        <button class="btn btn-danger" type="submit" onclick="return confirm('해제하겠습니까?')">정지해제</button>
    </form>
</td>
                                           
                </tr>
            </c:forEach>
            </tbody> 
                                    
                                    
                                </table>
                                <button type="button" onclick="deleteMembers()">선택한 회원 삭제</button>
</form>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function deleteMembers() {
       alert("ok")
        var selectedMembers = $(".selectedMembersCheckbox:checked").map(function() {
            return $(this).val();
        }).get();

        if (selectedMembers.length === 0) {
            alert('삭제할 회원을 선택하세요.');
            return;
        }
        console.log(selectedMembers)
        $.ajax({
            type: 'GET',
            url: '${pageContext.request.contextPath}/admin/deleteMembers?selectedMembers='+selectedMembers, // 실제 컨트롤러 매핑에 맞게 수정
           // data: selectedMembers,
            success: function(response) {
                // 서버로부터의 응답 처리
                alert('선택한 회원이 삭제되었습니다.');
                location.reload(); // 페이지 새로고침 또는 필요한 작업 수행
            },
            error: function(error) {
                console.error('에러 발생:', error);
            }
        });
    }
    </script>
 
<script>
    function deleteSelectedMembers() {
        var checkboxes = document.getElementsByName('selectedMembers');
        var checkedCheckboxes = Array.from(checkboxes).filter(checkbox => checkbox.checked);

        if (checkedCheckboxes.length === 0) {
            alert('삭제할 회원을 선택하세요.');
            return;
        }

        document.getElementById('deleteForm').submit();
    }
</script>
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
        <script>
       
    </script>
    </body>
</html>
