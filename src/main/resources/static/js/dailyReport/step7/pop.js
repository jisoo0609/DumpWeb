var clBtn = null;
var opBtn = null;

$(document).ready(function(){
    init();
    popJS(opBtn,clBtn);
});

function init(){
    clBtn = $(".clBtn");
    opBtn = $(".opBtn");
}

function popJS(opBtn,clBtn){
    var opTarget;
    $(opBtn).click(function(){
        opTarget = "#"+ $(this).attr("data-popName");
        $(opTarget).addClass('active');
    });
    $(clBtn).click(function(){
       $(opTarget).removeClass("active")
    });
}
