<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet"
	href="${path}/resources/css/style_ei.css">
<link rel="stylesheet"
	href="${path}/resources/css/dashboard.css">



<section id="content">
	<div class="header_fe hidden-xs">
		<div class="header_nav">
			<div class="hidden-xs">
				<nav class="nav">
					<ul class="ei_nav nav_us">
						<li class="ls1 ls3" >
							<a class="ei_a1" href="${path}/business/applicants.lbc">지원자</a>
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
		<!-- <div id='appl-leftside' class='appl-leftside'>
			<h5>
				채용중
				<i class='fas fa-angle-up'></i>
			</h5>
			<hr/>
			<ul class='apply-ing'>
				<li><span class='aList-type'>포지션 전체</span> <span class='aList-count'>11</span></li>
				<li><span class='aList-type'>매치업</span> <span class='aList-count'>11</span></li>
			</ul>
			<br/>
			<h5>
				마감된 포지션
				<i class='fas fa-angle-up'></i>
			</h5>
			<hr/>
			<ul></ul>
		</div>
		<div id='appl-main' class='appl-main'>
			<div id='appl-main-top' class='appl-main-top'>
				<div id='appl-main-top-left'>
					<h4 class='h-left'>지원자 응답률</h4>
					<h4 class='h-right'>0.0%</h4>
				</div>
				<div>
					<h4 class='h-left'>평균 응답일</h4>
					<h4 class='h-right'>0일</h4>
				</div>
			</div>
			<nav class='appl-main-nav nav'>
				<ul class='nav_us'>
					<li class='ls3'>
						<a class='ei_a2'>신규&nbsp;<span>( 11 )</span></a>
					</li>
					<li class='ls3'>
						<a class='ei_a2'>서류통과&nbsp;<span>( 11 )</span></a>
					</li>
					<li class='ls3'>
						<a class='ei_a2'>최종합격&nbsp;<span>( 11 )</span></a>
					</li>
					<li class='ls3'>
						<a class='ei_a2'>불합격&nbsp;<span>( 11 )</span></a>
					</li>
					<li class='ls3'>
						<a class='ei_a2'>기간만료&nbsp;<span>( 11 )</span></a>
					</li>
					<li class='ls3 li_input'>
						<input type='text' name='search_em' placeholder='지원자, 포지션 검색'/>
						<label for='btn_search_em'>
							<i class='fas fa-search'></i>
						</label>
						<button type='button' id='btn_search_em' style='display: none;'></button>
					</li>
				</ul>
			</nav>
			<div class='appl-like-check'>
				<input type='checkbox' class='' id='like_check' name='like_check'/><label for='like_check'>별표한 지원자만 보기</label>
			</div>
			<div class='appl-applicant-list'>
				<c:if test='${empty aList}'>
					<div class='appl-aList'>
						<div class='aList-left'>
							<div class='aList-like-btn'><i class='fas fa-star'></i></div>
							<div class='aList-info'>
								<div class='aList-info-no'>No_1</div>
								<div class='aList-info-name'>송<i class='far fa-circle'></i><i class='far fa-circle'></i></div>
							</div>
							<div class='aList-type'>
								<span>매치업</span>
							</div>
						</div>
						<div class='aList-right'>
							<div class='aList-del-btn'>
								<button type='button' class='del-btn' onclick='fn_aList_del()'>삭제</button>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test='${not empty aList}'>
					<br/>
					<h4>포지션에 적합한 후보자가 없으신가요?</h4>
					<h4><a href='#'>매치업</a> 탭에서 인재를 검색하고 직접 면접제안을 해보세요!</h4>
				</c:if>
			</div>
		</div> -->

		
	</div>
</section>
<script>
	var path="${path}";
	var db_index="${dbIndex}";
	var db_html="${dbHtml}";
	var se_html="${seHtml}";
	var appl_index="${applIndex}";
	var appl_page='${applcPage}';
	var appl_like='${applLike}';
	var bus_info='${busInfo}';

</script>
<script src="${path}/resources/js/db-main.js"></script>
<c:if test="${dbIndex eq 1}">	
	<script src="${path}/resources/js/db-applicants.js"></script>
</c:if>
<c:if test="${dbIndex eq 2}">	
	<!-- <script src="${path}/resources/js/db-matchup.js"></script> -->
</c:if>

<c:if test="${dbIndex eq 5}">	
	<script src="${path}/resources/js/db-businfo.js"></script>
</c:if>
<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 