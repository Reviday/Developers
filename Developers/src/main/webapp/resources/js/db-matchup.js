// 검색하기 로직 

var searchBtn=document.querySelector("#searchBtn");
var searchBox=document.querySelector('#searchBox');
var mainActive=document.querySelector('button.btn-outline-info.main');
var details=$('button.btn-outline-info.rest');
var activeCount=0; 
var selected = new Array;
var firstValue="";
var searchValue="";

for(var i=0;i<details.length;i++){  
    details[i].addEventListener('click',function(e){
        if(e.target.className=='btn btn-outline-info rest'){
            mainActive.className='btn btn-outline-info main';
            e.target.className+=' active';
            activeCount++;
            selected.push(e.target.value);
        }else if(e.target.className=='btn btn-outline-info rest active'){
            e.target.className='btn btn-outline-info rest';
            activeCount--;
            selected.splice(selected.indexOf(e.target.value),1);
        }
        console.log(activeCount);
        if(activeCount<1){
            mainActive.className='btn btn-outline-info main active';
            firstValue="";
            searchValue="";
            cPageSearch();
        }
        // if(searchBox.value!=""&&searchBox.value!=undefined){
        //     var searchBoxValue=searchBox.value;
        // }
        if (typeof selected != 'undefined' && selected.length > 0) {
            cPageSearch();
            // let searchPackage= new Array;
            // var selectedString=selected.toString();
            // console.log("값 있음");
            // searchPackage.push(selectedString);
            // searchBoxValue!=undefined?searchPackage.push(searchBoxValue):searchPackage.push("");
            // console.log(searchPackage)
            // ajaxLogic(searchPackage);
        }
    });
}

mainActive.addEventListener('click',function(e){
    mainActive.className='btn btn-outline-info main active';
    for(var i=0;i<details.length;i++){
        details[i].className='btn btn-outline-info rest';
    }
    firstValue="";
    searchValue="";
    selected=[];
    activeCount=0;
    console.log(selected);
    cPageSearch()
});


searchBtn.addEventListener('click',function(){
    cPageSearch();
});
searchBox.addEventListener('keypress',function(e){
    if(e.keyCode==13){
        cPageSearch();
    }
});

function searchEvent(){
    let searchPackage=new Array;
    let searchBoxValue=searchBox.value;
    let selected=new Array;
    let selectedString="";
    for(var i=0;i<details.length;i++){
        if(details[i].className=='btn btn-outline-info rest active'){
            selected.push(details[i].value);
        }
    }
    selectedString=selected.toString();
    searchPackage.push(selectedString);
    searchPackage.push(searchBoxValue);
    ajaxLogic(searchPackage);
};

// 페이지 로딩할때 불러와야 할 것
// function selectAllCards(){
//     var selectedString="";
//     let searchPackage= new Array;
//     searchPackage.push(selectedString);
//     searchPackage.push("");
//     ajaxLogic(searchPackage);
// };



function cPageSearch(cPage) {
    let searchPackage=new Array;
    let searchBoxValue=searchBox.value;
    seva=searchBoxValue;
    // seva.trim();
    // seva.replace(/\s{2,}/gi, ' ');
    searchValue=seva.trim().replace(/\s{2,}/gi, ' ');
    let selected=new Array;
    let selectedString="";
    for(var i=0;i<details.length;i++){
        if(details[i].className=='btn btn-outline-info rest active'){
            firstValue=details[i].value;
            console.log(firstValue);
            selected.push(details[i].value);
        }
    }
    selectedString=selected.toString();
    searchPackage.push(selectedString);
    searchPackage.push(searchBoxValue);
    searchPackage.push(cPage);
    ajaxLogic(searchPackage);
}


