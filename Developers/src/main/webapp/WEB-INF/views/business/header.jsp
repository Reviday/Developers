<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Developers Black</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-3.3.7.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_fe.css">

	
<!-- jQuery library -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/popper.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	
	
	
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
							<a class="as2" data-toggle="modal" 
							data-target="#empLoginModal">채용담당자 로그인</a>
						</li>
						<li class="ls1 ls3">
							<a class="as2 as3" data-toggle="modal" 
							data-target="#empEnrollModal">관리자 가입</a>
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
						<li class="ls4"><a class="as2" type="submit" 
								data-toggle="modal" data-target="#empLoginModal">채용담당자 로그인</a></li>
						<li class="ls4 active"><a class="as2 as3" type="submit"
							 data-toggle="modal" data-target="#empEnrollModal">관리자 가입</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<!-- 회원가입 모달 창 -->
	<div class="modal fade" id="empEnrollModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Recruiting Developers </h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
          <form action="${pageContext.request.contextPath}/business/empEnroll.do" method="post">
	      <div class="modal-body">
			    <input type="text" class="form-control" name="userName" placeholder="담당자 성함" required>
			    <br />
			    <input type="text" class="form-control" name="userDepartment" placeholder="직책(부서)" required>
			    <br />
			    <input type="text" class="form-control" name="userPhone" placeholder="연락처" required>
			    <hr>
			    <input type="text" class="form-control" name="userEmail" placeholder="회사 이메일(로그인 아이디로 사용)" required>
			    <br />
			    <input type="password" class="form-control" name="userPassword" placeholder="비밀번호" required>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-outline-primary" >관리자 계정 생성</button>
	      </div>
		  </form>
	     <div>
	     	 <p>회원가입시 개인정보 <a class="navbar-brand-small" href="#">취급방침</a>을 읽었으며, <br> <a class="navbar-brand-small" href="#">이용약관</a>에 동의하신 것으로 간주합니다.</p>
	     </div>
	     	<div>
	     		<hr>
		  		<p>이미 가입되어 있으신가요?<a class="navbar-brand-small" href="#">로그인하기</a></p>
		  	</div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 로그인 창  -->
		<div class="modal fade" id="empLoginModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">관리자 계정 로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
          <form action="${pageContext.request.contextPath}/business/empLogin.do" method="post">
	      <div class="modal-body">
			    <input type="text" class="form-control" name="chargeEmail" placeholder="회사 이메일(로그인 아이디로 사용)" required>
			    <br />
			    <input type="password" class="form-control" name="chargePassword" placeholder="비밀번호" required>
	      </div>
	      <div>
	        <button type="submit" class="btn btn-outline-primary" >로그인</button>
	        <div>
	        	<p><a class="navbar-brand-small" href="#">비밀번호 초기화/변경</a><P>
	        </div>
	        <button type="submit" class="btn btn-outline-success" > 페이스북으로 시작하기</button>
	      </div>
		  </form>
	     	<div class="modal-footer">
		  		<p>계정이 없으신가요?<a class="navbar-brand-small" href="#">관리자 계정 만들기</a></p>
		  	</div>
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