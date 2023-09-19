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


/*
    2023-09-18 김준형
    일괄배차 팝업 open, close 함수 추가
 */
function openPopupTest(pop_name) {
    $("#pop-" + pop_name).removeClass("dis-n");
}

function closePopUpTest(e) {
    $(e).closest(".layerMask").addClass("dis-n");
}