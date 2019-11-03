<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Developers Black - Admin</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_fa.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/navMenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/all.css">


<!-- jQuery library -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/popper.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/all.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/navMenu.js"></script>

<script>
	var path = '${path}';
	var lbc = '${lbc}';
</script>

</head>


<body>
	<header class="header_fa">
        <!-- Ace Responsive Menu -->
        <nav class="header_nav">
	        <nav class="nav_style_l">
				<ul class="nav_us">
					<li class="ls1 ls2">
						<a id="header_title" aria-current="page" class="as1" href="#">
							<img id="header_logo" src="${path}/resources/images/Developers_black_logo_favicon.png" widht="30px" height="30px"/>
							&nbsp;Developers Black for Admin
						</a>
					</li>
				</ul>
			</nav>
			<nav class="nav_style_r">
	            <!-- Menu Toggle btn-->
	            <div class="menu-toggle">
					<a id="header_title" aria-current="page" class="as1 nav_a" href="#" style="float:left">
						<img id="header_logo" src="${path}/resources/images/Developers_black_logo_favicon.png" widht="30px" height="30px"/>
						&nbsp;Developers Black for Admin
					</a>
	                <button type="button" id="menu-btn">
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	            </div>
	            <!-- Responsive Menu Structure-->
	            <!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
	            <ul id="respMenu" class="ace-responsive-menu" data-menu-style="horizontal">
	                  <li>
	                    <a href="${path}/">
	                        <i class="fa fa-home" aria-hidden="true"></i>
	                        <span class="title">Developers</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="javascript:;">
	                        <i class="fa fa-cube" aria-hidden="true"></i>
	                        <span class="title">회원관리</span>
	    
	                    </a>
	                    <!-- Level Two-->
	                    <ul>
	                        <li>
	                            <a href="${path }/admin/memberList">회원목록</a>
	                        </li>
	                        <li>
	                           <a href="javascript:;">
	                               	회원목록							
	                           </a>
	                           <!-- Level Three-->
	                           <ul>
	                               <li><a href="${path }/admin/memberList">
	                               		<i class="fa fa-user" aria-hidden="true"></i>
	                               		기본정보</a>
	                               	</li>
	                               <li>
	                                   <a href="${path }/admin/memberList">
	                                       <i class="fa fa-diamond" aria-hidden="true"></i>부가정보</a>
	                               </li>
	                               <li>
	                                   <a href="${path }/admin/memberList">
	                                       <i class="fa fa-diamond" aria-hidden="true"></i>상세정보</a>
	                               </li>
	                           </ul>
	                       </li>
	                        <li>
	                            <a href="#">Sub Item Two</a>
	                        </li>
	                        <li>
	                            <a href="#">Sub Item Three</a>
	                        </li>
	                        <li>
	                            <a href="#">Sub Item Four</a>
	                        </li>
	                    </ul>
	                </li>
	    
	                <li>
	                    <a href="javascript:;">
	                        <i class="fa fa-crop" aria-hidden="true"></i>
	                        <span class="title">기업 관리</span>
	                    </a>
	                    <!-- Level Two-->
	                    <ul>
	                        <li>
	                            <a href="javascript:;">
	                                <i class="fa fa-graduation-cap" aria-hidden="true"></i>
	                                Sub Item One						
	                            </a>
	                        </li>
	                        <li>
	                            <a href="#">
	                                <i class="fa fa-database" aria-hidden="true"></i>
	                                Sub Item Two
	                            </a>
	                        </li>
	                        <li>
	                            <a href="javascript:;">
	                                <i class="fa fa-amazon" aria-hidden="true"></i>
	                                Sub Item Three							
	                            </a>
	                            <!-- Level Three-->
	                            <ul>
	                                <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Sub Item Link 1</a></li>
	                                <li>
	                                    <a href="javascript:;">
	                                        <i class="fa fa-diamond" aria-hidden="true"></i>Sub Item Link 2</a>
	                                    <!-- Level Four-->
	                                    <ul>
	                                        <li><a href="#"><i class="fa fa-trash" aria-hidden="true"></i>Sub Item Link 1</a></li>
	                                        <li><a href="#"><i class="fa fa-dashcube" aria-hidden="true"></i>Sub Item Link 2</a></li>
	                                        <li><a href="#"><i class="fa fa-dropbox" aria-hidden="true"></i>Sub Item Link 3</a></li>
	                                    </ul>
	                                </li>
	                                <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i>Sub Item Link 3</a></li>
	                            </ul>
	                        </li>
	    
	                        <li>
	                            <a href="#">
	                                <i class="fa fa-database" aria-hidden="true"></i>
	                                Sub Item Four
	                            </a>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                    <a class="" href="javascript:;">
	                        <i class="fa fa-graduation-cap" aria-hidden="true"></i>
	                        <span class="title">로그 관리</span>
	    
	                    </a>
	                    <ul>
	                        <li>
	                            <a href="#">Sub Item One
	                            </a>
	                        </li>
	                        <li>
	                            <a href="javascript:;">Sub Item Two							
	                            </a>
	                            <ul>
	                                <li><a href="#">Sub Item Link 1</a></li>
	                                <li><a href="#">Sub Item Link 2</a></li>
	                                <li><a href="#">Sub Item Link 3</a></li>
	                            </ul>
	                        </li>
	                        <li>
	                            <a href="javascript:;">Sub Item Three							
	                            </a>
	                            <ul>
	                                <li><a href="#">Sub Item Link 1</a></li>
	                                <li><a href="#">Sub Item Link 1</a></li>
	                                <li><a href="#">Sub Item Link 1</a></li>
	                            </ul>
	                        </li>
	                        <li>
	                            <a href="#">Sub Item Four
	                            </a>
	                        </li>
	                    </ul>
	                </li>
	                <li>
	                    <a href="javascript:;">
	                        <i class="fa fa-heart" aria-hidden="true"></i>
	                        <span class="title">서비스</span>
	                    </a>
	                </li>
	            </ul>
	        </nav>
        </nav>
	</header>
	<!--Plugin Initialization-->
     <script type="text/javascript">
         $(document).ready(function () {
             $("#respMenu").aceResponsiveMenu({
                 resizeWidth: '768', // Set the same in Media query       
                 animationSpeed: 'fast', //slow, medium, fast
                 accoridonExpAll: false //Expands all the accordion menu on click
             });
         });
    </script>