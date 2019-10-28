<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/resumeList.css">
    <meta name="msapplication-TileImage" content="//static.wanted.co.kr/favicon/144x144.png" class="next-head">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>

<section id="content">
<div style="height: 70px;" ></div>
  <div class="section">
    <div id="app">
        <main class="App-iEDHGk UeTOO" data-reactid=".0">
            <div data-reactid=".0.0">
                <div data-reactid=".0.0.0">
                    <div id="resume-app" class="react-container">
                        <div class="resume-list-container" >
                            <div id="resume-list">
                                <div class="resume-list-header" >
                                    <h4 >최근 문서</h4><button
                                        ><span >디벨로퍼 이력서
                                            소개</span><i class="icon-arrow_right"
                                           ></i></button>
                                </div>
                                <div class="resume-banner" >
                                    <a href="//career.wanted.co.kr/product-category/rcs/" target="_blank"
                                        rel="noopener noreferrer" ">
                                        직무 전문가와의
                                        1:1 이력서 코칭을 통해,
                                        완성된 이력서를 만들어보세요.</a></div>
                                <div style="max-height:inherit;overflow-y:inherit;height:inherit;"
                                    data-reactid=".0.0.0.0.0.0.2">
                                    <div class="resume-list-content Row-ciskzD hmOcCM" >
                                        <div class="resume-item Column-cKhjSj ehaaKs" >
                                            <div class="resume-box ResumeItemBox__Box-dRwtdQ jzITim"
                                                data-reactid=".0.0.0.0.0.0.2.0.0.0"><button
                                                    class="btn-add-resume btn btn-default" type="button"
                                                    >
                                                    <div class="wrapper" >
                                                        <div class="box blue" >
                                                            <i class="far fa-plus-square"></i></div>
                                                        <p>새 이력서 작성</p>
                                                    </div>
                                                </button></div>
                                        </div>
                                        <div class="resume-item Column-cKhjSj ehaaKs" >
                                            <div class="resume-box ResumeItemBox__Box-dRwtdQ jzITim">
                                                <div class="dropzone" >
                                                    <div class="wrapper" >
                                                        <div class="box"">
                                                            <i class="fas fa-file-upload"></i></div>
                                                        <p>파일 업로드</p>
                                                    </div><input type="file" style="display:none;" multiple=""
                                                       >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="resume-item Column-cKhjSj ehaaKs"
                                            data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume" style="">
                                            <div class="resume-box ResumeItemBox__Box-dRwtdQ dhPSzh"
                                                data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0">
                                                <div class="resume-preview"
                                                    data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.0">
                                                    <h3 class="writing"
                                                        data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.0.0">강병민 10
                                                    </h3>
                                                    <p class="date"
                                                        data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.0.1">
                                                        2019.10.24</p>
                                                </div>

                                                <div class="resume-info"
                                                    data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.1">
                                                    <div class="resume-icon writing"
                                                        data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.1.0">한</div>
                                                    <div class="resume-status"
                                                        data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.1.1"><span
                                                            class="writing"
                                                            data-reactid=".0.0.0.0.0.0.2.0.3:$348290_resume.0.1.1.0">작성
                                                            중</span></div>

                                                    <div class="dropdown">
                                                            <button class=""
                                                                type="button" data-toggle="dropdown">
                                                                <i class="fas fa-ellipsis-v"></i></button>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li name="en"><a href="#">이름변경</a></li>
                                                                <li><a href="#">다운로드</a></li>
                                                                <li><a href="#">삭제</a></li>
                                                            </ul>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="Overlay-iWuiZb gMLFic" data-reactid=".0.9.3"></div>
                </div>
        </main>
    </div>

</div>
</section>
	
