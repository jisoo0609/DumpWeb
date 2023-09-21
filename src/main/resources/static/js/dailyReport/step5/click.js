function save() {
    //fetch 코드도 고민해볼 것.
    $.ajax({
        url: "/dailyReport/carcareform/ajax/save",
        type: "POST",
        data: $("[name=entry_form]").serialize(),
        success: function (data) {
            console.log('정상 저장');
        }
    })
}

function bindList() {
    $.ajax({
        url: "/dailyReport/carcareform/ajax/listload",
        type: "POST",
        data: {date : $("#reg-date").val()},
        success: function (data) {
            printList(data);
        }
    })
}
