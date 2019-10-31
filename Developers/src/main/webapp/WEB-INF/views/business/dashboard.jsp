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
					<ul class="ei_nav nav_us">
						<li class="ls1 ls3" >
							<a class="ei_a1" data="applications">지원자</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" data="machup">매치업</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" data="position">포지션</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" data="ad">채용 광고</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" data="busInfo">회사정보</a>
						</li>
						<li class="ls1 ls3">
							<a class="ei_a1" data="settings">계정 관리</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<div id="db-container" class="db-container">
		<div id="db-leftside" class="db-leftside">
			<h5>
				채용중
				<i class="fas fa-angle-up"></i>
			</h5>
			<hr/>
			<ul class="apply-ing">
				<li><span class="aList-type">포지션 전체</span> <span class="aList-count">11</span></li>
				<li><span class="aList-type">매치업</span> <span class="aList-count">11</span></li>
			</ul>
			<br/>
			<h5>
				마감된 포지션
				<i class="fas fa-angle-up"></i>
			</h5>
			<hr/>
			<ul></ul>
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
			<nav class="db-main-nav nav">
				<ul class="nav_us">
					<li class="ls3">
						<a class="ei_a2">신규&nbsp;<span>( 11 )</span></a>
					</li>
					<li class="ls3">
						<a class="ei_a2">서류통과&nbsp;<span>( 11 )</span></a>
					</li>
					<li class="ls3">
						<a class="ei_a2">최종합격&nbsp;<span>( 11 )</span></a>
					</li>
					<li class="ls3">
						<a class="ei_a2">불합격&nbsp;<span>( 11 )</span></a>
					</li>
					<li class="ls3">
						<a class="ei_a2">기간만료&nbsp;<span>( 11 )</span></a>
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
			<div class="db-like-check">
				<input type="checkbox" class="" id="like_check" name="like_check"/><label for="like_check">별표한 지원자만 보기</label>
			</div>
			<div class="db-applicant-list">
				<c:if test="${empty aList}">
					<!-- <c:forEach items="${aList}" var="l" varStatus="v">
						
					</c:forEach> -->
					<div class="db-aList">
						<div class="aList-left">
							<div class="aList-like-btn"><i class="fas fa-star"></i></div>
							<div class="aList-info">
								<div class="aList-info-no">No_1</div>
								<div class="aList-info-name">송<i class="far fa-circle"></i><i class="far fa-circle"></i></div>
							</div>
							<div class="aList-type">
								<span>매치업</span>
							</div>
						</div>
						<div class="aList-right">
							<div class="aList-del-btn">
								<button type="button" class="del-btn" onclick="fn_aList_del()">삭제</button>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty aList}">
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
		display: inline-grid;
	}
	.db-main{
		margin: 0 10px;
	}
	.db-leftside{
		top:-40px;
		padding:0 13px;
	}
	.db-leftside>h5{
		font-size: 1.4rem;
	}
	.db-leftside>ul>li{
		font-size: 1.5rem;
		padding: 3px 0;
		cursor: pointer;
	}
	.db-leftside>hr{
		width:100%;
		color:silver;
	}
	.db-leftside>h5>svg{
		display: none;
		float:right;
	}
	.aList-count{
		background-color:rgb(233, 233, 233);
		border-radius: 3px;
		border:1px solid darkgray;
		padding:0px 2px;
		font-size: 1.3rem;
		float:right;
	}
	.aList-click>.aList-type{
		color:coral;
		font-weight: 900;
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
	.db-main-nav>ul>li{
		padding:5px 0px
	}
	.db-main-top-left{
		border-right: 1px solid rgb(226, 224, 224);
	}
	.db-main-nav>ul{
		width:100%;
	}
	.li_input{
		margin:7px auto;
		float: right;
		
	}
	.li_input>label>svg{
		position: relative;
		color:silver;
		font-size: 1.2rem;
	}
	input[name="search_em"]{
		border:none;
		background-color: #f8f8f8;
		margin: 3px 0;
		outline: none;
		font-size: 1.4rem;
	}
	input[name="search_em"]::placeholder{
		color:silver;
		font-size: 1.4rem;
	}

	.db-like-check{
		width:100%;
		text-align: right;
		padding:10px 5px;
		margin-top:-20px;
		
		
	}
	.db-like-check>input[type="checkbox"]{
		width: 1.8rem;
    	height: 1.8rem;
	}
	.db-like-check>label{
		padding:3px;
		margin:0 auto;
		color:rgb(136, 136, 136);
		font-size: 1.4rem;
	}
	.db-like-check>*{
		vertical-align: middle;
		cursor: pointer;
	}
	.db-applicant-list{
		text-align: center;
	}
	.db-aList{
		width:100%;
		height:60px;
		background-color: white;
		border-radius: 3px;
	}
	.aList-like-btn{
		margin:22px 20px;
		margin-left: 40px;

	}
	.aList-like-btn>svg{
		color:silver;
		font-size: 1.5rem;
	}
	.aList-left>div{
		position: relative;
		display: inline-grid;
		float:left;
		
	}
	.aList-info-no{
		font-size: 1.5rem;
		text-align: left;
		margin: 3px 2px;
		color:rgb(156, 156, 156);
		
	}
	.aList-info-name{
		font-size: 1.6rem;
		font-weight: bold;
		margin: 3px auto;
	}
	.aList-type>span{
		font-size:1rem;
		padding:2px 3px;
		margin:20px 15px;
		border:1px solid silver;
		border-radius: 2px;
	}

	.aList-right>div{
		position: relative;
		display: inline-grid;
		float:right;
	}

	.aList-del-btn{
		margin:16px 20px;
	}

	.del-btn{
		border:1px solid #900020;
		border-radius: 3px;
		padding:3px 7px;
		font-size: 1.3rem;
	}
	.del-btn:hover{
		background-color: 	#900020;
		color:white;
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
			margin-top:50px;
		}
		.db-leftside{
			width:100%;
			top:10px;
		}
		.db-main{
			width:100% -25px;
			top:20px;
		}
		.db-leftside>h5>svg{
			display: block;
		}

	}

