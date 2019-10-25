<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_ei.css">
<section id="content">
	<div class="header_fe hidden-xs">
			<div class="header_nav">
				<div class="hidden-xs">
					<nav class="nav">
						<ul class="nav_us" id="ei_nav">
							<li class="ls1 ls3">
								<a class="ei_a1">지원자</a>
							</li>
							<li class="ls1 ls3">
								<a class="ei_a1">매치업</a>
							</li>
							<li class="ls1 ls3">
								<a class="ei_a1">포지션</a>
							</li>
							<li class="ls1 ls3">
								<a class="ei_a1">채용 광고</a>
							</li>
							<li class="ls1 ls3">
								<a class="ei_a1">회사정보</a>
							</li>
							<li class="ls1 ls3">
								<a class="ei_a1">계정 관리</a>
							</li>
						</ul>
					</nav>
					</div>
				</div>
	</div>
	<p>담당자 테스트</p>
</section>
	
<script>
	$(function(){
		$("#ei_nav>li>a").on("click",function(){
			$($(this).parent().siblings()).children().removeClass("ca1");
			$(this).addClass('ca1');
		});
	})
</script>
<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 