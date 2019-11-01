// 로그인 창 
var logEml=document.querySelector("input.login-email");
var logPw=document.querySelector("input#login-password");
var logBtn=document.querySelector("button#loginBtn");
var accDe=document.querySelector("div#access-denied>p");

logPw.addEventListener('keyup',function(e){
    if(e.target.selectionEnd>3){
        logBtn.style.color="";
        logBtn.style.borderColor="";
        logBtn.removeAttribute("disabled");
    }else if(e.target.selectionEnd<=3){
        logBtn.style.color="#D0D3D4";
        logBtn.style.borderColor="#D0D3D4";
        logBtn.setAttribute("disabled",true);
    }
});


logBtn.addEventListener('click',function(){
    $.ajax({
        url: "${path}/member/passwordCheck",
        type:"post",
        data:{"memEmail":logEml.value,
        	"memPassword":logPw.value},
        success:function(result){
            if(!result.flag){
                console.log("비번틀림");
                accDe.setAttribute("display",block);
                logPw.style.borderColor='red';
            }else{
                console.log("성공적으로 에젝스");
           
            }
        }
    });
});





