<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/companyAllInfo.css">
	
    <section id="conmanyInfo">
        <div class="companyHeader">
            <div class="comheader">
                <img src="${company.bus_logo }" alt="Company Logo">
                <h2><c:out value="${company.bus_name }"/></h2>
            </div>
        </div>
        <div class="commanyBody">
            <div class="companyTag">
                <h3>태그</h3>
                <ul>
                	<c:if test="${not empty tagList }">
                    	<c:forEach var="t" items="${tagList }">
                    		<li><a href="">#<c:out value="${t }"/></a></li>
                    	</c:forEach>
                    </c:if>
                    <li>
                        <button type="button" class="tagModalOpen">+ 태그 의견보내기</button>
                    </li>
                </ul>
                <div class="item-gradient end"></div>

                <!-- 태그모달창 -->
                <div class="tagModal">
                    <div class="tagModal-body">
                        <div class="tagmodal-header">
                                                              태그 의견
                            <button type="button" class="tagmodal-close">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        <div id="MODAL_BODY" class="modaltag_body">
                            <div class="tag-body">
                                <p class="tag-body-title">
                                                                               해당 회사의 다양한 태그 의견을 받습니다
                                    <br>
                                                                               보내주신 태그는 developers에서 검토 후 반영됩니다
                                </p>
                                <div class="tagInput">
                                    <div class="tagInput-div">
                                        <input type="text" name="newTag" id="newTag" placeholder="태그를 이곳에 입력해주세요.">
                                        <button type="button" onclick="newTag();">추가</button>
                                    </div>
                                </div>
                                <div class="newTagDiv"></div>
                                <button type="button" class="tagSubmit tagSubmit1" disabled style="cursor: default;">의견 보내기</button>
                            </div>
                        </div>
                    </div>
                    <div role="presentation" class="chang11 chang22"></div>
                </div>
            </div>
            <div class="companyInfoBody">
                <div class="company-position">
                    <h3>채용 중인 포지션</h3>
                    <c:if test="${empty psList }">
	                    <button class="notPosition" type="button">
	                    	등록된 포지션이 없습니다
	                    </button>
                    </c:if>
                    <c:if test="${not empty psList }">
	                    <div class="positionList">
		                    <c:if test="${not empty loginMember }">
		                    	<c:forEach var="p" items="${psList }">
			                        <a href="${path }/search/companyInfo.do?positionNo=${p.position_no }&memNo=${loginMember.memNo}" class="positionInfo">
			                            <h4>${p.position }</h4>
			                            <h5>채용보상금 1,000,000원</h5>
			                            <c:if test="${p.dead_date == 'Thu Dec 31 00:00:00 KST 2099'}">
			                            	<p>상시</p>
			                            </c:if>
			                            <c:if test="${p.dead_date != 'Thu Dec 31 00:00:00 KST 2099'}">
			                            	<p><fmt:formatDate value="${p.dead_date}" pattern="yyyy년MM월dd일"/></p>
			                            </c:if>
			                            <button type="button">
			                                <c:out value="${p.like_count }"></c:out>
			                                <i class="far fa-heart"></i>
			                            </button>
			                        </a>
		                        </c:forEach>
	                        </c:if>
	                        <c:if test="${empty loginMember }">
		                    	<c:forEach var="p" items="${psList }">
			                        <a href="${path }/search/companyInfo1.do?positionNo=${p.position_no }" class="positionInfo">
			                            <h4>${p.position }</h4>
			                            <h5>채용보상금 1,000,000원</h5>
			                            <c:if test="${p.dead_date == 'Thu Dec 31 00:00:00 KST 2099'}">
			                            	<p>상시</p>
			                            </c:if>
			                            <c:if test="${p.dead_date != 'Thu Dec 31 00:00:00 KST 2099'}">
			                            	<p><fmt:formatDate value="${p.dead_date}" pattern="yyyy년MM월dd일"/></p>
			                            </c:if>
			                            <button type="button">
			                                <c:out value="${p.like_count }"></c:out>
			                                <i class="far fa-heart"></i>
			                            </button>
			                        </a>
		                        </c:forEach>
	                        </c:if>
	                    </div>
                    </c:if>
                </div>
                <div class="companyContent">
                    <h3>회사 소개</h3>
                    <div class="companyFicture">
                    	<c:if test="${not empty company.bus_images }">
	                    	<c:forEach var="f" items="${company.bus_images }" varStatus="vs">
		                        <c:if test="${vs < 4 }">
			                        <button class="fictureBtn">
			                            <img src="${f }"
			                                alt="">
			                        </button>
		                        </c:if>
	                        </c:forEach>
                        </c:if>
                        <p class="companyTextInfo companyTextInfo1">
                           <c:out value="${company.bus_introduce }"></c:out>
                        </p>
                        <!-- 회사사진모달창 -->
                        <div class="modalChang">
                            <div class="modalbig">
                                <div class="modalbody">
                                    <ul class="fictureUl">
                                    	<c:forEach var="f" items="${company.bus_images }" varStatus="vs">
	                                        <c:if test="${vs < 4 }">
	                                        <li><img src="${f }" alt="" class="modalficture"></li>
	                                        </c:if>
                                        </c:forEach>
                                    </ul>
                                    <button type="button" class="closebtn">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <button type="button" class="leftbtn">
                                        <div class="leftbtn-div">
                                            <i class="fas fa-chevron-left"></i>
                                        </div>
                                    </button>
                                    <button type="button" class="rightbtn">
                                        <div class="rightbtn-div">
                                            <i class="fas fa-chevron-right"></i>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div role="presentation" class="chang1 chang2"></div>
                        </div>
                    </div>
                    <p class="companyText"></p>
                </div>
                <div class="companyIncome">
                    <div>
                        <div class="pungIncome">
                            <h3>평균 연봉</h3>
                            <h4 class="gook">출처 : 국민연금</h4>
                            <c:if test="${not empty company.new_income }">
	                            <div class="incomeHeader">
	                                <div class="incomeNew">
	                                    <h4 class="incomeNew-header">신규 입사자</h4>
	                                    <div class="newPrice"><c:out value="${company.new_income }"></c:out> 만원</div>
	                                </div>
	                                <div class="incomeAll">
	                                    <h4 class="incomeAll-header">전체</h4>
	                                    <div class="allPrice"><c:out value="${company.all_income }"></c:out> 만원</div>
	                                </div>
	                            </div>
                            </c:if>
                            <c:if test="${empty company.new_income }">
                            	<div class="companyCount">
                                <h4 class="companyCount-header">기업이 데이터 제공을 원하지 않습니다.</h4>
                            	</div>
                            </c:if>
                        </div>
                        <div></div>
                    </div>
                </div>
                <div class="companyIncome">
                    <div>
                        <div class="pungIncome">
                            <h3>직원수</h3>
                            <div class="companyCount">
                            	<c:if test="${not empty company.new_income }">
	                                <h4 class="companyCount-header">전체 인원</h4>
	                                <div class="companyCount-body"><c:out value="${company.bus_total_emp }"/></div>
	                            </c:if>
	                            <c:if test="${empty company.new_income }">
	                            	<h4 class="companyCount-header">기업이 데이터 제공을 원하지 않습니다.</h4>
	                            </c:if>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 

