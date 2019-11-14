



// 메뉴바 클릭했을 시 
var favBtns=document.querySelectorAll('a.list-group-item-action');
favBtns.forEach(function(e){
    e.addEventListener('click',function(){
        for(let i=0;i<favBtns.length;i++){
            favBtns[i].className="list-group-item list-group-item-action";
        }
        this.className+=' active';
    });
});