function ajaxLogic(searchPackage){
    $.ajax({
        url:path+"/business/selectResume",
        type:"post",
        async: false,
        data:{
            "searchPackage":searchPackage
        },
        success:function(result){
            if(result!=undefined||result!=null){
                var cards=JSON.parse(result);
                console.log(cards);
                var icList=cards.icList;
                console.log(icList);
                console.log("길이: "+icList.length);
                
                var cardsArea=$('div#cards-area');
                var cardContainer="";
                if(searchValue!=""){
                    var sValues = new Array;
                    sValues=searchValue.split(" ");
                    console.log(sValues.length);
                    for(let i=0;i<sValues.length;i++){
                        if(sValues[i]==""||sValues[i]==null||sValues[i]==undefined){
                            console.log(sValues[i]);
                            sValues.splice(sValues.indexOf(sValues[i]),1);
                        }
                    }
                    console.log(sValues);
                }
                
                cardsArea.html();
                console.log("firstValue= "+firstValue);
                console.log("searchValue= "+searchValue);
                
                if(icList.length>0){
                        cardContainer+='<div class="cardsList" style="display:inline-block; width:100%;">';
                    for(var i in icList){
                        cardContainer+='<div class="resume-card" style="margin:auto auto; width:90%; padding-top:18px; padding-bottom:15px;">';
                        cardContainer+='<div class="card"><h5 class="card-header">';
                        cardContainer+='<div id="resumeNo" style="float:left;"><small>'+icList[i].resumeNo+'</small></div>';
                        cardContainer+='<div style="float:left; margin-left:10px;"><img class="bus-user-profile" src="'+path+'/resources/upload/profile/no-profile-image.png"/></div>';
                        let userName=icList[i].memName.split("");
                        let sirName=userName.splice(0,1);
                        cardContainer+='<div id="memName" style="float:left; color:#A4A4A4; margin-left:10px; padding:7px;"><p id="sirName">'+sirName+'</p></div>';
                        cardContainer+='<div id="favBtn" style="float:right; width:18%;"><button class="btn btn-primary favBtns" id="buttonFav" style="font-size:large; margin-top:-2px;"><i class="fas fa-heart"></i>&nbsp&nbsp<p style="font-size:12px; display:inline-block";>찜하기</p></button></div></h5>';
                        cardContainer+='<div class="card-body">';
                        cardContainer+='<h5 class="card-title">';
                        cardContainer+='<div class="duty-list"><p class="duty">';

                        // 직무 
                        if(icList[i].duty.length>0){
                            for(var re in icList[i].duty){
                                if(firstValue!=""){
                                    icList[i].duty.splice(icList[i].duty.indexOf(firstValue),1);
                                    icList[i].duty.unshift(firstValue);
                                }
                                if(icList[i].duty[re]==firstValue){
                                    cardContainer+='<mark><b>'+icList[i].duty[re]+'</b></mark>';
                                }else{
                                    if(firstValue!=""){
                                        cardContainer+='&nbsp&nbsp<span class="aline">'+" | "+'</span>&nbsp&nbsp'+icList[i].duty[re];
                                    }else{
                                        if(icList[i].duty[icList[i].duty.length-1]==icList[i].duty[re]){
                                            cardContainer+=icList[i].duty[re];
                                        }else{
                                            cardContainer+=icList[i].duty[re]+'&nbsp&nbsp<span class="aline">'+" | "+'</span>&nbsp&nbsp';
                                        }
                                    }
                                }
                            }
                        }
                        cardContainer+='</p></div></h5>'
                        // 경력 / 커리어
                        let experi="";
                        experi=icList[i].experience>0?icList[i].experience+"년 경력":"신입";
                        cardContainer+='<div class="exp-career" style="display:inline-block"><p class="career-list">'+experi+'<span class="aline">'+" | "+'&nbsp</span></p></div>';
                        let careers=icList[i].careers;
                        for(var ca=0;ca<careers.length;ca++){
                            cardContainer+='<div class="career-busName exp-career" style="display:inline-block"><p>';
                            if(searchValue!=""){
                            for(var s=0;s<sValues.length;s++){
                                    if(careers[ca].busName.match(sValues[s])){  
                                    cardContainer+='<mark><b>'
                                    }
                                }
                            }
                            cardContainer+=careers[ca].busName;
                            if(searchValue!=""){
                                cardContainer+='</b></mark>';
                            }
                            cardContainer+='</p></div>';
                            
                            cardContainer+='<div class="exp-career" style="display:inline-block"><small>('+getMonths(careers[ca].startCareer,careers[ca].endCareer)+'개월)</small></div>';
                        }
                        cardContainer+='<hr>';
                        let intro=icList[i].intro!=null?icList[i].intro:"";
                        cardContainer+='<p class="card-text intro">'+intro+'</p>';

                        //스킬 
                        cardContainer+='<div class="skill-list">';
                        if (icList[i].skill.length>0){
                            for(var sk in icList[i].skill){
                                cardContainer+='<div class="showBox">';
                                if(searchValue!=""){
                                    for(var v=0;v<sValues.length;v++){
                                        if(icList[i].skill[sk].match(sValues[v])){
                                            cardContainer+='<mark><b>';
                                        }
                                    }
                                }
                                cardContainer+=icList[i].skill[sk];
                                if(searchValue!=""){
                                    cardContainer+='</b></mark>';
                                }
                                cardContainer+='</div>';
                            }
                        }
                        cardContainer+='</div><hr>';

                        // 학교 + 미리보기 버튼
                        cardContainer+='<div class="bottom row"><p class="education-list col-12 col-sm-8">';
                        let education=icList[i].educations;
                        for(var ed=0;ed<education.length;ed++){
                            if(searchValue!=""){
                                for(var u=0;u<sValues.length;u++){
                                    if(education[ed].schoolName.match(sValues[u])){
                                        cardContainer+='<mark><b>';
                                    }
                                }
                            }
                            cardContainer+=education[ed].schoolName;
                            if(searchValue!=""){
                                cardContainer+='</b></mark>';
                            }
                            cardContainer+='<span class="aline">'+" | "+'</span>';    
                            cardContainer+='<small>'+education[ed].majorName+'</small>';
                        }
                        cardContainer+='</p>'
                        // 이력서 미리보기 버튼 
                        cardContainer+='<a href="#" class="btn btn-primary favBtn openResume col-6 col-sm-4" data-toggle="modal" data-target="#openRoughResume" onclick="openResume('+icList[i].resumeNo+');">이력서 미리보기</a></div>';
                        cardContainer+='</div></div></div>';
                    }
                    cardContainer+='</div>';
                    cardContainer+='<div class="pageBar">'+cards.pageBar+'</div>';
                    cardContainer+='<script> document.querySelectorAll("button.favBtns").forEach(function(e){';
                    cardContainer+='e.addEventListener("click",function(e){';
                    cardContainer+='clickFav(e)});});</script>';
                    $(cardsArea).html(cardContainer);
                }

                if(icList.length<1){
                cardContainer+='<div class="container"><h4 id="noResult">검색 결과가 없습니다.</h4></div>';
                $(cardsArea).html(cardContainer);
                }
            }
        }
    });
}


