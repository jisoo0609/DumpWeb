var tabBtn = null;
var tabPg = null;

$(document).ready(function(){
    init();
    tabInputJS(tabBtn,tabPg);
});
function init(){
    tabBtn = $(".tabBtn");
    tabPg = $(".tabPg");
}

function tabInputJS(tabBtn,tabPg){
    $(tabBtn).click(function(){
        $(tabBtn).removeClass('active');
        $(this).addClass('active');

        $(tabPg).removeClass('active');
        $('#' + $(this).attr('data-tab')).addClass('active')
    });
}