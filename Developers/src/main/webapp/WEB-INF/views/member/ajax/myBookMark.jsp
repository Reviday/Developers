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

    <div class="_1Gv5LM5zal-f72_XSo_qJ_">
 <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">프로필<i
                    class="icon-arrow_bottom_fill"></i></button>
                    <c:set value="${loginMember.memEmail }" var="memEmail"  />
            <ul class="">
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="" onclick="profilePage('${memEmail }')">프로필</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="myPointPage('${memEmail}')" class="">포인트</a></li>
				<li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="applicantPage('${memEmail}');" class="">제안받기 현황</a></li>	
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="likePage('${memEmail }');" class="">좋아요</a></li>
                <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#"  class="activeNav">북마크</a></li>
              
            </ul>
        </nav>
        <div class="_2oEXS1kAsO9i_0mkxCxkCA">
            <ul class="clearfix">
       
            <c:forEach items="${likeList }" var="l">
                <li>
                    <div class="_3D4OeuZHyGXN7wwibRM5BJ liked">
                    <a href="${path }/search/companyInfo.do?positionNo=${l.position_no }&memNo=${loginMember.memNo}" target="_self" class="">
                            <header
                                style="background-image: url('${path}${l.bus_images[0]}');">
                               </header>
                            <div class="body">
                                <dl>
                                    <dt> ${l.position }</dt>
                                    <dd>${l.bus_name }<br><span>${l.bus_area }</span>
                                    <span class="addressDot">.</span>
                                    <span>${l.bus_country }</span></dd>
                                </dl>
                                <div class="reward">채용보상금 1,000,000원</div>
                            </div>
                        </a></div>
             	   </li>
               </c:forEach>
              
            </ul>
        </div>
    </div>
    

