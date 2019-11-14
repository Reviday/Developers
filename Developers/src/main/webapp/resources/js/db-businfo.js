$(function(){
    $('.bi_info_img').on('click',function(){
        $('body').css('overflow','hidden');
        $('.bi_img_container').slideDown();
    });
    
    $('.bi_img_close').on('click',function(){
        $('.bi_img_container').slideUp();
        $('.bi_img_container>div').scrollTop(0);
        $('body').css('overflow','');
    });

    


    //회사정보-메인사진 클릭
    $("[name=bus_img]").on("change",function(){
        var frm=new FormData($(this).parent()[0]);
        if($(this).parents('.add_img').length!=0){
            $.ajax({
                url:path+"/business/busImgAdd",
                data:frm,
                type:"post",
                processData:false,
                contentType:false,
                success:function(data){
                    var imgHtml="";
                    imgHtml+="";
                    imgHtml+="<div class='bi_img_bus modi_img del_img'>";
                    imgHtml+="<label for='bus_img"+data.count+"'>";
                    imgHtml+="<img class='bi_img_busimg' src='"+path+data.addImg+"'/>";
                    imgHtml+="<i class='fas fa-sync-alt'></i>";
                    imgHtml+="<form enctype='multipart/form-data' method='POST'>";
                    imgHtml+="<input id='bus_img"+data.count+"' name='bus_img' type='file' style='display:none;'>";
                    imgHtml+="</form>";
                    imgHtml+="</label>";
                    imgHtml+="<button type='button' class='img_del_btn' onclick='fn_del_img(event);'><i class='far fa-times-circle'></i></botton>";
                    imgHtml+="</div>";
                    $(".add_img").before(imgHtml);
                }
            });
        }else{
            frm.append("imgIndex",$(this).parents('.modi_img').index()-1);
            var img=$(this).parent().siblings('.bi_img_busimg');
            $.ajax({
                url:path+"/business/busImgModify",
                data:frm,
                type:"post",
                processData:false,
                contentType:false,
                success:function(data){
                    $(img).attr("src",path+data.busImg);
                    
                }
            });
        }
    });
    $(".bi_info_ta").blur(function(){
        $(this).val($(this).val().trim());
        $(this).css("height",this.scrollHeight+2+"px");
    });
    $('.modi_img').attr('title','이미지 변경');
    $('.add_img').attr('title', '이미지 추가');
});

function fn_del_img(event){
    $.ajax({
        url:path+"/business/busImgDelete",
        data:{"imgIndex":($(event.target).parents('.modi_img').index())-1},
        type:"post"
    });
    $($(event.target).parents('.modi_img')).remove();
}

function fn_update_bus(){
    var busFrm=new FormData($(".bi_frm")[0]);
    $.ajax({
        url:path+"/business/updateBusInfo.lbc",
        data:busFrm,
        type:"post",
        processData:false,
        contentType:false,
        success:function(){
            $(".modi_text").show();
            setTimeout(function(){
                $(".modi_text").fadeOut();
            },2000);
        }
    });
}

function fn_keyword_add(){
    if($('[name="add_keyword"]').val()!=''){
        if($('[name="searchKeywords"]')[2]!=null){
            $('.key_over').css("color","red");
            $(event.target).attr('disabled','disabled');
        }else{
            var kw=$('[name="add_keyword"]').val();
            var keyHtml="<div class='bi_keyword'>";
            keyHtml+="<input type='checkbox' value='"+kw+"' name='searchKeywords' checked/>";
            keyHtml+="<span>#"+kw+"</span><button type='button' onclick='fn_del_keyword();'><i class='fas fa-times'></i></button></div>";
            $('.bi_info_keywords').append(keyHtml);
            $('[name="add_keyword"]').val('');
        }
    }else{
        $('[name="add_keyword"]').addClass('key_o');
        $('[name="add_keyword"]').focus();
        setTimeout(function(){
            $('[name="add_keyword"]').removeClass('key_o');
        },1000);

    }
}

function fn_del_keyword(){
    $(event.target).parents('.bi_keyword').remove();
    $('.key_over').css("color","black");
    $('.bi_keyword_add').prop("disabled",false);
}
