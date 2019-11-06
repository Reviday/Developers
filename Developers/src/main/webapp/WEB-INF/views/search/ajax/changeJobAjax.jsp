<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
		<div class="search-header">
            <div class="search-header-mid">
                <ul class="mid-menuBar">
                    <li>
                        <a href="${path }/search/mainSearch.do" style="color:gray;">전체</a>
                        <i class="fas fa-chevron-right" style="margin-left: 10px;color:gray;"></i>
                    </li>
                    <li><c:out value="${jobName }"/></li>
                </ul>
                <div class="mid-content">
                    <button class="mid-type prev hidden">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <button class="mid-type next">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                    <div class="mid-type-content">
                        <ul class="contentList">
                        	<c:forEach var="j" items="${list }">
	                            <li class="type-content-li">
	                                <a href="javascript:void(0);" onclick="changeJobAjax('${j.job_name}');">
	                                    <div class="content-li-text">
	                                        <span><c:out value="${j.job_name }"/></span>
	                                    </div>
	                                </a>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="search-main">
            <div class="search-main-mid">
                <div class="main-mid-menu">
                    <div class="menu-mid">
                        <div class="menu-mid-1 hidden-xs">
                        	<c:if test="${empty loginMember }">
	                            <button class="menu-mid-menu1 suBtn">
	                                <span class="fontweight fontcolor">최신순</span>
	                            </button>
	                            <button class="menu-mid-menu1 suBtn">
	                                <span class="native">국가</span>
	                                <span class="fontweight fontcolor">한국</span>
	                            </button>
	                            <button class="menu-mid-menu1 suBtn">
	                                <span class="native">지역</span>
	                                <span class="fontweight fontcolor1">전국</span>
	                            </button>
	                            <button class="menu-mid-menu1 suBtn">
	                                <span class="native">경력</span>
	                                <span class="fontweight fontcolor1">전체</span>
	                            </button>
                            </c:if>
                            <c:if test="${not empty loginMember }">
                            	<button class="menu-mid-menu">
	                                <span class="fontweight fontcolor">최신순</span>
	                            </button>
	                            <button class="menu-mid-menu">
	                                <span class="native">국가</span>
	                                <span class="fontweight fontcolor">한국</span>
	                            </button>
	                            <button class="menu-mid-menu">
	                                <span class="native">지역</span>
	                                <span class="fontweight fontcolor1">전국</span>
	                            </button>
	                            <button class="menu-mid-menu">
	                                <span class="native">경력</span>
	                                <span class="fontweight fontcolor1">전체</span>
	                            </button>
                            </c:if>
                        </div>
                        <div class="menu-mid-1 visible-xs">
                            적용 중 필터
                            <p>2</p>
                        </div>
                        <div class="filter">
                        	<c:if test="${not empty loginMember }">
	                            <button class="filter-btn">
	                                <span class="filter-btn-1">
	                                    <i class="fas fa-sliders-h"></i>
	                                </span>
	                                <span class="filter-btn-2">
	                                    <span style="color: rgb(37, 139, 247);">필터</span>
	                                </span>
	                            </button>
                            </c:if>
                            <c:if test="${empty loginMember }">
	                            <button class="filter-btn1 suBtn">
	                                <span class="filter-btn-1">
	                                    <i class="fas fa-sliders-h"></i>
	                                </span>
	                                <span class="filter-btn-2">
	                                    <span style="color: rgb(37, 139, 247);">필터</span>
	                                </span>
	                            </button>
                            </c:if>
                        </div>
                    </div>
                </div>
                
                
                <div id="modalTool">
                    <div class="modalchang">
                        <div class="modalchang-1">
                            <div class="modalHeader">
                                <button type="button" class="modalHeader-btn">
                                    <i class="fas fa-redo-alt"></i>
                                    초기화
                                </button>
                                <span>필터</span>
                                <button type="button" id="chobtn">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div class="modalBody">
                                <div id="MODAL_BODY" class="modalBody-body">
                                    <div class="modaljung">
                                        <h6 class="jungHea">정렬</h6>
                                        <div class="jungbody">
                                            <select name="order" id="">
                                                <option value="time" class="time">최신순</option>
                                                <option value="money">보상금순</option>
                                                <option value="like">인기순</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modalnara">
                                        <h6 class="narahea">국가</h6>
                                        <div class="narabody">
                                            <button type="button" class="naraBtn">전세계</button>
                                            <button type="button" class="naraBtn">대만</button>
                                            <button type="button" class="naraBtn">싱가폴</button>
                                            <button type="button" class="naraBtn">일본</button>
                                            <button type="button" class="naraBtn ko narabody-btn">한국</button>
                                            <button type="button" class="naraBtn">홍콩</button>
                                            <button type="button" class="naraBtn">기타</button>
                                        </div>
                                    </div>
                                    <div class="modaljiuk">
                                        <h6 class="jiukhea">지역</h6>
                                        <div class="jiukbody">
                                            <button type="button" class="jiukBtn junguk jiuk-btn">전국</button>
                                            <button type="button" class="jiukBtn">서울</button>
                                            <button type="button" class="jiukBtn">부산</button>
                                            <button type="button" class="jiukBtn">대구</button>
                                            <button type="button" class="jiukBtn">인천</button>
                                            <button type="button" class="jiukBtn">광주</button>
                                            <button type="button" class="jiukBtn">대전</button>
                                            <button type="button" class="jiukBtn">울산</button>
                                            <button type="button" class="jiukBtn">세종</button>
                                            <button type="button" class="jiukBtn">경기</button>
                                            <button type="button" class="jiukBtn">강원</button>
                                            <button type="button" class="jiukBtn">충북</button>
                                            <button type="button" class="jiukBtn">충남</button>
                                            <button type="button" class="jiukBtn">전북</button>
                                            <button type="button" class="jiukBtn">전남</button>
                                            <button type="button" class="jiukBtn">경북</button>
                                            <button type="button" class="jiukBtn">경남</button>
                                            <button type="button" class="jiukBtn">제주</button>
                                        </div>
                                    </div>
                                    <div class="modalgung">
                                        <h6 class="gunghae">경력</h6>
                                        <div class="gungbody">
                                            <select name="cureer" id="">
                                                <option value="all" class="all">전체</option>
                                                <option value="new">신입</option>
                                                <option value="one">1년</option>
                                                <option value="two">2년</option>
                                                <option value="three">3년</option>
                                                <option value="four">4년</option>
                                                <option value="five">5년</option>
                                                <option value="six">6년</option>
                                                <option value="seven">7년</option>
                                                <option value="eight">8년</option>
                                                <option value="nine">9년</option>
                                                <option value="tenup">10년 이상</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modalfilter">
                                        <input type="checkbox" name="filtersave" id="">
                                        적용된 필터를 저장하고 유지합니다.
                                    </div>
                                </div>
                            </div>
                            <div class="modalsubmit">
                                <button type="submit">적용</button>
                            </div>
                        </div>
                    </div>
                    <div role="presentation" class="modalBig"></div>
                </div>
                
                
                <h3 class="firstCompany">적극 채용 중인 회사</h3>
                <div class="firstCompany-list">
                    <ul>
                    	<c:if test="${not empty firstPsList }">
                    		<c:forEach var="f" items="${firstPsList }">
                        		<a href="${path }/search/companyAllInfo?busNo=${f.bus_no}">
                            		<li>
                                		<div class="searchHeader">
                                			
                                    		<div class="companyBg" style="background-image: url(${f.bus_images[0]})"></div>
                                		</div>
		                                <footer>
		                                    <div class="logoCircle" style="background-image: url(${f.bus_logo})"></div>
		                                    <h4><c:out value="${f.bus_name }"/></h4>
		                                    <h5><c:out value="${f.po_count }"/>개 포지션</h5>
		                                </footer>
                            		</li>
                        		</a>
                        	</c:forEach>
                        </c:if>
                    </ul>
                </div>
                <ul class="clearfix">
                	<c:if test="${not empty psList }">
	                	<c:forEach var="p" items="${psList }">
		                    <li>
		                        <div class="company-list">
		                        	<c:if test="${not empty loginMember }">
		                            <a href="${path }/search/companyInfo.do?positionNo=${p.position_no }&memNo=${loginMember.memNo}">
		                            </c:if>
		                            <c:if test="${empty loginMember }">
		                            <a href="${path }/search/companyInfo1.do?positionNo=${p.position_no }">
		                            </c:if>
		                                <div class="buttonHeader" style="background-image: url(${p.bus_images[0]})">
		                                    <button class="likeButton">
		                                        <i class="fas fa-heart"></i>
		                                        <c:out value="${p.like_count }"/>
		                                    </button>
		                                </div>
		                                <div class="body">
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
		                        </div>
		                    </li>
	                    </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
