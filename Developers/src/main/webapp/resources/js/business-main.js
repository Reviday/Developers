// 로그인 창 
var logEml=document.querySelector("input.login-email");
var logPw=document.querySelector("input#login-password");
var logBtn=document.querySelector("button#loginBtn");
var warning=document.getElementById("warning");


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

function loginValidate(){
	var temp="";
    $.ajax({
        url: path+"/member/passwordCheck",
        type:"post",
        async:false,
        data:{"memEmail":logEml.value,
            "memPassword":logPw.value},
        success:function(result){
            if(!result.flag){
                warning.style.display='block';
                logPw.style.borderColor='#E53935';
                logEml.style.borderColor='#E53935';
                temp= false;
            }else{
                temp= true;
            }
        }
    });
    return temp;
}

logEml.addEventListener('keyup',function(e){
    if(e.target.style.borderColor!=""){
        e.target.style.borderColor="";
        document.querySelector("input#login-password").style.borderColor="";
        warning.style.display='none';
    }
});
logPw.addEventListener('keyup',function(e){
    if(e.target.style.borderColor!=""){
        e.target.style.borderColor="";
        document.querySelector("input.login-email").style.borderColor="";
        warning.style.display='none';
    }
});







