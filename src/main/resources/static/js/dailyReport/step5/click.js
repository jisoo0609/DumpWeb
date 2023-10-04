function getCheckParam(id){
    const checkBox = document.getElementById(id);
    return  "&" + id + "=" + checkBox.checked;
}

function bindList() {
    $.ajax({
        url: "/dailyReport/carcareform/ajax/list",
        type: "POST",
        data: {date : $("#reg-date").val()},
        success: function (data) {
            printList(data);
        }
    })
}


function save() {

    //fetch 코드도 고민해볼 것.
    const checkBoxID = ["chk2","rependchk"];

//    let checkData = "";
//    String drvClub = request.getParameter("drvClub");
//    String drvDate = request.getParameter("drvDate");
//    int lastKm = request.getParameter("lastKm");
//    int useAmt = request.getParameter("useAmt");
//    int useOil = request.getParameter("useOil");
//    String drvRem = request.getParameter("drvRem");
//    String exchange-date = request.getParameter("exchange-date");
//    int nextlastkm = request.getParameter("nextlastkm");
//
//    // 빈 값 처리
//    if (drvClub == null || drvClub.isEmpty()) {
//        drvClub = "";
//    }
//    if (drvDate == null || drvDate.isEmpty()) {
//        drvDate = "";
//    }
//    if (lastKm == null || lastKm.isEmpty()) {
//        lastKm = "";
//    }
//    if (useAmt == null || useAmt.isEmpty()) {
//        useAmt = "";
//    }
//    if (useOil == null || useOil.isEmpty()) {
//        useOil = "";
//    }
//    if (drvRem == null || drvRem.isEmpty()) {
//        drvRem = "";
//    }

    checkBoxID.forEach(id => checkData += getCheckParam(id));

    console.log($("[name=entry_form]").serialize() + checkData);

    $.ajax({
        url: "/dailyReport/carcareform/ajax/save",
        type: "POST",
        data: $("[name=entry_form]").serialize() + checkData,
        success: function (data) {
            alert('저장 되었습니다.');
            bindList();
        }
    })
}


function deleteData(){
    $.ajax({
        url: "/dailyReport/carcareform/ajax/delete",
        type: "DELETE",
        data : {driveID : $("[name=driveID]").val()},
        success: function (data) {
            alert('삭제 되었습니다.');
            bindList();
        }
    })
}

function clickListThAndRedirect(){
    const listRow = document.querySelector("table tbody");

    listRow.addEventListener("click", (event) => {
        let driveID = event.target.parentElement.getAttribute("data-drive-id")
        let url = "/dailyReport/carcareform" + "?driveID=" + driveID;
        window.location.href = url;
    });
}