<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${path }/resources/css/otherSearch.css">
	
<section id="companyJobSearch">
    <div class="cjsTitle">
        <!-- 밑에 버튼을 클릭하면 검색모달 나오면 됨 -->
        <button type="button" class="cjsTitle-btn" onclick="openSearchModal();"><c:out value="${text }"/></button>
    </div>
    <div class="cjsBody">
    	<c:if test="${empty cList && empty pList }">
    		<p style="text-align: center;margin-top: 100px;font-size: 30px;color: gray;">검색결과가 없습니다</p>
    	</c:if>
    	<c:if test="${not empty cList }">
	        <h2 class="cjsBody-title">회사</h2>
	        <div class="companyList">
	        	<c:forEach var="c" items="${cList }">
		            <a href="${path }/search/companyAllInfo?busNo=${c.bus_no}" class="companyInfo">
		                <div class="companyContent">
		                    <div class="companyLogo" style="background-image: url(${path}${c.bus_logo });"></div>
		                    <div class="companyIntro">
		                        <h5><c:out value="${c.bus_name }"/></h5>
		                        <h6><c:out value="${c.bus_industrial }"/></h6>
		                    </div>
		                </div>
		            </a>
	            </c:forEach>
	        </div>
        </c:if>
        <c:if test="${not empty pList }">
	        <h2 class="cjsBody-title">포지션</h2>
	        <div class="positionList">
	            <ul class="clearfix">
	            	<c:forEach var="p" items="${pList }">
		                <li>
		                    <div class="positionInfo">
		                    	<c:if test="${not empty loginMember }">
		                            <a href="${path }/search/companyInfo.do?positionNo=${p.position_no }&memNo=${loginMember.memNo}">
			                            <div class="positionInfoHeader" style="background-image: url(${path}${p.bus_images });">
			                                <button type="button" class="likeButton">
			                                    <i class="fas fa-heart"></i>
			                                    <c:out value="${p.like_count }"/>
			                                </button>
		                            	</div>
		                            	<div class="positionBody">
			                                <dl>
			                                    <dt><c:out value="${p.position }"/></dt>
			                                    <dd>
			                                        <c:out value="${p.bus_name }"/>
			                                        <br>
			                                        <span><c:out value="${p.bus_area }"/></span>
			                                        <span class="addressDot">.</span>
			                                        <span><c:out value="${p.bus_country }"/></span>
			                                    </dd>
			                                </dl>
		                                	<div class="reward">채용보상금 1,000,000원</div>
		                            	</div>
		                        	</a>
	                            </c:if>
	                            <c:if test="${empty loginMember }">
		                            <a href="${path }/search/companyInfo1.do?positionNo=${p.position_no }">
			                            <div class="positionInfoHeader" style="background-image: url(${path}${p.bus_images });">
			                                <button type="button" class="likeButton">
			                                    <i class="fas fa-heart"></i>
			                                    <c:out value="${p.like_count }"/>
			                                </button>
	                            		</div>
	                            		<div class="positionBody">
			                                <dl>
			                                    <dt><c:out value="${p.position }"/></dt>
			                                    <dd>
			                                        <c:out value="${p.bus_name }"/>
			                                        <br>
			                                        <span><c:out value="${p.bus_area }"/></span>
			                                        <span class="addressDot">.</span>
			                                        <span><c:out value="${p.bus_country }"/></span>
			                                    </dd>
			                                </dl>
	                                		<div class="reward">채용보상금 1,000,000원</div>
	                            		</div>
		                        	</a>
		                        </c:if>
		                    </div>
		                </li>
	                </c:forEach>
	            </ul>
	        </div>
        </c:if>
    </div>
</section>
<script>
	function openSearchModal(){
		$.ajax({
			url: path + "/mainSearch/mainSearchModal",
			type: "POST",	
			success: function(data){
				$(".heaer_fm").append(data);
			}
		})
	}
</script>