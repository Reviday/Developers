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
                    $(".add_img").before(data.imgHtml);
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
                    $(img).attr("src",data.busImg);
                    
                }
            });
        }
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
