<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link rel="stylesheet" type="text/css" href="${path }/resources/css/insertResume.css">
    <meta name="msapplication-TileImage" content="//static.wanted.co.kr/favicon/144x144.png" class="next-head">
    <link href="${path }/resources/css/all.css" rel="stylesheet">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<div style="height: 70px;"></div>
<div class="section">
<div id="app">
    <main class="App-iEDHGk UeTOO">
        <div>
            <div>
                <div id="resume-app" class="react-container background-white">
                 <form action="${path }/resume/updateResume.lmc" method="post">
                    <div class="container">
                        <div id="resume-detail" class="">
                            <div class="resume-toolbar">
                                <div class="resume-select-lang ko"><i class="icon-ic-language"></i><select
                                        class="resume-lang">
                                        <option selected="" value="ko">한국어
                                        </option>
                                        <option value="ja">日本語</option>
                                        <option value="tw">繁體中文</option>
                                        <option value="en">English
                                        </option>
                                    </select><i class="icon-arrow_bottom_fill"
                                       ></i></div>

                                <div class="other-btns"><button class="hidden-xs btn btn-primary"
                                        type="submit">작성 완료</button><button class="border-gray btn btn-default"
                                        type="button"><i class="fas fa-download"></i></button>
                                </div>
                            </div>
                            <div class="Box-cwadsP iKzpWM" id="deleteModal">
                            <input type="hidden" id="deleteIndex" value=""/>
                           			 <input type="hidden" id="deleteNo" value=""/>
                           			  <c:set value="${resume.resumeNo }" var="resumeNo"/>
                           			  
                           			 <input type="hidden" id="resumeNo" value="${resume.resumeNo }"/>
                                <div width="40" class="Content-zwkXZ dzZUIS" id="deleteModal2">
                                    <div class="Div-hTZHGu fEVoGZ">
                                    
                                        <p class="Confirm__ConfirmMessage-fNOBqL cHGGot" id=".0.3.0.$/=11.0">
                                            삭제하시겠습니까?</p>
                                    </div>
                                    <div class="Div-hTZHGu dXKeOh"><button color="#B5B5B5" type="button"
                                            class="Button-kDSBcD hzWWar" onclick="madalclose();">닫기</button>
                                            <button
                 color="#258BF7" class="Button-kDSBcD ebVQvc" type="button"
                 onclick="deleteList('${resumeNo }');">확인</button>
         </div>
     </div>
     <div class="Overlay-iWuiZb gMLFic" id="deleteModal3"></div>
 </div>
 <div class="resume-basic-info">
     <div class="resume-input-form-group"><input class="resume-input name" type="text"
             maxlength="100" placeholder="이름" value="${resume.memName }"></div>
     <div class="resume-input-form-group"><input class="resume-input email" type="text"
             maxlength="120" placeholder="이메일(필수)" value="${resume.memEmail }" id="allmemEmail"></div>
     <div class="resume-input-form-group">
         <c:if test="${resume.memPhone==null||resume.memPhone=='null' }">
             <input class="resume-input mobile" type="text" maxlength="200"name="memPhone"
                 placeholder="연락처(필수) ex) 010-0000-0000">
         </c:if>
          <c:if test="${resume.memPhone!=null&&resume.memPhone!='null' }">
             <input class="resume-input mobile" type="text" maxlength="200"name="memPhone"
                 value="${resume.memPhone }">
         </c:if>
     </div>
     <div class="resume-input-form-group">
     <c:set value="${resume.resumeNo }" var="resumeNo"/>
       <input type="hidden" name="memEmail" value="${loginMember.memEmail }"/>
	<input type="hidden"  name="resumeNo" value="${resume.resumeNo }"/>
         <div class="dynamic-textarea"><textarea style="height:34px;"
                 class="resume-input about" maxlength="2000" name="intro"
                 placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)"></textarea><textarea
                 class="textarea-clone" readonly=""
                 style="top: 0px; left: 0px; width: 1060px; padding: 0px; font-size: 16px; line-height: 22.8571px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)</textarea>
         </div>
     </div>
 </div>
