<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${path }/resources/css/tagSearch.css">
	
<section id="tagSearch">
    <div class="tagSearch-title">
        <div class="tagSearch-title-title">
            <h3 class="tagSearch-title-text">
                ${tag }
				<button style="font-size:13px;" onclick="deleteTag();">
                    <i class="fas fa-times"></i>
				</button>
            </h3>
        </div>
    </div>
    <div class="tagChoochunList">
        <div class="tagChoochunList-list">
        	<c:if test="${not empty reList }">
	            <h4 class="tagList-text">추천</h4>
	            <c:forEach var="r" items="${reList }">
	            	<c:if test="${r.tag == tag }">
	            		<button class="tagListBtn activeTag" type="button">${r.tag }</button>
	            	</c:if>
	            	<c:if test="${r.tag != tag }">
	            		<button class="tagListBtn" type="button" onclick="tagSearch('${r.tag}');">${r.tag }</button>
	            	</c:if>
	            </c:forEach>
            </c:if>
        </div>
    </div>
    <div class="tagCompanyList">
    	<c:if test="${empty cList }">
    		<h4 class="notTagList">태그 검색 결과가 없습니다.</h4>
    	</c:if>
    	<c:if test="${not empty cList }">
	        <div class="tagCompanyList-list">
	        	<c:forEach var="c" items="${cList }">
		            <a href="${path }/search/companyAllInfo?busNo=${c.bus_no}" class="companyList">
		                <div class="companyInfo">
		                    <img src="${path }${c.bus_logo}" alt="회사로고">
		                    <h5>${c.bus_name }</h5>
		                </div>
		                <div class="companyTag">
		                	<c:if test="${not empty tagList }">
		                		<c:forEach var="t" items="${tagList }">
		                			<c:if test="${c.bus_no == t.bus_no }">
		                    			<span class="companyTag-span" role="presentation">${t.tag }</span>
		                    		</c:if>
		                    	</c:forEach>
		                    </c:if>
		                </div>
		            </a>
	            </c:forEach>
	        </div>
        </c:if>
    </div>
</section>
<script>
	function deleteTag(){
		$(".tagSearch-title-text").html("");
		$(".tagSearch-title-text").html("태그를 선택해 기업을 찾아보세요!");
	}
	function tagSearch(text){
		location.href= path + "/mainSearch/changePage?text=" + encodeURIComponent(text);
	}
</script>