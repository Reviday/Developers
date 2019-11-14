<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="recommend-title">
    <p class="recommed-menu menu1">추천하기</p>
    <p class="recommed-menu selected menu2">내가 받은 추천</p>
    <p class="recommed-menu menu3">내가 한 추천</p>
</div>
<!-- 내가 받은 추천 -->
<div class="myrecievehun1 myrecievehun2" style="display: block;">
    <div class="myreciveList1 myreciveList2 myreciveList3 myreciveList4">
        <c:if test="${not empty list }">
        	<c:forEach var="r" items="${list }">
		        <div class="mypushList1 mypushList2 mypushList3 mypushList4">
		            <div class="profile1 profile2" style="background-image: url(${r.mem_photo});"></div>
		            <p class="sentreferName"><c:out value="${r.mem_name }"/></p>
		            <p class="sentreferDescription">
		            	<c:if test="${r.realationship == 'colleague' }">(전)직장동료</c:if>
		            	<c:if test="${r.realationship == 'otherCompany' }">가까운 회사의 직원</c:if>
		            	<c:if test="${r.realationship == 'school' }">학교 동문</c:if>
		            	<c:if test="${r.realationship == 'mentor' }">멘토/멘티</c:if>
		            	<c:if test="${r.realationship == 'warmFriend' }">친한친구</c:if>
		            	<c:if test="${r.realationship == 'friends' }">지인</c:if>
		            </p>
		            <!-- 추천사 작성 안되어있으면 request1클래스로 변경 -->
		            <c:if test="${not empty r.recommend_text }">
			            <div class="sentReferItemButton request">
			                <!-- 추천사 작성 되어있으면 추천사 확인 -->
			                <p>추천사 확인</p>
			            </div>		            
		            </c:if>
		            <c:if test="${empty r.recommend_text }">
			            <div class="sentReferItemButton request1">
			                <!-- 추천사 작성 되어있으면 추천사 확인 -->
			                <p>추천사 확인</p>
			            </div>		            
		            </c:if>
		        </div>
		        <!-- 추천사확인 모달 -->
			    <div class="modal1 modal2">
			        <div class="modalbody1 modalbody2 modalbody3 modalbody4">
			            <div class="modaltitle1 modaltitle2">
			                <span>추천사 확인</span>
			                <button type="button" class="right button1 button2">
			                    <i class="fas fa-times"></i>
			                </button>
			            </div>
			            <div class="modaltitle1 modaltitle3">
			                <div class="recommendeeSection">
			                    <div class="recommendPicture1 recommendPicture2" style="background-image: url(${r.mem_photo});"></div>
			                    <p class="recommendeeName"><c:out value="${r.mem_name }"/></p>
			                    <div class="recommendeeSubInfo">
			                        <p class="realationship1111">
			                        	<c:if test="${r.realationship == 'colleague' }">(전)직장동료</c:if>
						            	<c:if test="${r.realationship == 'otherCompany' }">가까운 회사의 직원</c:if>
						            	<c:if test="${r.realationship == 'school' }">학교 동문</c:if>
						            	<c:if test="${r.realationship == 'mentor' }">멘토/멘티</c:if>
						            	<c:if test="${r.realationship == 'warmFriend' }">친한친구</c:if>
						            	<c:if test="${r.realationship == 'friends' }">지인</c:if>
			                        </p>
			                    </div>
			                </div>
			            </div>
			            <div class="modalfooter1 modalfooter2 modalfooter3">
			                <p class="referralText"><c:out value="${r.recommend_text }"/></p>
			            </div>
			        </div>
			        <div class="modalBigchang1 modalBigchang2"></div>
			    </div>
	        </c:forEach>
        </c:if>
        <c:if test="${empty list }">
        	<p style="text-align: center;margin-top: 100px;font-size: 25px;color: gray;">받은 추천이 없습니다</p>
        </c:if>
    </div>
</div>
<!-- 메뉴변환 -->
<script>
$(document).on("click", ".menu1", function(event){
	location.href = ${path} + "/recommend/recommendMain.lmc?memNo=" + '${memNo}';
})
$(document).on("click", ".menu2", function(event){
	$.ajax({
		url: "${path}" + "/recommend/recommendRecieve",
		type: "POST",
		data: {memNo : '${memNo}'},	
		success: function(data){
			$(".margin2").html("");
			$(".margin2").html(data);
		}
	}) 
})
$(document).on("click", ".menu3", function(event){
	$.ajax({
		url: "${path}" + "/recommend/myrecommend",
		type: "POST",
		data: {memNo : '${memNo}'},	
		success: function(data){
			$(".margin2").html("");
			$(".margin2").html(data);
		}
	}) 
})
</script>
<!-- 추천사확인 모달 -->
<script>
	$(document).on("click", ".request", function(event){
		$(this).parent().next().css("display", "block");	
	})
	$(document).on("click", ".button2", function(event){
		$(".modal2").css("display", "none");	
	})
	$(document).on("click", ".modalBigchang2", function(event){
		$(".modal2").css("display", "none");	
	})	
</script>