<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="기업 인증전" value="기업 인증전"/> 
</jsp:include>

<style>
div.image{
	background-image: url("${path}/resources/images/mainView_group.png");
	text-align: center;
	height:68em;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
}
div.explanation{
	padding-top:18em;
	color: #FFFFFF;

}
</style>

<section id="content">
	<div class="image">
		<div class="explanation">
			<h1 style="margin-bottom:8px; background-color: rgba(0, 0, 0, 0.6); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;"><span style="color:#0080FF;">기업 등록</span> 신청이 완료되었습니다.</h1>
			<h2 style="margin-bottom:8px; background-color: rgba(0, 0, 0, 0.6); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">등록한 기업 검토 중입니다.. 1~2일 정도 소요될 수 있습니다.</h2>
			<h3 style="color:#F2F2F2; background-color: rgba(0, 0, 0, 0.6); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;"">결과는 관리자 계정 이메일로 전됩니다. 회사등록이 완료되면<br> 디벨로퍼스 블랙의 
			모든 기능을 이용하실 수 있습니다.</h3>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 