<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<!-- jQuery library -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<header class="row">
		<div class="header_nav continer">
			<nav>
				<a href="/" class="developersLogo"> 
					<h2 class="">Developers</h2>
				</a>
				<ul class="nav_items">
					<li class=""><a href="#" class="">탐색</a></li>
					<li class="microMoreVisible"><a href="#" class="">직군별 연봉</a></li>
					<li class="smMoreVisible"><a href="#" class="">이력서</a></li>
					<li class="smMoreVisible selectedNav"><a href="#" class="">추천</a></li>
				</ul>
				<div role="presentation" class="list_view">
					<div class="overlay">
						<div class="container">
							<div class="row">
								<div class="_3DlvRNfvccuhGRij2MuTUG">
									<a href="/wdlist/518" class=""><h2>
											개발<i class="icon-arrow_right"></i>
										</h2></a><a href="/wdlist/518/873" class=""><h3>웹 개발자</h3></a><a
										href="/wdlist/518/872" class=""><h3>서버 개발자</h3></a><a
										href="/wdlist/518/669" class=""><h3>프론트엔드 개발자</h3></a><a
										href="/wdlist/518/660" class=""><h3>자바 개발자</h3></a><a
										href="/wdlist/518/677" class=""><h3>안드로이드 개발자</h3></a><a
										href="/wdlist/518/678" class=""><h3>iOS 개발자</h3></a><a
										href="/wdlist/518/899" class=""><h3>파이썬 개발자</h3></a><a
										href="/wdlist/518/665" class=""><h3>시스템,네트워크 관리자</h3></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<aside class="aside_menu">
					<ul>
						<li class="smMoreVi	sible">
							<button class="searchButton" type="button">
								<!-- 돋보기 아이콘 추가 필요 -->
							</button></li>
						<li>
							<button class="signUpButton" type="button">회원가입/로그인</button>
							<!-- 
							<button class="xsSignUpButton" type="button">회원가입</button>
							 -->
						</li>
						<li class="lgMoreVisible">
							<a href="/newintro" class="">서비스 소개</a>
						</li>
						<li class="smMoreVisible">
							<a class="dashboardButton" href="/dashboard">기업 서비스</a>
						</li>
						<li class="xsOnly" style="display:none">
							<button class="menuButton" type="button">
								<i class="icon-menu"></i>
							</button>
						</li>
					</ul>
				</aside>
			</nav>
		</div>
	</header>