<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<link rel="stylesheet"
	href="${path }/resources/css/style_ei.css">

<style>
div.mainView{
	background-image: url("${path}/resources/images/mainView.gif");
	text-align: center;
	height:55em;
	background-repeat: no-repeat;
 	background-position: center center;
	background-size: cover;
}
div#image1{
	background-image: url("${path}/resources/images/middleView1.jpg");
	object-fit: cover;
	height:50em;
	background-repeat: no-repeat;
 	background-position: center center;
	background-size: cover;
}
div#image2{
	background-image: url("${path}/resources/images/middleView3.jpg");
	object-fit: cover;
	height:50em;
	background-repeat: no-repeat;
 	background-position: center center;
	background-size: cover;
}
div#image3{
	background-image: url("${path}/resources/images/middleView2.jpg");
	object-fit: cover;
	height:50em;
	background-repeat: no-repeat;
 	background-position: center center;
	background-size: cover;
}
h1.middleTitle{
	/* color: #FFFFFF; */
	font-size: 6em;
	margin-left:15%;
	margin-top:10%;
	font-weight: bold;
	font-display:inherit;
}
h4.middlesub{
	font-size:3em;
	color: #FFFFFF;
	margin-left:5%;
	margin-top:1%;
	padding:3em;
}

h1.mainTitle, h3.subTitle{
	color: #FFFFFF;
	font-size: xx-large;
}
h1.mainTitle{
	font-size:6em;
	font-weight: bold;
	padding:30px;
	padding-top:2em;
}
h3.subTitle{
	padding:10px;
}
button#startBtn{
	/* width:15em;
	height:6em; */
	margin-top:30px;
	font-size:20px;
	padding:15px;

}

</style>


<section id="content">
	<div class="viewAll">
		<div class="mainView">
			<h1 class="mainTitle">원하는 모두가 여기 있습니다</h1>
			<h3 class="subTitle">DEVELOPERS BLACK에서 경험해보세요</h3>
			<button id="startBtn" class="btn btn-primary">시작하기</button>
		</div>
		<div class="middleView">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div id="image1" class="carousel-item active">
					<h1 class="middleTitle" style="color:#CEE3F6;">추천 채용</h1>
					<h4 class="middlesub">채용 확정 전까지 아무런 비용 부담없이, 80만 명의 추천인들로부터 최적의 인재를 추천 받으세요</h4>
					</div>
					<div id="image2" class="carousel-item">
					<h1 class="middleTitle" style="color:#FAFAFA;">매치업</h1>
					<h4 class="middlesub">100,000+명의 엄선된 경력자들 중에 맘에 드는 후보자에게 직접 면접을 제안하세요</h4>
					</div>
					<div id="image3" class="carousel-item">
					<h1 class="middleTitle" style="color:#FAFAFA;">네트워크 광고</h1>
					<h4 class="middlesub" >한번의 신청으로 최대 500만명의 적극적, 잠재적 구직자들에게 채용정보를 알리세요</h4>
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
		<div class="bottomView">
			<h1>DEVELOPERS BLACK 을 통해 최적의 후보자를 지금 만나보세요</h1>
		</div>
	</div>
</section>
<script>

</script>

<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 