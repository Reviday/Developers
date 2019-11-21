<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">    -->
<jsp:include page="/WEB-INF/views/business/header.jsp">
<jsp:param name="pageTitle" value="메인 화면" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- <link rel="stylesheet" href="${path}/resources/css/dashboard.css"> -->
<link rel="stylesheet" href="${path}/resources/css/style_ei.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
@media (max-width: 767px){
#db-container{
	margin-top:48px;
	}
}
#content>*{
	font-size:15px;
}
p{
	font-size: 15px;
}
/* .pagination>*{
    font-size: 1.8rem;
    margin:0 3px;
    
}
.pagination>.active>.page-link{
    background-color: #01C1D3;
    border-color:silver;
}
.pagination>.active>.page-link:hover{
    color:white;
}
.pagination>li>a{
    padding:.5rem 1rem;
    color:#0081C7;
}

.pagination>li>a:hover{
    color:#01C1D3;
} */

@media (min-width: 576px){
	.col-sm-4{
		flex:0 0 30%;
	}
}
@media (max-width: 767px){
	a.col-6 {
		margin:auto auto;
		margin-top: 15px;
	} 
}

img#loading{
	margin-left:45%;
	margin-top:15%;
}

div#resumeNo{
	color:#A4A4A4;
}
/* div#memName{
	border:1px solid red;
	border-radius: 20px;
	height:30px;
	width: 30px;
} */
div.searchBar{
	height:50px;
}

input#searchBox{
	height:2.6em;
	font-size:1em;

}

.favBtn{
	padding: .575rem 1.75rem;
	font-size:15px;
}

div.resume-area{
	background-color:#F6F7F7;
}

.card-header{
	background-color: #fff;
	padding-bottom:12px !important;
	padding-top:12px !important;
}

div.card{
	border-color: #fff;
	box-shadow: 5px 5px 5px 5px #CBCCCC;
}
div.card>*{
	padding:15px;
}

button.btn-outline-info{
	margin:3px 3px 3px 3px;
	font-size:12px;
	border-radius: 15px;
}

div.showBox{
	display: inline-block;
	padding-left:20px;
	padding-right: 20px;
	padding-top: 1px;
	padding-bottom: 1px;
	border-radius: 18px;
	margin-right:5px;
	border:1px solid #5E23D3;
}
div.skill-list{
	padding-top: 12px;
}
div.duty-list{
	display: inline-block;
}
mark{
	background-color: #e0ff3f;
}
div.forOpen{
	text-align: center;
}

div.forOpen>.btn{
	width: 90%;
	height: 4em;
	/* margin-top: 30px; */
}
/* div.left-menu{
	margin-left: 15px;
	margin-right: 15px;

} */
div.left-menu{
	padding:15px
}

@media (min-width: 576px){
	div.resume-left-area{
		margin-left: 20px;
		padding-right:0;
	}
}

a.list-group-item-action{
	border-color: #fff;
}

div.exp-career{
	margin-left:3px;
	margin-right:3px;
}

p.intro{
	color:#A4A4A4;
}
span.aline{
	color:#A4A4A4;
}
p#sirName:after {
	content: ' \25EF' ' \25EF';
}
h4#noResult{
	height:70px;
	text-align: center;
	font-size:20px;
	margin-top:80px;
}
h4#noResult::before {
    content: ' \26A0 ';
}

/* 모달 css */

div.roughResume{
	position: fixed;
}
div.modal-footer{
	background-color: #2E2E2E;
	padding:20px;
}
@media (min-width: 576px){
	.modal-dialog {
		max-width: 800px;
	}
}
@media (min-width: 576px){
	#ticket-modal {
		max-width: 630px;
	}
}

@media (max-width: 767px){
	div.resumePayment {
		text-align:center;
	} 
	div.footer-intro{
		text-align:center;
		padding-bottom:15px;
	}
}
div#resumeBody{
	overflow:auto; 
	background-color:#E6E6E6;

}
div#resumeBodyInside{
	background-color: #FFFFFF;
	margin:3px 3px 3px 3px;
	box-shadow: 2px 2px 2px 2px #CBCCCC;
}
div#resumeBodyInside>*{
	font-size:15px;
	padding:2px;
} 

