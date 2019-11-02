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



// 회원가입 창 
var phone=document.querySelector("input#phone");
var email=document.querySelector("input#reg-email");
var pswd=document.querySelector("input#pswd");
var pswd2=document.querySelector("input#pswd2");
var regPhone= /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var regPw =/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
var phoneCheck=0;
var emailCheck=0;
var pswdCheck=0;
var pswd2Check=0;


phone.addEventListener('change',function(e){
    phone.borderColor!=""?phone.borderColor="":phone.borderColor="";
    if(document.getElementById("warning-area").children.length>0){
        $("#warning-area p").remove();
    }
    if(regPhone.test(phone.value)){
        phoneCheck=0;
        phoneCheck++;
    }else{
        $('#warning-area').append("<p style='color:#F57F17'>전화번호를 정확히 입력해주세요.</p>")
        phoneCheck=0;
    }
});

pswd.addEventListener('change',function(e){
    pswd.borderColor!=""?pswd.borderColor="":pswd.borderColor="";
    pswd2.value="";
    if(document.getElementById("warning-area").children.length>0){
        $("#warning-area p").remove();
    }
    if(regPw.test(pswd.value)){
        pswd2.removeAttribute('disabled');
        pswd2.style.borderColor="";
        pswd2.style.color="";
        pswd2.style.backgroundColor="";
        pswd2.className+="ed";
        pswdCheck=0;
        pswdCheck++;
    }else{
        $('#warning-area').append("<p style='color:#E53935'>사용이 불가능한 형식입니다.</p>")
        pswd2.setAttribute('disabled',true);
        pswd2.value="";
        pswd2.style.borderColor="#E6E6E6";
        pswd2.style.color="#A4A4A4";
        pswd2.style.backgroundColor="#FFFFFF";
        pswd2.className="form-control must remov"
        pswdCheck=0;
    }
});

pswd2.addEventListener('change',function(e){
    pswd2.borderColor!=""?pswd2.borderColor="":pswd2.borderColor="";
    if(document.getElementById("warning-area").children.length>0){
        $("#warning-area p").remove();
    }
    if(pswd.value!=""&&e.target.value!=pswd.value){
        $('#warning-area').append("<p style='color:#E53935'>암호가 일치하지 않습니다.</p>");
        pswd2Check=0;
    }else if(pswd.value!=""&&e.target.value==pswd.value){
        $('#warning-area').append("<p style='color:#0033FF'>암호가 일치합니다.</p>");
        pswd2Check=0;
        pswd2Check++;
    }else{
        $('#warning-area').append("<p style='color:#F57F17'>암호를 먼저 입력해 주세요.</p>");
        pswdCheck=0;
    }
})



email.addEventListener('change',function(e){
    email.borderColor!=""?email.borderColor="":email.borderColor="";
        if(document.getElementById("warning-area").children.length>0){
            $("#warning-area p").remove();
        }
        $.ajax({
            url: path+"/member/emailCheck",
            type:"post",
            async:false,
            data:{ "memEmail":email.value },
            success:function(result){
                if(!result.flag&&regEmail.test(email.value)){
                    $('#warning-area').append("<p style='color:#0033FF'>사용가능한 이메일입니다.</p>");
                    emailCheck=0;
                    emailCheck++;
                }else if(result.flag&&!regEmail.test(email.value)){
                    $('#warning-area').append("<p style='color:#F57F17'>유효한 이메일을 적어주세요.</p>")
                    emailCheck=0;
                }else if(!result.flag&&!regEmail.test(email.value)){
                    $('#warning-area').append("<p style='color:#F57F17'>유효한 이메일을 적어주세요.</p>")
                    emailCheck=0;
                }else{
                    $('#warning-area').append("<p style='color:#E53935'>이미 사용중인 이메일입니다.</p>")
                    emailCheck=2;
                }
            }
        });
});





$('#registerBtn').click(function(){
    if(registerValidate()){
        $('form#registerForm').submit();
    }
});


function registerValidate(){
    var mendat=$('input.must');
    for(var i=0;i<mendat.length;i++){
        if(mendat[i].style.borderColor!=""&&mendat[i].value!=""){
            mendat[i].style.borderColor="";									
        }else if(mendat[i].style.borderColor!=""&&mendat[i].value==""){
            mendat[i].style.borderColor="#FF0000";
            mendat[i].addEventListener('keyup',function(e){
                e.target.style.borderColor="";
            });
        }else if(mendat[i].value==""){
            if(mendat[i].style.borderColor!="#FF0000"){
                mendat[i].style.borderColor="#FF0000";
                mendat[i].addEventListener('keyup',function(e){
                    e.target.style.borderColor="";
                });
            }	
        }
    }
    var temp=0;
    for(var i=0;i<mendat.length;i++){
        if(mendat[i].value!=""){
            temp++;
        }
    }
    var totalSum=temp+phoneCheck+emailCheck+pswdCheck+pswd2Check;
    console.log(totalSum);
    if(totalSum==mendat.length+1+1+1+1){
        return true;
        // console.log("다음 단계로")
    }else{
        if(phone.value!=""&&phoneCheck==0){
            if(document.getElementById("warning-area").children.length>0){
                $("#warning-area p").remove();
            }
            phone.style.borderColor="#FF0000";
            $('#warning-area').append("<p style='color:#F57F17'>전화번호를 정확히 입력해주세요.</p>");
            phone.focus();
        }if(email.value!=""&&emailCheck==0){
            if(document.getElementById("warning-area").children.length>0){
                $("#warning-area p").remove();
            }
            email.style.borderColor="#FF0000";
            $('#warning-area').append("<p style='color:#F57F17'>유효한 이메일을 적어주세요.</p>");
            email.focus();
        }if(email.value!=""&&emailCheck==2){
            if(document.getElementById("warning-area").children.length>0){
                $("#warning-area p").remove();
            }
            email.style.borderColor="#FF0000";
            $('#warning-area').append("<p style='color:#E53935'>이미 사용중인 이메일입니다.</p>");
            email.focus();
        }if(pswd.value!=""&&pswdCheck==0){
            if(document.getElementById("warning-area").children.length>0){
                $("#warning-area p").remove();
            }
            pswd.style.borderColor="#FF0000";
            $('#warning-area').append("<p style='color:#E53935'>사용이 불가능한 형식입니다.</p>");
            pswd.focus();
        }if(pswd2.value!=""&&pswd2Check==0){
            if(document.getElementById("warning-area").children.length>0){
                $("#warning-area p").remove();
            }
            pswd2.style.borderColor="#FF0000";
            $('#warning-area').append("<p style='color:#E53935'>암호가 일치하지 않습니다.</p>");
            pswd2.focus();
        }
        return false;														
    }
}