<!-- 회사사진슬라이드 -->
    <script>
        $(function () {
            $(".fictureBtn").click(function () {
                $(".modalChang").css("display", "block");
            });

            $(".closebtn").on("click", function () {
                $(".modalChang").css("display", "none");
            });
            $(".chang1").on("click", function () {
                $(".modalChang").css("display", "none");
            });
        })

        var sliderWrapper = document.getElementsByClassName("modalbody"),
            sliderContainer = document.getElementsByClassName("fictureUl"),
            slides = document.getElementsByClassName("modalficture"),
            slideCount = slides.length,
            currentIndex = 0,
            topHeight = 0,
            navPrev = document.getElementsByClassName("leftbtn"),
            navNext = document.getElementsByClassName("rightbtn");

        function calculateTallestSlide() {
            for (var i = 0; i < slideCount; i++) {
                if (slides[i].offsetHeight > topHeight) {
                    topHeight = slides[i].offsetHeight;
                }
            }
            sliderWrapper[0].style.height = topHeight + 'px';
            sliderContainer[0].style.height = topHeight + 'px';
        }
        calculateTallestSlide();

        for (var i = 0; i < slideCount; i++) {
            slides[i].style.left = i * 100 + '%';
        }

        function goToSlide(idx) {
            sliderContainer[0].style.left = idx * -100 + '%';
            currentIndex = idx;
            // updateNav();
        }

        $(navPrev).click(function (e) {
            e.preventDefault();
            if (currentIndex > 0) {
                goToSlide(currentIndex - 1);
            } else {
                goToSlide(slideCount - 1);
            }
        });

        $(navNext).click(function (e) {
            e.preventDefault();
            if (currentIndex < slideCount - 1) {
                goToSlide(currentIndex + 1);
            } else {
                goToSlide(0);
            }
        });

        function updateNav() {
            if (currentIndex == 0) {
                $(navPrev).addClass('disabled');
            } else {
                $(navPrev).removeClass('disabled');
            }
            if (currentIndex == slideCount - 1) {
                $(navNext).addClass('disabled');
            } else {
                $(navNext).removeClass('disabled');
            }
        }
        goToSlide(0);
    </script>
    <!-- 태그모달창 -->
    <script>
        $(function () {
            $(".tagModalOpen").click(function () {
                $(".tagModal").css("display", "block");
            });

            $(".tagmodal-close").on("click", function () {
                $(".tagModal").css("display", "none");
            });
            $(".chang11").on("click", function () {
                $(".tagModal").css("display", "none");
            });
        })
    </script>
    <!-- 태그의견보내기 스크립트 -->
    <script>
    	$(document).on('click', '.tagclose', function(){
    		$(this).parent('div.newTagContent').remove();    
	    	if($('.newTagContent').length == 0){
	    		$('.tagSubmit').addClass("tagSubmit1");
				$('.tagSubmit').prop("disabled", true);
				$('.tagSubmit').css("cursor", "default");
	    	}
    	})
    	function newTag(){
    		if($("#newTag").val().length > 0){
    			$.ajax({
    				url: path + "/search/newTagButton",
    				type: "POST",
    				data: {newTag : $("#newTag").val()},	
    				success: function(data){
    					$("#newTag").val("");
    					$(".newTagDiv").css("display", "block");
    					var s = $(".newTagDiv").html();
    					s += data;
    					$(".newTagDiv").html(s);
    					$('.tagSubmit').removeClass("tagSubmit1");
    					$('.tagSubmit').removeAttr("disabled");
    					$('.tagSubmit').css("cursor", "pointer");
    				}
    			}) 
    		}
    	}
    	$(".tagSubmit").click(function(){
    		var tagArr = new Array();
    		var tag = document.getElementsByClassName("newTagContent");
    		for(var i = 0; i < tag.length; i++) {
    			tagArr[i] = tag[i].innerText;
    		}
    		var busNo = '${company.bus_no}';
    		$.ajax({
				url: path + "/search/newTagSubmit",
				type: "POST",
				traditional: true,
				data: {
						tagArr : tagArr,
						busNo : busNo		
				},	
				success: function(data){
					$(".tagModal").css("display", "none");
					alert(data);
				}
			}) 
    	})
    </script>