div#memName{
	font-size:35px;
	padding:25px;
	padding-left:30px;
	font-weight:bold;
}
div.personalInfo{
	padding-left:30px;
	font-size:15px;
	color:#A4A4A4;
}
div#memIntro{
	padding:30px;
	padding-left:30px;
	font-size:13px;
}
.careerTitle,.educationTitle{
	float:left;
	margin-left:30px;
}
.busName,.schoolName{
	float:left;
	margin-left:20%;
}
.deptName,.majorName{
	float:left;
}
.startCareer,.startEd{
	float:right;
	margin-right:4px;
}
.endCareer,.endEd{
	float:right;
	margin-right:4%;
} 
.careerIntro,.subjectName{
	padding:30px;
	word-break: break-all;
}
button#buttonFav{
	width:100%;
}
.btn-primary.focus, .btn-primary:focus {
    box-shadow: 0 0 0 0;
}
input::placeholder {
  font-size:12px;
  font-style: italic;
}

div.left-side{
	border:1px solid #D8D8D8;
	float:left;
}

div.right-side{
	border:1px solid #D8D8D8;
	float:right;
}

div.packageEx>*{
	padding:6px;
}

@media (max-width: 767px){
	div.left-side{
		text-align: center !important;
		width:100% !important;
		margin-left: 0 !important;
		margin-bottom:10px;
	}
	div.right-side{
		text-align: center !important;
		width:100% !important;
		margin-right: 0 !important;
	}
}
.custom-control-label::before, 
.custom-control-label::after {
top:0.5rem;
width: 2.7rem;
height: 2.7rem;
}
div.left-side:hover{
	background: #E0ECF8;
	border:1.5px solid #2E64FE;
	cursor: pointer;
}
div.right-side:hover{
	background: #ECE0F8;
	border:1.5px solid #7401DF;
	cursor: pointer;
}

/* div.left-side>h2,h4,p{
	color:#585858
} */

/* #rightCheck::before{
	background-color: #7401DF !important;
	border-color: #5E23D3;
} */
/* #rightCheck::after{
	background-color: #7401DF !important;
	border-color:#5E23D3; */
/* } */
.custom-control-input:checked~#rightCheck::before{
	background-color: #7401DF !important;
	border-color:#5F04B4 !important;
}
/* .custom-control-input:checked~#rightCheck:focus{
	box-shadow:#5F04B4 !important;
} */

button#toTicketMo:hover{
	background-color: #5F04B4 !important;
	border-color: #5F04B4 !important;
}

#useTicket{
	font-size: 1em;
    height: 4em;
    width: 9em;
}
#offerInterview{
	font-size: 1em;
    height: 4em;
    width: 9em;
}










</style>


