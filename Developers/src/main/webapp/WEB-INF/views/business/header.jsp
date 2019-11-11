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
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_fe.css">
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
	var path='${path}';
	var lbc='${lbc}';
</script>

</head>

<style>
	#logoImg{
		margin-top:6px;
		width:35px;
		height:35px;
	}
	.re180{
		transform: rotate(180deg);
		transition:all 2s;
	}
	.nav_rr>*{
		position: relative;
		display: inline-block !important;
	}
	/* .nav_rr{
		width:300px;
	} */
	.bl_1{
		color:white;
		font-weight: 900 !important;
		font-size:1.4rem;
	}
	.rotate{
		transform: rotate(180deg);
	}
	.ddm-log{
		font-size:1.3rem;
	}

	.bl_1:hover{
		color:silver !important;
	}
	.bus-user-profile{
		width:32px;
		height:32px;
		border-radius: 16px;
	}
	input.remov::placeholder{
		color:#A4A4A4
	}
	input.removed::placeholder{
		color:"";
	}



</style>


<body>
	<header class="header_fe"><!-- for Employers -->
		<c:if test="${empty loginMember}">
			<div class="header_nav">
				<nav class="nav_style_l">
					<ul class="nav_us">
						<li class="ls1 ls2">
							<a id="header_title" aria-current="page" class="as1" href="#">
								<img id="header_logo" src="${path}/resources/images/Developers_black_logo_favicon.png" widht="30px" height="30px"/>
								&nbsp;Developers Black for Recruiters
							</a>
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
								data-target="#empEnrollModal">채용담당자 가입</a>
							</li>
							
							<button class="home_button emp_Btn" onclick="location.href='${path}'">
								디벨로퍼스 홈
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
								data-toggle="modal" data-target="#empEnrollModal">채용담당자 가입</a></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty loginMember}">
			<div class="header_nav">
				<nav class="nav_style_l">
					<ul class="nav_us">
						<li class="ls1 ls2" id="logo">
							<label for="logoFile" style="cursor: pointer;">
								<img id="logoImg" src="${busInfo.busLogo}"/>
								<form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
									<input type="file" accept="image/*" id="logoFile" name="logoFile" style="display:none"/>
								</form>
							</label>
						</li>
						<li class="ls1 ls2">
							<a aria-current="page" class="as1" href="#"><c:out value="${busInfo.busName}"/></a>
						</li>
					</ul>
				</nav>
				<div class="hidden-xs">
					<nav class="nav_style_r">
						<div class="nav_rr">
							<div class="dropdown bus-user-info">
								<button class="bl_1"
									type="button" data-toggle="dropdown">
									<img class="bus-user-profile" src="${path}/resources/upload/profile/no-profile-image.png"/>
									&nbsp;<c:out value="${loginMember.memName}"/>&nbsp;<i class="fas fa-angle-down"></i></button>
								<div class="dropdown-menu ddm-log">
									<a class="dropdown-item" href="#">내 프로필</a>
									<a class="dropdown-item" href="${path}/business/logout">로그아웃</a>
								</div>
							</div>
							<button class="home_button emp_Btn" onclick="location.href='${path}'">
								디벨로퍼스 홈
							</button>
						</div>
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
							<li class="ls4"><a class="as2">지원자</a></li>
							<li class="ls4"><a class="as2">매치업</a></li>
							<li class="ls4"><a class="as2">포지션</a></li>
							<li class="ls4"><a class="as2">채용광고</a></li>
							<li class="ls4"><a class="as2">회사정보</a></li>
							<li class="ls4"><a class="as2">계정 관리</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/logout">로그아웃</a></li>
							<li class="ls4"><a class="as2">디벨로퍼스 홈</a></li>

						</ul>
					</div>
				</div>
			</div>
		</c:if>
		<!-- 회원가입 모달 창 -->
	<div class="modal fade" id="empEnrollModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
		  <div class="modal-header" style="background-color: #1C1C1C;">
			<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
	        <h5 class="modal-title" style="color: #ffffff; margin: auto auto;" id="exampleModalLabel">Recruiting Developers</h5>
	        <button type="button" style="color:#ffffff; padding-top: 15px;" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">X</span>
	        </button>
	      </div>
          <!-- <form id="registerForm" action="${pageContext.request.contextPath}/business/register" onsubmit="return registerValidate()" method="post"> -->
	      <div class="modal-body">
			    <input type="text" id="regname" class="form-control must" name="memName" placeholder="담당자 성함" required>
			    <!-- <br />
			    <input type="text" class="form-control" placeholder="직책(부서)"> -->
			    <br />
			    <input type="text" id="phone" class="form-control must" name="memPhone" placeholder="연락처 (-)없이" required>
			    <hr>
			    <input type="text" id='reg-email' class="form-control must" name="memEmail" placeholder="회사 이메일(로그인 아이디로 사용)" required>
			    <br />
				<input type="password" id="pswd" class="form-control must" name="memPassword" placeholder="특수문자 /문자 /숫자 포함 형태의 8~15자리 이내의 암호로 설정해주세요." required>
				<br />
				<input type="password" id="pswd2" class="form-control must remov" placeholder="암호를 확인하세요." style="border-color: #E6E6E6; color: #A4A4A4; background-color: #FFFFFF;" disabled required>
			</div>
		<!-- </form> -->
			<div class="modal-footer">
				<button type="submit" id="registerBtn" class="btn btn-outline-primary" >채용담당자 계정 생성</button>
			</div>
		  <div id="warning-area"></div>
	     <div>
	     	 <p>회원가입시 개인정보 <a class="navbar-brand-small" href="#">취급방침</a>을 읽었으며, <br> <a class="navbar-brand-small" href="#">이용약관</a>에 동의하신 것으로 간주합니다.</p>
	     </div>
	     	<div>
	     		<hr>
		  		<p>이미 가입되어 있으신가요?<a class="navbar-brand-small" href="#" onclick="changeModal('toLogin'); return false">로그인하기</a></p>
		  	</div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 로그인 창  -->
		<div class="modal fade" id="empLoginModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
		  <div class="modal-header" style="background-color: #1C1C1C;" >
			<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
	        <h5 class="modal-title" style="color: #ffffff; margin: auto auto;"  id="exampleModalLabel">Recruiting Developers</h5>
	        <button type="button" class="close" style="color:#ffffff; padding-top: 15px;" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">X</span>
	        </button>
	      </div>
          <form id="login" action="${pageContext.request.contextPath}/business/login" onsubmit="return loginValidate()" method="post">
	      <div class="modal-body">
			<input type="text" class="form-control login-email" name="memEmail" placeholder="회사 이메일(로그인 아이디로 사용)" required>
			<br>
			<input type="password" id="login-password" class="form-control login-password" name="memPassword" placeholder="비밀번호" required>
			<br>
			<div>
				<button type="submit" id="loginBtn" class="btn btn-outline-primary" 
				style="border-color: #D0D3D4; color:#D0D3D4" disabled>로그인</button>
			</div>	
			</form>
				<div>
					<p><a class="navbar-brand-small" href="#">비밀번호 초기화/변경</a><P>
				</div>
				<div>
					<button class="btn btn-outline-success" > 페이스북으로 시작하기</button>
				</div>
				<div class="access-denied">
					<p id="warning" style="display: none; color:#E53935">이메일 혹은 비밀번호가 틀렸습니다</p>
				</div>
		  </div>
	     	<div class="modal-footer">
		  		<p>계정이 없으신가요?<a class="navbar-brand-small" href="#" onclick="changeModal('toReg'); return false">채용담당자 계정 만들기</a></p>
		  	</div>
	    </div>
	  </div>
	</div>


	<!-- 이메일 인증 창 -->
	<div class="modal fade" id="emailConfirmModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
		  <div class="modal-header" style="background-color: #151515;" >
			<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
	        <h5 class="modal-title" style="color: #ffffff; margin: auto auto;"  id="exampleModalLabel">Recruiting Developers</h5>
	        <button type="button" class="close" style="color:#ffffff; padding-top: 15px;" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">X</span>
	        </button>
	      </div>
          <!-- <form id="loginEnd" action="${pageContext.request.contextPath}/business/login" onsubmit="return loginValidate()" method="post"> -->
	      <div class="modal-body">
			<div>
				<!-- 여기에 이메일 출력해주기. -->
				<p id="emailTitle"></p>
			</div> 
			<input type="text" class="form-control confirmation" name="confirmationNo" placeholder="인증번호 입력" required>
			<br>
			<button type="submit" id="confirm" class="btn btn-outline-primary" >인증번호 확인</button>
			<!-- </form> -->
				<div>
					<p><a class="navbar-brand-small" href="#" onclick="resendEmail(); return false">인증번호 재발송</a><P>
				</div>
				<div class="access-denied">
					<p id="warning" style="display: none; color:#E53935">인증번호가 맞지 않습니다.</p>
				</div>
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
			// if("${not empty busInfo}"){
			// 	var logoPath="${path}"+"${busInfo.busLogo}";
				
			// 	$("#logoImg").attr("src", logoPath );
			// }
		}

		$(function(){
			//로고 클릭 이벤트
			$("#logoFile").on("change",function(){
				var frm=new FormData($("#logoFrm")[0]);
				$.ajax({
					url:"${path}/business/logoChange",
					data:frm,
					type:"post",
					processData:false,
              	    contentType:false,
					success:function(data){
						$("#logoImg").attr("src",data.logo);
					}

				})
			});
			$(".bl_1").on("click", function(){
				if($(".bl_1>svg").hasClass("rotate")){
					$(".bl_1>svg").removeClass("rotate");
				}else{
					$(".bl_1>svg").addClass("rotate");
				};
			});
			
		});

		// var logPw=document.querySelector("input#login-password");
		// console.log(logPw);
		
		
	</script>
	<!-- custom js -->
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/business-main.js"></script>	