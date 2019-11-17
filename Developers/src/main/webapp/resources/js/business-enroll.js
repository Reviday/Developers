$(function(){
    disabledOn();
});

var titles=document.getElementsByClassName('subtitles');
var bars=document.getElementsByClassName('dis');
var bnt=document.querySelector('#startButton');

function openSearch(){
    var searchBar=document.querySelector('#busSearch');
    searchBar.value="";
    searchBar.style.borderColor="";
    searchBar.style.color="";
    searchBar.style.backgroundColor="";
    searchBar.removeAttribute('readonly');	
    //autofocus 가 안먹힘
}

function disabledOn(){
    // allInfo=$('.dis');
    // for(var a in allInfo){
    //     allInfo[a].value="";
    // }
    
    bnt.setAttribute("disabled", true);
    bnt.style.color="#A4A4A4";
    bnt.style.borderColor="#A4A4A4";
    for(var i in titles){
        if(titles[i].style!=undefined){
            titles[i].style.color="#A4A4A4"; 					
        }
    }
    for(var ba in bars){
        if(bars[ba].style!=undefined){
            bars[ba].style.borderColor="#E6E6E6";
            bars[ba].style.color="#A4A4A4";
            bars[ba].style.backgroundColor="#FFFFFF";
            bars[ba].setAttribute("disabled", true);			
        }
    }
}

function bus_reset(){
    var searchBar=document.querySelector('#busSearch');
    if(searchBar.getAttribute('readonly')=='true'){

        $('#confirmModal').modal('show');
    }
}



function bus_search(){
    
     var searchBus=document.getElementById('search-business');
     var listGroup=document.getElementById('list-area');
     $(listGroup).html("");
     /* var listGroup=document.createElement('div'); */ 
     //listGroup.id="list-group";
     /* searchBus.html(listGroup); */
    
    var input=$("#busSearch").val()
    $.ajax({
        type: "post",
         url: path+"/business/APISearch.do",
         data:{"input": input},
         success:function(data){
             console.log(data);
                var busTitle="";
                // let listArea=document.querySelector("#list-area");
                // listArea.style.borderColor="#0080FF";
                let dropBottom=document.querySelector(".shadow-drop-bottom-first");
                dropBottom.style.borderColor="#FFFFFF";
                let searchBusiness=document.querySelector("#search-business");
                searchBusiness.style.border="1px solid #0080FF";
                
            
             for(var i in data.items){
                 var resultBtn=document.createElement('div');
                 resultBtn.className="result_button";
                 var hiddenA=document.createElement('input');
                 var hiddenB=document.createElement('input');
                 var hiddenC=document.createElement('input');
                 var hiddenD=document.createElement('input');
                 hiddenA.type="hidden";
                 hiddenB.type="hidden";
                 hiddenC.type="hidden";
                 hiddenD.type="hidden";
                 hiddenA.id="address";
                 hiddenB.id="industry";
                 hiddenC.id="website";
                 hiddenD.id="busName";
                 //api로 가져온 값 출력하는 로직
                 resultBtn.innerHTML='<p style="display:inline-block; margin-left:1%;">'+data.items[i].title+'</p>'+'<small style="float:right; margin-right:3%;">'+data.items[i].roadAddress+'</small>'; 
                 hiddenA.value=data.items[i].roadAddress
                 hiddenB.value=data.items[i].category
                 hiddenC.value=data.items[i].link
                 hiddenD.innerHTML=data.items[i].title		
                 resultBtn.append(hiddenA);
                 resultBtn.append(hiddenB);
                 resultBtn.append(hiddenC);
                 resultBtn.append(hiddenD);
                 listGroup.append(resultBtn);
                 
             }
             var resultBtn=document.createElement('div');
             resultBtn.className="result_button veryLast";
             resultBtn.innerHTML='<p style="margin-left:1%;">'+input+'</p>';
             listGroup.append(resultBtn);
             
            var buttons=document.querySelectorAll('.result_button');
            buttons.forEach(function(event){
                event.addEventListener('click',function(){
                    searchBusiness.style.border="";
                
                document.querySelector('#busSearch').value=this.children[5].innerText;	
                if($(this).children().length>0){
                    var cityChoice=($($(this).children("#address")).val()).substring(0,2); 
                    var options=$('#city>option');
                    
                    for(var o in options){
                         if(options[o].innerText==cityChoice){
                             options[o].setAttribute('selected',true);
                        }
                    } 
                    document.querySelector('#busAddress').value=$($(this).children("#address")).val();
                    document.querySelector('#category').value=$($(this).children('#industry')).val();
                    document.querySelector('#busSite').value=$($(this).children('#website')).val();
                }
                document.querySelector('#busCountry').value="한국";
                bnt.removeAttribute("disabled");
                bnt.style.color="";
                bnt.style.borderColor="";
                for(var i in titles){
                    if(titles[i].style!=undefined){
                        titles[i].style.color=""; 					
                    }
                }
                for(var ba in bars){
                    if(bars[ba].style!=undefined){
                        bars[ba].style.borderColor="";
                        bars[ba].style.color="";
                        bars[ba].style.backgroundColor="";
                        bars[ba].removeAttribute("disabled");			
                    }
                }
                
                listGroup.remove();
                var searchBar=document.querySelector('#busSearch');
                searchBar.style.borderColor="#E6E6E6";
                searchBar.style.color="#A4A4A4";
                searchBar.style.backgroundColor="#FFFFFF";
                searchBar.setAttribute('readonly',true);
                })
            })
            }
        });
    }
    
    function modalClose(){
        $(".modal").modal('hide');			
    };
    
    // submit버튼 이벤트
    $("#startButton").click(function(){
        if(validateForm()){
            $('form.form').submit();
            console.log("모든 입력 완료");
        }
    });

    // Validate Form 메소드 
    function validateForm(){
        var mendatory=$(".must");
        
        for(var i=0;i<mendatory.length;i++){
            console.log(mendatory[i]);
             if(mendatory[i].value!=""){
                if(mendatory[i].style.borderColor!=""){
                    mendatory[i].style.borderColor="";									
                }
            }else if(mendatory[i].value==""){
                if(mendatory[i].style.borderColor!="#FF0000"){
                    mendatory[i].style.borderColor="#FF0000";
                    mendatory[i].addEventListener('change',function(e){
                        e.target.style.borderColor="";
                    });
                    mendatory[i].addEventListener('keyup',function(e){
                        e.target.style.borderColor="";
                    });
                }	
            }
        }
        var temp=0;
        for(var i=0;i<mendatory.length;i++){
            if(mendatory[i].value!=""){
                temp++;
            }
        }
        console.log(temp);
        console.log(mendatory.length);
        if(temp==mendatory.length){
            return true;
        }else{
            return false;														
        }
    }
    
    