
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

    theForm = document.entry_form;

    if(theForm.drvClub.value==="" || theForm.drvDate.value==="" || theForm.lastKm.value==="" || theForm.useAmt.value==="" || theForm.useOil.value===""){
        if(theForm.drvClub.value==""){
            alert("품목을 선택해 주세요.")
        }else if(theForm.drvDate.value==""){
            alert("날짜를 선택해 주세요.")
            return theForm.drvDate.focus();
        }else if(theForm.lastKm.value==""){
            alert("최종 주행 거리를 입력해 주세요.")
            return theForm.lastKm.focus();
        }else if(theForm.useAmt.value==""){
            alert("사용 금액을 입력해 주세요.")
            return theForm.useAmt.focus();
        }else if(theForm.useOil.value==""){
            alert("주유량을 입력해 주세요.")
            return theForm.useOil.focus();
        }else if(theForm.rependdate.value==""){
            alert("교환 예정일을 선택해 주세요.")
            return theForm.rependdate.focus();
        }else if(theForm.rependchk.value==""){
            alert("교환완료 체크를 해주세요")
        }
    }

    if(document.querySelector('input[name="rependdate"]').value.length === 0){
        document.querySelector('input[name="rependdate"]').value = '-1';
    }

    if(document.querySelector('input[name="repaddkm"]').value.length === 0){
        document.querySelector('input[name="repaddkm"]').value = '-1';
    }


    //fetch 코드도 고민해볼 것.
    const checkBoxID = ["chk2","rependchk"];

    let checkData = "";

    checkBoxID.forEach(id => checkData += getCheckParam(id));


    const formData = $("[name=entry_form]").serialize() + checkData;

    if(document.querySelector('input[name="rependdate"]').value === '-1'){
        document.querySelector('input[name="rependdate"]').value = '';
    }

    if(document.querySelector('input[name="repaddkm"]').value === '-1'){
        document.querySelector('input[name="repaddkm"]').value = '';
    }

    $.ajax({
        url: "/dailyReport/carcareform/ajax/save",
        type: "POST",
        data: formData,
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