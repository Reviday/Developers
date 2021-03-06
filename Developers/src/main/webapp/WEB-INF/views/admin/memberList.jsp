<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:if test="${statsList ne null}">
	<c:forEach items="statsList" var="sl">
	</c:forEach>
</c:if>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${path}/resources/css/adminstyle.css" rel="stylesheet" id="bootstrap-css">
<section id="content">
	<div class="container" style="height: 60px"></div>
		<div class="row" style="margin-bottom: 20px">
			<div class="middle">
		        <div class="counting-sec">
		            <div class="inner-width">
		                <div class="col">
		                    <i class="fas fa-users"></i>
		                    <div class="num">${statsMap.total }</div>
		                    	총 회원
		                </div>
		
		                <div class="col">
		                    <i class="fas fa-users-cog"></i>
		                    <div class="num">${statsMap.business }</div>
		                    	기업 회원
		                </div>
		
		                <div class="col">
		                    <<i class="fas fa-user-check"></i>
		                    <div class="num">${statsMap.common }</div>
		                    	일반 회원
		                </div>
		
		                <div class="col">
		                    <i class="fas fa-user-times"></i>
		                    <div class="num">${statsMap.unfinished }</div>
		                    	가입 미완료
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <script>
		        $(".num").counterUp({delay:10, time:1000});
		    </script>
		</div>
	<div class="container mainContent">
		<div class="row">
			<h1 class="title">회원 정보 - 기본 정보</h1>
		</div>
		<div class="row">
			<div class="input-group" style="width: 50%;">
				<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
				<input class="form-control" id="system-search" 
					placeholder="Search for" required> <span
					class="input-group-btn">
					<button type="button" class="btn btn-default" onclick="search(0);">
						<i class="fas fa-search"></i>
					</button>
				</span>
			</div>
			<table class="table table-list-search rwd-table" id="memberListTB">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이메일</th>
						<th>등급
							<div class="dropdown" style="display: inline-block;">
						        <select class="dropdown-select-version select" name="memLevel" id="searchlevel" style="vertical-align: top; height: 21px; width: 100px; margin: 0; margin-left: 10px;">
						        	<option value="-2"selected disabled hidden>등급별검색</option>
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
				$('#system-search').on("keyup", function(key) {
					if(key.keyCode == 13) {
						search(0);
					}
				});
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
	</div>

</section>
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/admin_main.js"></script>