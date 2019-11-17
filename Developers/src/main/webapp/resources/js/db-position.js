$(function(){
    $(".po_salary").on("keydown",function(){
        if(($(this).val()).length<=1 && event.code=='Backspace'){
            event.returnValue=false;
            event.target.value=0;
        }
    });
});


function fn_enroll_position(){
    location.href=path+"/business/enrollPosition.lbc";
}

function onlyNumber(){
    if((event.keyCode<48)||(event.keyCode>57)){
        event.returnValue=false;
    }else if(event.target.value==0){
        event.target.value='';
    }
}

function fn_add_position(){
    var fd=new FormData($('[name="po_frm"]')[0]);
    fd.append("poStatus",$(event.target).attr('data'));
    // console.log($(event.target).attr('data'));
    $.ajax({
        url:path+"/business/insertPosition.lbc",
        data:fd,
        type:"post",
        processData:false,
        contentType:false,
        success:function(){
            console.log("성공");
        }
    })
}
