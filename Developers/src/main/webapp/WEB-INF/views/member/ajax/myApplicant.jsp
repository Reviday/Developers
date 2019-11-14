<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<div class="_1Gv5LM5zal-f72_XSo_qJ_">
    <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">제안받기 현황<span
                class="subtitle"><i class="icon-arrow_right"></i>전체</span><i
                class="icon-arrow_bottom_fill"></i></button>
        <ul class="">
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/matching" class="">프로필</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/point" class="">포인트</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/status" class="activeNav">제안받기
                    현황</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/likes" class="">좋아요</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="/profile/bookmarks" class="">북마크</a></li>
        </ul>
    </nav>
    <div class="_3Qcftta6FkVOkjFbE2NJ2v"><button class="statusInfoButton" type="button"><i
                class="icon-step_info_icon"></i></button>
        <div class="DS_fYpEMhiYB3fNFb0lCn">
            <h3>제안받기 현황</h3>
            <dl>
                <dt>나를 원하는 회사</dt>
                <dd>
                    <ul>
                        <li class="active"><a href="/profile/status?type=matchup-offers" class="">받은 제안
                        <div class="label_">1
                                </div></a></li>
                    </ul>
                </dd>
            </dl>
        </div>
        <section>
            <div class="_2BcuDguCHGaa1TAI2sJw20">
                <div class="header">
                    <ul>
                        <li>회사명</li>
                        <li>&nbsp; </li>
                        <li>상태</li>
                    </ul>
                </div>
                <ul class="content">
                <c:forEach items="${bus }" var="b" varStatus="bt">
                <a href="/profile" class="">
                        <li>
                            <h2 role="presentation">
                                <div class="thumbnail"
                                    style="background-image: url(${b.busLogo });">
                                </div>${b.busName }
                            </h2>
                            <time ></time><div class="type resumeRequest">수락 / 거절</div>
                        </li>
                    </a>
                 </c:forEach>  
                  </ul>
                   
            </div>
        </section>
    </div>
</div>

</body>
</html>