</style>
<script>
	$(window).ready(function(){
		$(".ei_nav>li>a:first").addClass('ca1');
		$(".db-main-nav>ul>li>a:first").addClass('ca2');
		// fn_indexChange();
	});

	function fn_indexChange(db_index){
		
		$.ajax({
			url="naver.com",
			data:{"index":db_index},
			success:function(data){
				$("#db-container").html(data.html);

			}
		});
	}

	$(function(){
		$(".ei_nav>li>a").on("click",function(){
			$($(this).parent().siblings()).children().removeClass("ca1");
			$(this).addClass('ca1');
			fn_indexChange($(this).atr("data"));
		});
		$(".ei_nav>li>a").hover(function(){
			$(this).addClass('ca3');
		},function(){
			$(this).removeClass('ca3');
		});

		$(".db-main-nav>ul>li>a").on("click",function(){
			$($(this).parent().siblings()).children().removeClass("ca2");
			$(this).addClass('ca2');
		});
		$(".db-main-nav>ul>li>a").hover(function(){
			$(this).addClass('ca4');
		},function(){
			$(this).removeClass('ca4');
		});
		
		$(".db-leftside>h5").on("click",function(){
			if($($(this).children("svg")).hasClass("rotate")){
				$($(this).children("svg")).removeClass("rotate");
			}else{
				$($(this).children("svg")).addClass("rotate")
			}
			if($(this).hasClass("slide_btn")){
					$(this).next().next().slideToggle();
				}
		});
		$(window).resize(function(){
			if(window.innerWidth<767){
				if(!$(".db-leftside>h5").hasClass("slide_btn")){
					$(".db-leftside>h5").addClass("slide_btn");
				}
			}else{
				$(".db-leftside>h5").removeClass("slide_btn");
			}
		});

		$(".db-leftside>ul>li").on("click", function(){
			$(this).parent().parent().children("ul").children().removeClass("aList-click");
			if(!$(this).hasClass("aList-click")){
				$(this).addClass("aList-click");
			}
		});
		
	});

</script>
<jsp:include page="/WEB-INF/views/business/footer.jsp"/> 