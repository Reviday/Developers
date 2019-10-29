<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/business/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style_ei.css">
<section id="content">
	<div class="header_fe hidden-xs">
		<div class="header_nav">
			<div class="hidden-xs">
				<nav class="nav">
					<ul class="nav_us" id="ei_nav">
						<li class="ls1 ls3">
							<a class="ei_a1">지원자</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1">매치업</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1">포지션</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1">채용 광고</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1">회사정보</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1">계정 관리</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<div id="db-container" class="db-container">
		<div id="db-leftside" class="db-leftside">
			<div class="db-side-nav">
				<h5>채용중</h5>
				<hr/>
				<ul>
					<li>포지션 전체</li>
					<li>매치업</li>
				</ul>
				<h5>마감된 포지션</h5>
				<hr/>
				<ul></ul>
			</div>
		</div>
		<div id="db-main" class="db-main">
			<div id="db-main-top" class="db-main-top">
				<div id="db-main-top-left">
					<h4 class="h-left">지원자 응답률</h4>
					<h4 class="h-right">0.0%</h4>
				</div>
				<div>
					<h4 class="h-left">평균 응답일</h4>
					<h4 class="h-right">0일</h4>
				</div>
			</div>
			<nav id="db-main-nav" class="nav">
				<ul class="nav_us">
					<li class="ls3">
						<a class="ei_a2">신규</a>
					</li>
					<li class="ls3">
						<a class="ei_a2">서류통과</a>
					</li>
					<li class="ls3">
						<a class="ei_a2">최종합격</a>
					</li>
					<li class="ls3">
						<a class="ei_a2">불합격</a>
					</li>
					<li class="ls3">
						<a class="ei_a2">기간만료</a>
					</li>
					<li class="ls3 li_input">
						<input type="text" name="search_em" placeholder="지원자, 포지션 검색"/>
						<label for="btn_search_em">
							<i class="fas fa-search"></i>
						</label>
						<button type="button" id="btn_search_em" style="display: none;"></button>
					</li>
				</ul>
			</nav>
			<div id="db-like-check">
				<input type="checkbox" id="like_check" name="like_check"/><label for="like_check">별표한 지원자만 보기</label>
			</div>
			<div id="db-applicant-list">
				<c:if test="${not empty aList}">
					<c:forEach items="${aList}" var="l" varStatus="v">
						
					</c:forEach>
				</c:if>
				<c:if test="${empty aList}">
					<br/>
					<h4>포지션에 적합한 후보자가 없으신가요?</h4>
					<h4><a href="#">매치업</a> 탭에서 인재를 검색하고 직접 면접제안을 해보세요!</h4>
				</c:if>
			</div>
		</div>
	</div>
</section>
<style>
	section{
		background-color: #f8f8f8 !important;
	}
	.db-container{
		margin:20px auto;
		height: 1000px;
	}
	.db-container>div{
		position: relative;
		display: inline-block;
	}
	.db-main{
		margin: 0 10px;
	}
	.db-leftside{
		height:500px;
	}
	.db-main-top{
		width:100%;
		border:1px solid rgb(226, 224, 224);
		height:60px;
		text-align: center;
		background-color: white;
	}
	.db-main-top>div{
		width:47%;
		background-color:white ;
		position: relative;
		display: inline-block;
		/* border:1px solid black; */
		margin:20px auto;
	}
	.db-main-top>div>h4{
		margin:0 auto;
		position: relative;
		display: inline-block;
		padding:0 10px;
	}
	.h-left{
		float:left;
		
	}
	.h-right{
		float:right;
	}
	#db-main-nav>ul>li{
		padding:5px 5px
	}
	#db-main-top-left{
		border-right: 1px solid rgb(226, 224, 224);
	}

	.li_input{
		margin:5px auto;
		float: right;
	}
	.li_input>label{
		width:0;
	}
	.li_input>label>svg{
		position: relative;
		color:silver;
		left:-25px;
	}
	input[name="search_em"]{
		border:none;
		background-color: #f8f8f8;
		margin: 3px 0;
		outline: none;
	}
	input[name="search_em"]::placeholder{
		color:silver;
	}

	#db-like-check{
		width:100%;
		text-align: right;
		padding:0 10px;
		
	}
	#db-like-check>input[type="checkbox"]{
		width: 1.8rem;
    	height: 1.8rem;
		
		box-sizing: border-box;
		resize: none;
		color: rgb(51, 51, 51);
		font-size: 1.6rem;
		margin:4px auto;
		vertical-align: middle;
		box-shadow: none !important;
		border-radius: 3px;
		border-style: initial;
		border-color: initial;
		border-image: initial;
		padding: 0px;
		background-repeat: no-repeat;
		
	}
	#db-like-check>label{
		padding:3px;
		margin:5px auto;
		color:rgb(136, 136, 136);
	}
	#db-applicant-list{
		text-align: center;
	}
	@media (min-width: 1200px){
		.db-container{
			width:1024px;
		}
		.db-leftside{
			width:200px;
		}
		.db-main{
			width:790px;
		}

	}
	@media (max-width: 1199px) and (min-width: 768px){
		.db-container{
			width:85%;
		}
		.db-leftside{
			width:19%;
		}
		.db-main{
			width:75%;
		}
		
	}
	@media (max-width: 767px){
		.db-container{
			width:100%;
		}
		.db-leftside{
			width:100%;
		}
		.db-main{
			width:100%;
		}

	}

</style>
<script>
	$(window).ready(function(){
		$("#ei_nav>li>a:first").addClass('ca1');
	});
	$(function(){
		$("#ei_nav>li>a").on("click",function(){
			$($(this).parent().siblings()).children().removeClass("ca1");
			$(this).addClass('ca1');
		});
		$("#ei_nav>li>a").hover(function(){
			$(this).addClass('ca3');
		},function(){
			$(this).removeClass('ca3');
		});

		$("#db-main-nav>ul>li>a").on("click",function(){
			$($(this).parent().siblings()).children().removeClass("ca2");
			$(this).addClass('ca2');
		});
		$("#db-main-nav>ul>li>a").hover(function(){
			$(this).addClass('ca4');
		},function(){
			$(this).removeClass('ca4');
		});
		

	});

</script>
<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 