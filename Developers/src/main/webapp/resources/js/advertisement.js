var category="";
var main="";



// 메뉴바 클릭했을 시 
var favBtns=document.querySelectorAll('a.list-group-item-action');
favBtns.forEach(function(e){
    e.addEventListener('click',function(){
        for(let i=0;i<favBtns.length;i++){
            favBtns[i].className="list-group-item list-group-item-action";
        }
        this.className+=' active';
    });
});

function categoryAd(category){
    favBtns[1].className="list-group-item list-group-item-action active";
    favBtns[0].className="list-group-item list-group-item-action";
    favBtns[2].className="list-group-item list-group-item-action"
    ajaxLogic(category);
}

function mainAd(main){
    favBtns[2].className="list-group-item list-group-item-action active";
    favBtns[0].className="list-group-item list-group-item-action";
    favBtns[1].className="list-group-item list-group-item-action"
    ajaxLogic(main);
}



function ajaxLogic(flag){
    console.log(flag);
    $('div#cards-area').html("<img id='loading' src='"+path+"/resources/images/Developers_black_loading.gif' width='30px;'/>");
    $.ajax({
        url:path+"/business/selectPositionInfo",
        type:"post",
        // async: false,
        data:{
            "flag":flag
        },
        success:function(result){
            var resultMap=JSON.parse(result);
        AdArea=$('div#ad-area');
        AdArea.html();
        AdCon="";
        if(resultMap.flag!="main"){
            // category 상단 광고 
            var polist=resultMap.polist;
            AdCon+='<div>';
            AdCon+='<div class="accordion" id="accordionExample" style="padding-top:2em;">';
            AdCon+='<div class="card">';
            AdCon+='<div class="card-header" id="headingOne">';
            AdCon+='<h2 class="mb-0">';
            AdCon+='<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">';
            AdCon+='<div class="firstRow"><p class="steps" style="display:inline-block;">1단계</p><p class="stepText" style="display:inline-block; margin-left:5em; font-weight:bold;">광고를 노출할 방문자의 직무를 선택</p></div>';
            AdCon+='</button>';
            AdCon+='</h2>';
            AdCon+='</div>';
            AdCon+='<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">';
            AdCon+='<div class="card-body" style="overflow:scroll; height:200px;">';
            AdCon+='<div><p style="text-align:center; color:#848484;">채용 포지션 등록시 선택한 직무 목록입니다. 현재 채용 중인 포지션이 있는 직무에 광고를 할 수 있습니다.</p></div><hr>';
            if(polist!=undefined||polist!=null||polist!=""){
                for(let i=0;i<polist.length;i++){
                    let deadDate=polist[i].deadDate;
                    let year=new Date(deadDate).getFullYear()+"년 ";
                    let month=(new Date(deadDate).getMonth()+1)+"월 ";
                    let day=new Date(deadDate).getDate()+"일";
                    let positionName=polist[i].position;
                    AdCon+='<div class="selectPosition" style="display:flex; background-color:#FAFAFA; border:1px solid #BDBDBD; padding:10px; border-radius:15px 15px 15px 15px;"><small style="width:20%">'+(i+1)+'</small>';
                    AdCon+='<p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:10px; padding:3px; margin-right:3%;">등록한 포지션</p>';
                    AdCon+='<p style="width:25%;">'+positionName+'</p>';
                    AdCon+='<p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:10px; padding:3px; margin-right:3%;">등록 기간</p>';
                    if(new Date(deadDate).getFullYear()>=2099){
                        AdCon+='<p style="width:25%;">상시 모집 중</p>';
                    }else{
                        AdCon+='<p style="width:25%;">'+year+month+day+' 까지</p>';
                    }
                    AdCon+='</a></div><hr>';
                }
            }else{
                AdCon+='<div class="noPosition"><p stlye="text-align:center; padding:6em;">현재 채용 중이거나, 승인 신청 중인 포지션이 없습니다. <br>왼쪽 상단의 포지션 등록하기를 이용해보세요.</p></div>'
            }
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='<div class="card">';
            AdCon+='<div class="card-header" id="headingTwo">';
            AdCon+='<h2 class="mb-0">';
            AdCon+='<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">';
            AdCon+='<div class="secondRow"><p class="steps" style="display:inline-block;">2단계</p><p class="stepText" style="display:inline-block; margin-left:5em; font-weight:bold;">광고 일정 선택</p></div>';
            AdCon+='</button>';
            AdCon+='</h2>';
            AdCon+='</div>';
            AdCon+='<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">';
            AdCon+='<div class="card-body">';
            AdCon+='<div><p style="text-align:center; color:#848484;">필요한 기간만큼 선택하세요. 최대 4주 선택 가능합니다.</p></div><hr>';
            AdCon+='<div class="input-group mb-3">';
            AdCon+='<div class="input-group-prepend">';
            AdCon+='<label class="input-group-text" for="inputGroupSelect01" style="font-size:14px;">기간 선택</label>';
            AdCon+='</div>';
            AdCon+='<select class="custom-select" id="inputGroupSelect01" style="height:3em; font-size:15px;">';
            AdCon+='<option class="options" value="0" selected>선택</option>';
            AdCon+='<option class="options" value="7">7일</option>';
            AdCon+='<option class="options" value="14">14일</option>';
            AdCon+='<option class="options" value="21">21일</option>';
            AdCon+='<option class="options" value="29">29일</option>';
            AdCon+='</select>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='<div class="card">';
            AdCon+='<div class="card-header" id="headingThree">';
            AdCon+='<h2 class="mb-0">';
            AdCon+='<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">';
            AdCon+='<div class="thirdRow"><p class="steps" style="display:inline-block;">3단계</p><p class="stepText" style="display:inline-block; margin-left:5em; font-weight:bold;">광고 금액 확인 및 결제</p></div>';
            AdCon+='</button>';
            AdCon+='</h2>';
            AdCon+='</div>';
            AdCon+='<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">';
            AdCon+='<div class="card-body">';
            AdCon+='<div><p style="text-align:center; color:#848484;">신중한 확인 후 결재 바랍니다.</p></div><hr>';
            AdCon+='<div class="";>';
            AdCon+='<div id="explanation" style="text-align:center";><p><b>광고 비용</b><hr>[ 7일 ] &nbsp&nbsp&nbsp<small>150,000원</small> <hr>[ 14일 ] &nbsp&nbsp&nbsp<small>290,000원</small> <hr>[ 21일 ] &nbsp&nbsp&nbsp<small>430,000원</small> <hr>[ 29일 ] &nbsp&nbsp&nbsp<small>520,000원</small></div>';
            AdCon+='<div id="bottom-info" style="padding:2em; text-align:-webkit-center;"><div>';
            AdCon+='<p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">노출 직무</p></div>';
            AdCon+='<input class="poName" id="positionName" disabled>';
            AdCon+='<div><p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">등록 기간</p></div>';
            AdCon+='<input class="untilWhen" id="until" disabled>';
            AdCon+='<div><p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">노출 일 수</p></div>';
            AdCon+='<input class="adUntil" id="adDate" disabled>';
            AdCon+='<div><p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">노출 위치</p></div>';
            AdCon+='<input id="adType" value="직무 페이지 상단" disabled></div>';
            AdCon+='<div class="" style="text-align:center; margin-top:-20px; margin-bottom:20px;">';
            AdCon+='<input class="agree" type="checkbox" aria-label="Checkbox for agreement">';
            AdCon+='<h4 style="margin-left:10px; display:inline-block";>결제 정보를 확인하였으며, 이에 동의합니다. (필수)</h4>';
            AdCon+='</div>';
            AdCon+='<div id="category-payment pay" style="text-align:center";><button class="btn btn-primary paym" style="padding:9px; width:30%; font-size:18px"; disabled onclick="payment(1);">결제하기</button>'
            
            AdCon+='<div>';

            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='<div>';
            // AdCon+='<input type="" id="positionName" value="">';
            // AdCon+='<input type="" id="adDate" value="">';
            AdCon+='</div>';





            AdCon+='</div>';
        }else{
            // main 상단 광고
            var polist=resultMap.polist;
            AdCon+='<div>';
            AdCon+='<div class="accordion" id="accordionExample" style="padding-top:2em;">';
            AdCon+='<div class="card">';
            AdCon+='<div class="card-header" id="headingOne">';
            AdCon+='<h2 class="mb-0">';
            AdCon+='<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">';
            AdCon+='<div class="firstRow"><p class="steps-main" style="display:inline-block;">1단계</p><p class="stepText-main" style="display:inline-block; margin-left:5em; font-weight:bold;">광고를 노출할 방문자의 직무를 선택</p></div>';
            AdCon+='</button>';
            AdCon+='</h2>';
            AdCon+='</div>';
            AdCon+='<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">';
            AdCon+='<div class="card-body" style="overflow:scroll; height:200px;">';
            AdCon+='<div><p style="text-align:center; color:#848484;">채용 포지션 등록시 선택한 직무 목록입니다. 현재 채용 중인 포지션이 있는 직무에 광고를 할 수 있습니다.</p></div><hr>';
            if(polist!=undefined||polist!=null||polist!=""){
                for(let i=0;i<polist.length;i++){
                    let deadDate=polist[i].deadDate;
                    let year=new Date(deadDate).getFullYear()+"년 ";
                    let month=(new Date(deadDate).getMonth()+1)+"월 ";
                    let day=new Date(deadDate).getDate()+"일";
                    let positionName=polist[i].position;
                    AdCon+='<div class="selectPosition" style="display:flex; background-color:#FAFAFA; border:1px solid #BDBDBD; padding:10px; border-radius:15px 15px 15px 15px;"><small style="width:20%">'+(i+1)+'</small>';
                    AdCon+='<p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:10px; padding:3px; margin-right:3%;">등록한 포지션</p>';
                    AdCon+='<p style="width:25%;">'+positionName+'</p>';
                    AdCon+='<p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:10px; padding:3px; margin-right:3%;">등록 기간</p>';
                    if(new Date(deadDate).getFullYear()>=2099){
                        AdCon+='<p style="width:25%;">상시 모집 중</p>';
                    }else{
                        AdCon+='<p style="width:25%;">'+year+month+day+' 까지</p>';
                    }
                    AdCon+='</a></div><hr>';
                }
            }else{
                AdCon+='<div class="noPosition"><p stlye="text-align:center; padding:6em;">현재 채용 중이거나, 승인 신청 중인 포지션이 없습니다. <br>왼쪽 상단의 포지션 등록하기를 이용해보세요.</p></div>'
            }
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='<div class="card">';
            AdCon+='<div class="card-header" id="headingTwo">';
            AdCon+='<h2 class="mb-0">';
            AdCon+='<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">';
            AdCon+='<div class="secondRow"><p class="steps-main" style="display:inline-block;">2단계</p><p class="stepText-main" style="display:inline-block; margin-left:5em; font-weight:bold;">광고 일정 선택</p></div>';
            AdCon+='</button>';
            AdCon+='</h2>';
            AdCon+='</div>';
            AdCon+='<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">';
            AdCon+='<div class="card-body">';
            AdCon+='<div><p style="text-align:center; color:#848484;">필요한 기간만큼 선택하세요. 최대 4주 선택 가능합니다.</p></div><hr>';
            AdCon+='<div class="input-group mb-3">';
            AdCon+='<div class="input-group-prepend">';
            AdCon+='<label class="input-group-text" for="inputGroupSelect01" style="font-size:14px;">기간 선택</label>';
            AdCon+='</div>';
            AdCon+='<select class="custom-select" id="inputGroupSelect01" style="height:3em; font-size:15px;">';
            AdCon+='<option class="options" value="0" selected>선택</option>';
            AdCon+='<option class="options" value="7">7일</option>';
            AdCon+='<option class="options" value="14">14일</option>';
            AdCon+='<option class="options" value="21">21일</option>';
            AdCon+='<option class="options" value="29">29일</option>';
            AdCon+='</select>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='<div class="card">';
            AdCon+='<div class="card-header" id="headingThree">';
            AdCon+='<h2 class="mb-0">';
            AdCon+='<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">';
            AdCon+='<div class="thirdRow"><p class="steps-main" style="display:inline-block;">3단계</p><p class="stepText-main" style="display:inline-block; margin-left:5em; font-weight:bold;">광고 금액 확인 및 결제</p></div>';
            AdCon+='</button>';
            AdCon+='</h2>';
            AdCon+='</div>';
            AdCon+='<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">';
            AdCon+='<div class="card-body">';
            AdCon+='<div><p style="text-align:center; color:#848484;">신중한 확인 후 결재 바랍니다.</p></div><hr>';
            AdCon+='<div class="";>';
            AdCon+='<div id="explanation" style="text-align:center";><p><b>광고 비용</b><hr>[ 7일 ] &nbsp&nbsp&nbsp<small>300,000원</small> <hr>[ 14일 ] &nbsp&nbsp&nbsp<small>550,000원</small> <hr>[ 21일 ] &nbsp&nbsp&nbsp<small>890,000원</small> <hr>[ 29일 ] &nbsp&nbsp&nbsp<small>1,100,000원</small></div>';
            AdCon+='<div id="bottom-info" style="padding:2em; text-align:-webkit-center;"><div>';
            AdCon+='<p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">노출 직무</p></div>';
            AdCon+='<input class="poName" id="positionName" disabled>';
            AdCon+='<div><p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">등록 기간</p></div>';
            AdCon+='<input class="untilWhen" id="until" disabled>';
            AdCon+='<div><p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">노출 일 수</p></div>';
            AdCon+='<input class="adUntil" id="adDate" disabled>';
            AdCon+='<div><p style="background-color:#2E2E2E; color:#FFFFFF; border-radius:15px 15px 15px 15px; font-size:12px; width:25%; padding:2px; text-align: -webkit-center;">노출 위치</p></div>';
            AdCon+='<input id="adType" value="메인 페이지 상단" disabled></div>';
            AdCon+='<div class="" style="text-align:center; margin-top:-20px; margin-bottom:20px;">';
            AdCon+='<input class="agree" type="checkbox" aria-label="Checkbox for agreement">';
            AdCon+='<h4 style="margin-left:10px; display:inline-block";>결제 정보를 확인하였으며, 이에 동의합니다. (필수)</h4>';
            AdCon+='</div>';
            AdCon+='<div id="category-payment pay" style="text-align:center";><button class="btn btn-primary paym" style="padding:9px; width:30%; font-size:18px"; disabled onclick="payment(2);">결제하기</button>'
            
            AdCon+='<div>';

            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='</div>';
            AdCon+='<div>';

            AdCon+='</div>';
            AdCon+='</div>';
        }
        AdCon+='<script>';
       
        AdCon+='document.querySelectorAll("div.selectPosition").forEach(function(e){';
        AdCon+='e.addEventListener("click",function(e){';
        AdCon+='clickPositions($(this))});});';

        AdCon+='var con=document.querySelector(".custom-select");';
        AdCon+='con.addEventListener("change",function(e){';
        AdCon+='clickOptions(e.target.value);});';

        
        AdCon+='var checked=document.querySelectorAll(".agree");';
        AdCon+='checked.forEach(function(e){';
        AdCon+='e.addEventListener("click",function(e){';
        AdCon+='agreeCheck(e)})});';

        AdCon+='function payment(num){';
        AdCon+='if($("#positionName").val()!=""&&$("#until").val()!=""&&$("#adDate").val()!=""){ console.log("결제하기로");';
        AdCon+='}else{ alert("선택이 안된 정보가 있습니다. 단계별로 진행해 주세요.")}};';



        AdCon+='</script>';
        AdArea.html(AdCon);
        }
    });
}