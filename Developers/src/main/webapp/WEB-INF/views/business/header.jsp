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
	.logoImg{
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
								<c:if test="${empty busInfo}">
									<img class="Dev_black_logo" src="${path}/resources/images/Developers_black_logo.png" style="height:30px; margin-top:10px;"/>
								</c:if>
								<c:if test="${not empty busInfo.busLogo}">
									<img class="logoImg" src="${path}${busInfo.busLogo}" title='로고 수정하기'/>
									<form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
										<input type="file" accept="image/*" id="logoFile" name="logoFile" style="display:none"/>
									</form>
								</c:if>
								<c:if test="${not empty busInfo && empty busInfo.busLogo}">
									<img class="logoImg" src="${path}/resources/images/bus_logo_plus.png" title="로고를 등록하세요"/>
									<form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
										<input type="file" accept="image/*" id="logoFile" name="logoFile" style="display:none"/>
									</form>
								</c:if>
							</label>
						</li>
						<li class="ls1 ls2">
							<a aria-current="page" class="as1" href="${path}/business"><c:out value="${busInfo.busName}"/></a>
						</li>
					</ul>
				</nav>
				<div class="hidden-xs">
					<nav class="nav_style_r">
						<div class="nav_rr">
							<div class="dropdown bus-user-info">
								<button class="bl_1"
									type="button" data-toggle="dropdown">
									<c:if test="${not empty loginMember.memIcon}">
										<img class="bus-user-profile" src="${path}${loginMember.memIcon}"/>	
									</c:if>
									<c:if test="${empty loginMember.memIcon}">
										<img class="bus-user-profile" src="${path}/resources/upload/profile/no-profile-image.png"/>
									</c:if>
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
							<li class="ls4"><a class="as2" href="${path}/business/applicants.lbc">지원자</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/matchup.lbc">매치업</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/position.lbc">포지션</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/ad.lbc">채용광고</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/busInfo.lbc">회사정보</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/settings.lbc">계정 관리</a></li>
							<li class="ls4"><a class="as2" href="${path}/business/logout">로그아웃</a></li>
							<li class="ls4"><a class="as2" href="${path}">디벨로퍼스 홈</a></li>

						</ul>
					</div>
				</div>
			</div>
		</c:if>
	
	
	</header>
	<script>
		/* 메뉴 온/오프기능  온로드 함수를 사용 */
		window.onload=function() {
			var menuButton=document.getElementsByClassName('menuButton')[0];
		    var menuBar=document.getElementsByClassName('mobile-menu')[0];
		    menuBar.style.display="none";
		    
		    menuButton.onclick=function() {
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
						$(".logoImg").attr("src",path+data.logo);
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

<jsp:include page="/WEB-INF/views/business/busloadingPage.jsp"/>