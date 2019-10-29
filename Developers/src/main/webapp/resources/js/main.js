/* header js*/
window.onload=function() {
								
	/* 메뉴 온/오프기능  온로드 함수를 사용 */
	var menuBar=document.getElementsByClassName('menuButton')[0];
	menuBar.onclick=function() {
        headerBar.style.display="block";
    }
	
    var headerBarExit=document.getElementsByClassName('headerBar_exit')[0];
    var headerBar=document.getElementsByClassName('xsMenuBar')[0];

    headerBarExit.onclick=function() {
        headerBar.style.display="none";
    }
    	
    
}
/* 로그인/회원가입 모달창 */
var $div=$('<div class="modal_login_enroll"></div>');
var innerTag='<div class="login_enroll" style="width: 400px;">';
innerTag+='<div class="login_enroll_header">';
innerTag+='<span>Developers</span>';
innerTag+='<button id="modal_close" type="button">';
innerTag+='<i class="fas fa-times"></i>';
innerTag+='</button>';
innerTag+='</div>';
innerTag+='<div id="MODAL_BODY" class="login_enroll_body">';
innerTag+='<div class="le_intro">';
innerTag+='<h1>친구에게 딱 맞는<br>회사를 추천해 주세요!</h1>';
innerTag+='<h2>디벨로퍼는 친구에게 좋은 회사를 추천하고,<br>채용 성공시 보상 받을 수 있는 서비스입니다.</h2>';
innerTag+='</div>';
innerTag+='<div class="le_form">';
innerTag+='<input class="le_password" type="password" autocomplete="password">';
innerTag+='<input class="le_email" type="email" autocomplete="username" placeholder="이메일을 입력해 주세요." value="">';
innerTag+='<button class="emailLoginButton" type="button">';
innerTag+='<i class="far fa-envelope"></i>이메일로 시작하기';
innerTag+='</button>';
innerTag+='<div class="buttonDivider"></div>';
innerTag+='<button class="facebookLoginButton" type="button">';
innerTag+='<i class="fab fa-facebook-square"></i>페이스북으로 시작하기';
innerTag+='</button>';
innerTag+='<p>걱정마세요! 여러분의 지원 활동은 SNS에 노출되지 않습니다.<br>회원가입 시 ';
innerTag+='<a class="loginModalAnchor" href="/privacy" target="_blank">개인정보 취급방침</a>과 ';
innerTag+='<a class="loginModalAnchor" href="/terms" target="_blank">이용약관</a>을 확인하였으며, 동의합니다.';
innerTag+='</p>';
innerTag+='</div>';
innerTag+='</div>';
innerTag+='</div>';
innerTag+='<div role="presentation" class="modal_area"></div>';
var errorMessage='<p class="errorMessage"></p>';

