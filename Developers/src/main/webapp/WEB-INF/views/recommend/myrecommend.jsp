<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="recommend-title">
    <p class="recommed-menu menu1">추천하기</p>
    <p class="recommed-menu menu2">내가 받은 추천</p>
    <p class="recommed-menu selected menu3">내가 한 추천</p>
</div>
<!-- 내가 한 추천 -->
<div>
    <div class="mypushrecommend1 mypushrecommend2 mypushrecommend3 mypushrecommend4" style="display: block;">
    	<c:if test="${not empty list }">
    		<c:forEach var="r" items="${list }">
		        <div class="mypushList1 mypushList2 mypushList3 mypushList4">
		            <div class="profile1 profile2" style="background-image: url(${path}${r.recommend_photo});"></div>
		            <p class="sentreferName"><c:out value="${r.recommend_name }"/></p>
		            <p class="sentreferDescription">
		            	<c:if test="${r.realationship == 'colleague' }">(전)직장동료</c:if>
		            	<c:if test="${r.realationship == 'otherCompany' }">가까운 회사의 직원</c:if>
		            	<c:if test="${r.realationship == 'school' }">학교 동문</c:if>
		            	<c:if test="${r.realationship == 'mentor' }">멘토/멘티</c:if>
		            	<c:if test="${r.realationship == 'warmFriend' }">친한친구</c:if>
		            	<c:if test="${r.realationship == 'friends' }">지인</c:if>
		            </p>
		            <!-- 추천사 작성 되어있으면 request클래스 삭제 -->
		            <c:if test="${empty r.recommend_text }">
			            <div class="sentReferItemButton request" onclick="choochunsa('${r.mem_no}', '${r.recommend_no}')">
			                <!-- 추천사 작성 되어있으면 추천사 확인 -->
			                <p>추천사 작성</p>
			            </div>
		            </c:if>
		            <c:if test="${not empty r.recommend_text }">
			            <div class="sentReferItemButton choochunSu">
			                <!-- 추천사 작성 되어있으면 추천사 확인 -->
			                <p>추천사 확인</p>
			            </div>
		            </c:if>
		            <i class="fas fa-ellipsis-v cancle"></i>
		            <!-- 위의 icon 눌렀을 떄 생성 -->
		            <div class="showMoreOverlay">
		                <p onclick="recommendCancle('${r.recommend_no}');">추천 취소</p>
		            </div>
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
			                    <div class="recommendPicture1 recommendPicture2" style="background-image: url(${r.recommend_photo});"></div>
			                    <p class="recommendeeName"><c:out value="${r.recommend_name }"/></p>
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
			            <div class="modalbtn1 modalbtn2">
			                <div class="buttonDeleteReferral" onclick="recommendCancle('${r.recommend_no}');">
			                    <p>삭제</p>
			                </div>
			                <div class="buttonModifyReferral" onclick="choochunsa('${r.mem_no}', '${r.recommend_no}')">
			                    <p>수정</p>
			                </div>
			            </div>
			        </div>
			        <div class="modalBigchang1 modalBigchang2"></div>
			    </div>
	        </c:forEach>
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
<!-- 취소모달 -->
<script>
	var s = 0;
	$(document).on("click", ".cancle", function(event){
		if(s == 0){
			$(".showMoreOverlay").css("display", "block");
			s = 1;
		}
		else if(s == 1){
			$(".showMoreOverlay").css("display", "none");
			s = 0;
		}
	})
	function recommendCancle(recommendNo){
		$.ajax({
			url: "${path}" + "/recommend/canclerecommend",
			type: "POST",
			data: {
					memNo : '${memNo}',
					recommendNo : recommendNo
					},	
			success: function(data){
				$(".margin2").html("");
				$(".margin2").html(data);
			}
		}) 
	}
</script>
<!-- 추천사 작성 페이지-->
<script>
	function choochunsa(memNo, recommendNo){
		console.log("ddd");
		location.href = '${path}' + "/recommend/choochunsa?memNo=" + memNo + "&recommendNo=" + recommendNo;
	}
</script>
<!-- 추천사확인 모달 -->
<script>
	$(document).on("click", ".choochunSu", function(event){
		$(this).parent().next().css("display", "block");	
	})
	$(document).on("click", ".button2", function(event){
		$(".modal2").css("display", "none");	
	})
	$(document).on("click", ".modalBigchang2", function(event){
		$(".modal2").css("display", "none");	
	})
</script>