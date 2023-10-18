/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    bindDispatchList();
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

function printSummary(data) {

    const ttamount = document.getElementById("ttamount");
    const tncars = document.getElementById("tncars");

    ttamount.innerHTML = data.totalTransportationCost.toLocaleString();
    tncars.innerHTML = data.totalTrips.toLocaleString();
}

function printDispatchList(searchResultData) {
    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector("table tbody");
    //tableBody.innerHTML = "";

    // 검색 결과 데이터를 테이블 본문에 추가.
    searchResultData.forEach((data, index) => {
        const row = document.createElement("tr");
        let order = [
            data.carNo, data.fromsite, data.tosite, data.item, data.qty];

        row.innerHTML = ` 
                    <td>${order[0]}</td>
                    <td>${order[1]}</td>
                    <td>${order[2]}</td> 
                    <td>${order[3]}</td>
                    <td>${order[4]}</td> 
                 `;

        row.setAttribute("data-sheet-sub-ss2", data.sheetsubSS2);
        row.setAttribute("data-sheet-id", data.sheetID);
        tableBody.appendChild(row);
    });

};

/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    clickListThAndRedirect();
});

/* 리스트의 행 클릭시, 파라미터와 함께 step5로 이동하도록 처리. */
function clickListThAndRedirect() {
    const tableBody = document.querySelector("table tbody");

    tableBody.addEventListener("click", (event) => {
        const parentRow = event.target.closest("tr");
        if (parentRow) {
            const sheetID = parentRow.getAttribute("data-sheet-id");

            if (sheetID === null) {
                return;
            }
console.log(sheetID)

            const sheetSubSS2 = parentRow.getAttribute("data-sheet-sub-ss2");
console.log(sheetSubSS2)
            if (sheetSubSS2 !== null) {
                const uuserID = document.querySelector('input[name="sheetSubSS2"]').value;
console.log(uuseerID)
                if(sheetSubSS2 ===  uuserID){
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

