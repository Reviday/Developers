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

<style>
@media (max-width: 767px){
#db-container{
	margin-top:48px;
	}
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
a.col-6 {
	margin:auto auto;
	margin-top: 15px;
}

</style>

<section id="content">
	<div class="header_fe hidden-xs">
		<div class="header_nav">
			<div class="hidden-xs">
				<nav class="nav">
					<ul class="ei_nav nav_us">
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/applications.lbc">지원자</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/matchup.lbc">매치업</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/position.lbc">포지션</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/ad.lbc">채용 광고</a>
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
					<a class="matchup-intro container" href="/bussiness/matchupintro">
						<h2 class="container" style="color:#FFFFFF;">매치업 소개</h2>
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
			<div class="searchBar container" style="height:35px">
				<div class="input-group container col-md-8">
					<input type="text" id="searchBox" class="form-control" style="border-color: #ffffff;" placeholder="회사명, 학교, 스킬 검색 (중복검색 가능 e.g.회사명 AND 스킬, 회사명 OR 학교)" aria-label="search-bar" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button id="searchBtn" class="btn btn-primary" style="background-color: #02609B; border-color: #FFFFFF" type="button">검색하기</button>
					</div>
				</div>
				<!-- <div class="col-md-4">
					<div class="dropdown-menu"><input type="range" class="custom-range dropdown-item" min="0" max="30" id="experiance"></input><div id="values_area"><p id="slider_values"></p></div></div>
				</div> -->
			</div>
		</div>
		<div class="resume-area row">
			<div style="border: 1px solid red; padding-right: 0;" class="col-12 col-sm-4">
				<div class="top center" style="height: 100px; border: 1px solid green">
					<button class="btn btn-success" style="background-color: #7B39BD; border-color: #7B39BD; height:60px; width:70%;">알림권 결제하기</button>
				</div>
				<div class="bottom center" style="border: 1px solid blue">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action active">목록 전체</a>
						<a href="#" class="list-group-item list-group-item-action">찜한 목록<div class='countSelected'></div></a>
						<a href="#" class="list-group-item list-group-item-action">열람한 목록<div class='countSelected'></div></a>
						<a href="#" class="list-group-item list-group-item-action">면접 제안한 목록<div class='countSelected'></div></a>
					</div>
				</div>
			</div>
			<div id="cards-area" style="border: 1px solid red" class="col-12 col-sm-8">
				<!-- 디비에서 레주메 가져와 리스트 뿌려주기  -->
				<!-- <c:if test="${not empty myPage}">
					<c:forEach var="i" items="${resumeList}" varStatus="s">
						<div class="resume-card col-sm-10 container">
							<div class="card">
								<h5 class="card-header"><img class="bus-user-profile" src="${path}/resources/upload/profile/no-profile-image.png"/><button class="btn btn-outline-primary" type="button">찜하기</button></h5>
								<div class="card-body">
									<h5 class="card-title">Special title treatment</h5>
									<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
									<a href="#" class="btn btn-primary">이력서 미리보기</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty myPage}">
					<h3>검색 결과가 없습니다.</h3>
				</c:if> -->
			</div>
		</div>








	</div>	
</section>


<script>
	var path = "${path}";
	var db_index = "${dbIndex}";
	var db_html = "${dbHtml}";
	var appl_index = "${applIndex}";

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