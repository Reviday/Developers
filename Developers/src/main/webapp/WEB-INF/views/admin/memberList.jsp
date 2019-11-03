<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
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

</style>
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
						<!-- <th>이메일인증여부</th>
						<th>수신동의</th>
						<th>차단여부</th>
						<th>가입일</th>
						<th>가입ip</th>
						<th>마지막 접속일</th>
						<th>마지막 접속 ip</th>
						<th></th> -->
					</tr>
				</thead>
				<tbody>
					<tr>
						<td data-th="Entry">Sample</td>
						<td data-th="Entry">Filter</td>
						<td data-th="Entry">12-11-2011 11:11</td>
						<td data-th="Entry">OK</td>
						<td data-th="Entry">123</td>
						<td data-th="Entry">Do some other</td>
					</tr>
					<tr>
						<td data-th="Entry">Try</td>
						<td data-th="Entry">It</td>
						<td data-th="Entry">11-20-2013 08:56</td>
						<td data-th="Entry">It</td>
						<td data-th="Entry">Works</td>
						<td data-th="Entry">Do some FILTERME</td>
					</tr>
					<tr>
						<td data-th="Entry">§</td>
						<td data-th="Entry">$</td>
						<td data-th="Entry">%</td>
						<td data-th="Entry">&</td>
						<td data-th="Entry">/</td>
						<td data-th="Entry">!</td>
					</tr>
				</tbody>
			</table>
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