<!-- 슬라이드용 스크립트 -->
<script>
    var sliderWrapper = document.getElementsByClassName("mid-type-content"),
        sliderContainer = document.getElementsByClassName("contentList"),
        slides = document.getElementsByClassName("type-content-li"),
        slideCount = slides.length,
        currentIndex = 0,
        topHeight = 0,
        navPrev = document.getElementsByClassName("mid-type prev"),
        navNext = document.getElementsByClassName("mid-type next");
    var slideLength = slideCount * 130;
    var slideLastCount = parseInt(slideLength / 530); 
    function calculateTallestSlide(){
        for(var i = 0; i < slideCount; i++){
            if(slides[i].offsetHeight > topHeight){
                topHeight = slides[i].offsetHeight;
            }
        }
        sliderWrapper[0].style.height = topHeight + 'px';
        sliderContainer[0].style.height = topHeight + 'px';
    }
    calculateTallestSlide();

    for(var i = 0; i < slideCount; i++){
        slides[i].style.left = i * 130 + 'px';
    }

    function goToSlide(idx) {
        sliderContainer[0].style.left = idx * -530 + 'px';
        currentIndex = idx;
        updateNav();
    }

    $(navPrev).click(function(e){
        e.preventDefault();
        goToSlide(currentIndex - 1);
    });

    $(navNext).click(function(e){
        e.preventDefault();
        goToSlide(currentIndex + 1);
    });

    function updateNav(){
        if(currentIndex == 0){
            $(navPrev).addClass('hidden');
        }else{
            $(navPrev).removeClass('hidden');
        }
        if(currentIndex == slideLastCount - 1){
            $(navNext).addClass('hidden');
        }else{
            $(navNext).removeClass('hidden');
        }
    }
    goToSlide(0);
