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
	href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/all.css">
<!-- jQuery library -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<!-- FontAwesome -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/all.js"></script>
</head>
<body>
	<header class="heaer_fm"> <!-- for Member -->
		<div class="header_nav container">
			<nav>
				<a href="/" class="developersLogo">
					<h2 class="">Developers</h2>
				</a>
				<ul class="nav_items">
					<li class="xsHomeButton xsOnly"><a href="/" class="">홈</a></li>
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
						<li class="smMoreVisible sible">
							<button class="searchButton img_ico" type="button"></button>
						</li>
						<li>
							<button class="signUpButton" type="button">회원가입/로그인</button>
							<button class="xsSignUpButton" type="button">회원가입</button>
						</li>
						<li class="lgMoreVisible">
							<a href="/newintro" class="">서비스 소개</a>
						</li>
						<li class="smMoreVisible">
							<a class="dashboardButton" href="${path }/business/employerIndex.do">기업 서비스</a>
						</li>
						<li class="xsOnly">
							<button type="button" class="menuButton img_ico"></button>
						</li>
					</ul>
					<div class="xsMenuBar" style="display:none">
						<div class="headerBar">
							<!-- 로고넣읍시다. -->
							<span style="font-weight: 600; font-size: 24px">Developers</span>
							<button type="button" class="headerBar_exit img_ico"></button>
						</div>
						<ul>
							<li><button type="button">로그인</button></li>
							<div class="divider xsOnly"></div>
							<li class="xsOnly"><a href="/cv" class="">이력서</a></li>
							<li class="xsOnly"><a href="/referral" class="">추천</a></li>
							<li class="hideForAnonymous"><a href="/status/applications"
								class="">지원 현황</a></li>
							<div class="divider xsOnly"></div>
							<li class="microOnly"><a href="/salary" class="">직군별 연봉</a></li>
							<li class="xsOnly"><a href="/events" class="">커리어/이벤트</a></li>
							<div class="divider xsOnly"></div>
							<li class="xsOnly"><a href="/dashboard">기업 서비스</a></li>
							<li class="xsOnly"><a href="/newintro" class="">서비스 소개</a></li>
							<li class="hideForAnonymous"><a class="logOutAnchor"
								href="/logout">로그아웃</a></li>
						</ul>
					</div>
					<script>
						/* 메뉴 온/오프기능  온로드 함수를 사용 */
						window.onload=function() {
							var menuBar=document.getElementsByClassName('menuButton')[0];
							menuBar.onclick=function() {
						        headerBar.style.display="block";
						    }
							
							
						    var headerBarExit=document.getElementsByClassName('headerBar_exit')[0];
						    var headerBar=document.getElementsByClassName('xsMenuBar')[0];

						    headerBarExit.onclick=function() {
						        headerBar.style.display="none";
						    }
						}
					</script>
				</aside>
			</nav>
		</div>
	</header>
	<!-- 
	<div class="modal_login_enroll">
		<div class="login_enroll" style="width: 400px;">
			<div class="login_enroll_header">
				<span>Developers</span>
				<button type="button">
					<i class="fas fa-times"></i>
				</button>
			</div>
			<div id="MODAL_BODY" class="login_enroll_body">
				<div class="le_intro">
					<h1>친구에게 딱 맞는<br>회사를 추천해 주세요!</h1>
					<h2>원티드는 친구에게 좋은 회사를 추천하고,<br>채용 성공시 보상 받을 수 있는 서비스입니다.</h2>
				</div>
				<div class="le_form">
					<input class="le_password" type="password" autocomplete="password">
					<input class="le_email" type="email" autocomplete="username" placeholder="이메일을 입력해 주세요." value="">
					<button class="emailLoginButton" type="button">
						<i class="far fa-envelope"></i>이메일로 시작하기
					</button>
					<div class="buttonDivider"></div>
					<button class="facebookLoginButton" type="button">
						<i class="fab fa-facebook-square"></i>페이스북으로 시작하기
					</button>
					<p>걱정마세요! 여러분의 지원 활동은 SNS에 노출되지 않습니다.<br>회원가입 시 
						<a class="loginModalAnchor" href="/privacy" target="_blank">개인정보 취급방침</a>과 
						<a class="loginModalAnchor" href="/terms" target="_blank">이용약관</a>을 확인하였으며, 동의합니다.
					</p>
				</div>
			</div>
		</div>
		<div role="presentation" class="_2OQakuZmFdVjmjiQz4QMbx false"></div>
	</div>
	 -->
	<script>
		
	</script>