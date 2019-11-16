<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!-- 검색모달 -->
<div class="searchHeader11">
      <form role="presentation" action="" onsubmit="return false;">
          <input type="text" placeholder="#태그, 회사, 포지션, 키워드 검색" autocomplete="off" name="search" id="searchInput11">
          <i class="fas fa-search"></i>
          <button type="button" class="searchClose11">
              <i class="fas fa-times"></i>
          </button>
      </form>
      <div class="searchBody11">
          <div class="container111" role="presentation">
              <h4 class="recommendTag11">추천태그로 검색해보세요</h4>
              <ul class="tagList11">
                  <c:if test="${not empty list }">	
                  	  <c:forEach var="t" items="${list }">
		                  <li class="tagListItem11">
		                      <button class="tagListBtn11" type="button" onclick="searchTag('${t.tag}')"><c:out value="${t.tag }"/></button>
		                  </li>
	                  </c:forEach>
                  </c:if>
              </ul>
              <c:if test="${not empty cookieList }">
              	  <h4 class="latelysearch11">최근 검색 기록</h4>
	              <button type="button" class="searchDelete11">기록 삭제</button>
	              <ul class="latelysearchList11">
	                  <li>
	                      <a href="">100억원</a>
	                      <button type="button" class="disBtn11">
	                          <i class="fas fa-times"></i>
	                      </button>
	                  </li>
	                  <li>
	                      <a href="">구글</a>
	                      <button type="button" class="disBtn11">
	                          <i class="fas fa-times"></i>
	                      </button>
	                  </li>
	                  <li>
	                      <a href="">자바 개발자</a>
	                      <button type="button" class="disBtn11">
	                          <i class="fas fa-times"></i>
	                      </button>
	                  </li>
	              </ul>
              </c:if>
          </div>
      </div>
</div>

<!-- 검색창 -->
<script>
	$(".container111").after().click(function(){
		$(".searchHeader11").css("display", "none");
	})
	$(document).on("keyup", "input[name=search]", function(event){
		if($("input[name=search]").val().length > 0){
			$(".searchBody11").css("display", "none");
		}else{
			$(".searchBody11").css("display", "block");
		}
	})
	$(document).on("click",".searchClose11", function(event){
		$(".searchBody11").css("display", "block");
	})
	$(document).on("click", ".searchButton", function(event){
		$(".searchHeader11").css("display", "block");
	})
	$(document).on("keydown", "input[name=search]", function(event){
		if(event.keyCode == 13){
			if($("#searchInput11").val().trim().length > 0){
				location.href= path + "/mainSearch/changePage?text=" + encodeURIComponent($("#searchInput11").val());
			}else{
				alert("검색어를 입력해주세요");
			}
		}
	})
	function searchTag(tag){
		location.href= path + "/mainSearch/changePage?text=" + encodeURIComponent(tag);
	}
</script>
<!--  -->