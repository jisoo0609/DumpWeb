var closeBtn = null;
var openBtn = null;

$(document).ready(function(){
    init();
    popupJS(opBtn,clBtn);
});

function init(){
    closeBtn = $(".clBtn");
    openBtn = $(".opBtn");
}

function popupJS(opBtn,clBtn){
    var openTarget;
    $(opBtn).click(function(){
        openTarget = "#"+ $(this).attr("data-popName");
        $(openTarget).addClass('active');
    });
    $(clBtn).click(function(){
       $(openTarget).removeClass("active") 
    });
}
