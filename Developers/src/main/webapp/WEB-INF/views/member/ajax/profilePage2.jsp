<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <nav role="presentation" class="_3wSXAiIJQZ98fJ-Hi6G42Q"><button type="button" class="">프로필<i
                class="icon-arrow_bottom_fill"></i></button>
                <c:set value="${loginMember.memEmail }" var="memEmail"  />
        <ul class="">
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="activeNav">프로필</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" class="">포인트</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="applicantPage('${memEmail }')" class="">제안받기 현황</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="likePage('${memEmail }');" class="">좋아요</a></li>
            <li class="_1ft7OZSrbzL35bkI-omU2b"><a href="#" onclick="myBookMark('${memEmail }')" class="">북마크</a></li>
        </ul>
    </nav>
    <div class="_14NzdD9Zqjq8ocf6TORWoN">
        <aside class="Aside _1dBR38s0D_bqykmPvZBYPu">
            <div class="Aside-header">
                <div class="Aside-avatar">
                    <c:if test="${loginMember.memIcon==null }">
                    <div class="Aside-avatar_image" id="logoImg" 
                    style="background-image: url('${path}/resources/upload/profile/no-profile-image.png ');">
                          <div class="_1RDFX7ZROHIIPqPMgmtS2E">
                        <form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
                        <i class="icon-camera_icon" role="presentation">+</i>
							<input type="file" accept="image/*" id="logoFile" name="logoFile"/>
						</form>
                       </div>
                    </div>
                    </c:if>
                    
                    <c:if test="${loginMember.memIcon!=null }">
                    <div class="Aside-avatar_image" id="logoImg" 
                    style="background-image: url('${path}${loginMember.memIcon } ');">
                          <div class="_1RDFX7ZROHIIPqPMgmtS2E">
                        <form id="logoFrm" name="logoFrm" enctype="multipart/form-data" method="POST">
                        <i class="icon-camera_icon" role="presentation">+</i>
					<input type="file" accept="image/*" id="logoFile" name="logoFile"/>
						</form>
                       </div>
                    </div>
                    </c:if>
                  
                </div>
                <div class="Aside-me">
                    <div class="Aside-me_name">${loginMember.memName }</div>
                    <div class="Aside-me_email">${memEmail }</div>
                    <div class="Aside-me_tel">
                    <c:if test="${loginMember.memPhone==null }">
                    	저장된 번호가 없습니다
                    </c:if>
                    <c:if test="${loginMember.memPhone!=null }">
                    ${loginMember.memPhone }
                    </c:if>
                    </div>
                </div><a href="#"  onclick="updatePage();"class="Aside-edit">기본정보 수정</a>
            </div>

        </aside>
        <section id="sectionA">
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
        </section>
    </div>