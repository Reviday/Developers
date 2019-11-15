<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" type="text/css" href="${path }/resources/css/mypage.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<body>

<div style="height: 50px;"></div> 



<div id="appl-main" class="appl-main">
    <div id="appl-main-top" class="appl-main-top">
        <div id="appl-main-top-left" class="appl-main-top-left">
            <h4 class="h-left">지원자 응답률</h4>
            <h4 class="h-right">50.0%</h4>
        </div>
        <div>
            <h4 class="h-left">평균 응답일</h4>
            <h4 class="h-right">0.0일</h4>
        </div>
    </div>
    <nav class="appl-main-nav nav">
        <ul class="nav_us">
            <li class="ls3"><a class="ei_a2 ca2">신규&nbsp;<span>( 19 )</span></a></li>
            <li class="ls3"><a class="ei_a2">서류통과&nbsp;<span>( 4 )</span></a></li>
            <li class="ls3"><a class="ei_a2">최종합격&nbsp;<span>( 0 )</span></a></li>
            <li class="ls3"><a class="ei_a2">불합격&nbsp;<span>( 0 )</span></a></li>
            <li class="ls3"><a class="ei_a2">기간만료&nbsp;<span>( 0 )</span></a></li>
        </ul>
        <div class="li_input"><input type="text" name="search_em" placeholder="지원자, 포지션 검색"><label
                for="btn_search_em"><svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" focusable="false"
                    data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 512 512" data-fa-i2svg="">
                    <path fill="currentColor"
                        d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z">
                    </path>
                </svg><!-- <i class="fas fa-search"></i> --></label><button type="button" id="btn_search_em"
                style="display: none;" onclick="fn_appl_nav(appl_index, appl_page, appl_position)"></button></div>
    </nav>
    <div class="appl-like-check"><input type="checkbox" class="" id="like_check" name="like_check"><label
            for="like_check">별표한 지원자만 보기</label></div>
    <div class="appl-applicant-list">
        <div class="appl-aList">
            <div class="aList-like-btn like_on"><svg class="svg-inline--fa fa-star fa-w-18" aria-hidden="true"
                    focusable="false" data-prefix="fas" data-icon="star" role="img" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 576 512" data-fa-i2svg="">
                    <path fill="currentColor"
                        d="M259.3 17.8L194 150.2 47.9 171.5c-26.2 3.8-36.7 36.1-17.7 54.6l105.7 103-25 145.5c-4.5 26.3 23.2 46 46.4 33.7L288 439.6l130.7 68.7c23.2 12.2 50.9-7.4 46.4-33.7l-25-145.5 105.7-103c19-18.5 8.5-50.8-17.7-54.6L382 150.2 316.7 17.8c-11.7-23.6-45.6-23.9-57.4 0z">
                    </path>
                </svg><!-- <i class="fas fa-star"></i> -->
            </div>
            <div class="aList-left">
                <div class="aList-info">
                    <div class="aList-info-no">No_23</div>
                    <div class="aList-info-name">나<svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true"
                            focusable="false" data-prefix="far" data-icon="circle" role="img"
                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                            <path fill="currentColor"
                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200z">
                            </path>
                        </svg><!-- <i class="far fa-circle"></i> --><svg class="svg-inline--fa fa-circle fa-w-16"
                            aria-hidden="true" focusable="false" data-prefix="far" data-icon="circle" role="img"
                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                            <path fill="currentColor"
                                d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200z">
                            </path>
                        </svg><!-- <i class="far fa-circle"></i> -->
                    </div>
                </div>
                <div class="aList-type"><span>매치업</span></div>
            </div>
            <div class="aList-right">
                <div class="aList-del-btn"><button type="button" class="appl-del-btn"
                        onclick="fn_del_modal(event);">삭제</button></div>
            </div><input type="hidden" class="aList-appl-no" value="23">
        </div><br>
        <br>
    
    </div>
</div>



	
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</html>