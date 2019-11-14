<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
	 <div class="_6zGbQ6Gwdi0O826QWL_gN">

                <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi _3IED0gKfPim4KkuZ7BNhTA" id="resumeContainer">
                    <div class="Form-header">
                        <dl class="Form-title">
                            <dt>기본 이력서</dt>
                         
                        </dl>
                    </div>
                    <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                        <div class="FormBlock-content content">

                            <div class="MainResume-fieldset">
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">학교</div>
                                    <div class="Static-body">
                                    <c:forEach items="${ed }" var="e">
                                        <div class="_19vX-16wSMhdZ9PHWSu9fr"><span
                                                class="ResumeEntry-major">${e.schoolName}</span>
                                               <c:if test="${e.majorName==null }">
                                                <span class="ResumeEntry-minor is-empty">전공 미입력</span>
                                               </c:if> 
                                                 <c:if test="${e.majorName!=null }">
                                                <span class="ResumeEntry-minor">${e.majorName }</span>
                                               </c:if> 
                                                </div>
                                               
                                                </c:forEach>
                                    </div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">직장</div>
                                    <div class="Static-body">
                                     <c:forEach items="${career }" var="c">
                                        <div class="_19vX-16wSMhdZ9PHWSu9fr"><span
                                                class="ResumeEntry-major">${c.busName }</span>
                                                <c:if test="${c.depName==null }">
                                                <span
                                                class="ResumeEntry-minor is-empty">직책 미입력</span>
                                                 </c:if> 
                                                   <c:if test="${c.depName!=null }">
                                                <span
                                                class="ResumeEntry-minor">${c.depName }</span>
                                                 </c:if> 
                                         </div>
                                      </c:forEach>
                                    </div>
                                </div>
                                <c:set value="${resume }" var="r"></c:set>
                                <a href="#" 
                                onclick="location.href ='${path }/resume/resumeView.lmc?resumeNo=${r.resumeNo }'"
                                 class="MainResume-edit" >
                                <i class="far fa-edit"  id="updateResume" 
                                        style="font-size: 20px;"></i></a>
                            </div>
                            <div class="MainResume-about">${resume.intro }</div>
                        </div>
                    </div>
                </div>
                <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi _3ZoHfZyrHiWR9JdVIgtNxq" id="interestsContainer">
                    <div class="Form-header">
                        <dl class="Form-title">
                            <dt>관심분야 설정</dt>
                        </dl>
                    </div>
                    <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                        <div class="FormBlock-content content">
                            <div class="EnterInterestArea-fieldset">
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">직군</div>
                                    <div class="Static-body">개발</div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">직무</div>
                                    <div class="Static-body">
                                    <c:forEach items="${inter.duty }" var="dutis">
                                    ${dutis }
                                    </c:forEach>

                                    
                                    </div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">경력</div>
                                    <div class="Static-body">${inter.experience } 년 이상</div>
                                </div>
                                <div class="_1hQHY2MOttuKGMBqDe_htT">
                                    <div class="Static-label">스킬</div>
                                    <div class="Static-body">
                                    <c:forEach items="${inter.skill }" var="skills"  >
                                    ${skills }
                                    </c:forEach> 
                                    
                                    </div>
                                </div> 
                                 <c:set value="${loginMember.memEmail }" var="memEmail" />
                               <a href="#" class="EnterInterestArea-edit"
                                onclick="updateInterts('${memEmail }');">
                                 <i class="far fa-edit"  id="updateInterests" 
                                        style="font-size: 20px;"></i></a></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
</body>
</html>