</script>
<!-- 화면전환용 Ajax 스크립트 -->
<script>
	function changeJobAjax(jobName) {
		$.ajax({
			url: path + "/search/changeJobAjax",
			type: "POST",
			data: {jobName : jobName},	
			success: function(data){
				$("#search-main").html("");
				$("#search-main").html(data);
			}
		})
	}
</script>
<!-- 모달창 스크립트 -->
<script>

	var modal = document.getElementById('modalTool');                                         
	$("#chobtn").click(function() {
	    $("#modalTool").css("display","none");
	}); 
	$(".modalBig").on("click",function() {
	    $("#modalTool").css("display","none");
	});
	$(".menu-mid-menu").click(function(){
		$("#modalTool").css("display","block");
	})
	$(".filter-btn").click(function(){
		$("#modalTool").css("display","block");
	})
	$(".naraBtn").click(function(e) {
		var classVal = e.target.className;
		$(".naraBtn").next().removeClass('narabody-btn');
		$(".naraBtn").prev().removeClass('narabody-btn');
		$(this).addClass('narabody-btn');
		if($(this).text() != "한국") {
			$(".modaljiuk").css("display", "none");
		}else{
			$(".modaljiuk").css("display", "block");
		}
	})
	$(".jiukBtn").click(function(e) {
		var classVal = e.target.className;
		$(".jiukBtn").next().removeClass('jiuk-btn');
		$(".jiukBtn").prev().removeClass('jiuk-btn');
		$(this).addClass('jiuk-btn');
	})
	$(".modalHeader-btn").click(function(){
		$(".time").prop("selected", true);
		$(".all").prop("selected", true);
		$(".naraBtn").next().removeClass('narabody-btn');
		$(".naraBtn").prev().removeClass('narabody-btn');
		$(".ko").addClass("narabody-btn");
		$(".jiukBtn").next().removeClass('jiuk-btn');
		$(".jiukBtn").prev().removeClass('jiuk-btn');
		$(".junguk").addClass('jiuk-btn');
		$(".modaljiuk").css("display", "block");
	})

</script>