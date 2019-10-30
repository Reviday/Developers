<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/resumeIntro.css">
    <meta name="msapplication-TileImage" content="//static.wanted.co.kr/favicon/144x144.png" class="next-head">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>

<section id="content" >
  <div class="section">
   <div id="app">
        <main class="App-iEDHGk UeTOO">
            <div >
                <div >
                    <div id="resume-app" class="react-container" >
                        <div >
                            <div id="resume-intro" >
                                <div class="block background-white" >
                                    <div class="content" >
                                        <h1 >이력서 양식, 그 이상</h1>
                                        <h2 ><span
                                                >채용 전문가들의 조언을 얻어, 이력서를 잘 쓸 수 있는 도구를
                                                만들었습니다. <br>
                                                서류 통과가 잘 되는 디벨로퍼 이력서를 쉽고 빠르게 작성해 보세요.</span></h2>
                                        <div class="button-block" >
                                        
                                      <c:if test="${loginMember==null }">  
                                        <button
                                                class="btn btn-default suBtn">
                                                	이력서 관리</button><button class="btn btn-primary suBtn"
                                                >새 이력서 작성</button>
                                         </c:if>       
                                          <c:if test="${loginMember!=null }">  
                                        <button
                                                class="btn btn-default" onclick="location.href='${path }/resume/resumeList.lmc'">이력서
                                                관리</button><button class="btn btn-primary" onclick="location.href='${path }/resume/insertResumepage.lmc?memEmail=${loginMember.memEmail }';"
                                                >새 이력서 작성</button>
                                         </c:if>           
                                                </div>
                                    </div>
                                    <div class="background-image bg-edit ko" ></div>
                                </div>
                                <div class="block background-image bg-advantage" >
                                    <div class="content" >
                                        <h1 >지원에 유리한</h1>
                                        <h2 ><span>
                                              글로벌 기업에 보편적이고, 성별이나 가족관계 등 차별 금지 정책에
                                                맞춰서 제작하였습니다. <br>
                                                군더더기 없이, 당신의 진짜 경쟁력을 드러 내 보세요.</span></h2>
                                    </div>
                                </div>
                                <div class="block background-white" >
                                    <div class="content" >
                                        <h1 >본질에 집중한</h1>
                                        <h2 ><span
                                                >보다 명확한 정보 설계로 당신의 커리어를 돋보이게 만들어
                                                드립니다. <br>
                                                불필요한 정보 입력을 최소화하고 이력서 작성에 방해가 되는 UI 요소들을 제거하였습니다.</span></h2>
                                    </div>
                                    <div class="background-image bg-career ko" ></div>
                                </div>
                                <div class="block background-image bg-download" >
                                    <div class="content" >
                                        <h1 >활용이 자유로운</h1>
                                        <h2 ><span
                                                >PC/모바일 어디에서나 작성할 수 있고, PDF 파일로 저장과
                                                활용이 쉽습니다. <br>
                                                가독성에 중점을 두고 설계하여, 파일 저장/출력시에도 돋보이는 결과물을 얻을 수 있습니다.</span></h2>
                                        <div class="button-block" ><a
                                                class="btn btn-default false"
                                                href="https://s3.ap-northeast-2.amazonaws.com/wanted-public/sample_resume_ko.pdf"
                                                target="_blank" rel="noopener noreferrer"
                                                >샘플 다운로드</a>
                                                <c:if test="${loginMember==null }">  
                                        <button
                                                class="btn btn-default" >이력서
                                                관리</button><button class="btn btn-primary suBtn"
                                                >새 이력서 작성</button>
                                         </c:if>       
                                          <c:if test="${loginMember!=null }">  
                                        <button
                                                class="btn btn-default" >이력서
                                                관리</button><button class="btn btn-primary"  onclick="location.href='${path }/resume/insertResumepage.lmc?memEmail=${loginMember.memEmail }';"
                                                >새 이력서 작성</button>
                                         </c:if>
                                                
                                                </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="Notice-iRWNro bdALza" ><span class="icon"
                           ><i class="icon-check" ></i></span>
                    </div>
                </div>
            </div>
            
        </main>
    </div>
    </div>

</section>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"/> 

