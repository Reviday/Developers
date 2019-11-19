<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<div class="row">
	<h1 class="title">포지션등록승인관리</h1>
</div>
<div class="row">
	<table class="table table-list-search rwd-table">
		<thead>
			<tr>
				<th>구분</th>
				<th>기업명</th>
				<th class="visible-over-md">직무</th>
				<th class="visible-only-lg">커리어</th>
				<th class="visible-only-lg">포지션</th>
				<th>신청일시</th>
				<th>정보보기</th>
				<th>승인/거절</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty resultList}">
				<c:forEach items="${resultList }" var="l">
					<tr>
						<td data-th="구분">
							<c:if test="${l.status eq 'O' }">신규등록</c:if>
							<c:if test="${l.status eq 'M' }">수정요청</c:if>
						</td>
						<td data-th="기업명">
							<button type="button" class="btn btn-success" style="font-weight: 600" onclick="blank_bus_info(${l.busNo});">
								${l.busName }
							</button>
							<input type="hidden" value="${l.busName }" id="busName_${l.busNo }"/>
							<input type="hidden" value="${l.applyEmail }" id="applyEmail_${l.positionNo }"/>
						</td>
						<td class="visible-over-md" data-th="직무">
							<c:forEach items="${l.jobType }" var="j" varStatus="s">
								${j }<c:if test="${!s.last}">,</c:if>
							</c:forEach> 
						</td>
						<td class="visible-only-lg" data-th="커리어">
							<c:forEach items="${l.career }" var="j" varStatus="s">
								${j }<c:if test="${!s.last}">~</c:if>
							</c:forEach> 
						</td>
						<td class="visible-only-lg" data-th="포지션">${l.position }</td>
						<td data-th="신청일시">
							<c:if test="${l.enrollDate ne null }">
								<fmt:formatDate value="${l.enrollDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:if>
						</td>
						<td data-th="정보보기">
							<button type="button" class="btn btn-success" style="font-weight: 600" onclick="blank_pos_info(${l.positionNo});">
								정보보기
							</button>
						</td>
						<td data-th="승인/거절">
							<button type="button" class="btn btn-primary btn-sm" onclick="position_approval(${l.positionNo }, ${l.busNo });">승인</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="position_rejection(${l.positionNo }, ${l.busNo });">거절</button>
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
			var win = window.open(path+"/admin/businessInfo.lac?busNo="+busNo, "기업정보", "width=500,height=600");
		};
		function blank_pos_info(positionNo) {
			var win = window.open(path+"/admin/positionInfo.lac?positionNo="+positionNo, "포지션정보", "width=500,height=600");
		};
	</script>
</div>
