<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="row">
	<h1 class="title">회원 정보 - 기본 정보</h1>
</div>
<div class="row">
	<form action="#" method="get" style="width: 50%;">
		<div class="input-group">
			<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
			<input class="form-control" id="system-search"
				placeholder="Search for" required value="${searchValue}"> <span
				class="input-group-btn">
				<button type="button" class="btn btn-default" onclick="search(0);">
					<i class="fas fa-search"></i>
				</button>
			</span>
		</div>
	</form>
	<table class="table table-list-search rwd-table" id="memberListTB">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>이메일</th>
				<th>등급
					<div class="dropdown" style="display: inline-block;">
				        <select class="dropdown-select-version select" name="memLevel" id="searchlevel" style="vertical-align: top; height: 21px; width: 100px; margin: 0; margin-left: 10px;">
				        	<option value="-2" selected disabled hidden>등급별검색</option>
						    <option value="-1" <c:if test="${searchLevel eq -1}">selected</c:if>>전체</option>
				        	<option value="5" <c:if test="${searchLevel eq 5}">selected</c:if>>관리자</option>
						    <option value="4" <c:if test="${searchLevel eq 4}">selected</c:if>>기업관리자</option>
						    <option value="3" <c:if test="${searchLevel eq 3}">selected</c:if>>기업매니저</option>
						    <!--<option value="2">-미정-</option> -->
						    <option value="1" <c:if test="${searchLevel eq 1}">selected</c:if>>정회원</option>
						    <option value="0" <c:if test="${searchLevel eq 0}">selected</c:if>>가입미완료</option> <!-- 회원가입 미완료 상태 -->
				        </select>
				    </div>
				</th>
				<th>이름</th>
				<th>전화번호</th>
				<th class="hidden_th">포인트</th>
				<th class="hidden_th">메모</th>
				<th>수정/탈퇴</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty memList}">
			<c:forEach items="${memList }" var="m">
				<tr>
					<td data-th="회원번호">${m.memNo }</td>
					<td data-th="이메일">${m.memEmail }</td>
					<td data-th="등급">
						<div class="dropdown" style="display: inline-block;">
					        <select class="dropdown-select-version select" name="memLevel" id="level_${m.memNo}">
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
					<td class="hidden_td" data-th="포인트">${m.memPoint }</td>
					<td class="hidden_td" data-th="메모">
						<button class="btn memoBtn" id="mBtn_${m.memNo }" style=" width:32px; height:32px">
							<img src="${path}/resources/images/memo.png" style="width:32px; height:32px"/>
						</button>
						<div class="memo_area" id="memo_${m.memNo }" style="display:none;">
							<textarea class="memo_ta" id="memoarea_${m.memNo}">${m.memAdminmemo }</textarea>
						</div>
					</td>
					<td data-th="수정/탈퇴"> 
						<button type="button" class="btn btn-primary btn-sm" onclick="fn_updateMember(${m.memNo})">수정</button>
						<button type="button" class="btn btn-danger btn-sm" onclick="fn_deleteMember(${m.memNo})">탈퇴</button>
					</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty memList}">
				<tr>
					<td colspan="8">
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
		$('.memoBtn').on('click', function() {
			var choId=$(this).next('.memo_area');
			var memoArr=$(".memo_area");
			$.each(memoArr, function(index, item) {
				if($(item).attr("id")==$(choId).attr("id")) {
					$(choId).slideToggle();
				} else {
					$(item).slideUp();		
				}
			})
		})
		
		$('#searchlevel').on('change', function() {
			search(0);		
		});
	</script>
</div>
