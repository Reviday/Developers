<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<div class="row">
	<h1 class="title">기업등록승인관리</h1>
</div>
<div class="row">
	<table class="table table-list-search rwd-table">
		<thead>
			<tr>
				<th>등록기업명</th>
				<th style="display:none">기업주소</th>
				<th class="visible-only-lg">산업</th>
				<th class="visible-only-lg">연매출</th>
				<th>요청회원정보</th>
				<th>신청일시</th>
				<th>승인/거절</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty resultList}">
				<c:forEach items="${resultList }" var="l">
					<tr>
						<td data-th="등록기업명">
							<button type="button" class="btn btn-success" style="font-weight: 600" onclick="blank_bus_info(${l.busNo});">
								${l.busName }
							</button>
						</td>
						<td class="only_mb" style="display:none" data-th="기업주소">${l.busAddress }</td>
						<td class="visible-only-lg" data-th="산업">${l.busIndustrial }</td>
						<td class="visible-only-lg" data-th="연매출">${l.busIncome }</td>
						<td data-th="요청회원정보">
							<button type="button" class="btn btn-success" style="font-weight: 600" onclick="blank_mem_info(${l.memNo});">
								${l.memEmail }
							</button>
						</td>
						<td data-th="신청일시">
							<c:if test="${l.requestDate ne null }">
								<fmt:formatDate value="${l.requestDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:if>
						</td>
						<td data-th="승인/거절">
							<button type="button" class="btn btn-primary btn-sm" onclick="bus_req_approval(${l.requestNo }, ${l.busNo},${l.memNo});">승인</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="bus_req_rejection(${l.requestNo }, ${l.busNo},${l.memNo});">거절</button>
						</td>
					</tr>
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
	<script>
		function blank_bus_info(busNo) {
			var win = window.open(path+"/admin/businessInfo.lac?busNo="+busNo, "기업정보", "width=500,height=550");
		};
		function blank_mem_info(memNo) {
			var win = window.open(path+"/admin/memberInfo.lac?memNo="+memNo, "회원정보", "width=500,height=400");
		};
	</script>
</div>