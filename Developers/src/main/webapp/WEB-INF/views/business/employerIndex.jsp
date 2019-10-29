<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<link rel="stylesheet"
	href="${path }/resources/css/style_ei.css">
<section id="content">
	
	<p>담당자 테스트</p>
	<input type="text" name="name" id="name"/>
	<button onclick="fn_search()">검색</button>
	<button onclick="location.href='${path}/business/applications.do'">지원자</button>
</section>
<script>
	function fn_search(){
		location.href="${path}/business/naverSearch.do?name="+$("#name").val();
	}
</script>

<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 