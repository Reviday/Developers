<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="row">
	<h1 class="title">기능별 사용 횟수</h1>
</div>
<div class="row">
	<table class="table table-list-search rwd-table" id="mappingCountListTB">
		<thead>
			<tr>
				<th style="max-width:200px !important">매핑값<button class="sortBtn" type="button" 
						<c:if test="${mapperId eq 'mapperASC'}">id="mapperASC"</c:if>
						<c:if test="${mapperId eq 'mapperDESC'}">id="mapperDESC"</c:if>>
					<c:if test="${mapperId eq 'mapperASC'}">▲</c:if>
					<c:if test="${mapperId eq 'mapperDESC'}">▼</c:if>
					</button>
				</th>
				<th>구분</th>
				<th style="max-width:200px !important">상세정보</th>
				<th>권한</th>
				<th>횟수<button class="sortBtn" type="button"  
						<c:if test="${countId eq 'countASD'}">id="countASD"</c:if>
						<c:if test="${countId eq 'countDESC'}">id="countDESC"</c:if>>
					<c:if test="${countId eq 'countASD'}">▲</c:if>
					<c:if test="${countId eq 'countDESC'}">▼</c:if>
					</button>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty mcList}">
				<c:forEach items="${mcList }" var="m">
				<tr>
					<td data-th="매핑값" style="max-width:200px !important">${m.mapper }</td>
					<td data-th="구분">${m.mapDiv }</td>
					<td data-th="상세정보" style="max-width:200px !important">${m.detail }</td>
					<td data-th="권한">${m.authority }</td>
					<td data-th="횟수">${m.count } 회</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty mcList}">
				<tr>
					<td colspan="5">
						결과가 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<script>
		$('.sortBtn').on('click', function() {
			var id = $(this).attr('id');
			mapperCountSort(id);
		});
	</script>
</div>