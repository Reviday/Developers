//dashboard-applications



$(function(){
    if(appl_like=='true'){
        $("#like_check").prop("checked",true);
    }
    //리스트 가져오는 함수
    fn_appl_nav(appl_index, appl_page);
   
    //인덱스 선택
    $($('.appl-main-nav>ul>li')[appl_index]).children().addClass('ca2');

    //사이드내비
    $('.appl-leftside>h5').on('click',function(){
        if($($(this).children('svg')).hasClass('rotate')){
            $($(this).children('svg')).removeClass('rotate');
        }else{
            $($(this).children('svg')).addClass('rotate')
        }
        if($(this).hasClass('slide_btn')){
                $(this).next().next().slideToggle();
            }
    });
    //지원자 내비
    $('.appl-main-nav>ul>li>a').on('click',function(){
        $($(this).parent().siblings()).children().removeClass('ca2');
        $(this).addClass('ca2');
        fn_appl_nav($(this).parent().index());
    });
    $('.appl-main-nav>ul>li>a').hover(function(){
        $(this).addClass('ca4');
    },function(){
        $(this).removeClass('ca4');
    });
    $("[name='search_em']").on("keyup", function(event){
        if(event.keyCode=='13'){
            fn_appl_nav(appl_index, appl_page);
        }
    });
    $("#like_check").on("change", function(){
        fn_appl_nav(appl_index, appl_page);
    });

   

});
  
function fn_appl_nav(index, page){
    appl_index=index;
    appl_page=page;
    $(".appl-applicant-list").html("<img src='"+path+"/resources/images/Developers_black_loading.gif' width='30px;'/>");
    $.ajax({
        url:path+"/business/applChange.lbc",
        data:{"applIndex":index, "applLike":$("#like_check").prop("checked"),"search":$("[name='search_em']").val(), "cPage":page},
        success:function(data){
            $(".appl-applicant-list").html(data.applInnerHtml);
            $(".appl-applicant-list").append(data.pageBar);
             //좋아요 버튼 클릭
            $(".aList-like-btn").on("click",function(){
                if($(this).hasClass("like_on")){
                    $(this).removeClass("like_on");
                    fn_appl_like(event, true);
                }else{
                    $(this).addClass("like_on");
                    fn_appl_like(event, false);
                }
            })
        }
    });

}

function fn_appl_like(event, flag){
    var memNo=$(event.target).parents('.aList-left').children('.aList-info').children(':first').html().substring(3);
    $.ajax({
        url:path+"/business/applLike.lbc",
        data:{"memNo":memNo, "flag":flag}
    });
}



    
    


















    //반응형 처리
$(function(){
    $(window).resize(function(){
        if(window.innerWidth<767){
            if(!$('.appl-leftside>h5').hasClass('slide_btn')){
                $('.appl-leftside>h5').addClass('slide_btn');
            }
        }else{
            $('.appl-leftside>h5').removeClass('slide_btn');
            $('.appl-leftside>ul').css('display','');
        }
    });

    $('.appl-leftside>ul>li').on('click', function(){
        $(this).parent().parent().children('ul').children().removeClass('aList-click');
        if(!$(this).hasClass('aList-click')){
            $(this).addClass('aList-click');
        }
    });
});