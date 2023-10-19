/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    bindDispatchList();
    bindSubmittedList();
});


function bindSummary() {
    $.ajax({
        url: "/dailyReport/manager/ajax/summary",
        type: "POST",
        data: $("[name=option_frm]").serialize(),
        success: function (data) {
            printSummary(data);
        }
    });
}

function bindDispatchList() {
    $.ajax({
        url: "/dailyReport/manager/ajax/submitlist",
        type: "GET",
        success: function (data) {
            printDispatchList(data);
        }
    });
}

function bindSubmittedList() {
    $.ajax({
        url: "/dailyReport/manager/ajax/submittedlist",
        type: "GET",
        success: function (data) {
            printDispatchList(data);
        }
    });
}


function printSummary(data) {

    const ttamount = document.getElementById("ttamount");
    const tncars = document.getElementById("tncars");

    ttamount.innerHTML = data.totalTransportationCost.toLocaleString();
    tncars.innerHTML = data.totalTrips.toLocaleString();
}

function printDispatchList(searchResultData) {
    // 테이블 본문 내용 초기화
    const tableBody1 = document.querySelector("#tbody1");
    const tableBody2 = document.querySelector("#tbody2");
    //tableBody.innerHTML = "";

    // 검색 결과 데이터를 테이블 본문에 추가.
    searchResultData.forEach((data, index) => {
        const row1 = document.createElement("tr");
        let order = [
            data.carNo, data.fromsite, data.tosite, data.item, data.qty];

        row.innerHTML = ` 
                    <td>${order[0]}</td>
                    <td>${order[1]}</td>
                    <td>${order[2]}</td> 
                    <td>${order[3]}</td>
                    <td>${order[4]}</td> 
                 `;

        row.setAttribute("data-writerIdx", data.writerIDX);
        row.setAttribute("data-sheet-id", data.sheetID);

        tableBody1.appendChild(row);
        tableBody2.appendChild(row);
    });
};

/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    clickListThAndRedirect();
});

/* 리스트의 행 클릭시, 파라미터와 함께 step5로 이동하도록 처리. */

function clickListThAndRedirect() {

    const tableBody1 = document.querySelector("#tbody1");

    tableBody1.addEventListener("click", (event) => {
        const parentRow = event.target.closest("tr");
        if (parentRow) {
            const sheetID = parentRow.getAttribute("data-sheet-id");

            if (sheetID === null) {
                return;
            }
    console.log(sheetID)
            const writerIdx = parentRow.getAttribute("data-writerIdx");
    console.log(writerIdx)

            if (writerIdx !== null) {
                const sheetSubSS2 = document.querySelector('input[name="sheetSubSS2"]').value;
                if(sheetSubSS2 ===  writerIdx){
                    const url = `/dailyReport/orderform?groupSheetID=${sheetID}`;
                    window.location.href = url;
                }

            }
            // if (userPosition === 'manager') {
            //     const url = `/dailyReport/orderform?sheetID=${sheetID}`;
            //     window.location.href = url;
            // }
        }
    });

}

