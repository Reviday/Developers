// 검색하기 로직 

var searchBtn=document.querySelector("#searchBtn");
var searchBox=document.querySelector('#searchBox');
var mainActive=document.querySelector('button.btn-outline-info.main');
var details=$('button.btn-outline-info.rest');
var activeCount=0; 
var selected = new Array;

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
            searchEvent();
        }
        if(searchBox.value!=""&&searchBox.value!=undefined){
            var searchBoxValue=searchBox.value;
        }
        if (typeof selected != 'undefined' && selected.length > 0) {
            let searchPackage= new Array;
            var selectedString=selected.toString();
            console.log("searchBox :"+searchBoxValue);
            console.log("selectedString :"+selectedString);
            console.log("값 있음");
            searchPackage.push(selectedString);
            searchBoxValue!=undefined?searchPackage.push(searchBoxValue):searchPackage.push("");
            console.log(searchPackage)
            ajaxLogic(searchPackage);

        }
    });
}

mainActive.addEventListener('click',function(e){
    mainActive.className='btn btn-outline-info main active';
    for(var i=0;i<details.length;i++){
        details[i].className='btn btn-outline-info rest';
    }
    selected=[];
    activeCount=0;
    console.log(selected);
    searchEvent()
});


searchBtn.addEventListener('click',function(){
    searchEvent();
});
searchBox.addEventListener('keypress',function(e){
    if(e.keyCode==13){
        searchEvent();
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
    ajaxLogic(searchPackage)
};

// 페이지 로딩할때 불러와야 할 것
function selectAllCards(){
    var selectedString="";
    let searchPackage= new Array;
    searchPackage.push(selectedString);
    searchPackage.push("");
    ajaxLogic(searchPackage);
};


function ajaxLogic(searchPackage){
    $.ajax({
        url:path+"/business/selectResume",
        type:"post",
        async: false,
        data:{
            "searchPackage":searchPackage
        },
        success:function(result){
            console.log(result);
            if(result!=undefined||result!=null){
                var cards=JSON.parse(result);
                console.log(cards);
                console.log(cards[0]);

                var cardsArea=$('div#cards-area');
                var cardContainer="";

                for(var i in cards){
                    cardContainer+='<div class="resume-card col-sm-10 container">';
                    cardContainer+='<div class="card"><h5 class="card-header"><img class="bus-user-profile" src="'+path+'/resources/upload/profile/no-profile-image.png"/><button class="btn btn-outline-primary" type="button">찜하기</button></h5>';
                    cardContainer+='<div class="card-body">';
                    cardContainer+='<h5 class="card-title">Special title treatment</h5>';
                    cardContainer+='<p class="card-text">'+cards[i].intro+'</p>';
                    cardContainer+='<a href="#" class="btn btn-primary">이력서 미리보기</a>';
                    cardContainer+='</div></div></div>';
    
                    $(cardsArea).html(cardContainer);
                }
            }
        }
    });
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


