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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="메인 화면"/> 
</jsp:include>
<div style="height: 70px;" ></div>
<div class="section">
    <div id="app">
        <main class="App-iEDHGk UeTOO" data-reactid=".0">
            <div data-reactid=".0.0">
                <div data-reactid=".0.0.0">
                    <div id="resume-app" class="react-container background-white">
                        <div class="container">
                            <div id="resume-detail" class="" >
                                <div class="resume-toolbar" >
                                    <div class="resume-select-lang ko" ><i
                                            class="icon-ic-language" ></i><select
                                            class="resume-lang" >
                                            <option selected="" value="ko" >한국어
                                            </option>
                                            <option value="ja" >日本語</option>
                                            <option value="tw" >繁體中文</option>
                                            <option value="en" >English
                                            </option>
                                        </select><i class="icon-arrow_bottom_fill"
                                            ></i></div>

                                    <div class="other-btns" ><button
                                            class="border-primary hidden-xs btn btn-default" type="button"
                                           >임시 저장</button><button
                                            class="hidden-xs btn btn-primary" type="button"
                                           >작성 완료</button><button
                                            class="border-gray btn btn-default" type="button"
                                            ><i class="fas fa-download"></i></button>
                                    </div>
                                </div>
                                <div class="Box-cwadsP iKzpWM" id="deleteModal">
                                    <div width="40" class="Content-zwkXZ dzZUIS" id="deleteModal2">
                                        <div class="Div-hTZHGu fEVoGZ" id=".0.3.0.$/=11"> 
                                            <p class="Confirm__ConfirmMessage-fNOBqL cHGGot"
                                                id=".0.3.0.$/=11.0">삭제하시겠습니까?</p>
                                        </div>
                                        <div class="Div-hTZHGu dXKeOh" ><button
                                                color="#B5B5B5" class="Button-kDSBcD hzWWar"
                                                onclick="madalclose();">닫기</button><button color="#258BF7"
                                                class="Button-kDSBcD ebVQvc" id="deleteList(1);">확인</button>
                                        </div>
                                    </div>
                                    <div class="Overlay-iWuiZb gMLFic" id="deleteModal3"></div>
                                </div>
                                <div class="resume-basic-info" >
                                    <div class="resume-input-form-group" ><input
                                            class="resume-input name" type="text" maxlength="100" placeholder="이름"
                                            value="${resumeMem.memName }" ></div>
                                    <div class="resume-input-form-group" ><input
                                            class="resume-input email" type="text" maxlength="120" placeholder="이메일(필수)"
                                            value="${resumeMem.memEmail }" ></div>
                                    <div class="resume-input-form-group" >
                                    <c:if test="${resumeMem.memPhone==null }">
                                    <input class="resume-input mobile" type="text" maxlength="200"
                                            placeholder="연락처(필수) ex) 010-0000-0000" >
                                    </c:if>
                                    <c:if test="${resumeMem.memPhone!=null }">
                                     <input class="resume-input mobile" type="text" maxlength="200"
                                         value="${resumeMem.memPhone }"   placeholder="연락처(필수) ex) 010-0000-0000" >
                                    </c:if>
                                    </div>
                                    <div class="resume-input-form-group" >
                                        <div class="dynamic-textarea" ><textarea
                                                style="height:34px;" class="resume-input about" maxlength="2000"
                                                placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)"
                                                ></textarea><textarea
                                                class="textarea-clone" readonly="" data-reactid=".0.0.0.0.0.0.1.3.0.1"
                                                style="top: 0px; left: 0px; width: 1060px; padding: 0px; font-size: 16px; line-height: 22.8571px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="resume-lists" >
                                    <div class="resume-list careers" >
                                        <div class="resume-list-header" ><span
                                                data-reactid=".0.0.0.0.0.0.2.0.0.0">경력</span></div>
                                        <div class="resume-list-body" >
                                       <c:set value="${loginMember.memEmail }" var="memEmail"></c:set>
                                        <button
                                                class="btn-add btn btn-default" type="button" onclick="careersplus('${memEmail }');"
                                                >+
                                                추가</button>
                                            <div id="careerslist">



                                            </div>

                                        </div>
                                    </div>
                                    <div class="resume-list educations" >
                                        <div class="resume-list-header" ><span
                                                data-reactid=".0.0.0.0.0.0.2.1.0.0">학력</span></div>
                                        <div class="resume-list-body" ><button
                                                class="btn-add btn btn-default" type="button"
                                                onclick="educationsplus();">+ 추가</button>
                                            <div id="educationslist">



                                            </div>


                                        </div>
                                    </div>
                                    <div class="resume-list activities" >
                                        <div class="resume-list-header" ><span
                                                >수상 및 기타</span></div>
                                        <div class="resume-list-body" ><button
                                                class="btn-add btn btn-default" type="button"
                                                onclick="activetiesplus();">+ 추가</button>
                                            <div id="activitieslist">



                                            </div>
                                        </div>
                                    </div>
                                    <div class="resume-list language_certs" >
                                        <div class="resume-list-header" ><span
                                               >외국어</span></div>
                                        <div class="resume-list-body" ><button
                                                class="btn-add btn btn-default" type="button"
                                                onclick="languageplus();">+ 추가</button>
                                            <div id="languagelist">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="resume-list links" >
                                        <div class="resume-list-header" ><span
                                                >링크</span></div>
                                        <div class="resume-list-body" ><button
                                                class="btn-add btn btn-default" type="button" onclick="linkplus();">+
                                                추가</button>
                                            <div id="linklist">

                                            </div>
                                        </div>
                                    </div>
                                </div><span ></span>
                                <div class="resume-toolbar fixed-bottom visible-xs" >
                                    <div class="other-btns" >
                                        <div ><button
                                                class="border-primary btn btn-default" type="button"
                                                >임시 저장</button></div>
                                        <div ><button type="button"
                                                class="btn btn-primary" >작성
                                                완료</button></div>
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

