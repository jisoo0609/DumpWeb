function getCheckParam(id){
    const checkBox = document.getElementById(id);
    return  "&" + id + "=" + checkBox.checked;
}


function save() {
    //fetch 코드도 고민해볼 것.

    const checkBoxID = ["chk2","rependchk"];

    let checkData = "";

    checkBoxID.forEach(id => checkData += getCheckParam(id));

    console.log($("[name=entry_form]").serialize() + checkData);

    $.ajax({
        url: "/dailyReport/carcareform/ajax/save",
        type: "POST",
        data: $("[name=entry_form]").serialize() + checkData,
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

function deleteData(){
    $.ajax({
        url: "/dailyReport/carcareform/ajax/delete",
        type: "DELETE",
        data : {driveID : $("[name=driveID]").val()},
        success: function (data) {
            console.log("제거 완료");
        }
    })
}
