function getList(){
    $.ajax({
       url: "/dailyReport/ajax/list",
        type: "POST",
        data: $("[name=data_frm]").serialize(),
        success: function(data){
           //서버에서 받은 데이터 처리할 함수 입력
        }
    });
}