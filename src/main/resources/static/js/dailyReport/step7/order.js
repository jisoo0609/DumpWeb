function cancel() {
    // 팝업 창을 숨기는 코드
    const golPop2 = document.querySelector("#golPop2");
    golPop2.classList.remove("active");
    emptyRow();
}

function getCheckParam(id){
    const checkBox = document.getElementById(id);
    return  "&" + id + "=" + checkBox.checked;
}

function save() {
    $("#fromsite").prop("disabled", false);
    $("#tosite").prop("disabled", false);
    $("#item").prop("disabled", false);
    $("#Qty").prop("disabled", false);
    $("#carNo").prop("disabled", false);
    $("#Qtyup").prop("disabled", false);

    const checkBoxID = ["chk1"];

    let checkData = "";

    checkBoxID.forEach(id => checkData += getCheckParam(id));
    const formData = $("[name=golForm]").serialize() + checkData;

    console.log(formData);

    $.ajax({
        url: "/dailyReport/ajax/orderSave",
        type: "POST",
        data: formData,
        async: false,
        success: function (data) {
            alert("저장이 완료되었습니다.");
            bindList();
        }
    })
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {
    $.ajax({
        url: "/dailyReport/ajax/orderList",
        type: "POST",
        data: $("[name=golForm]").serialize(),
        success: function (data) {
            // 팝업 창을 숨기는 코드
            const golPop3 = document.querySelector("#golPop3");
            golPop3.classList.remove("active");
            emptyRow();
            printTable(data);
        }
    })
}

/* 저장&확인 버튼을 눌렀을 때, input 필드에 있는 값 초기화 */
function emptyRow() {
    const fromsiteInput = document.querySelector("#fromsite");
    const tositeInput = document.querySelector("#tosite");
    const itemInput = document.querySelector("#item");
    const QtyInput = document.querySelector("#Qty");
    const carNoInput = document.querySelector("#carNo");
    const QtyupInput = document.querySelector("#Qtyup");

    fromsiteInput.value = "";
    tositeInput.value = "";
    itemInput.value = "";
    QtyInput.value = "";
    carNoInput.value = "";
    QtyupInput.value = "";
}

/* 표에 새 행을 추가 */
function printTable(searchResultData) {

    const tableBody = document.querySelector("table tbody");
    tableBody.innerHTML = "";

    if (!searchResultData) {
        tableBody.innerHTML = '<tr><td colspan="6" style="text-align: center;">입력된 정보가 없습니다.</td></tr>';
        return;
    }

    searchResultData.slice(0, 10).forEach((data, index) => {
        const row = document.createElement("tr");

        let order = [
            data.fromsite,
            data.tosite,
            data.item,
            data.qty,
            data.carNo
        ];

        //데이터 테이블에 출력
        row.innerHTML = `
            <td>${index + 1}</td>   
            <td>${order[0]}</td>
            <td>${order[1]}</td>
            <td>${order[2]}</td>
            <td>${order[3]}</td>
            <td>${order[4]}</td>
        `;

        row.setAttribute("data-sheet-sub-id", data.sheetsubID);
        tableBody.appendChild(row);
    });
}


document.addEventListener("DOMContentLoaded", function () {
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let sheetsubID = params.get("subID");

    if (sheetsubID !== null) {
        getSheetsubIDDataByParams(sheetsubID);
    }
    else{
        bindList();
    }
    clickListThAndRedirect();
});

function orderDelete(){
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let sheetsubID = params.get("subID");

    $.ajax({
        url: "/dailyReport/ajax/orderDelete",
        type: "DELETE",
        data: {sheetsubID: sheetsubID},
        success: function (data) {
            alert("삭제 되었습니다.");
            window.location.href = '/dailyReport/orderform';
        }
    })

}




function getSheetsubIDDataByParams(sheetsubID) {
    $.ajax({
        url: "/dailyReport/ajax/details",
        type: "POST",
        data: {sheetsubID: sheetsubID},
        success: function (data) {
            document.getElementById('date').value = data.drvDate;
            document.getElementById('fromsite').value = data.fromsite;
            document.getElementById('tosite').value = data.tosite;
            document.getElementById('item').value = data.item;
            document.getElementById('Qty').value = data.qty;
            document.getElementById('carNo').value = data.carNo;
            document.getElementById('Qtyup').value = data.qtyup;
        }
    })
}

/* 리스트의 행 클릭시, 상태값에 따라 파라미터와 함께 step3 or step7로 이동하도록 처리. */
function clickListThAndRedirect() {
    const tableBody = document.querySelector("table tbody");

    tableBody.addEventListener("click", (event) => {
        const parentRow = event.target.closest("tr");
        if (parentRow) {
            const sheetsubID = parentRow.getAttribute("data-sheet-sub-id");
            if (sheetsubID) {
                const url = `/dailyReport/orderform?subID=${sheetsubID}`;
                window.location.href = url;
            }
        }
    });
}