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
<section id="content">
	<div class="container" style="height: 60px"></div>
	<div class="container mainContent">
		<div class="row">
			<h1 class="title">로그인 로그</h1>
		</div>
		<div class="row">
			<form action="#" method="get" style="width: 50%;">
				<div class="input-group">
					<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
					<input class="form-control" id="system-search" 
						placeholder="Search for" required> <span
						class="input-group-btn">
						<button type="button" class="btn btn-default" onclick="mll_search(0);">
							<i class="fas fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<table class="table table-list-search rwd-table">
				<thead>
					<tr>
						<th>No.</th>
						<th>
							<div class="dropdown" style="display: inline-block;">
						        <select class="dropdown-select-version select" name="mllSuccess" id="mllSuccess" style="vertical-align: top; height: 21px; width: 62px; margin: 0; margin-left: 10px; color: #dd5;">
						        	<option value="R" selected disabled hidden>결과</option>
						        	<option value="A" <c:if test="${mllSuccess eq 'A'}">selected</c:if>>전체</option>
						        	<option value="Y" <c:if test="${mllSuccess eq 'Y'}">selected</c:if>>성공</option>
								    <option value="N" <c:if test="${mllSuccess eq 'N'}">selected</c:if>>실패</option>
						        </select>
						    </div>
						</th>
						<th class="hidden_th">사유</th>
						<th>이메일</th>
						<th>일시</th>
						<th>접속IP</th>
						<th class="hidden_th">UserAgent</th>
						<th class="hidden_th">URL</th>
						<th class="hidden_th">Referer</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty logList}">
						<c:forEach items="${logList }" var="l">
						<tr>
							<td data-th="No.">${l.mllNo }</td>
							<td class="mb-text-align-left" data-th="수행결과" style="text-align: center">
								<c:if test="${l.mllSuccess eq 'Y'}">성공</c:if>
								<c:if test="${l.mllSuccess eq 'N'}">실패</c:if>
							</td>
							<td class="hidden_td" data-th="사유">${l.mllReason}</td>
							<td data-th="이메일">${l.mllUserEmail}</td>
							<td data-th="일시">
								<c:if test="${l.mllDatetime ne null }">
									<fmt:formatDate value="${l.mllDatetime }" pattern="yyyy-MM-dd HH:mm:ss"/>
								</c:if>
							</td>
							<td data-th="접속IP">${l.mllIp }</td>
							<td class="hidden_td" data-th="UserAgent">${l.mllUseragent}</td>
							<td class="hidden_td" data-th="URL">${l.mllUrl}</td>
							<td class="hidden_td" data-th="Referer">${l.mllReferer}</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty logList}">
						<tr>
							<td colspan="9">
								결과가 존재하지 않습니다.
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
				$('#mllSuccess').on('change', function() {
					mll_search(0);
				});
			</script>
		</div>
	</div>
</section>
<style>

</style>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>