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
							<a class="ei_a1" href="${path}/business/matchup.lbc">인재풀</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" href="${path}/business/position.lbc">채용 공고</a>
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
		<c:if test='${not empty dbIndex}'>
			${dbHtml}
		</c:if>
	</div>
	<c:if test='${not empty seHtml}'>
		${seHtml}
	</c:if>
</section>
<script>
	var path="${path}";
	var db_index="${dbIndex}";
	var se_html="${seHtml}";
	var appl_index="${applIndex}";
	var appl_page='${applcPage}';
	var appl_like='${applLike}';
	var appl_position='${applPosition}';
</script>
<script src="${path}/resources/js/db-main.js"></script>
<c:if test="${dbIndex eq 1}">	
	<script src="${path}/resources/js/db-applicants.js"></script>
</c:if>
<c:if test="${dbIndex eq 11}">	
	<script src="${path}/resources/js/db-appl-view.js"></script>
</c:if>
<c:if test="${dbIndex eq 2}">	
	<!-- <script src="${path}/resources/js/db-matchup.js"></script> -->
</c:if>
<c:if test="${dbIndex eq 3}">	
	<script src="${path}/resources/js/db-position.js"></script>
</c:if>
<c:if test="${dbIndex eq 5}">	
	<script src="${path}/resources/js/db-businfo.js"></script>
</c:if>
<c:if test="${dbIndex eq 6}">	
	<script src="${path}/resources/js/db-settings.js"></script>
</c:if>
<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 