</form>
 <div class="resume-lists">
     <div class="resume-list careers">
         <div class="resume-list-header"><span>경력</span></div>
         <div class="resume-list-body">
             <c:set value="${resume.memEmail }" var="memEmail"  />
           
             <button class="btn-add btn btn-default" type="button"
                 onclick="careersplus('${memEmail }','${resumeNo }');">+ 추가</button>
               <div id="careerslist">
               <ul class="list-group sortable-list careers">
                   <c:if test="${not empty career}">
                           <c:forEach var="c" items="${career }" >
                           	 <form action="${path }/resume/updateCareer.lmc" method="post" >
                               <li class="list-group-item sortable-item careers">
                                   <div class="portlet-handler">
                                       <div class="handler"></div>
                                   </div>
                                    
                                   <div class="career-item clearfix">
                                       <div class="col-sm-3">
                                           <div class="period">
                                               <div class="datetime">
                                                   <div class="start-time">
                                                       <div class="form-group">
                                                    
                                                       <c:if test="${c.startCareer==null }">
                                                           <input type="text" maxlength="6"
                                                               class="year form-control" name="startCareer"
                                                               placeholder="YYYYMM"
                                                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                                       </c:if>
                                                       <c:if test="${c.startCareer!=null }">
                                                           <input type="text" maxlength="6"
                                                               class="year form-control" name="startCareer"
                                                               placeholder="YYYYMM" value="${c.startCareer }"
                                                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                                       </c:if>
                                                       </div>
                                                       <div class="form-group">
                                                       
                                                    
                                                       </div></span>
                                                   </div>
                                                   <div class="end-time"><span
                                                           class="delimiter">-</span>
                                                       <div class="form-group">
                                                           <c:if test="${c.endCareer==null }">
                                                           <input type="text" maxlength="6"
                                                               class="year form-control" 
                                                               placeholder="YYYYMM"  name="endCareer"
                                                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                                       </c:if>
                                                       <c:if test="${c.endCareer!=null }">
                                                           <input type="text" maxlength="6"
                                                               class="year form-control" name="endCareer"
                                                               placeholder="YYYYMM" value="${c.endCareer }"
                                                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                                                       </c:if>
                                                       </div>
                                                       <div class=" form-group">
                                                       
                                                       </div>
                                                       </span>
                                                   </div>
                                               </div>
                                               <div class="form-group"></div>
                                           </div>
                                       </div>
                                       <div class="col-sm-9">
                                           <div
                                               class="search-input-box resume-input-form-group">
                                               <c:if test="${c.busName==null }">
                                               <input type="text" class="resume-input company_name"
                                                  name="busName"     placeholder="회사명">
                                                </c:if>
                                                <c:if test="${c.busName!=null }">
                                               <input type="text" class="resume-input company_name"
                                                 name="busName" placeholder="회사명" value="${c.busName }">
                                                </c:if>
                                           </div>
                                           <div class="resume-input-form-group">
                                           <c:if test="${c.depName==null }">
                                               <input class="resume-input title"
                                                   type="text" maxlength="255"
                                                    name="depName"
                                                   placeholder="부서명/직책">
                                                </c:if>
                                             <c:if test="${c.depName!=null }">
                                               <input class="resume-input title"
                                                   type="text" maxlength="255" value="${c.depName }"
                                                    name="depName"
                                                   placeholder="부서명/직책">
                                                </c:if>    
                                                
                                                </div>
                                           
                                                <div class="resume-input-form-group">
            								    <div class="dynamic-textarea">
            								  <c:if test="${c.careerIntro==null }">  
                                             	 <textarea style="height:60px;" class="resume-input description" name="careerIntro"
                        maxlength="1000" placeholder="상세 업무 내용과 성과를 기입해주세요"></textarea>
                                             	</c:if>
                                             	<c:if test="${c.careerIntro!=null }">  
                                             	 <textarea style="height:60px; text-align: left" class="resume-input description" name="careerIntro"
                        maxlength="1000" placeholder="상세 업무 내용과 성과를 기입해주세요">${c.careerIntro }</textarea>
                                             	</c:if>
                                               </div>
                                           </div>
                                      
                                       <c:set value="${c.careerNo }" var="careerNo"/>
                                       <input type="hidden" value="${c.careerNo }" name="careerNo"/>
                                       <input type="hidden" value="${resumeNo }" name="resumeNo"/> 
                                       <input type="hidden" value="${memEmail }" name="memEmail"/> 
                                       
                                       <button class="btn-delete btn" type="button"
                                           onclick="deleteModal('${careerNo}',1);">
                                           <i class="fas fa-times"></i>
                                           </button>
                                        <button class="btn-save btn" type="submit">
                                         <i class="far fa-save"></i>
                                         </button>   
                                          
                                   </div>
                               </li>
                         </form>
                           </c:forEach>
                   </c:if>
                     <c:if test="${empty career }">
                              </c:if>
					 </ul>

                       </div>
				
                   </div>
               </div>
               <div class="resume-list educations">
                   <div class="resume-list-header"><span>학력</span></div>
                   <div class="resume-list-body"><button class="btn-add btn btn-default"
                           type="button" onclick="educationsplus('${memEmail }','${resumeNo }');">+ 추가</button>
                       <div id="educationslist">
						<ul class="list-group sortable-list educations" >
						<c:if test="${not empty ed }">
							<c:forEach items="${ed }" var="e">
							 <form action="${path }/resume/updateEd.lmc" method="post" >
							 <li class="list-group-item sortable-item educations">
     <div class="portlet-handler">

         <div class="handler"></div>
     </div>
     <div class="education-item clearfix">
         <div class="col-sm-3">
             <div class="period">
                 <div class="datetime">
                     <div class="start-time">
                         <div class="form-group">
								<c:if test="${e.startEd==null }">
                             <input type="text" maxlength="6" class="year form-control" name="startEd" placeholder="YYYYMM" 
                              onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                              </c:if>
                              <c:if test="${e.startEd!=null }">
                             <input type="text" maxlength="6" class="year form-control" name="startEd" placeholder="YYYYMM" 
                              onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${e.startEd }" />
                              </c:if>
                             </div>
                         <div class="form-group">

                             </div>
                         <div class="end-time"><span class="delimiter">-</span>
                             <div class="form-group">

                                 <c:if test="${e.endEd==null }">
                             <input type="text" maxlength="6" class="year form-control" name="endEd" placeholder="YYYYMM" 
                              onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                              </c:if>
                              <c:if test="${e.endEd!=null }">
                             <input type="text" maxlength="6" class="year form-control" name="endEd" placeholder="YYYYMM" 
                              onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${e.endEd }" />
                              </c:if>
                             </div>
                             <div class="form-group"></div></span>
                         </div>
                     </div>
                     <div class="form-group"></div>
                 </div>
             </div>
         </div>
         <div class="col-sm-9">
             <div class="search-input-box resume-input-form-group">
                 <c:if test="${e.schoolName==null }">
                 <input type="text" class="resume-input school_name" name="schoolName"
                  placeholder="학교명">
                 </c:if>
                 <c:if test="${e.schoolName!=null }">
                 <input type="text" class="resume-input school_name" name="schoolName"
                  placeholder="학교명" value="${e.schoolName }">
                 </c:if>
             </div>
             <div class="search-input-box resume-input-form-group">
              <c:if test="${e.majorName==null }">
                 <input type="text" class="resume-input major" name="majorName"
                  placeholder="전공 및 학위 (ex: 컴퓨터 공학과 학사)">
               </c:if>
               <c:if test="${e.majorName!=null }">
                <input type="text" class="resume-input major" name="majorName"
                  placeholder="전공 및 학위 (ex: 컴퓨터 공학과 학사)" value="${e.majorName }">
               </c:if>  
             </div>
             <div class="resume-input-form-group">
                 <div class="dynamic-textarea">
                 <c:if test="${e.subjectName==null }">
                 <textarea style="height:34px;" class="resume-input description"
                   name="subjectName" maxlength="1000" placeholder="이수과목 또는 연구내용"></textarea>
                  </c:if>
                  <c:if test="${e.subjectName!=null }">
                 <textarea style="height:34px;" class="resume-input description"
                         maxlength="1000" placeholder="이수과목 또는 연구내용">
                         ${e.subjectName }
                         </textarea>
                  </c:if>
                         <textarea class="textarea-clone"
                         readonly=""
                         style="top: 0px; left: 0px; width: 750px; padding: 0px; font-size: 14px; line-height: 22.4px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">
                         이수과목 또는 연구내용
                         </textarea>
                 </div>
             </div>
         </div>
		 <c:set value="${e.edNo }" var="edNo"/>
         <button class="btn-delete btn btn-default" type="button" onclick="deleteModal('${edNo}',2);">
            <i class="fas fa-times"></i></button>
              <c:set value="${e.edNo }" var="edNo"/>
            <input type="hidden" value="${e.edNo }" name="edNo"/>
            <input type="hidden" value="${resumeNo }" name="resumeNo"/> 
            <input type="hidden" value="${memEmail }" name="memEmail"/> 
            <button class="btn-save btn" type="submit">
              <i class="far fa-save"></i>
              </button> 
     </div>
 </li>	
 </form>		
 </c:forEach>
						</c:if>
						</ul>
                       </div>
                   </div>
               </div>
               <div class="resume-list activities">
                   <div class="resume-list-header"><span>수상 및 기타</span></div>
                   <div class="resume-list-body"><button class="btn-add btn btn-default"
                           type="button" onclick="activetiesplus('${memEmail }','${resumeNo }');">+ 추가</button>
                       <div id="activitieslist">
						<ul class="list-group sortable-list activities">
						<c:if test="${not empty ac }">
							<c:forEach items="${ac }" var="ac">	
