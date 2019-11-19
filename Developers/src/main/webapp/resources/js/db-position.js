$(function(){
/////////////////////////////////////포지션메인
    $(".position_info").on("click",function(){
        var position_no=$($(this).children('.position_no')).val();
        location.href=path+"/business/enrollPosition.lbc?poNo="+position_no;
    });



















  //////////////////////////////////////포지션등록  
    //연봉정보 0 고정
    $(".po_num").on("keydown",function(){
        if(($(this).val()).length<=1 && event.code=='Backspace'){
            event.returnValue=false;
            event.target.value=0;
        }
    });

    //input 값 변경될 때 경고 제거
    $(".form-control").on("change",function(){
        if($(this).val()!=''&&$(this).val()!=null&&$(this).hasClass('po_info_null')){
            $(this).removeClass("po_info_null");
        }
    });

    //직군/직무 추가
    $(".po_type_list").on("change",function(){
        var type=$(this).val();
        $('.type_init').prop('selected',true);
        if($(".po_type")[2]!=null){
            $(this).attr("disabled","disabled");
            $('.po_three').css('color','red');
        }else{
            var count=0;
            $("[name='job_type']").each(function(){
                var jt=this;
                if($(jt).val()==type){
                    $($(jt).parent()).addClass("blinking_btn");
                    setTimeout(function(){
                        $($(jt).parent()).removeClass("blinking_btn")},2000);
                    count++;
                }
            });
            if(count<1){
                var typeHtml="<div class='po_type'>";
                typeHtml+="<input type='hidden' value='"+type+"' name='job_type'/>";
                typeHtml+="<span>"+type+"</span><button type='button' onclick='fn_del_type();'><i class='fas fa-times'></i></button></div>";
                $(".po_type_con").append(typeHtml);
            }else{
                fn_modi_finish("직군/직무가 중복되었습니다.");
            }
        }
    });

    //날짜 변경시
    $("[name='po_date']").on("change",function(){
        if($(this).val()!=''){
            $("[.po_period]").prop("checked",false);
        }else{
            $(".po_period").prop("checked",true);
        }
    });
    if($(".po_junior").prop("checked")){
        $("[name='po_career']").prop("disabled",true);
    }
    //경력 변경시
    $(".po_junior").on("change",function(){
        if($(this).prop("checked")){
            $("[name='po_career']").prop("disabled",true);
            $("[name='po_career']").val(0);
        }else{
            $("[name='po_career']").prop("disabled",false);
        }
    });


    $(".po_del").on("click",function(){
        $(".del-modal").css("display","block");
        $('body').css('overflow','hidden');
    });

    $(".close-modal").on("click", function () {
        $(".del-modal").hide();
        $('body').css('overflow','');
    });

});



function fn_enroll_position(){
    location.href=path+"/business/enrollPosition.lbc?poNo=0";
}

function onlyNumber(){
    if((event.keyCode<48)||(event.keyCode>57)){
        event.returnValue=false;
    }else if(event.target.value==0){
        event.target.value='';
    }
}

function fn_add_position(){
    if($(event.target).attr('data')=='O' 
        &&( $('.po_type_list').val()==null
        || $('[name="position"]').val()==''
        || $('[name="position_info"]').val()==''
        || $('[name="mainbusiness"]').val()==''
        || $('[name="qualification"]').val()==''
        || $('[name="benefit"]').val()==''
        || $('[name="apply_email"]').val()=='')){
            fn_null_check($('[name="po_frm"]')[0]);
            fn_modi_finish("포지션 승인 요청 시 필요한 정보가 부족합니다.");
    }else if($($('[name="po_career"]')[0]).val()-$($('[name="po_career"]')[1]).val()>0){
        fn_modi_finish("입력된 경력을 확인하세요.");
        $("[name='po_career']").addClass("blinking_btn");
                    setTimeout(function(){
                        $("[name='po_career']").removeClass("blinking_btn")},2000);
    }else {
        var fd=new FormData($('[name="po_frm"]')[0]);
        fd.append("poStatus",$(event.target).attr('data'));
        $.ajax({
            url:path+"/business/updatePosition.lbc",
            data:fd,
            type:"post",
            processData:false,
            contentType:false,
            success:function(data){
                var text="";
                if(data.status=='T'){
                    text="임시저장 되었습니다.";
                    $(".po_info_null").removeClass("po_info_null");
                }else{
                    text="승인 요청을 보냈습니다.";
                }
                fn_modi_finish(text);
                if($("[name='position_no']").val()==0){
                    $("[name='position_no']").val(data.poNo);
                    $(".po_del").css("display","block");
                }
            }
        });
    }
}


function fn_modi_finish(text){
    
    $(".modi_text").text(text);
    $(".modi_text").show();
    setTimeout(function(){
        $(".modi_text").fadeOut();
    },2000);
}


function fn_null_check(form){
    for(var i=0; i<form.length; i++){
        if(i==1||i==10||i==11||i==12||i==13||i==15||i==16){
            if($(form[i]).val()==''||$(form[i]).val()==null){
                $(form[i]).addClass('po_info_null');
            }
        }
    }
}

function fn_del_type(){
    $(event.target).parents('.po_type').remove();
    $('.po_type_list').prop("disabled",false);
    $('.po_three').css('color','black');
}

function fn_del_position(){
        location.href=path+"/business/deletePosition.lbc"
}