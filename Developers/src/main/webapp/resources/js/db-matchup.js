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
    // $('div#cards-area').html("<img id='loading' src='"+path+"/resources/images/Developers_black_loading.gif' width='30px;'/>");
    $.ajax({
        url:path+"/business/selectResume",
        type:"post",
        // async: false,
        data:{
            "searchPackage":searchPackage
        },
        success:function(result){
            if(result!=undefined||result!=null){
                var cards=JSON.parse(result);
                var icList=cards.icList;                
                var cardsArea=$('div#cards-area');
                var cardContainer="";
                if(searchValue!=""){
                    var sValues = new Array;
                    sValues=searchValue.split(" ");
                    console.log(sValues.length);
                    for(let i=0;i<sValues.length;i++){
                        if(sValues[i]==""||sValues[i]==null||sValues[i]==undefined){
                            sValues.splice(sValues.indexOf(sValues[i]),1);
                        }
                    }
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
                        cardContainer+='<div id="favBtn" style="float:right; width:18%;">';
                        if(icList[i].favorite!="F"){
                            cardContainer+='<button class="btn btn-primary favBtns" id="buttonFav" style="font-size:large; margin-top:-2px; border-Color:#F2F2F2; background-Color:#F2F2F2; color:#2E2E2E;">';
                            cardContainer+='<i class="fas fa-heart" style="color:#FF0040;"></i>&nbsp&nbsp<p style="font-size:12px; display:inline-block";>찜함</p></button></div></h5>';
                        }else{
                            cardContainer+='<button class="btn btn-primary favBtns" id="buttonFav" style="font-size:large; margin-top:-2px; border-Color:#D8D8D8; background-Color:#D8D8D8; color:#FFFFFF;">';
                            cardContainer+='<i class="fas fa-heart" style="color:#FFFFFF;"></i>&nbsp&nbsp<p style="font-size:12px; display:inline-block";>찜하기</p></button></div></h5>';
                        }
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
                        let shortenIntro=intro.substring(0,20);
                        cardContainer+='<p class="card-text intro">'+shortenIntro+"..."+'</p>';

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
                        if(icList[i].educations!=null||icList[i].educations!=undefined){
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
                                if(education[ed]!=null||education[ed]!=undefined){
                                    cardContainer+=education[ed].schoolName;
                                }
                                if(searchValue!=""){
                                    cardContainer+='</b></mark>';
                                }
                                cardContainer+='<span class="aline">'+" | "+'</span>';    
                                cardContainer+='<small>'+education[ed].majorName+'</small>';
                            }
                            cardContainer+='</p>';
                        }
                        // 이력서 미리보기 버튼 
                        if(icList[i].readed=="T"){
                            cardContainer+='<a href="#" class="btn btn-outline-primary favBtn openResume col-6 col-sm-4" data-toggle="modal" data-target="#openRoughResume" onclick="openResume('+icList[i].resumeNo+","+2+');">이력서 상세보기</a></div>';
                        }else{
                            cardContainer+='<a href="#" class="btn btn-primary favBtn openResume col-6 col-sm-4" data-toggle="modal" data-target="#openRoughResume" onclick="openResume('+icList[i].resumeNo+","+1+');">이력서 미리보기</a></div>';
                        }
                        cardContainer+='</div></div></div>';
                    }
                    cardContainer+='</div>';
                    cardContainer+='<div class="pageBar">'+cards.pageBar+'</div>';
                    cardContainer+='<script>document.querySelectorAll("button.favBtns").forEach(function(e){';
                    cardContainer+='e.addEventListener("click",function(e){';
                    cardContainer+='clickFav($(this))});});</script>';
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
function openResume(resumeNo, level){
    if(resumeNo!=""||resumeNo!=null||resumeNo!=undefined){
        $.ajax({
            url:path+"/business/openResume",
            type:"post",
            async: false,
            data:{
                "resumeNo":resumeNo,
                "level":level
            },
            success:function(result){
                if(result!=null||result!=undefined){
                    let hiddenA=$('div#ResumeNo');
                    let title=$('div#ResumeTitle');
                    let name=$('div#ResuMemName');
                    let email=$('div#ResuMemEmail');
                    let phone=$('div#ResuMemPhone');
                    let intro=$('div#ResuIntro');
                    let career=$('div#ResuCareers');
                    let education=$('div#ResuEducation');
                    let resumeFooter=$('div#resumeFooter');
                    info=JSON.parse(result);
                    let userName=info.memName.split("");
                    let sirName=userName.splice(0,1);
                    let firstName=userName.join("");
                    let fn=firstName.split("");
                    for(let i=0;i<fn.length;i++){
                        fn[i]='◯ ';
                    }
                    fn=fn.join("");
                    hiddenA.html('<input type="hidden" id="hiddenResumeNo" value="'+resumeNo +'">');
                    name.html('<div id="memName" ><p style="font-size:0.9em;">'+sirName+'<span id="firstName" style="margin-left:3px;">'+fn+'</span></p></div>');
                    //결제 했을경우 안했을 경우 분기처리 해야함 
                    // info.memEmail
                    if(level>1){
                        email.html('<div class="personalInfo"><p>이메일: <span id="memEmail" style="background-color:#F7BE81; color:#FFFFFF;">후보자가 제안을 수락할 경우</span></p></div>');
                        phone.html('<div class="personalInfo"><p>연락처: <span id="memPhone" style="background-color:#F7BE81; color:#FFFFFF;">이름과 연락처를 확인할 수 있습니다.</span></p></div>');
                    }
                    if(level<2){
                        let finEmail="◯◯◯◯◯◯◯◯◯";
                        email.html('<div class="personalInfo"><p>이메일: <span id="memEmail">'+finEmail+'</span></p></div>');
                        // info.memPhone
                        let finPhone="◯◯◯◯◯◯◯◯◯";
                        phone.html('<div class="personalInfo"><p>연락처: <span id="memPhone">'+finPhone+'</span></p></div>');
                    }
                    intro.html('<div id="memIntro"><p style="color:#848484;">'+info.intro+'</p></div>');

                    let careerss="";
                    for(let i in info.careers){
                        careerss+='<div class="careerTitle" style="font-weight:bold;">경력</div>';
                        careerss+='<div class="busName">'+info.careers[i].busName+'</div>';
                        careerss+='<div><span class="aline" style="float:left; margin-left:1%; margin-right:1%;">'+" | "+'</span></div>';
                        careerss+='<div class="deptName" style="color:#6E6E6E";>'+info.careers[i].deptName+'</div>';
                        let endDate=info.careers[i].endCareer
                        endDate=endDate.slice(0,4)+"."+endDate.slice(4,6);
                        let startDate=info.careers[i].startCareer
                        startDate=startDate.slice(0,4)+"."+startDate.slice(4,6);
                        careerss+='<div class="endCareer">'+endDate+'</div>';
                        careerss+='<div class="startCareer">'+startDate+'  ~'+'</div>';
                        careerss+='<br>';
                        let finalCareer="";
                        info.careers[i].careerIntro!=null?finalCareer=info.careers[i].careerIntro:finalCareer="";
                        if(finalCareer!=""&&finalCareer.slice(0,1)=="♥"){
                            careerss+='<div class="careerIntro"><p id="careerIntro" style="width:fit-content;background-color:#D8D8D8;color:#D8D8D8;">'+finalCareer+'</p></div>';
                        }else{
                            careerss+='<div class="careerIntro"><p id="careerIntro">'+finalCareer+'</p></div>';
                        }
                        careerss+='<hr style="width:95%;">';
                    }
                    career.html(careerss);

                    let educationss="";
                    for(let i in info.educations){
                        educationss+='<div class="educationTitle" style="font-weight:bold;">학력</div>';
                        educationss+='<div class="schoolName">'+info.educations[i].schoolName+'</div>';
                        educationss+='<span class="aline" style="float:left; margin-left:1%; margin-right:1%;">'+" | "+'</span>';
                        educationss+='<div class="majorName" style="color:#6E6E6E;">'+info.educations[i].majorName+'</div>';
                        let endDate=info.educations[i].endEd
                        endDate=endDate.slice(0,4)+"."+endDate.slice(4,6);
                        let startDate=info.educations[i].startEd
                        startDate=startDate.slice(0,4)+"."+startDate.slice(4,6);
                        educationss+='<div class="endEd">'+endDate+'</div>';
                        educationss+='<div class="startEd">'+startDate+'  ~'+'</div>';
                        educationss+='<br>';
                        let finalEd="";
                        info.educations[i].subjectName!=null?finalEd=info.educations[i].subjectName:finalEd="";
                        if(finalEd!=""&&finalEd.slice(0,1)=="♥"){
                            educationss+='<div class="subjectName"><p id="subjectName" style="width:fit-content;background-color:#D8D8D8;color:#D8D8D8;">'+finalEd+'</p></div>';
                        }else{
                            educationss+='<div class="subjectName"><p id="subjectName">'+finalEd+'</p></div>';
                        }
                        
                        educationss+='<hr style="width:95%;">';
                    }
                    education.html(educationss);

                    let resFooter="";
                    if(level>1){
                        resFooter+='<div class="footer-intro col-12 col-sm-9" style="color: #fff; margin:auto auto;"><p style="font-size:20px;">경력과 학력 확인 후 면접 제안을 할 수 있습니다.</p></div>';
                        resFooter+='<div class="resumePayment col-12 col-sm-3"><button type="button" id="offerInterview" color="#258BF7" class="btn btn-primary"  onclick="offerInterview();">면접 제안하기</button></div>';
                    }
                    if(level<2){
                        resFooter+='<div class="footer-intro col-12 col-sm-9" style="color: #fff; margin:auto auto;"><p style="font-size:20px;">이력서 상세보기 시, 열람권 1회가 차감됩니다.</p></div>';
                        resFooter+='<div class="resumePayment col-12 col-sm-3"><button type="button" id="useTicket" color="#258BF7" class="btn btn-primary"  onclick="useTicket();">이력서 상세보기</button></div>';
                    }
                    resumeFooter.html(resFooter);
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

// 찜하기 불러오기
function favoriteList(cPage){
    // $('div#cards-area').html("<img src='"+path+"/resources/images/Developers_black_loading.gif' width='30px;'/>");
    $.ajax({
        url:path+"/business/favoriteList",
        type:"post",
        async: false,
        data:{
            "cPage":cPage
        },
        success:function(result) {
        if(result!=undefined||result!=null){
            document.querySelector('#searchBox').setAttribute("disabled","disabled");
            document.querySelector('#searchBtn').setAttribute("disabled","disabled");
            let rest=document.querySelectorAll('button.btn-outline-info');
            for(let i=0;i<rest.length;i++){
                rest[i].setAttribute("disabled","disabled");
            }
            var cards=JSON.parse(result);
            var cardsArea=$('div#cards-area');
            var cardContainer="";
            if(cards!="F"){
                var icList=cards.icList;                
                cardsArea.html();
                if(icList.length>0){
                    cardContainer+='<div class="cardsList" style="display:inline-block; width:100%;">';
                    for(var i in icList){
                        cardContainer+='<div class="resume-card" style="margin:auto auto; width:90%; padding-top:18px; padding-bottom:15px;">';
                        cardContainer+='<div class="card"><h5 class="card-header">';
                        cardContainer+='<div id="resumeNo" style="float:left;"><small>'+icList[i].resumeNo+'</small></div>';
                        cardContainer+='<div style="float:left; margin-left:10px;"><img class="bus-user-profile" src="'+path+'/resources/upload/profile/no-profile-image.png"/></div>';
                        let userName=icList[i].memName.split("");
                        let sirName=userName.splice(0,1);
                        cardContainer+='<div id="memName" style="float:left; color:#A4A4A4; margin-left:10px; padding:7px;"><p id="sirName" style="font-size:15px;">'+sirName+'</p></div>';
                        cardContainer+='<div id="favBtn" style="float:right; width:18%;">';
                        if(icList[i].favorite!="F"){
                            cardContainer+='<button class="btn btn-primary favBtns" id="buttonFav" style="font-size:large; margin-top:-2px; border-Color:#F2F2F2; background-Color:#F2F2F2; color:#2E2E2E;">';
                            cardContainer+='<i class="fas fa-heart" style="color:#FF0040;"></i>&nbsp&nbsp<p style="font-size:15px; display:inline-block";>찜함</p></button></div></h5>';
                        }else{
                            cardContainer+='<button class="btn btn-primary favBtns" id="buttonFav" style="font-size:large; margin-top:-2px; border-Color:#D8D8D8; background-Color:#D8D8D8; color:#FFFFFF;">';
                            cardContainer+='<i class="fas fa-heart" style="color:#FFFFFF;"></i>&nbsp&nbsp<p style="font-size:12px; display:inline-block";>찜하기</p></button></div></h5>';
                        }
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
                        let shortenIntro=intro.substring(0,20);
                        cardContainer+='<p class="card-text intro">'+shortenIntro+"..."+'</p>';
                        
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
                        if(icList[i].readed=="T"){
                            cardContainer+='<a href="#" class="btn btn-outline-primary favBtn openResume col-6 col-sm-4" data-toggle="modal" data-target="#openRoughResume" onclick="openResume('+icList[i].resumeNo+","+2+');">이력서 상세보기</a></div>';
                        }else{
                            cardContainer+='<a href="#" class="btn btn-primary favBtn openResume col-6 col-sm-4" data-toggle="modal" data-target="#openRoughResume" onclick="openResume('+icList[i].resumeNo+","+1+');">이력서 미리보기</a></div>';
                        }
                        cardContainer+='</div></div></div>';
                    }
                    cardContainer+='</div>';
                    cardContainer+='<div class="pageBar">'+cards.pageBar+'</div>';
                    cardContainer+='<script>document.querySelectorAll("button.favBtns").forEach(function(e){';
                    cardContainer+='e.addEventListener("click",function(e){';
                    cardContainer+='clickFav($(this))});});</script>';
                    $(cardsArea).html(cardContainer);
                }
            }
            else{
                cardContainer+='<div class="container"><h4 id="noResult">검색 결과가 없습니다.</h4></div>';
                $(cardsArea).html(cardContainer);
            }
        }
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

// 찜하기 로직
function clickFav(e){
    let resumeNo;
    if(parseInt(e[0].parentNode.parentNode.firstChild.innerText)>0){
        resumeNo=e[0].parentNode.parentNode.firstChild.innerText;
    }else{
        resumeNo=-1;
    }
    let flag="";
    let innerText=e[0].children[1].innerText
    if(innerText=='찜하기'&&resumeNo>-1){
        flag=1;
    }else if(innerText=='찜함'&&resumeNo>-1){
        flag=-1;
    }
        $.ajax({
        url:path+"/business/clickFav",
        type:"post",
        async: false,
        data:{
            "resumeNo":resumeNo,
            "flag":flag
        },
        success:function(result){
            if(result>0){
                e[0].style.backgroundColor='#F2F2F2';
                e[0].style.borderColor='#F2F2F2';
                e[0].firstChild.firstChild.style.color='#FF0040';
                e[0].children[1].innerText='찜함';
                e[0].style.color='#2E2E2E';
            }else{
                e[0].style.backgroundColor='#D8D8D8';
                e[0].firstChild.color='#D8D8D8';
                e[0].firstChild.firstChild.style.color='#FFFFFF';
                e[0].children[1].innerText='찜하기';
                e[0].style.color='#FFFFFF';
            }
        }
    });
}


$(function(){
    updateNumOfTicket();
})

function updateNumOfTicket(){
    let num=getNumOfTicket();
    // let num=0;
    let ticketA="";
    if(num>0){
        $('div#ticketArea').html();
        ticketA='<div class="numOfTicket_area" style="background-color: #8000FF; border-color:#8000FF; width:90%; height:4.3em; margin:auto; color:#FFFFFF; ; border-radius:3px 3px 3px 3px;"><p style="font-size:17px;padding-top:1.1em;">남은 열람권 갯수 : <span style="font-weight:bold;">'+num+'</span> 개</p></div>';
        $('div#ticketArea').html(ticketA);
    }else{
        $('div#ticketArea').html();
        ticketA='<button class="btn btn-success" id="toTicketMo" style="background-color: #8000FF; border-color: #8000FF; font-size:17px;" onclick="toTicketModal();">열람권 결제하기</button>';
        $('div#ticketArea').html(ticketA);
    }
}

function getNumOfTicket(){
    let num=0;
    $.ajax({
        url:path+"/business/numOfTicket",
        type:"post",
        async: false,
        data:{
        },
        success:function(result){
            JSON.parse(result);
            console.log(result);
            num=result;
        }
    });
    return num;
}

function toTicketModal(){
    $('#ticketModal').modal('show');
}

var checkBox=document.querySelectorAll(".custom-control-input");
var checkLabel=document.querySelectorAll(".custom-control-label");



    checkLabel[0].addEventListener("click",function(e){
        if(checkBox[0].checked!=true){
            document.querySelector('.left-side').style.background='#E0ECF8';
            document.querySelector('.left-side').style.border='1.5px solid #2E64FE';
            document.querySelector('.right-side').style.background="";
            document.querySelector('.right-side').style.border="";
            checkBox[1].checked=false;
            document.querySelector('#ticket-pay').removeAttribute("disabled");
            document.querySelector('#ticket-pay').style.borderColor='#2E64FE';
            document.querySelector('#ticket-pay').style.backgroundColor='#2E64FE';
            document.querySelector("#hiddenType").value=0;
        }
        if(checkBox[0].checked==true){
            document.querySelector('.left-side').style.background="";
            document.querySelector('.left-side').style.border="";
            document.querySelector('.right-side').style.background="";
            document.querySelector('.right-side').style.border="";
            document.querySelector('#ticket-pay').setAttribute("disabled","disabled");
            document.querySelector('#ticket-pay').style.borderColor='#F2F2F2';
            document.querySelector('#ticket-pay').style.backgroundColor='#F2F2F2';
            document.querySelector("#hiddenType").value="";
        }
    });   
    checkLabel[1].addEventListener("click",function(e){
        if(checkBox[1].checked!=true){
            document.querySelector('.right-side').style.background='#ECE0F8';
            document.querySelector('.right-side').style.border='1.5px solid #7401DF';
            document.querySelector('.left-side').style.background="";
            document.querySelector('.left-side').style.border="";
            checkBox[0].checked=false;
            document.querySelector('#ticket-pay').removeAttribute("disabled");
            document.querySelector('#ticket-pay').style.borderColor='#7401DF';
            document.querySelector('#ticket-pay').style.backgroundColor='#7401DF';
            document.querySelector("#hiddenType").value=2;
        }
        if(checkBox[1].checked==true){
            document.querySelector('.right-side').style.background="";
            document.querySelector('.right-side').style.border="";
            document.querySelector('.left-side').style.background="";
            document.querySelector('.left-side').style.border="";
            document.querySelector('#ticket-pay').setAttribute("disabled","disabled");
            document.querySelector('#ticket-pay').style.borderColor='#F2F2F2';
            document.querySelector('#ticket-pay').style.backgroundColor='#F2F2F2';
            document.querySelector("#hiddenType").value="";
        }
    });   


    // 열람권 결제 로직 
    function fn_payment(){
		var finalPrice=0;
        var packageType="";
        var num=0;
        var msg="";
        let hiddenType=document.querySelector('#hiddenType').value;
        if(hiddenType>0){
            packageType="고급 패키지";
            finalPrice=500000;
            num=50;
        }else{
            packageType="기본 패키지";
            finalPrice=300000;
            num=20;
        }
        console.log(hiddenType);
	   var IMP = window.IMP;
	   IMP.init('iamport');
	   IMP.request_pay({
		   pg : 'html5_inicis',
		   pay_method : 'vbank',
		   merchant_uid : 'merchant_' + new Date().getTime(),
		   name : packageType,
		   amount : finalPrice,
		   buyer_email : memEmail,
		   buyer_name : memName,
		   buyer_tel : memPhone,
		   buyer_addr : "",
		   buyer_postcode :""
	   }, function(rsp) {
		   if ( rsp.success ) {
			$.ajax({
				url:path+"/business/packagePay",
				type:"post",
				async:false,
				data:{
					"numOfTicket":num
				},
				success:function(result){
					msg=JSON.parse(result);
				}
			});
			//   location.href="${path}/business/paySuccess?adType="+adType+"&days="+adLength+"&positionNo="+positionNumber;
			  alert(msg);
			  location.reload()
		   } 
		});
	};

        

function useTicket(){
    let num=getNumOfTicket();
    if(num<1){
        $("#openRoughResume").modal("hide");
        toTicketModal();
    }else{
        $.ajax({
            url:path+"/business/useTicket",
            type:"post",
            async: false,
            data:{
            },
            success:function(result){    
                let type=JSON.parse(result);            
                if(type=="T"){
                    let resumeNo=document.querySelector("#hiddenResumeNo").value;
                    let res=insertReaded(resumeNo);
                    console.log(res);
                    let temp=JSON.parse(res);
                    if(res.msg!="T"){
                        alert(res.msg);
                    }else if(res.msg=="T"&&res.applNo!=null){
                        updateNumOfTicket();
                        alert("열람권 1개를 사용하셨습니다. 남은 갯수 : "+(num-1)+"개");
                        openResume(resumeNo,2);
                    }
                }else{
                    alert(result);
                }
            }
        });
    }
}


function insertReaded(resumeNo){
    let res="";
    $.ajax({
        url:path+"/business/insertToReaded",
        type:"post",
        async: false,
        data:{
            "resumeNo":resumeNo
        },
        success:function(result){ 
            res=JSON.parse(result);
        }
    });
    return res;
}


// checkBox.forEach(function(e){
//     e.addEventListener("click",function(e){
//         console.log(e);
//     })
// });










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