<form action="${path }/resume/updateAct.lmc" method="post" >									
<li class="list-group-item sortable-item activities">
    <div class="portlet-handler">
        <div class="handler"></div>
    </div>
    <div class="activity-item clearfix">
        <div class="col-sm-3">
            <div class="period">
                <div class="datetime">
                    <div class="start-time">
                        <div class="form-group">
                        	<c:if test="${ac.startAct==null }">
                            <input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM"  name="startAct"
                            onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
                            </c:if>
                            <c:if test="${ac.startAct!=null }">
                            <input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM" name="startAct"
                            onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${ac.startAct }" />
                            </c:if>
                            </div>
                        <div class="form-group"></div></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="resume-input-form-group">
            	<c:if test="${ac.actName==null }">
            <input class="resume-input title" type="text" maxlength="255" name="actName"
                    placeholder="활동명">
                </c:if> 
                <c:if test="${ac.actName!=null }">
            <input class="resume-input title" type="text" maxlength="255" name="actName"
                    placeholder="활동명" value="${ac.actName }">
                </c:if>     
                    </div>ㄷ
            <div class="resume-input-form-group">
                <div class="dynamic-textarea">
                <c:if test="${ac.actDetail==null }">
                <textarea style="height:34px;" class="resume-input description" name="actDetail"
                        maxlength="1000" placeholder="세부사항"></textarea>
                 </c:if>   
                   <c:if test="${ac.actDetail!=null }">
                <textarea style="height:34px;" class="resume-input description" name="actDetail"
                        maxlength="1000" placeholder="세부사항">${ac.actDetail }</textarea>
                 </c:if>     
                        
               <textarea class="textarea-clone" readonly=""
                        style="top: 0px; left: 0px; width: 576px; padding: 0px; font-size: 14px; line-height: 22.4px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">세부사항</textarea>
                </div>
            </div>
        </div>
         <c:set value="${ac.actNo }" var="acNo"/>
        <button class="btn-delete btn btn-default" type="button"  style="top:3px !important"
        onclick="deleteModal('${acNo}',3);"><i
                class="fas fa-times"></i></button>
                    
         <input type="hidden" value="${ac.actNo }" name="actNo"/>
         <input type="hidden" value="${resumeNo }" name="resumeNo"/> 
         <input type="hidden" value="${memEmail }" name="memEmail"/> 
       <button class="btn-save btn" type="submit" style="top:30px !important"><i class="far fa-save"></i></button>
    </div>
