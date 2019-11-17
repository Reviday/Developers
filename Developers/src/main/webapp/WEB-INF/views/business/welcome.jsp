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

.modal>*{
	 font-size:15px;
	 
	}
	.navbar-brand-small{
		color: #0080FF;
	}
	.btn-primary{
		font-size: 17px;
	}
	input.form-control::placeholder, input.form-control{
		font-size:15px;
		margin-bottom:10px;
		height:2.8em;
	}
	.modal-body{
		padding:1.2em;
	}
	/* .modal-content{
		background-image: url("${path}/resources/images/forModal2.jpeg");
		background-size:cover;
	} */
	/* .modal-content {
  content: "";
  position: fixed; 
  left: 0;
  right: 0;
  z-index: -1;

  display: block;
  background-image: url("${path}/resources/images/forModal2.jpeg");
  background-size:cover;
  width: 100%;
  height: 100%;

  -webkit-filter: blur(5px);
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
} */

.modal-content{
 background-color: #F2F2F2;
 opacity: 0.95;
}
.modal-content>*{
	
}
#exampleModalLabel{
	font-size:16px;
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

			<!-- 회원가입 모달 창 -->
			<div class="modal fade" id="empEnrollModal" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" style="height:25em; overflow: scroll;">
				  <div class="modal-header" style="background-color: #1C1C1C;">
					<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
					<h5 class="modal-title" style="color: #ffffff; margin: auto auto;" id="exampleModalLabel">Recruiting Developers</h5>
					<button type="button" style="color:#ffffff; padding-top: 15px;" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">X</span>
					</button>
				  </div>
				  <!-- <form id="registerForm" action="${pageContext.request.contextPath}/business/register" onsubmit="return registerValidate()" method="post"> -->
				  <div class="modal-body">
						<input type="text" id="regname" class="form-control must" name="memName" placeholder="담당자 성함" required>
						<!-- <br />
						<input type="text" class="form-control" placeholder="직책(부서)"> -->
						
						<input type="text" id="phone" class="form-control must" name="memPhone" placeholder="연락처 (-)없이" required>
						<hr>
						<input type="text" id='reg-email' class="form-control must" name="memEmail" placeholder="회사 이메일(로그인 아이디로 사용)" required>
						
						<input type="password" id="pswd" class="form-control must" name="memPassword" placeholder="특수문자 /문자 /숫자 포함 형태의 8~15자리 이내의 암호로 설정해주세요." required>
						
						<input type="password" id="pswd2" class="form-control must remov" placeholder="암호를 확인하세요." style="border-color: #E6E6E6; color: #A4A4A4; background-color: #FFFFFF;" disabled required>
					</div>
				<!-- </form> -->
					<div class="modal-footer">
						<div id="warning-area" style="display:inline-block; margin-right:22%;"></div>
						<div><button type="submit" id="registerBtn" class="btn btn-primary" style="height:3em; width:8em; margin-right:0.5em;" >계정 생성</button></div>
					</div>
				 <div>
					  <p style="margin-left:3%">회원가입시 개인정보 <a class="navbar-brand-small" href="#">취급방침</a>을 읽었으며, <br> <a class="navbar-brand-small" href="#">이용약관</a>에 동의하신 것으로 간주합니다.</p>
				 </div>
					 <div>
						 <hr>
						  <p style="margin-left:3%; margin-bottom:9px;">이미 가입되어 있으신가요?&nbsp;&nbsp;<a class="navbar-brand-small" href="#" onclick="changeModal('toLogin'); return false">로그인하기</a></p>
					  </div>
				</div>
			  </div>
			</div>
			
			
			<!-- 로그인 창  -->
				<div class="modal fade" id="empLoginModal" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content bgBlur">
				  <div class="modal-header" style="background-color: #1C1C1C;" >
					<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
					<h5 class="modal-title" style="color: #ffffff; margin: auto auto;"  id="exampleModalLabel">Recruiting Developers</h5>
					<button type="button" class="close" style="color:#ffffff; padding-top: 15px;" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">X</span>
					</button>
				  </div>
				  <form id="login" action="${pageContext.request.contextPath}/business/login" onsubmit="return loginValidate()" method="post">
				  <div class="modal-body">
					<input type="text" class="form-control login-email" name="memEmail" placeholder="회사 이메일(로그인 아이디로 사용)" required>
					
					<input type="password" id="login-password" class="form-control login-password" name="memPassword" placeholder="비밀번호" required>
					
					<div style="text-align: center;">
						<button type="submit" id="loginBtn" class="btn btn-primary" 
						style="border-color: #FAFAFA; color:#FAFAFA; background-color: #E6E6E6; height:3em; width:6em; margin-bottom:6px;" disabled>로그인</button>
					</div>	
					</form>
						<div style="text-align: center;">
							<p><a class="navbar-brand-small" href="#">비밀번호 초기화/변경</a><P>
						</div>
						<!-- <div>
							<button class="btn btn-outline-success" > 페이스북으로 시작하기</button>
						</div> -->
						<div class="access-denied" style="text-align: center;">
							<p id="warning" style="display: none; color:#E53935">이메일 혹은 비밀번호가 틀렸습니다</p>
						</div>
				  </div>
					 <div class="modal-footer">
						  <p>계정이 없으신가요?&nbsp&nbsp<a class="navbar-brand-small" href="#" onclick="changeModal('toReg'); return false">채용담당자 계정 만들기</a></p>
					  </div>
				</div>
			  </div>
			</div>
		
		
			<!-- 이메일 인증 창 -->
			<div class="modal fade" id="emailConfirmModal" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
				  <div class="modal-header" style="background-color: #151515;" >
					<img src="${path }/resources/images/Developers_black_logo.png" style="height:30px; margin-left:10px;"/>
					<h5 class="modal-title" style="color: #ffffff; margin: auto auto;"  id="exampleModalLabel">Recruiting Developers</h5>
					<button type="button" class="close" style="color:#ffffff; padding-top: 15px;" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">X</span>
					</button>
				  </div>
				  <!-- <form id="loginEnd" action="${pageContext.request.contextPath}/business/login" onsubmit="return loginValidate()" method="post"> -->
				  <div class="modal-body">
					<div>
						<!-- 여기에 이메일 출력해주기. -->
						<h4>입력하신 정보로 인증 이메일을 성공적으로 보냈습니다.<br> 이메일을 확인하여 주시기 바랍니다.<h4>
					</div> 
					<!-- <input type="text" class="form-control confirmation" name="confirmationNo" placeholder="인증번호 입력" required> -->
					
					<!-- <button type="submit" id="confirm" class="btn btn-primary" style="height:3em; width:8em; margin-top:8px; float:right;">인증번호 확인</button> -->
					<!-- </form> -->
						<div style="padding:1em; text-align: center;">
							<p><a class="navbar-brand-small" href="#" onclick="resendEmail(); return false">인증번호 재발송</a><P>
						</div>
						<!-- <div class="access-denied">
							<p id="warning" style="display: none; color:#E53935">인증번호가 맞지 않습니다.</p>
						</div> -->
				  </div>
				</div>
			  </div>
			</div>
			
</section>
<script>
	function toEnrollModal(){
        $('#empEnrollModal').modal('show');
	}
	$(function(){
		if(["${confirmed}"][0]!=""){
			$("#emailConfirmModal").modal('show');
		}
	});
</script>
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/business-main.js"></script>	

<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 