$('.suBtn').on('click',function() {
	$($div).html(innerTag);
	$('#header').after($div);
	var userEmail=$('.le_email');
	userEmail.after(errorMessage);
	
	$('.modal_area').on('click',(function() {
		userEmail.val("");
		userEmail.css("border","1px solid #dbdbdb");
		$('.errorMessage').text("");
    	$($div).remove();
	}));
	$('#modal_close').on('click',(function() {
		userEmail.val("");
		userEmail.css("border","1px solid #dbdbdb");
		$('.errorMessage').text("");
    	$($div).remove();
	}));
	
	var emailLoginButton=$('.emailLoginButton').click(function() {
		 // 정규식 - 이메일 유효성 검사
        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if( !userEmail.val() || !regEmail.test(userEmail.val())){
			 userEmail.css('border','1px solid red');
			 $('.errorMessage').text("유효한 이메일을 적어주세요.");
			 userEmail.focus();
            return false;
        } else {
        	$.ajax({
        		url:path+'/member/emailCheck',
        		type:'POST',
        		data:{'memEmail':userEmail.val()},
        		success: function(result) {
        			if(result.msg!=null&&result.msg!=""&&!result.flag) {
    	        		/*msg가 존재하는 경우*/
    	        		alert(msg);
    	        		return false;
    	        	} else if(result.flag) {
    	        		var uemail=userEmail.val();
    	        		/*회원인 경우*/
    	        		$('.login_enroll_header span').text('비밀번호 입력');
	    	        	$('.le_intro').remove();
	    	        	$('.le_form').remove();
	    	        	/* 패스워드 모달창 */
					    var innerPwTag='<div class="le_pwForm">';
	    	        	innerPwTag+='<input id="user-text-field" type="email" autocomplete="username" value="';
	    	        	innerPwTag+=uemail;
	    	        	innerPwTag+='" style="display: none;">';
	    	        	innerPwTag+='<input id="password-text-field" type="password" autocomplete="current-password" placeholder="비밀번호" value="">';
	    	        	innerPwTag+='<button type="button" id="loginBtn">로그인</button>';
	    	        	innerPwTag+='<button type="button" class="forgetPasswordButton">비밀번호 초기화/변경</button>';
	    	        	innerPwTag+='</div>';
	    	        	innerPwTag+='<script>';
	    	        	innerPwTag+='var errorMessagePw=';
	    	        	innerPwTag+="'<p class=";
	    	        	innerPwTag+='"errorMessage">비밀번호가 일치하지 않습니다.</p>';
	    	        	innerPwTag+="'; ";
	    	        	innerPwTag+='$("#loginBtn").click(function() {';
	    	        	innerPwTag+='$.ajax({';
	    	        	innerPwTag+='url:path+"/member/passwordCheck",'
	    	        	innerPwTag+='data:{"memEmail":$("#user-text-field").val(),';
	    	        	innerPwTag+='"memPassword":$("#password-text-field").val()},';
	    	        	innerPwTag+='success:function(result) {';
	    	        	innerPwTag+='if(!result.flag) {';
	    	        	innerPwTag+='$("#password-text-field").after(errorMessagePw);}';
	    	        	innerPwTag+='else{location.href=path+"/member/login.do?memEmail=';
	    	        	innerPwTag+=uemail+'"}';
	    	        	innerPwTag+='}});})<';
	    	        	innerPwTag+='/script>';
	    	        	$('#MODAL_BODY').html(innerPwTag);
	    	        	return true; 
    	        	} else {
    	        		/*비회원인 경우*/
    	        		$('.login_enroll_header span').text('비밀번호 설정');
	    	        	$('.le_intro').remove();
	    	        	$('.le_form').remove();
	    	        	/* 패스워드 모달창 */
					    var innerPcTag='<div class="le_pcForm">';
					    innerPcTag+='<input id="user-text-field" type="email" autocomplete="username" value="';
					    innerPcTag+=userEmail.val();
					    innerPcTag+='" style="display: none;">';
					    innerPcTag+='<input id="new-password-text-field" type="password" autocomplete="new-password" placeholder="비밀번호">';
					    innerPcTag+='<input id="confirm-password-text-field" type="password" autocomplete="new-password" placeholder="비밀번호 재입력"><span id="checkMsg"></span>';
					    innerPcTag+='<button type="button" id="enrollBtn">회원가입</button></div></div>';
					    innerPcTag+='</div></div>';
					    innerPcTag+='<script>';
					    innerPcTag+='var pwFlag=false;';
					    innerPcTag+='$("#confirm-password-text-field").keyup(function() {';
					    innerPcTag+='if(pwValidate($("#new-password-text-field").val())){';
					    innerPcTag+='if($("#new-password-text-field").val()!=$(this).val()) {';
					    innerPcTag+='$("input").css("border", "1px solid red");';
					    innerPcTag+='$("#checkMsg").text("비밀번호가 일치하지 않습니다.");';
					    innerPcTag+='$("#checkMsg").css("color","red");';
					    innerPcTag+='pwFlag=false;';
					    innerPcTag+='} else {$("input").css("border", "1px solid rgb(65,210,107)");';
					    innerPcTag+='$("#checkMsg").text("비밀번호가 일치합니다.");';
					    innerPcTag+='$("#checkMsg").css("color","rgb(65,210,107)");'
					    innerPcTag+='pwFlag=true;}}});';
					    innerPcTag+='$("#new-password-text-field").keyup(function() {';
					    innerPcTag+='if(pwValidate($("#new-password-text-field").val())){';
					    innerPcTag+='if($("#confirm-password-text-field").val()==null || $("#confirm-password-text-field").val()=="") {';
					    innerPcTag+='}else {';
					    innerPcTag+='if($("#confirm-password-text-field").val()!=$(this).val()) {';
					    innerPcTag+='$("input").css("border", "1px solid red");';
					    innerPcTag+='$("#checkMsg").text("비밀번호가 일치하지 않습니다.");';
					    innerPcTag+='$("#checkMsg").css("color","red");';
					    innerPcTag+='pwFlag=false;';
					    innerPcTag+='} else {$("#checkMsg").text("비밀번호가 일치합니다.");';
					    innerPcTag+='$("input").css("border", "1px solid rgb(65,210,107)");';
					    innerPcTag+='$("#checkMsg").css("color","rgb(65,210,107)");';
					    innerPcTag+='pwFlag=true;}';
					    innerPcTag+='}}});';
					    innerPcTag+='function pwValidate(data) {';
					    innerPcTag+='var regPw =/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;';
					    innerPcTag+='var str = "특수문자 /문자 /숫자 포함 형태의 8~15자리 이내의 암호로 설정해주세요.";';
					    innerPcTag+='if(!data|| !regPw.test(data)) {';
					    innerPcTag+='$("#checkMsg").text(str);';
					    innerPcTag+='$("#checkMsg").css("color","red");';
					    innerPcTag+='$("#new-password-text-field").css("border", "1px solid red");';
					    innerPcTag+='return false;';
					    innerPcTag+='} else {';
					    innerPcTag+='$("#checkMsg").text("");';
					    innerPcTag+='$("#new-password-text-field").css("border", "1px solid #dbdbdb");';
					    innerPcTag+='return true;';
					    innerPcTag+='}}';
					    innerPcTag+='$("#enrollBtn").on("click",function() {';
					    innerPcTag+='if(pwFlag) {';
					    innerPcTag+='$.ajax({';
					    innerPcTag+='url:path+"/member/enrollMember",';
					    innerPcTag+='type:"POST",';
					    innerPcTag+='data:{"memEmail":"';
					    innerPcTag+=userEmail.val();
					    innerPcTag+='", "memPassword": $("#new-password-text-field").val(),},';
					    innerPcTag+='success:function(result){';
					    innerPcTag+='console.log(result);';
					    innerPcTag+='alert(result.msg);';
					    innerPcTag+='$($div).remove();';
					    innerPcTag+='}})}});';
					    innerPcTag+='</script>';
	    	        	$('#MODAL_BODY').html(innerPcTag);
    	        	}
        		}
        	});
        }
     });
});

jQuery(document).ready(function(){
   $(document).mousemove(function(e){
      $('#mouse_shadow').css("left",e.pageX-$('#mouse_shadow').width()/2);
   });
})

$('#profile_img').click(function() {
	$(this).toggleClass('showMenuPopover');
	$('.xsMenuBar').toggle();
})

$('.headerBar_exit').click(function() {
	$('.xsMenuBar').toggle();
})

/* header js End*/