</li>
</form>
							</c:forEach>
						</c:if>
						   <c:if test="${empty ac }">
                              </c:if>
						</ul>
                       </div>
                   </div>
               </div>
               <div class="resume-list language_certs">
                   <div class="resume-list-header"><span>외국어</span></div>
                   <div class="resume-list-body"><button class="btn-add btn btn-default"
                           type="button" onclick="languageplus('${memEmail }','${resumeNo }');">+ 추가</button>
                       <div id="languagelist">
						<ul class="list-group sortable-list languages">
						
						<c:if test="${not empty Lang }">
						<c:forEach items="${Lang }" var="la">
						<form action="${path }/resume/updateLang.lmc" method="post" >
						<li class="list-group-item sortable-item languages">
						    <div class="portlet-handler">
						        <div class="handler"></div>
						    </div>
						    <div class="lang-item clearfix">
						        <div class="col-sm-9 col-sm-offset-3">
						
						            <div class="dropdown custom-dropdown i18n_language resume-dropdown">
						            <c:if test="${la.langName==null }">
						                <select class="mdb-select md-form colorful-select dropdown-primary" name="langName">
						                    <option selected="selected" disabled value=null >언어</option>
						                    <option value="영어">영어</option>
						                    <option value="독일어">독일어</option>
						                    <option value="스페인어">스페인어</option>
						                    <option value="중국어">중국어</option>
						                    <option value="한국어">한국어</option>
						                    <option value="불어">불어</option>
						                </select>
									</c:if>
									 <c:if test="${la.langName!=null }">
						                <select class="mdb-select md-form colorful-select dropdown-primary" name="langName">
						                    <option selected="selected"  value="${la.langName }" >${la.langName }</option>
						                    <option value="영어">영어</option>
						                    <option value="독일어">독일어</option>
						                    <option value="스페인어">스페인어</option>
						                    <option value="중국어">중국어</option>
						                    <option value="한국어">한국어</option>
						                    <option value="불어">불어</option>
						                </select>
									</c:if>
						            </div>
						            <div class="dropdown custom-dropdown i18n_level resume-dropdown">
						            <c:if test="${la.langLevel==null }">
						                <select class="browser-default custom-select" name="langLevel">
						                    <option selected="selected" disabled value=null  >수준</option>
						                    <option value="유창함">유창함</option>
						                    <option value="비지니스회화">비지니스회화</option>
						                    <option value="일상대화">일상대화</option>
						                </select>
									</c:if>
									<c:if test="${la.langLevel!=null }">
						                <select class="browser-default custom-select" name="langLevel">
						                    <option selected="selected" value="${la.langLevel }" >${la.langLevel }</option>
						                    <option value="유창함">유창함</option>
						                    <option value="비지니스회화">비지니스회화</option>
						                    <option value="일상대화">일상대화</option>
						                </select>
									</c:if>
						            </div>
						            <div class="resume-list exams">
						                <div class="resume-list-body"></div>
						            </div>
						        </div>
									<c:set value="${la.langNo }" var="laNo"/>
						        <button class="btn-delete btn btn-default" type="button" style="top:10px !important"
						         onclick="deleteModal('${laNo}',4)"><i
						                class="fas fa-times"></i></button>
						             <input type="hidden" value="${la.langNo }" name="langNo"/>
						         <input type="hidden" value="${resumeNo }" name="resumeNo"/> 
						         <input type="hidden" value="${memEmail }" name="memEmail"/> 
						       <button class="btn-save btn" type="submit" style="top:35px !important"><i class="far fa-save"></i></button>    
						    </div>
						</li>
		</form>
