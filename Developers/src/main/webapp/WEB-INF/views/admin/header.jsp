<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Developers Black</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_fa.css">
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

<script>
	var path = '${path}';
	var lbc = '${lbc}';
</script>

</head>


<body>
	<header class="header_fa">
		<!-- for Employers -->
		<div class="header_nav">
			<nav class="nav_style_l">
				<ul class="nav_us">
					<li class="ls1 ls2"><a id="header_title" aria-current="page"
						class="as1" href="#"> <img id="header_logo"
							src="${path}/resources/images/Developers_black_logo_favicon.png"
							widht="30px" height="30px" /> &nbsp;Developers Black for Admin
					</a></li>
				</ul>
			</nav>
			<div>
				<nav class="nav_style_r">
					<ul class="nav_us">

						<button class="home_button emp_Btn"
							onclick="location.href='${path}'">디벨로퍼스 홈</button>
					</ul>
				</nav>
			</div>
			<!-- 
			<div class="visible-xs">
				<nav class="nav_style_r">
					<ul class="nav_us">
						<li class="menu-icon bchIA"><a
							class="NavItem__StyledA-sc-1731p8k-1 dbSkqw">
								<button type="button" class="menuButton img_ico"></button>
						</a></li>
					</ul>
				</nav> 
				<div class="mobile-menu">
					<ul class="nav_us uwQaB">
						<li class="ls4"><a class="as2" type="submit"
							data-toggle="modal" data-target="#empLoginModal">채용담당자 로그인</a></li>
						<li class="ls4 active"><a class="as2 as3" type="submit"
							data-toggle="modal" data-target="#empEnrollModal">채용담당자 가입</a></li>
					</ul>
				</div>
			</div>  -->
		</div>

	</header>