<script>
    var i=1;
    function careersplus(memEmail) {
        $.ajax({
        	url: "${path}/resume/insertCareer.do",
            type: "POST",
            data: {"memEmail":memEmail},
            success: function(data){
        var careers = document.createElement('ul');
        var plus = '';
        plus +=
            '<ul class="list-group sortable-list careers" ><li class="list-group-item sortable-item careers"><div class="portlet-handler"><div class="handler" ></div></div><div class="career-item clearfix">';
        plus +=
            '<div class="col-sm-3"><div class="period" >';
        plus +=
            '<div class="datetime"><div class="start-time" ><div class="form-group">';
        plus +=
            '<input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +
            "''" + ');"/>';
        plus += '</div><div class="form-group" >';
        plus += '</div></span></div>';
        plus +=
            '<div class="end-time" ><span class="delimiter" >-</span><div class="form-group">';
        plus +=
            '<input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM"  onKeyup="this.value=this.value.replace(/[^0-9]/g,' +
            "''" +
            ');/></div><div class="form-group" ></div></span></div></div><div class="form-group" ></div></div></div><div class="col-sm-9"><div class="search-input-box resume-input-form-group"><form action="." ><input type="search" class="resume-input company_name" placeholder="회사명" ></form></div><div class="resume-input-form-group"><input class="resume-input title" type="text" maxlength="255" placeholder="부서명/직책" ></div>';
        plus +=
            '<div class="resume-list projects" ><div class="resume-list-body"></div></div></div>';
        plus += '<button class="btn-delete btn"  onclick="deleteModal('+1+');">';
        plus += '<i class="fas fa-times"></i></button></div></li></ul>';
        careers.innerHTML = plus;
        document.getElementById('careerslist').append(careers);
        },
            error: function(data){
                alert(data);
                console.log(data);
            }
        });
        
    }
    function educationsplus() {
        var educations = document.createElement('ul');
        var plus = '';
        plus +=
            '<ul class="list-group sortable-list educations" ><li class="list-group-item sortable-item educations"><div class="portlet-handler">';
        plus +=
            '<div class="handler"></div></div><div class="education-item clearfix" ><div class="col-sm-3"><div class="period"><div class="datetime"><div class="start-time"><div class="form-group">';
        plus +=
            '<input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +
            "''" + ');"/>';
        plus += '</div><div class="form-group" >';
        plus +=
            '</div><div class="end-time" ><span class="delimiter" >-</span><div class="form-group" >';
        plus +=
            '<input type="text" maxlength="6" value="" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +
            "''" + ');"/>';
        plus +=
            '</div><div class="form-group" ></div></span></div></div><div class="form-group"></div></div></div></div><div class="col-sm-9"><div class="search-input-box resume-input-form-group"><form action="."><input type="search" class="resume-input school_name" placeholder="학교명"></form></div><div class="search-input-box resume-input-form-group"><form action="."><input type="search" class="resume-input major" placeholder="전공 및 학위 (ex: 경영학과 학사)"></form></div><div class="resume-input-form-group"><div class="dynamic-textarea"><textarea style="height:34px;" class="resume-input description" maxlength="1000" placeholder="이수과목 또는 연구내용"></textarea><textarea class="textarea-clone" readonly="" style="top: 0px; left: 0px; width: 750px; padding: 0px; font-size: 14px; line-height: 22.4px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">이수과목 또는 연구내용</textarea></div></div></div>';
        plus +=
            '<button class="btn-delete btn btn-default" type="button" onclick="deleteModal('+1+');"><i class="fas fa-times"></i></button></div></li></ul>';
        educations.innerHTML = plus;
        document.getElementById('educationslist').append(educations);
    }
    function activetiesplus() {
        var activities = document.createElement('ul');
        var plus = '';
        plus +=
            '<ul class="list-group sortable-list activities"><li class="list-group-item sortable-item activities" ><div class="portlet-handler"><div class="handler" ></div></div><div class="activity-item clearfix"><div class="col-sm-3"><div class="period"><div class="datetime"><div class="start-time"><div class="form-group">';
        plus +=
            '<input type="text" maxlength="6" class="year form-control" placeholder="YYYYMM" onKeyup="this.value=this.value.replace(/[^0-9]/g,' +
            "''" + ');"/>';
        plus +=
            '</div><div class="form-group"></div></span></div></div></div></div><div class="col-sm-9"><div class="resume-input-form-group"><input class="resume-input title" type="text" maxlength="255" placeholder="활동명"></div><div class="resume-input-form-group"><div class="dynamic-textarea"><textarea style="height:34px;" class="resume-input description" maxlength="1000" placeholder="세부사항"></textarea><textarea class="textarea-clone" readonly="" style="top: 0px; left: 0px; width: 576px; padding: 0px; font-size: 14px; line-height: 22.4px; font-weight: 400; position: absolute; visibility: hidden; z-index: -9999; height: 0px;">세부사항</textarea></div></div></div>';
        plus +=
            '<button class="btn-delete btn btn-default" type="button" onclick="deleteModal('+1+');"><i class="fas fa-times"></i></button></div></li></ul>';
        activities.innerHTML = plus;
        document.getElementById('activitieslist').append(activities);
    }
    function languageplus() {
        var languages = document.createElement('ul');
        var plus = '';
        plus +=
            '<ul class="list-group sortable-list languages"><li class="list-group-item sortable-item languages"><div class="portlet-handler"><div class="handler"></div></div><div class="lang-item clearfix"><div class="col-sm-9 col-sm-offset-3">';
        plus +=
            '<div class="dropdown custom-dropdown i18n_language resume-dropdown">';
        plus += '<select class="mdb-select md-form colorful-select dropdown-primary">';
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
        plus += '<select class="browser-default custom-select">';
        plus += '<option selected="selected" disabled>수준</option>';
        plus += '<option value="유창함" >유창함</option>';
        plus += '<option value="비지니스회화" >비지니스회화</option>';
        plus += '<option value="일상대화" >일상대화</option>';
        plus += '</select>';
        plus +=
            '</div><div class="resume-list exams" ><div class="resume-list-body"></div></div></div>';
        plus +=
            '<button class="btn-delete btn btn-default" type="button" onclick="deleteModal('+1+');"><i class="fas fa-times"></i></button></div></li></ul>';
        languages.innerHTML = plus;
        document.getElementById('languagelist').append(languages);
    }

    function linkplus() {
        var links = document.createElement('ul');
        var plus = '';
        plus +=
            '<ul class="list-group sortable-list links" ><li class="list-group-item sortable-item links"><div class="portlet-handler"><div class="handler"></div></div><div class="link-item clearfix"><div class="resume-input-form-group"><input class="resume-input url" type="text" maxlength="300" placeholder="http://" ></div>';
        plus +=
            '<button class="btn-delete btn btn-default" type="button" onclick="deleteModal('+1+');"><i class="fas fa-times"></i></button></div></li></ul>';
        links.innerHTML = plus;
        document.getElementById('linklist').append(links);

    }
    function deleteModal(i){
    $("#deleteModal").removeClass('iKzpWM');
    $("#deleteModal3").removeClass('gMLFic'); 
    $("#deleteModal").addClass('bLaSri');
    $("#deleteModal2").addClass('grXykz');
    $("#deleteModal3").addClass('emhpxA');
    $("body").addClass('stop-scrolling');
    
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
    function deleteList(i){
        
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 

	