</c:forEach>
						</c:if>
		
						</ul>
                       </div>
                   </div>
               </div>
               <div class="resume-list links">
                   <div class="resume-list-header"><span>링크</span></div>
                   <div class="resume-list-body"><button class="btn-add btn btn-default"
                           type="button" onclick="linkplus('${memEmail }','${resumeNo }');">+ 추가</button>
                                        <div id="linklist">
                                        <ul class="list-group sortable-list links" >
                                        <c:if test="${not empty links}">
                                        <c:forEach var="link" items="${links }"> 
 										<form action="${path }/resume/updateLinks.lmc" method="post" >                                      
                                        <li class="list-group-item sortable-item links">
    <div class="portlet-handler">
        <div class="handler"></div>
    </div>
    <div class="link-item clearfix">
        <div class="resume-input-form-group">
        <c:if test="${link.linksAddr==null }">
        <input class="resume-input url" type="text" maxlength="300" name="linksAddr"
                placeholder="http://">
             
          </c:if>    
          <c:if test="${link.linksAddr!=null }">
        <input class="resume-input url" type="text" maxlength="300" name="linksAddr"
                placeholder="http://" value="${link.linksAddr }">
             
          </c:if>     
                </div>
                <c:set value="${link.linksNo }" var="linksNo"/>
        <button class="btn-delete btn btn-default" type="button" style="top:-8px !important"
         onclick="deleteModal('${linksNo}',5);"><i
                class="fas fa-times"></i></button>
                    <input type="hidden" value="${link.linksNo }" name="linksNo"/>
         <input type="hidden" value="${resumeNo }" name="resumeNo"/> 
         <input type="hidden" value="${memEmail }" name="memEmail"/> 
       <button class="btn-save btn" type="submit" style="top:16px !important"><i class="far fa-save"></i></button>
       
    </div>
</li>
</form>

                                        </c:forEach>

                                        </c:if>
                                        <c:if test="${empty links }">
											</c:if>
										</ul>
                                        </div>
                                    </div>
                                </div>
                            </div><span></span>
                            <div class="resume-toolbar fixed-bottom visible-xs">
                                <div class="other-btns">
                                    <div><button class="border-primary btn btn-default" type="button">임시 저장</button>
                                    </div>
                                    <div><button type="button" class="btn btn-primary">작성
                                            완료</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="Notice-iRWNro bdALza"><span class="icon"><i class="icon-check"></i></span>
                </div>
            </div>
        </div>
    </main>
 </div>
