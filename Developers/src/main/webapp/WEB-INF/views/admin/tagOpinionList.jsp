<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<h1 class="title">기업태그승인관리</h1>
		</div>
		<div class="row">
			<table class="table table-list-search rwd-table">
				<thead>
					<tr>
						<th>기업명</th>
						<th>위치</th>
						<th>산업</th>
						<th>요청 태그</th>
						<th>승인/거절</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty resultList}">
						<c:forEach items="${resultList }" var="l">
						<tr>
							<td data-th="기업명">${l.BUS_NAME}</td>
							<td data-th="위치">${l.BUS_COUNTRY}/${l.BUS_AREA}</td>
							<td data-th="산업">${l.BUS_INDUSTRIAL}</td>
							<td data-th="요청 태그">
								<input type="hidden" id="tag_opinion_${l.TAG_NO}" value="${l.TAG_OPINION }"/>
								<c:forEach items="${fn:split(l.TAG_OPINION, ',') }" var="item">
								    <a href="javascript:void(0);" class="tag_style" >#${item}</a>
								</c:forEach>
							</td>
							<td data-th="승인/거절">
								<button type="button" class="btn btn-primary btn-sm" onclick="tag_approval(${l.TAG_NO}, ${l.BUS_NO})">승인</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="tag_rejection(${l.TAG_NO})">거절</button>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty resultList}">
						<tr>
							<td colspan="5">
								승인 요청 내역이 없습니다.
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
<style>
	a{
	    text-decoration:none !important;
    	cursor: pointer;
	}
	.tag_style{
		font-family: 'Nanum Gothic', sans-serif;
		background-color: #f3f5f8;
    	padding: 12px 16px;
		display: inline-block;
	    font-size: 14px;
	    font-weight: 600;
	    line-height: 1;
	    color: #333;
	    border-radius: 20px;
	    margin-right: 6px;
	    margin-bottom: 10px;
	}
</style>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>