<section id="content">
	<div class="header_fe hidden-xs">
		<div class="header_nav">
			<div class="hidden-xs">
				<nav class="nav">
					<ul class="ei_nav nav_us">
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/applicants.lbc">지원자</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/matchup.lbc">개발자 인재풀</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/position.lbc">채용 공고</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/ad.lbc">네트워크 광고</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/busInfo.lbc">회사정보</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/settings.lbc">계정 관리</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<div id='db-container' class='db-container'>
		<div class="tag-header container-fluid" style="background-color:#0081C7;">
			<div class="tag-container container-fluid">
				<div class="intro-container container-fluid">
					<a class="matchup-intro container" href="#">
						<h2 class="container" style="color:#FFFFFF;">개발자 인재풀 소개</h2>
					</a>
					<!-- <div color="#FFFFFF" class="category">개발</div> -->
				</div>
				<div class="info-container container">
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info main active" value="전체">전체</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="웹 개발자">웹 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="자바 개발자">자바 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="서버 개발자">서버 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="프론트엔드 개발자">프론트엔드 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="파이썬 개발자">파이썬 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="안드로이드 개발자">안드로이드 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="C/C++ 개발자">C,C++ 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="Node.js 개발자">Node.js 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="데이터 엔지니어">데이터 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="시스템/네트워크 관리자">시스템,네트워크 관리자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="개발 매니저">개발 매니저</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="데이터 사이언티스트">데이터 사이언티스트</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="DevOps / 시스템 관리자">DevOps / 시스템 관리자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="iOS 개발자">iOS 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="PHP 개발자">PHP 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="웹 퍼블리셔">웹 퍼블리셔</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="빅데이터 엔지니어">빅데이터 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value=".NET 개발자">.NET 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="QA/테스트 엔지니어">QA,테스트 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="머신러닝 엔지니어">머신러닝 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="프로덕트 매니저">프로덕트 매니저</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="기술지원">기술지원</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="임베디드 개발자">임베디드 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="보안 엔지니어">보안 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="CTO/Chief Technology Officer">CTO,Chief Technology Officer</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="하드웨어 엔지니어">하드웨어 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="블록체인 플랫폼 엔지니어">블록체인 플랫폼 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="영상/음성 엔지니어">영상,음성 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="BI 엔지니어">BI 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="루비온레일즈 개발자">루비온레일즈 개발자</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="그래픽스 엔지니어">그래픽스 엔지니어</button>
					<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info rest" value="CIO/Chief Information Officer">CIO,Chief Information Officer</button>
				</div>
			</div>
			<hr>
			<div class="searchBar">
				<div class="input-group container col-md-8">
					<input type="text" id="searchBox" class="form-control" style="border-color: #ffffff;" placeholder="회사명, 학교, 스킬 검색 (중복검색 가능 e.g.회사명 AND 스킬, 회사명 OR 학교)" aria-label="search-bar" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button id="searchBtn" class="btn btn-primary" style="background-color: #02609B; border-color: #FFFFFF; font-size:15px;" type="button">검색하기</button>
					</div>
				</div>
				<!-- <div class="col-md-4">
					<div class="dropdown-menu"><input type="range" class="custom-range dropdown-item" min="0" max="30" id="experiance"></input><div id="values_area"><p id="slider_values"></p></div></div>
				</div> -->
			</div>
		</div>
		<div class="resume-area row" style="padding-bottom:1.5em;">
			<div class="resume-left-area col-12 col-sm-4">
				<div class="top center forOpen" id="ticketArea" style="height: 100px; padding-top:20px;">
						<!-- <c:if test="${ticket>0}">
							<div class="numOfTicket"><p>남은 열람권 갯수: <span id="numOfTicket">${ticket}</span>개 </p></div>
						</c:if>
						<c:if test="${ticket<1}">
							<button class="btn btn-success" style="background-color: #7B39BD; border-color: #7B39BD; font-size:15px;">알림권 결제하기</button>
						</c:if> -->
				</div>
				<div class="bottom center favList">
					<div class="list-group left-menu">
						<a href="#" class="list-group-item list-group-item-action active" onclick="location.reload()">목록 전체</a>
						<a href="#" class="list-group-item list-group-item-action" onclick="favoriteList(); return false;">찜한 목록<div class='countSelected'></div></a>
						<a href="#" class="list-group-item list-group-item-action" onclick="openedList();return false;">열람한 목록<div class='countSelected'></div></a>
						<a href="#" class="list-group-item list-group-item-action" onclick="offeredList();return false;">면접 제안한 목록<div class='countSelected'></div></a>
					</div>
				</div>
			</div>
			<div id="cards-area" class="col-12 col-sm-8">
					<!-- Ajax 로 불러온 레쥬메 영역 -->
			</div>
		</div>
	</div>	

	<!-- 이력서 미리보기 모달 -->
	<div class="modal fade roughResume" id="openRoughResume" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	    	<div class="modal-content" style="margin-top:20px; margin-bottom:20px;">
		  		<div class="modal-header" style="background-color: #2E2E2E;" >
					<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
					<h5 class="modal-title" style="color: #ffffff; margin: auto auto;"  id="exampleModalLabel">이력서 미리보기</h5>
	        		<button type="button" class="close" style="color:#ffffff; padding-top: 15px;" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">X</span>
	        	</button>
	    		</div>
         		 <!-- <form id="login" action="${pageContext.request.contextPath}/business/login" onsubmit="return loginValidate()" method="post"> -->
	    		<div class="modal-body" id="resumeBody">
					<div class="modal-body-area" id="resumeBodyInside">
						<div class="" id="ResumeNo"></div>
						<div class="" id="ResumeTitle"></div>
						<div class="" id="ResuMemName"></div>
						<div class="" id="ResuMemEmail"></div>
						<div class="" id="ResuMemPhone"></div>
						<div class="" id="ResuIntro"></div>
						<hr style="width:95%; border-top:groove;">
						<div class="" id="ResuCareers"></div>
						<div class="" id="ResuEducation"></div>
					</div>
				</div>
				<!-- </form> -->
	    		<div class="modal-footer">
					<div class="resume-footer row" id="resumeFooter" style="width:100%"></div>	
				</div>
			</div>
		</div>
	</div>


	<!-- 열람권 구매 모달-->
	<div class="modal fade" id="ticketModal" tabindex="-1" role="dialog" 
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div id="ticket-modal" class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
		  <div class="modal-header" style="background-color: #1C1C1C;" >
			<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
			<h2 class="modal-title" style="color: #ffffff; margin: auto auto;"  id="exampleModalLabel">열람권 구매</h2>
			<button type="button" class="close" style="color:#ffffff; padding-top: 15px;" data-dismiss="modal" aria-label="Close">
			  <span aria-hidden="true">X</span>
			</button>
		  </div>
		  <div class="modal-body">
			<div class="explain" style="text-align: center; color:#FF0040; font-size:15px; padding:1.5em; margin-top:-5px;">이력서 <b>상세보기</b> 및 <b>면접 제안</b>을 하기 위해서는 열람권을 구매 하셔야 합니다.</div>
			<div class="button-area">
				<div class="custom-control custom-checkbox left-side" style="width:48%; margin-left:1%; text-align:center; height:15em;">
					<input type="checkbox" class="custom-control-input" id="basicPack">
						<label class="custom-control-label" for="basicPack">
							<div class="hov packageEx">
								<h2 class="hov">기본 패키지</h2> 
								<h4 class="hov">300,000원 / 20건</h4>
								
								<p class="hov">20건의 이력서 열람 및 면접 제안 가능</p>
								<p>학력/경력 등 상세 정보 확인</p>
								<p>20건의 이력서 상세보기</p>
								<p>20건의 면접 제안 가능</p>
							</div>
						</label>
				</div>
				<div class="custom-control custom-checkbox right-side" style="width:48%; margin-right:1%; text-align: center; height:15em;">
					<input type="checkbox" class="custom-control-input" id="advancedPack">
						<label class="custom-control-label" id="rightCheck" for="advancedPack">
							<div class="hov packageEx">
								<h2 class="hov">고급 패키지</h2> 
								<h4 class="hov">500,000원 / 50건</h4>
								
								<p class="hov">50건의 이력서 열람 및 면접 제안 가능</p>
								<p>학력/경력 등 상세 정보 확인</p>
								<p>50건의 이력서 상세보기</p>
								<p>50건의 면접 제안 가능</p>
							</div>
						</label>
					</div>
				</div>	
		  </div>
			 <div class="modal-footer" style="justify-content: center; background-color: #FFFFFF; padding:0.5em;">
				<input type="hidden" id="hiddenType">
				<button class="btn btn-primary" id="ticket-pay"style="font-size:1.5em; padding:10px; width:7em; background-color: #F2F2F2; border-color: #F2F2F2;" onclick="fn_payment();" disabled>결제하기</button>
			  </div>
		</div>
	  </div>
	</div>



</section>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	var path = "${path}";
	var db_index = "${dbIndex}";
	var db_html = "${dbHtml}";
	var appl_index = "${applIndex}";

	var memEmail="${loginMember.memEmail}";
	var memName="${loginMember.memName}";
	var memPhone="${loginMember.memPhone}";

	function moveToInterview(applNo){
	location.href="${path}/business/applView.lbc?applNo="+applNo;
}


</script>
<!-- <script src="${path}/resources/js/db-main.js"></script>  -->
<c:if test="${dbIndex eq 1}">
	<script src="${path}/resources/js/db-applications.js"></script>
</c:if>
<c:if test="${dbIndex eq 2}">
	<script src="${path}/resources/js/db-matchup.js"></script>
</c:if>

<c:if test="${dbIndex eq 5}">
	<!-- <script src="${path}/resources/js/db-businfo.js"></script> -->
</c:if>
<jsp:include page="/WEB-INF/views/business/footer.jsp" />