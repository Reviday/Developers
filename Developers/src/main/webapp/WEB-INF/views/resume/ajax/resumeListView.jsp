<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <main class="App-iEDHGk UeTOO">
            <div>
                <div>
                    <div id="resume-app" class="react-container">
                        <div class="resume-list-container" >
                            <div id="resume-list">
                            <!-- <div class="Box-cwadsP bLaSri">
                            <div width="50" class="Content-zwkXZ kKarJI">
                            <div class="resume-delete-modal-body Div-hTZHGu fEVoGZ" >
                            <div >
                            <h3>
                            <span>이력서 강병민 7<br>
								삭제하시겠습니까?</span>
							</h3>
							</div>
							</div>
							<div class="resume-delete-modal-footer Div-hTZHGu dXKeOh">
							<button>취소</button>
							<button>삭제</button>
							</div>
							</div>
							<div class="Overlay-iWuiZb emhpxA">
							</div>
							</div> -->
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
                                <div style="max-height:inherit;overflow-y:inherit;height:inherit;">
                                    <div class="resume-list-content Row-ciskzD hmOcCM" >
                                        <div class="resume-item Column-cKhjSj ehaaKs" >
                                            <div class="resume-box ResumeItemBox__Box-dRwtdQ jzITim">
                                      	
                                                <button class="btn-add-resume btn btn-default" 
                                                type="button" onclick="location.href='${path }/resume/insertResumepage.lmc?memEmail=${loginMember.memEmail }';">
                                                    <div class="wrapper" >
                                                        <div class="box blue" >
                                                            <i class="far fa-plus-square"></i></div>
                                                        <p>새 이력서 작성</p>
                                                    </div>
                                                </button></div>
                                        </div>
                            
                                        <c:if test="${list !=null  }">
                                        <c:forEach items="${list }" var="r">
                                        <div class="resume-item Column-cKhjSj ehaaKs"
                                             style="">
                                            <div class="resume-box ResumeItemBox__Box-dRwtdQ dhPSzh">
                                                <div class="resume-preview" 
                                                    onclick="location.href ='${path }/resume/resumeView.lmc?resumeNo=${r.resumeNo }'">
                                                    <h3 class="writing">
                                                        ${r.memName }
                                                    </h3>
                                                    <p class="date">
                                                        
                                                       <fmt:formatDate value="${r.resumeDate }" pattern="yyyy.MM.dd"/>  </p>
                                                       <c:if test="${r.matchup=='Y' }">
                                                       <p class="matchup">매치업 이력서</p>
                                                       </c:if>
                                                </div>

                                                <div class="resume-info">
                                                    <div class="resume-icon writing">한</div>
                                                    <div class="resume-status"><span
                                                            class="writing">작성 중</span></div>
                                                    <div class="dropdown">
                                                            <button class=""
                                                                type="button" data-toggle="dropdown">
                                                                <i class="fas fa-ellipsis-v"></i></button>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#">다운로드</a></li>
                                                                <c:set value="${r.resumeNo }" var="resumeNo"/>
                                                                <c:set value="${loginMember.memEmail }" var="memEmail"/>
                                                                <li><a href="#" onclick="deleteResume('${resumeNo }','${memEmail }');">삭제</a></li>
                                                            </ul>
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                        </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
	
                    <div class="Overlay-iWuiZb gMLFic"></div>
                </div>
        </main>

</body>
</html>