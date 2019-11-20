<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
	.footer_nav{
		font-size:13px;
	}
	.developers_int{
		font-size:13px;
	}
</style>

	<footer class="footer" style="background-color:#2E2E2E; color:#FFFFFF;text-align: center;">
		<div class="footer_nav" style="padding-top:2em;" >
			<div class="footer_nav_items" style="margin-bottom: 1em;">
				<div class="footer_developers_icon">
					<img src="${path }/resources/images/Developers_black_logo.png" style="height:32px"/>
				</div>
				<div class="footer_nav_item" style="padding:1.5em;">
					<a href="#" class="" style="color:#2E64FE;">&nbsp서비스 소개&nbsp</a>
					<a href="#" class="" style="color:#2E64FE;">&nbsp이용약관 및 정책&nbsp&nbsp</a>
					<a href="#" class="" style="color:#2E64FE;">&nbsp자주 묻는 질문&nbsp</a>
				</div>
			</div>
			<!-- <div class="footer_language">
				<img class="countryIcon" src="https://s3.ap-northeast-2.amazonaws.com/wanted-public/ico_KR.svg" alt="country flag KR">
				<select>
					<option value="WW" disabled="" hidden="">Select Country</option>
					<option value="KR">한국 (한국어)</option>
				</select>
				<div class="img_ico"></div>
			</div> -->
		</div>
		<div class="footer_int" style="padding-bottom:3.5em;">
			<p class="developers_int">(주)Developers (대표이사:윤성규, 김우정, 윤성윤, 기영성, 이정섭, 강병민) | 서울특별시 강남구 테헤란로 22 | 개인정보보호관리자 : 유병승 | 통신판매번호 : 2016-서울강남-00207<br>
			유료직업소개사업등록번호 : (국내) 제2016-3220163-14-5-00001호 | (국외) F1201020170005 | 사업자등록번호 : 322-26-05011<br>
			서비스 및 기업문의 02-888-8888<br>
			© Developers, Inc.</p>
		</div>
	</footer>
</body>
<!-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/main.js"></script> -->
</html>