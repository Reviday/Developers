<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_fe.css">
<!-- jQuery library -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<header class="header_fe"><!-- for Employers -->
		<div class="header_nav">
			<nav class="nav_style_l">
				<ul class="nav_us">
					<li class="ls1 ls2">
						<a aria-current="page" class="as1" href="#">Developers for Employers</a>
					</li>
				</ul>
			</nav>
			<div class="hidden-xs">
				<nav class="nav_style_r">
					<ul class="nav_us">
						<li class="ls1 ls3">
							<a class="as2">채용담당자 로그인</a>
						</li>
						<li class="ls1 ls3">
							<a class="as2 as3">관리자 가입</a>
						</li>
						<button class="home_button emp_Btn">
							디벨로퍼 홈
						</button>
					</ul>
				</nav>
			</div>
			<div class="visible-xs">
				<nav class="nav_style_r">
					<ul class="nav_us">
						<li class="menu-icon bchIA">
							<a class="NavItem__StyledA-sc-1731p8k-1 dbSkqw">
								<button type="button" class="menuButton img_ico"></button>
							</a>
						</li>
					</ul>
				</nav>
				<div class="mobile-menu">
					<ul class="nav_us uwQaB">
						<li class="ls4">채용담당자 로그인</li>
						<li class="ls4 active">관리자 가입</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<script>
		/* 메뉴 온/오프기능  온로드 함수를 사용 */
		window.onload=function() {
			var menuButton=document.getElementsByClassName('menuButton')[0];
		    var menuBar=document.getElementsByClassName('mobile-menu')[0];
		    menuBar.style.display="none";
		    
		    menuButton.onclick=function() {
		    	console.log(menuBar.style.display);
		    	if(menuBar.style.display!="none") {
		    		menuBar.style.display="none";
		    	} else {
		    		menuBar.style.display="block";
		    	}
		    }
		}
	</script>