function getMonths(startCareer,endCareer){
    var workingYears
    let startYear=parseInt(startCareer.substring(0,4));
    let endYear=parseInt(endCareer.substring(0,4));
    let startMonth=parseInt(startCareer.substring(5,6))
    let endMonth=parseInt(endCareer.substring(5,6))

    let diff=endYear-startYear;
    if(diff==0){
        workingYears=endMonth-startMonth;
    }else if(diff>0){
        workingYears=(diff*12+endMonth)-startMonth;
    }
    return workingYears;
}


// 페이지 시작과 동시에 시작되는 함수
$(function(){
    cPageSearch();
});

var info="";

// 이력서 미리보기 로직
function openResume(resumeNo){
    if(resumeNo!=""||resumeNo!=null||resumeNo!=undefined){
        $.ajax({
            url:path+"/business/openResume",
            type:"post",
            async: false,
            data:{
                "resumeNo":resumeNo
            },
            success:function(result){
                if(result!=null||result!=undefined){
                    let title=$('div#ResumeTitle');
                    let name=$('div#ResuMemName');
                    let email=$('div#ResuMemEmail');
                    let phone=$('div#ResuMemPhone');
                    let intro=$('div#ResuIntro');
                    let career=$('div#ResuCareers');
                    let education=$('div#ResuEducation');
                    info=JSON.parse(result);
                    
                    name.html('<div id="memName">'+info.memName+'</div>');
                    email.html('<div class="personalInfo">이메일: '+info.memEmail+'</div>');
                    phone.html('<div class="personalInfo">전화번호: '+info.memPhone+'</div>');
                    intro.html('<div id="memIntro">'+info.intro+'</div>');

                    let careerss="";
                    for(let i in info.careers){
                        careerss+='<div class="careerTitle" style="font-weight:bold;">경력</div>';
                        careerss+='<div class="busName">'+info.careers[i].busName+'</div>';
                        careerss+='<div><span class="aline" style="float:left; margin-left:1%; margin-right:1%;">'+" | "+'</span></div>';
                        careerss+='<div class="deptName" style="color:#6E6E6E";>'+info.careers[i].deptName+'</div>';
                        careerss+='<div class="endCareer">'+info.careers[i].endCareer+'</div>';
                        careerss+='<div class="startCareer">'+info.careers[i].startCareer+'  ~'+'</div>';
                        careerss+='<br>';
                        careerss+='<div class="careerIntro">'+info.careers[i].careerIntro+'</div>';
                        careerss+='<hr style="width:95%;">';
                    }
                    career.html(careerss);

                    let educationss="";
                    for(let i in info.educations){
                        educationss+='<div class="educationTitle" style="font-weight:bold;">학력</div>';
                        educationss+='<div class="schoolName">'+info.educations[i].schoolName+'</div>';
                        educationss+='<span class="aline" style="float:left; margin-left:1%; margin-right:1%;">'+" | "+'</span>';
                        educationss+='<div class="majorName" style="color:#6E6E6E;">'+info.educations[i].majorName+'</div>';
                        educationss+='<div class="endEd">'+info.educations[i].endEd+'</div>';
                        educationss+='<div class="startEd">'+info.educations[i].startEd+'  ~'+'</div>';
                        educationss+='<br>';
                        educationss+='<div class="subjectName">'+info.educations[i].subjectName+'</div>';
                        educationss+='<hr style="width:95%;">';
                    }
                    education.html(educationss);
                }
            }
        });   
    }
}


