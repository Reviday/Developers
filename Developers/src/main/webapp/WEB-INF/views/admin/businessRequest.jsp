<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${path}/resources/css/adminstyle.css" rel="stylesheet" id="bootstrap-css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<section id="content">
	<div class="container" style="height: 60px"></div>
	<div class="container mainContent">
		<div class="row">
			<h1 class="title">기업등록승인관리</h1>
		</div>
		<div class="row">
			<table class="table table-list-search rwd-table">
				<thead>
					<tr>
						<th>등록기업명</th>
						<th>기업정보확인</th>
						<th>요청회원</th>
						<th>요청회원정보</th>
						<th>승인/거절</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty resultList}">
						<c:forEach items="${resultList }" var="l">
							<tr data-th="등록기업명">${l.BUS_NAME }</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty resultList}">
						<tr>
							<td colspan="5">
								등록 요청 내역이 없습니다.
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="container text-align-center">
			<c:if test="${pageBar ne null }">
				${pageBar}
			</c:if>
			<input type="hidden" value="${cPage}" id="cPage"/>
			<input type="hidden" value="${numPerPage}" id="numPerPage"/> 
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript" src="${path }/resources/js/admin_main.js"></script>