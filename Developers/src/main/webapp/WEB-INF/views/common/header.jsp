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
<link rel="shortcut icon" href="${path }/resources/images/Developers_logo_favicon.png">
<link rel="stylesheet"
   href="${path }/resources/css/bootstrap-grid.css">
<link rel="stylesheet"
   href="${path }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
   href="${path }/resources/css/all.css">
<link rel="stylesheet"
   href="${path }/resources/css/style.css">
<!-- jQuery library -->
<script type="text/javascript"
   src="${path }/resources/js/jquery-3.4.1.min.js"></script>
<!-- FontAwesome -->
<script type="text/javascript"
   src="${pageContext.request.contextPath }/resources/js/all.js"></script>
<script>
	var path='${path}';
	var ldc='${ldc}';
</script>
</head>
<body>
   <header id="header" class="heaer_fm"> <!-- for Member -->
   <div id="mouse_shadow"></div>
      <div class="header_nav container">
         <nav>
         	<c:if test="${empty loginMember }">
            <a href="${path }" class="developersLogo">
               <h2 class="ir_pm">Developers</h2>
               <img src="${path }/resources/images/Developers_logo.png" style="height:40px"/>
            </a>
            </c:if>
            <c:if test="${not empty loginMember }">
             <a href="${path }/member/main.lmc" class="developersLogo">
               <h2 class="ir_pm">Developers</h2>
               <img src="${path }/resources/images/Developers_logo.png" style="height:40px"/>
            </a>
            </c:if>
            <ul class="nav_items">
               <c:if test="${empty loginMember }">
               <li class="xsHomeButton xsOnly"><a href="${path }" class="">홈</a></li>
               </c:if>
               <c:if test="${not empty loginMember }">
               <li class="xsHomeButton xsOnly"><a href="${path }/member/main.lmc" class="">홈</a></li>
               </c:if>
               <c:if test="${empty loginMember }">
               <li class=""><a href="${path }/search/mainSearch.do" class="">탐색</a></li>
               </c:if>
               <c:if test="${not empty loginMember }">
               <li class=""><a href="${path }/search/mainSearch.lmc?memNo=${loginMember.memNo}" class="">탐색</a></li>
               </c:if>
               <li class="microMoreVisible"><a href="${path }/salary/salaryView.do" class="">직군별 연봉</a></li>
                <c:if test="${loginMember!=null }">  
               <li class="smMoreVisible"><a href="${path }/resume/resumeList.lmc?memEmail=${loginMember.memEmail }" class="">이력서</a></li>
               </c:if>
               <c:if test="${loginMember==null }">  
               <li class="smMoreVisible"><a href="${path }/resume/resumeIntro.do" class="">이력서</a></li>
               </c:if>
               <c:if test="${not empty loginMember }">
               	    <li class="smMoreVisible selectedNav"><a href="${path }/recommend/recommendMain.lmc?memNo=${loginMember.memNo}" class="">추천</a></li>
               </c:if>
               <c:if test="${empty loginMember }">
               	    <li class="smMoreVisible selectedNav suBtn"><a href="#" class="">추천</a></li>
               </c:if>
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
            <c:if test="${empty loginMember }">
               <aside class="aside_menu">
                  <ul>
                     <li class="smMoreVisible sible">
                        <button class="searchButton" type="button">
                           <i class="fas fa-search"></i>
                        </button>
                     </li>
                     <li>
                        <button class="signUpButton suBtn" type="button">회원가입/로그인</button>
                        <button class="xsSignUpButton suBtn" type="button">회원가입</button>
                     </li>
                     <li class="lgMoreVisible">
                        <a href="/newintro" class="">서비스 소개</a>
                     </li>
                     <li class="smMoreVisible">
                        <a class="dashboardButton" href="${path }/business">기업 서비스</a>
                     </li>
                     <li class="xsOnly">
                        <button type="button" class="menuButton img_ico"></button>
                     </li>
                  </ul>
                  <div class="xsMenuBar" style="display:none">
                     <div class="headerBar">
                        <c:if test="${empty loginMember }">
			            <a href="${path }" class="developersLogo">
			               <h2 class="ir_pm">Developers</h2>
			               <img src="${path }/resources/images/Developers_logo.png" style="height:40px"/>
			            </a>
			            </c:if>
			            <c:if test="${not empty loginMember }">
			             <a href="${path }/member/main.lmc" class="developersLogo">
			               <h2 class="ir_pm">Developers</h2>
			               <img src="${path }/resources/images/Developers_logo.png" style="height:40px"/>
			            </a>
			            </c:if>
                        <button type="button" class="headerBar_exit img_ico"></button>
                     </div>
                     <ul>
                        <li><button type="button">로그인</button></li>
                        <div class="divider xsOnly"></div>
                        <li class="xsOnly"><a href="${path }/resume/resumeIntro.do" class="">이력서</a></li>
                        <li class="xsOnly"><a href="/referral" class="">추천</a></li>
                        <li class="hideForAnonymous"><a href="/status/applications"
                           class="">지원 현황</a></li>
                        <div class="divider xsOnly"></div>
                        <li class="microOnly"><a href="${path }/salary/salaryView.do" class="">직군별 연봉</a></li>
                        <li class="xsOnly"><a href="/events" class="">커리어/이벤트</a></li>
                        <div class="divider xsOnly"></div>
                        <li class="xsOnly"><a href="${path }/business">기업 서비스</a></li>
                        <li class="xsOnly"><a href="/newintro" class="">서비스 소개</a></li>
                     </ul>
                  </div>
               </aside>
            </c:if>
            <c:if test="${not empty loginMember }">
               <aside class="aside_menu">
                  <ul>
                     <li class="smMoreVisible sible">
                        <button class="searchButton" type="button">
                           <i class="fas fa-search"></i>
                        </button>
                     </li>
                     <li>
                        <button type="button" class="notiButton">
                           <i class="far fa-bell">
                        </i></button>
                     </li>
                     <li class="smMoreVisible">
                        <button type="button" class="profileButton">
                        
                        	<c:if test="${loginMember.memIcon==null }">
                            <img src="${path}/resources/upload/profile/no-profile-image.png " 
                            style="width:32px; height:32px;" id="profile_img"/>
                            </c:if>
                            <c:if test="${loginMember.memIcon!=null }">
                            <img src="${path}/${loginMember.memIcon }" 
                            style="width:32px; height:32px;" id="profile_img"/>
                            </c:if>
                            
                         </button>
                     </li>
                     <li class="smMoreVisible">
                     	<c:if test="${loginMember.memLevel>=5 }">
                     		<a class="dashboardButton" href="${path }/admin/adminPage.lac">관리자 페이지</a>
                     	</c:if>
                     	<c:if test="${loginMember.memLevel<5 }">
	                        <a class="dashboardButton" href="${path }/business">기업 서비스</a>
                     	</c:if>
                     </li>
                     <li class="xsOnly">
                        <button type="button" class="menuButton img_ico"></button>
                     </li>
                  </ul>
                  <div class="xsMenuBar" style="display:none">
                     <div class="headerBar">
                        <c:if test="${empty loginMember }">
			            <a href="${path }" class="developersLogo">
			               <h2 class="ir_pm">Developers</h2>
			               <img src="${path }/resources/images/Developers_logo.png" style="height:40px"/>
			            </a>
			            </c:if>
			            <c:if test="${not empty loginMember }">
			             <a href="${path }/member/main.lmc" class="developersLogo">
			               <h2 class="ir_pm">Developers</h2>
			               <img src="${path }/resources/images/Developers_logo.png" style="height:40px"/>
			            </a>
			            </c:if>
                        <button type="button" class="headerBar_exit img_ico"></button>
                     </div>
                     <ul>
                        <li>
                           <a href="${path }/member/myPage.lmc?memEmail=${loginMember.memEmail }" class="">
                              내 정보
                              <img src="${path}/resources/upload/profile/no-profile-image.png" 
                                 class="xsOnly" id="profile_img"/>
                           </a>
                        </li>
                        <div class="divider xsOnly"></div>
                        <li class="xsOnly">
                           <a href="${path }/resume/resumeList.lmc?memEmail=${loginMember.memEmail }" class="">이력서</a>
                        </li>
                        <li class="xsOnly">
                           <a href="/referral" class="">추천</a>
                        </li>
                        <li class="">
                           <a href="/status/applications" class="">지원 현황</a>
                        </li>
                        <div class="divider xsOnly"></div>
                        <li class="microOnly">
                           <a href="${path }/salary/salaryView.do" class="">직군별 연봉</a>
                        </li>
                        <li class="xsOnly">
                           <a href="/events" class="">커리어/이벤트</a>
                        </li>
                        <div class="divider xsOnly"></div>
                        <li class="xsOnly">
                           <c:if test="${loginMember.memLevel>=5 }">
                     		<a class="dashboardButton" href="${path }/admin/adminPage.lac">관리자 페이지</a>
                     	</c:if>
                     	<c:if test="${loginMember.memLevel<5 }">
	                        <a class="dashboardButton" href="${path }/business">기업 서비스</a>
                     	</c:if>
                        </li>
                        <li class="xsOnly">
                           <a href="/newintro" class="">서비스 소개</a>
                        </li>
                        <li class="">
                           <a class="logOutAnchor" href="${path }/member/logout.do">로그아웃</a>
                        </li>
                     </ul>
                  </div>
               </aside>
            </c:if>
         </nav>
      </div>
   </header>
   <c:if test="${script ne null}">
	${script }
	</c:if>
   