// 왼쪽 메뉴바 함수들 

var favBtns=document.querySelectorAll('a.list-group-item-action');
favBtns.forEach(function(e){
    e.addEventListener('click',function(){
        for(let i=0;i<favBtns.length;i++){
            favBtns[i].className="list-group-item list-group-item-action";
        }
        this.className+=' active';
    });
});

function favoriteList(){
    $.ajax({
        url:path+"/business/favoriteList",
        type:"post",
        async: false,
        data:{
        },
        success:function(result){
        }
    });
}

function openedList(){
    $.ajax({
        url:path+"/business/openedList",
        type:"post",
        async: false,
        data:{
        },
        success:function(result){
        }
    });
}

function offeredList(){
    $.ajax({
        url:path+"/business/offeredList",
        type:"post",
        async: false,
        data:{
        },
        success:function(result){
        }
    });
}


function clickFav(e){
    let resumeNo=e.target.parentNode.parentNode.firstChild.innerText;
    let flag="";
    let bcolor=e.target.style.backgroundColor;
    console.log(e);
    if(resumeNo!=""&&bcolor==""){
        flag='insert';
        e.target.style.backgroundColor='#F2F2F2';
        e.target.style.borderColor='#F2F2F2';
        e.target.firstChild.firstChild.style.color='#FF0040';
        e.target.style.color='#2E2E2E';
    }else if(resumeNo!=""&&bcolor!=""){
        flag='remove';
        e.target.style.backgroundColor='';
        e.target.firstChild.color='';
        e.target.firstChild.firstChild.style.color='';
        e.target.style.color='';
    }

    console.log(flag);

    // if(e.target.style.backgroundColor!="yellow"){
    //     $.ajax({
    //         url:path+"/business/clickFav",
    //         type:"post",
    //         async: false,
    //         data:{
    //         },
    //         success:function(result){
    //             console.log(result);
    //             if(result>0){
    //                 e.target.style.backgroundColor="yellow";
    //             }
    //         }
    //     });
    // }else{
    //     $.ajax({
    //         url:path+"/business/removeFav",
    //         type:"post",
    //         async: false,
    //         data:{
    //         },
    //         success:function(result){
    //             console.log(result);
    //             if(result>0){
    //                 e.target.style.backgroundColor="";
    //             }
    //         }
    //     });
    // }
}








// $(function(){
//     var container=$('div#db-container');

//     var matchhtml="";
//     var searchBar="";
    
