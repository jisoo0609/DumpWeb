
function getCheckParam(id){
    const checkBox = document.getElementById(id);
    return  "&" + id + "=" + checkBox.checked;
}

function save() {

    theForm = document.entry_form;


    if(theForm.drvClub.value==="" || theForm.drvDate.value==="" || theForm.lastKm.value==="" || theForm.useAmt.value==="" || theForm.useOil.value===""){
        if(theForm.drvClub.value==""){
            alert("품목을 선택해 주세요.")
            return
        }else if(theForm.drvDate.value==""){
            alert("날짜를 선택해 주세요.")
            return theForm.drvDate.focus();
        }else if(theForm.lastKm.value==""){
            alert("최종 주행 거리를 입력해 주세요.")
            return theForm.lastKm.focus();
        }else if(theForm.useAmt.value==""){
            alert("사용 금액을 입력해 주세요.")
            return theForm.useAmt.focus();
        }
    }

//    if (theForm.drvClub.value === "" || theForm.drvDate.value === "" || theForm.lastKm.value === "" || theForm.useAmt.value === "") {
//        alert("모든 필수 항목을 입력해 주세요.");
//        return;
//    }

//    if (theForm.drvClub.value === "요소수") {
//        if (theForm.rependdate.value === "" || theForm.repaddkm.value === "") {
//            alert("요소수 항목을 선택하면 교환 예정일과 교환 주행거리를 입력해야 합니다.");
//            return;
//        }
//    }

    if (document.querySelector('input[name="useOil"]').value.length === 0) {
        document.querySelector('input[name="useOil"]').value = '';
    }

    if(document.querySelector('input[name="repaddkm"]').value.length === 0){
        document.querySelector('input[name="repaddkm"]').value = '';
    }

    if(document.querySelector('input[name="rependdate"]').value.length === 0){
            document.querySelector('input[name="rependdate"]').value = '';
        }


    //fetch 코드도 고민해볼 것.
    const checkBoxID = ["chk2","rependchk"];

    let checkData = "";

    checkBoxID.forEach(id => checkData += getCheckParam(id));
    const formData = $("[name=entry_form]").serialize() + checkData;

    console.log(formData);

    $.ajax({
        url: "/dailyReport/carcareform/ajax/save",
        type: "POST",
        data: formData,
        success: function (data) {
            alert('저장 되었습니다.');
            bindList();

        }
    })
    const drvDateInput = document.getElementById("reg-date");
    const drvDateValue = drvDateInput.value;
    theForm.reset();

    drvDateInput.value = drvDateValue;
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


function deleteData(){
    $.ajax({
        url: "/dailyReport/carcareform/ajax/delete",
        type: "DELETE",
        data : {driveID : $("[name=driveID]").val()},
        success: function (data) {
            alert('삭제 되었습니다.');
            location.reload(true)
            bindList();
        }
    })
}

function clickListThAndRedirect(){
    const tableBody = document.querySelector("table tbody");

     tableBody.addEventListener("click", (event) => {
         const parentRow = event.target.closest("tr");
         if (parentRow) {
             const driveID = parentRow.getAttribute("data-drive-id");
             if (driveID) {
                 const url = `/dailyReport/carcareform?driveID=${driveID}`;
                 window.location.href = url;
             }
         }
    });
}

document.addEventListener("DOMContentLoaded", () =>{
     $.ajax({
            url: "/dailyReport/carcareform/ajax/firstList",
            type: "GET",
            success: function (data) {
                console.log(data);
                printList(data);
            }
        })
})