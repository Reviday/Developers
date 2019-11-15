<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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