//     matchhtml+='<div class="tag-header" style="background-color:#0081C7;">';
//     matchhtml+='<div class="tag-container">';
//     matchhtml+='<div class="intro-container">';
//     matchhtml+='<a class="matchup-intro" href="/bussiness/matchupintro"><h3 style="color:#FFFFFF;">매치업 소개</h3></a>';
//     // matchhtml+='<div color="#FFFFFF" class="category">개발</div>';
//     matchhtml+='</div>';
//     matchhtml+='<div class="info-container">';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">전체</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">웹 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">자바 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">서버 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">프론트엔드 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">파이썬 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">안드로이드 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">C,C++ 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">Node.js 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">데이터 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">시스템,네트워크 관리자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">개발 매니저</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">데이터 사이언티스트</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">DevOps / 시스템 관리자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">iOS 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">PHP 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">웹 퍼블리셔</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">빅데이터 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">.NET 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">QA,테스트 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">머신러닝 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">프로덕트 매니저</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">기술지원</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">임베디드 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">보안 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">CTO,Chief Technology Officer</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">하드웨어 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">블록체인 플랫폼 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">영상,음성 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">BI 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">루비온레일즈 개발자</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">그래픽스 엔지니어</button>';
//     matchhtml+='<button style="color:#FFFFFF; border-color:#FFFFFF;" class="btn btn-outline-info">CIO,Chief Information Officer</button>';
//     matchhtml+='</div>';
//     matchhtml+='</div>';
//     matchhtml+='</div>';
//     $(container).html(matchhtml);

    // searchBar+='<div class="searchBar_container">';
    // searchBar+='<div class="searchBar_main">';
    // searchBar+='<i class="icon-search"></i><span class="Span-jgvlup-0 bnVXfh">';
    // searchBar+='<input type="text" placeholder="회사명, 학교, 스킬 검색 (중복검색 가능 e.g.회사명 AND 스킬, 회사명 OR 학교)" class="Input-a6r0nv-0 vNErk" value="">';
    // searchBar+='<button color="#B5B5B5" class="Button-yctx9e-0 MatchingSearchQuery__DeleteButton-kc3z24-1 cEdQVq">';
    // searchBar+='<i class="icon-close"></i></button></span>';
    // searchBar+='<button color="#333333" type="submit" class="btn btn-outline-primary">검색</button></div>';
    // searchBar+='<div class="Div-sc-9qwds6-0 MatchingFilter__StyledMatchingFilter-a8loqs-0 gjRqTy">';
    // searchBar+='<span class="Span-jgvlup-0 MatchingFilterToggleButton__StyledMatchingFilterToggleButton-uosfie-2 fPTOJJ">';
    // searchBar+='<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">';
    // searchBar+='<span class="MatchingFilterToggleButton__ButtonText-uosfie-1 fdZUGL">경력 전체</span></button>';
    // searchBar+='<div class="dropdown-menu"><input type="range" class="custom-range dropdown-item" min="0" max="20" id="experiance"></input><p id="slider_values"></p></div>';
    // searchBar+='<span class="MatchingFilterToggleButton__Caret-uosfie-0 bCZzOa"></span></button></span></div>';
    
    // searchBar+='</div></div><div class="menubar col-8 col-md-2">';
    // searchBar+='<div class="dropdown-menu"><input type="range" class="custom-range dropdown-item" min="0" max="30" id="experiance"></input><p id="slider_values"></p></div>';
    // searchBar+='</div></div></div>';

    // searchBar+='<nav class="navbar navbar-expand-lg navbar-dark indigo mb-4">';
    // searchBar+='<a class="navbar-brand" href="#">Navbar</a>';
    // searchBar+='<div class="collapse navbar-collapse" id="navbarSupportedContent">';
    // searchBar+='<form class="form-inline ml-auto">';
    // searchBar+='<div class="md-form my-0">';
    // searchBar+='<input class="form-control" type="text" placeholder="Search" aria-label="Search">';
    // searchBar+='</div>';
    // searchBar+='<button href="#!" class="btn btn-outline-white btn-md my-0 ml-sm-2" type="submit">Search</button>';
    // searchBar+='</form>';
    // searchBar+='</div>';
    // searchBar+='</nav>';



    // searchBar+='<div class="container-fluid">';
    // searchBar+='<div class="row searchArea container" style="margin: auto auto;">';
    // searchBar+='<div class="input-group col-md-8">';
    // searchBar+='<input type="text" class="form-control" placeholder="회사명, 학교, 스킬 검색 (중복검색 가능 e.g.회사명 AND 스킬, 회사명 OR 학교)" aria-label="search-bar" aria-describedby="basic-addon2">';
    // searchBar+='<div class="input-group-append">';
    // searchBar+='<button class="btn btn-primary" type="button">검색하기</button>';
    // searchBar+='</div>';
    // searchBar+='</div>';
    // searchBar+='<div class="col-md-4>'
    // searchBar+='<div class="dropdown-menu"><input type="range" class="custom-range dropdown-item" min="0" max="30" id="experiance"></input><div id="values_area"><p id="slider_values"></p><div></div>';
    // searchBar+='</div>';
    // searchBar+='</div>';
    


//     $(container).html(searchBar);
// });


