<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
@import "https://fonts.googleapis.com/css?family=Montserrat:300,400,700";
.rwd-table {
  margin: 1em 0;
  min-width: 300px;
}
.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}
.rwd-table th {
  display: none;
}
.rwd-table td {
  display: block;
}
.rwd-table td:first-child {
  padding-top: .5em;
}
.rwd-table td:last-child {
  padding-bottom: .5em;
}
.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 6.5em;
  display: inline-block;
}
@media (min-width: 768px) {
  .rwd-table td:before {
    display: none;
  }
}
.rwd-table th,
.rwd-table td {
  text-align: left;
}
@media (min-width: 768px) {
  .rwd-table th,
  .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child,
  .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child,
  .rwd-table td:last-child {
    padding-right: 0;
  }
}

body {
  font-family: sans-serif;
  color: #444;
  background: #eee;
}

h1 {
  font-weight: normal;
  letter-spacing: -1px;
  color: #34495E;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
}
.rwd-table tr {
  border-color: #46637f;
}
.rwd-table th,
.rwd-table td {
  margin: .5em 1em;
  border-top:none;
}
@media (min-width: 768px) {
  .rwd-table th,
  .rwd-table td {
    padding: 1em !important;
  }
}
.rwd-table th,
.rwd-table td:before {
  color: #dd5;
}
.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}
.text-align-center {
	text-align: center;
}
td {
	border-top: none !important;
	vertical-align: middle !important;
}
</style>

<style>
.select,
.download-target {
  width: 8em;
}
.select {
  position: relative;
  display: block;
  height: 3em;
  line-height: 3;
  background: #2c3e50;
  overflow: hidden;
  border-radius: .25em;
  display: inline-block;
  display: -webkit-inline-box;
  border: 1px solid #667780;
  margin: 1em 0;
}
select {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0 0 0 .5em;
  color: #fff;
  cursor: pointer;
}
select::-ms-expand {
  display: none;
}
.select::after {
  content: '\25BC';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  padding: 0 1em;
  background: #34495e;
  pointer-events: none;
}
.select:hover::after {
  color: #f39c12;
}
.select::after {
  -webkit-transition: .25s all ease;
  -o-transition: .25s all ease;
  transition: .25s all ease;
}

</style>
<script>
$('.dropdown-select-version').on('change', function() {
    if (this.value == 'x86') {
        $('.download-target').attr({ 'href': 'http://dl.dracos-linux.org/download.php?file=i686/dracOs-i686-2.0.iso' });
    }else if (this.value == 'x64') {
        $('.download-target').attr({ 'href': 'http://dl.dracos-linux.org/download.php?file=x86_64/dracOs-x86_64-2.0.iso' });
    }else {
        $('.download-target').attr({'href': '#'}); 
    } 
});
</script>
<section id="content">
	<div class="container" style="height: 60px"></div>
	<div class="container mainContent">
		<div class="row">
			<h1 class="title">회원 정보</h1>
		</div>
		<div class="row">
			<form action="#" method="get" style="width: 50%;">
				<div class="input-group">
					<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
					<input class="form-control" id="system-search" name="q"
						placeholder="Search for" required> <span
						class="input-group-btn">
						<button type="submit" class="btn btn-default">
							<i class="fas fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<table class="table table-list-search rwd-table">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이메일</th>
						<th>등급</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>포인트</th>
						<th>수정/탈퇴</th>
					</tr>
				</thead>
				<c:if test="${not empty memList}">
					<tbody>
						<c:forEach items="${memList }" var="m">
						<tr>
							<td data-th="회원번호">${m.memNo }</td>
							<td data-th="이메일">${m.memEmail }</td>
							<td data-th="등급">
								<div class="dropdown" style="display: inline-block;">
							        <select class="dropdown-select-version select" name="memLevel">
							        	<option value="5" <c:if test="${m.memLevel eq 5}">selected</c:if>>관리자</option>
									    <option value="4" <c:if test="${m.memLevel eq 4}">selected</c:if>>기업관리자</option>
									    <option value="3" <c:if test="${m.memLevel eq 3}">selected</c:if>>기업매니저</option>
									    <!--<option value="2">-미정-</option> -->
									    <option value="1" <c:if test="${m.memLevel eq 1}">selected</c:if>>정회원</option>
									    <option value="0" <c:if test="${m.memLevel eq 0}">selected</c:if>>가입미완료</option> <!-- 회원가입 미완료 상태 -->
							        </select>
							    </div>
							</td>
							<td data-th="이름">
								<c:if test="${m.memName eq null}"><span style="color:rgb(91, 91, 91);">#미기입</span></c:if>
								<c:if test="${m.memName ne null}">${m.memName}</c:if>
							</td>
							<td data-th="전화번호">
								<c:if test="${m.memPhone eq null}"><span style="color:rgb(91, 91, 91);">#미기입</span></c:if>
								<c:if test="${m.memPhone ne null}">${m.memPhone}</c:if>
							</td>
							<td data-th="포인트">${m.memPoint }</td>
							<td data-th="수정/탈퇴"> 
								<button type="button" class="btn btn-primary btn-sm" onclick="">수정</button>
								<button type="button" class="btn btn-danger btn-sm">탈퇴</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
		<div class="container text-align-center">
			<c:if test="${pageBar ne null }">
				${pageBar}
			</c:if>
		</div>
	</div>

</section>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script>
	$(document).ready(function() {
		var activeSystemClass = $('.list-group-item.active');
	
		//something is entered in search form
		$('#system-search').keyup(function() {
			var that = this;
			// affect all table rows on in systems table
			var tableBody = $('.table-list-search tbody');
			var tableRowsClass = $('.table-list-search tbody tr');
			$('.search-sf').remove();
			tableRowsClass.each(function(i, val) {

				//Lower text for case insensitive
				var rowText = $(val).text().toLowerCase();
				var inputText = $(that).val().toLowerCase();
				if (inputText != '') {
					$('.search-query-sf').remove();
					tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
									+ $(that).val()
									+ '"</strong></td></tr>');
				} else {
					$('.search-query-sf').remove();
				}

				if (rowText.indexOf(inputText) == -1) {
					//hide rows
					tableRowsClass.eq(i).hide();

				} else {
					$('.search-sf').remove();
					tableRowsClass.eq(i).show();
				}
			});
			//all tr elements are hidden
			if (tableRowsClass.children(':visible').length == 0) {
				tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
			}
		});
	});
</script>