</div>

<script>
	
    function careersplus(memEmail,resumeNo) {
        $.ajax({
            url: "${path}/resume/insertCareer.lmc",
            type: "POST",
            data: {"memEmail":memEmail,"resumeNo":resumeNo},
            success: function(data){
        var careers = document.createElement('ul');
        var plus = '';
        plus +='<form action="${path }/resume/updateCareer.lmc" method="post">';
        plus +='<li class="list-group-item sortable-item careers">';
        plus +='<div class="portlet-handler"><div class="handler" ></div></div><div class="career-item clearfix">';
        plus +='<div class="col-sm-3"><div class="period" >';
        plus +='<div class="datetime"><div class="start-time" ><div class="form-group">';
        plus +='<input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM" name="startCareer" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +"''" + ');"/>';
        plus +='</div><div class="form-group" >';
        plus +='</div></span></div>';
        plus +='<div class="end-time" ><span class="delimiter" >-</span><div class="form-group">';
        plus +='<input type="text" maxlength="6"  name="endCareer" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +"''" + ');" />';
        plus +='</div><div class="form-group" ></div></span></div></div><div class="form-group" >';
        plus +='</div></div></div><div class="col-sm-9"><div class="search-input-box resume-input-form-group">';
        plus +='<input type="text" class="resume-input company_name" placeholder="회사명" name="busName"/>';
        plus +='</div><div class="resume-input-form-group">';
        plus +='<input class="resume-input title" type="text" maxlength="255" placeholder="부서명/직책" name="depName"/></div>';
        plus +='<div class="resume-input-form-group">';
		plus +='<div class="dynamic-textarea">';
		plus +='<textarea style="height:60px;" class="resume-input description" name="careerIntro"';
		plus +='maxlength="1000" placeholder="상세 업무 내용과 성과를 기입해주세요"></textarea>';
		plus +='</div></div>';
        plus += '<button class="btn-delete btn" type="button"  onclick="deleteModal('+data+',1);">';
        plus += '<i class="fas fa-times"></i></button>';
        plus += '<input type="hidden" value="'+data+'" name="careerNo"/>';
        plus += '<input type="hidden" value="'+resumeNo+'" name="resumeNo"/>';
        plus += '<input type="hidden" value="'+memEmail+'" name="memEmail"/>';
        plus += '<button class="btn-save btn" type="submit"><i class="far fa-save"></i></button></div></li>';
        plus += '</form>';
        careers.innerHTML = plus;
        document.getElementById('careerslist').append(careers);
        },
            error: function(data){
                alert(data);
                console.log(data);
            }
        });
        
    }
    function educationsplus(memEmail,resumeNo) {
    	        $.ajax({
    	            url: "${path}/resume/insertEd.lmc",
    	            type: "POST",
    	            data: {"memEmail":memEmail,"resumeNo":resumeNo},
    	            success: function(data){
        var educations = document.createElement('ul');
        var plus = '';
        plus +='<form action="${path }/resume/updateEd.lmc" method="post">';
        plus +='<li class="list-group-item sortable-item educations"><div class="portlet-handler">';
        plus +='<div class="handler"></div></div><div class="education-item clearfix" ><div class="col-sm-3"><div class="period"><div class="datetime"><div class="start-time"><div class="form-group">';
        plus +='<input type="text" maxlength="6" class="year form-control" name="startEd" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +"''" + ');"/>';
        plus +='</div><div class="form-group" >';
        plus +='</div><div class="end-time" ><span class="delimiter" >-</span><div class="form-group" >';
        plus +='<input type="text" maxlength="6" name="endEd" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +"''" + ');"/>';
        plus +='</div><div class="form-group"></div></span></div></div><div class="form-group">';
        plus +='</div></div></div></div><div class="col-sm-9"><div class="search-input-box resume-input-form-group">';
        plus +='<input type="text" class="resume-input school_name" name="schoolName" placeholder="학교명"></div>';
        plus +='<div class="search-input-box resume-input-form-group">';
        plus +='<input type="text" class="resume-input major" name="majorName" placeholder="전공 및 학위 (ex: 컴퓨터 공학과 학사)"></div>';
        plus +='<div class="resume-input-form-group">';
        plus +='<div class="dynamic-textarea">';
        plus +='<textarea style="height:34px;" class="resume-input description" maxlength="1000" name="subjectName" placeholder="이수과목 또는 연구내용">';
        plus +='</textarea>';
        plus +='</div></div></div>';
        plus +='<button class="btn-delete btn btn-default" type="button" onclick="deleteModal('+data+',2);">';
        plus +='<i class="fas fa-times"></i></button>';
        plus +='<input type="hidden" value="'+data+'" name="edNo"/>';
        plus +='<input type="hidden" value="'+resumeNo+'" name="resumeNo"/>';
        plus +='<input type="hidden" value="'+memEmail+'" name="memEmail"/>';
        plus +='<button class="btn-save btn" type="submit"><i class="far fa-save"></i></button></div></li>';
        plus +='</form>';
        educations.innerHTML = plus;
        document.getElementById('educationslist').append(educations);
    	            },
    	            error: function(data){
    	                alert(data);
    	                console.log(data);
    	            }
    	        });
    }
    function activetiesplus(memEmail,resumeNo) {
	        $.ajax({
	            url: "${path}/resume/insertAct.lmc",
	            type: "POST",
	            data: {"memEmail":memEmail,"resumeNo":resumeNo},
	            success: function(data){
    
        var activities = document.createElement('ul');
        var plus = '';
        plus +='<form action="${path }/resume/updateAct.lmc" method="post" >';
        plus +='<li class="list-group-item sortable-item activities" ><div class="portlet-handler"><div class="handler" ></div></div><div class="activity-item clearfix">';
        plus +='<div class="col-sm-3"><div class="period"><div class="datetime"><div class="start-time"><div class="form-group">';
        plus +='<input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +"''" + ');" name="startAct"/>';
        plus +='</div><div class="form-group"></div></span></div></div></div></div><div class="col-sm-9">';
        plus +='<div class="resume-input-form-group"><input class="resume-input title" type="text" maxlength="255" placeholder="활동명" name="actName"></div>';
        plus +='<div class="resume-input-form-group"><div class="dynamic-textarea">';
        plus +='<textarea style="height:34px;" class="resume-input description" maxlength="1000" placeholder="세부사항" name="actDetail"></textarea>';
        plus +='<textarea class="textarea-clone" readonly="" style="top: 0px; left: 0px; width: 576px; padding: 0px; font-size: 14px; line-height: 22.4px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">세부사항</textarea></div></div></div>';
        plus +='<button class="btn-delete btn btn-default" type="button" style="top:3px !important"  onclick="deleteModal('+data+',3);">';
        plus +='<i class="fas fa-times"></i></button>';
        plus +='<input type="hidden" value="'+data+'" name="actNo"/>';
        plus +='<input type="hidden" value="'+resumeNo+'" name="resumeNo"/>';
        plus +='<input type="hidden" value="'+memEmail+'" name="memEmail"/>';
        plus +='<button class="btn-save btn" type="submit"  style="top:30px !important" ><i class="far fa-save"></i></button></div></li>';
        plus +='</form>';
        activities.innerHTML = plus;
        document.getElementById('activitieslist').append(activities);
	            },
	            error: function(data){
	                alert(data);
	                console.log(data);
	            }
	        });
    }
    function languageplus(memEmail,resumeNo) {
    	
	        $.ajax({
	            url: "${path}/resume/insertLang.lmc",
	            type: "POST",
	            data: {"memEmail":memEmail,"resumeNo":resumeNo},
	            success: function(data){
    
        var languages = document.createElement('ul');
        var plus = '';
        plus +='<form action="${path }/resume/updateLang.lmc" method="post" >';
        plus +=
            '<li class="list-group-item sortable-item languages"><div class="portlet-handler"><div class="handler"></div></div><div class="lang-item clearfix"><div class="col-sm-9 col-sm-offset-3">';
        plus +=
            '<div class="dropdown custom-dropdown i18n_language resume-dropdown">';
        plus += '<select class="mdb-select md-form colorful-select dropdown-primary" name="langName">';
        plus += '<option selected="selected" disabled>언어</option>';
        plus += '<option value="영어" >영어</option>';
        plus += '<option value="독일어" >독일어</option>';
        plus += '<option value="스페인어" >스페인어</option>';
        plus += '<option value="중국어" >중국어</option>';
        plus += '<option value="한국어" >한국어</option>';
        plus += '<option value="불어" >불어</option>';
        plus += '</select>';
        plus +=
            '</div><div class="dropdown custom-dropdown i18n_level resume-dropdown">';
        plus += '<select class="browser-default custom-select" name="langLevel">';
        plus += '<option selected="selected" disabled>수준</option>';
        plus += '<option value="유창함" >유창함</option>';
        plus += '<option value="비지니스회화" >비지니스회화</option>';
        plus += '<option value="일상대화" >일상대화</option>';
        plus += '</select>';
        plus +=
            '</div><div class="resume-list exams" ><div class="resume-list-body"></div></div></div>';
        plus +=
            '<button class="btn-delete btn btn-default" type="button" style="top:10px !important" onclick="deleteModal('+data+',4);"><i class="fas fa-times"></i></button>';
        plus +='<input type="hidden" value="'+data+'" name="langNo"/>';
        plus +='<input type="hidden" value="'+resumeNo+'" name="resumeNo"/>';
        plus +='<input type="hidden" value="'+memEmail+'" name="memEmail"/>';
        plus +='<button class="btn-save btn" type="submit" style="top:35px !important" ><i class="far fa-save"></i></button>';
        plus +='</div></li>';
        plus +='</form>';
        languages.innerHTML = plus;
        document.getElementById('languagelist').append(languages);
	            },
	            error: function(data){
	                alert(data);
	                console.log(data);
	            }
	        });
    }

    function linkplus(memEmail,resumeNo) {
	        $.ajax({
	            url: "${path}/resume/insertLink.lmc",
	            type: "POST",
	            data: {"memEmail":memEmail,"resumeNo":resumeNo},
	            success: function(data){
        var links = document.createElement('ul');
        var plus = '';
        plus +='<form action="${path }/resume/updateLinks.lmc" method="post" >';
        plus +=
            '<li class="list-group-item sortable-item links"><div class="portlet-handler"><div class="handler"></div></div><div class="link-item clearfix"><div class="resume-input-form-group"><input class="resume-input url" type="text" maxlength="300" name="linksAddr" placeholder="http://" ></div>';
        plus +=
            '<button class="btn-delete btn btn-default" type="button" style="top:-8px !important" onclick="deleteModal('+data+',5);"><i class="fas fa-times"></i></button>';
        plus +='<input type="hidden" value="'+data+'" name="linksNo"/>';
        plus +='<input type="hidden" value="'+resumeNo+'" name="resumeNo"/>';
        plus +='<input type="hidden" value="'+memEmail+'" name="memEmail"/>';
        plus +='<button class="btn-save btn" type="submit" style="top:16px !important" ><i class="far fa-save"></i></button>';
        plus +='</div></li>';
        plus +='</form>';
        links.innerHTML = plus;
        document.getElementById('linklist').append(links);
	            },
	            error: function(data){
	                alert(data);
	                console.log(data);
	            }
	        });

    }
    function deleteModal(no,index){
    $("#deleteModal").removeClass('iKzpWM');
    $("#deleteModal3").removeClass('gMLFic'); 
    $("#deleteModal").addClass('bLaSri');
    $("#deleteModal2").addClass('grXykz');
    $("#deleteModal3").addClass('emhpxA');
    $("body").addClass('stop-scrolling');
    var deleteNo=no;
    var deleteIndex=index;
    $('#deleteNo').val(deleteNo);
    $('#deleteIndex').val(deleteIndex);
    
    } 
    function  madalclose() {
    $("#deleteModal").removeClass('bLaSri');
    $("#deleteModal2").removeClass('grXykz');
    $("#deleteModal3").removeClass('emhpxA');
    $("body").removeClass('stop-scrolling'); 
    $("#deleteModal").addClass('iKzpWM');
    $("#deleteModal2").addClass('dzZUIS');
    $("#deleteModal3").addClass('gMLFic'); 
    }
    function deleteList(resumeNo){
    	var deleteNo= $('#deleteNo').val();
    	var deleteIndex = $('#deleteIndex').val();
    	location.href ="${path }/resume/deleteIndex.lmc?deleteNo="+deleteNo+"&deleteIndex="+deleteIndex+"&resumeNo="+resumeNo;
    }
    function updateCareer(careerNo){
    	$.ajax({
    		url:"${path }/resume/updateCareer",
    		type:"POST",
    		data: { },
    		success: { 
    			
    		},
    		error: {
    			
    		}
    		
    	});
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 

	