<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<link rel="stylesheet"
	href="${path }/resources/css/business-welcome-page.css">
<link rel="stylesheet"
	href="${path }/resources/css/style_ei.css">
<style>	
div.mainView{
background-image: url("${path}/resources/images/mainView.jpg");
text-align: center;
height:65em;
background-repeat: no-repeat;
background-position: center center;
background-size: cover;
}
div.firstView, div.bottomView{
background-image: url("${path}/resources/images/subView.jpg");
text-align: center;
height:35em;
background-repeat: no-repeat;
background-position: center center;
background-size: cover;
}
div#image1{
background-image: url("${path}/resources/images/middleView1.jpg");
object-fit: cover;
height:60em;
background-repeat: no-repeat;
background-position: center center;
background-size: cover;
}
div#image2{
background-image: url("${path}/resources/images/middleView3.jpg");
object-fit: cover;
height:60em;
background-repeat: no-repeat;
background-position: center center;
background-size: cover;
}
div#image3{
background-image: url("${path}/resources/images/middleView2.jpg");
object-fit: cover;
height:60em;
background-repeat: no-repeat;
background-position: center center;
background-size: cover;
}
</style>


<section id="content">
	<div class="viewAll">
		<div class="mainView" style="position:relative;">
			<p class="event blur-out-expand-fwd" style="margin-left:25%; margin-top:28%">웹 개발자</p>
			<p class="event blur-out-expand-fwd-8" style="margin-left:68%; margin-top:8%">빅데티어 엔지니어</p>
			<p class="event blur-out-expand-fwd-2" style="margin-left:15%; margin-top:5%;">임베디드 개발자</p>
			<p class="event blur-out-expand-fwd-3" style="margin-left:70%; margin-top:40%;">안드로이드 개발자</p>
			<p class="event blur-out-expand-fwd-4" style="margin-left:50%; margin-top:25%;">서버 개발자</p>
			<p class="event blur-out-expand-fwd-5" style="margin-left:8%; margin-top:23%;">그래픽 엔지니어</p>
			<p class="event blur-out-expand-fwd-6" style="margin-left:25%; margin-top:13%">파이썬 개발자</p>
			<p class="event blur-out-expand-fwd-7" style="margin-left:65%; margin-top:29%">프론트엔드 개발자</p>
			<p class="event blur-out-expand-fwd-9" style="margin-left:40%; margin-top:35%">머신러닝 엔지니어</p>
			<p class="event blur-out-expand-fwd-10" style="margin-left:5%; margin-top:35%">시스템, 네트워크 관리자</p>
			<p class="event blur-out-expand-fwd-11" style="margin-left:81%; margin-top:17%">PHP 개발자</p>
			<p class="event blur-out-expand-fwd-12" style="margin-left:58%; margin-top:16%">C,C++ 개발자</p>
			<p class="event blur-out-expand-fwd-13" style="margin-left:52%; margin-top:10%">웹 퍼블리셔</p>
			<p class="event blur-out-expand-fwd-14" style="margin-left:32%; margin-top:42%">보안 엔지니어</p>
			<h1 class="mainTitle text-flicker-out-glow">원하는 모두가 여기 있습니다</h1>
			<img class="groupImage text-focus-in-last" src="${path}/resources/images/mainView_group.png" src="Developers_Black_group"></img>
			<h3 class="subTitletop text-focus-in">바로 여기,</h3>
			<h3 class="subTitle  text-focus-in-next">DEVELOPERS BLACK 에서 경험해보세요</h3>
			<div class="forTwo"><img class="logo puff-in-center" src="${path}/resources/images/Developers_black_logo.png" src="Developers_Black_logo"></img>
			<button id="startBtn" class="btn btn-primary bounce-in-bck" onclick="toEnrollModal();">시작하기</button></div>
		</div>
		<div class="firstView" style="border:1px solid #FAFAFA; height:100%">
			<h1 style="font-size:3em; padding:5%;">최고의 효율을 누려보세요</h1>
			<div class="" style="display: inline-block;">
				<div class="developersLogo">
					<img class="" style="height:6em" src="${path}/resources/images/Developers_logo.png" src="Developers_logo"></img>
				</div>	
				<p style="float:left; font-size: 4em; margin-top:8px; margin-left:18px; margin-right:5px;">X</p>
				<div class="developersBlackLogo">;
					<img class="" style="height:5.5em" src="${path}/resources/images/Developers_black_logo.png" src="Developers_black_logo"></img>
				</div>
			</div>
			<h4 style="font-size:2em; margin-top:5%; margin-bottom:5%;">한번의 회원가입으로 교차이용이 가능합니다</h4>
		</div>
		<div class="middleView">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div id="image1" class="carousel-item active">
					<h2 class="middleTitle" style="color:#FAFAFA;background-color: rgba(0, 0, 0, 0.7); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">추천 채용</h2>
					<h4 class="middlesub" style="background-color: rgba(0, 0, 0, 0.6); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">채용 확정 전까지 아무런 비용 부담없이,<br> 80만 명의 추천인들로부터 최적의 인재를 추천 받으세요</h4>
					</div>
					<div id="image2" class="carousel-item">
					<h2 class="middleTitle" style="color:#FAFAFA; background-color: rgba(0, 0, 0, 0.7); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">매치업</h2>
					<h4 class="middlesub " style="background-color: rgba(0, 0, 0, 0.6); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">100,000+명의 엄선된 경력자들 중에 <br>맘에 드는 후보자에게 직접 면접을 제안하세요</h4>
					</div>
					<div id="image3" class="carousel-item">
					<h2 class="middleTitle" style="color:#FAFAFA; background-color: rgba(0, 0, 0, 0.7); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;">네트워크 광고</h2>
					<h4 class="middlesub"style="background-color: rgba(0, 0, 0, 0.6); text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;" >한번의 신청으로 최대 500만명의<br> 적극적, 잠재적 구직자들에게 채용정보를 알리세요</h4>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="bottomView" style="border:1px solid #FAFAFA;">
			<h1 style="font-size:3em; padding:7%;">DEVELOPERS BLACK 을 통해 최적의 후보자를 지금 만나보세요</h1>
			<div class="bottomTwo" style="display: inline-flex;">
				<img class="logo" style="background-color: black;" src="${path}/resources/images/Developers_black_logo.png" src="Developers_Black_logo"></img>
				<button id="startBtn" class="btn btn-primary" onclick="toEnrollModal();">시작하기</button>
			</div>
		</div>
	</div>
</section>
<script>
	function toEnrollModal(){
        $('#empEnrollModal').modal('show');
	}
</script>

<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 