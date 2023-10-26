/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    bindDispatchList();
    bindSubmittedList();
    bindRecruitmentList();
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
            printDispatchList(data, "tbody1");
        }
    });
}

function bindSubmittedList() {
    $.ajax({
        url: "/dailyReport/manager/ajax/submittedlist",
        type: "GET",
        success: function (data) {
            printDispatchList(data, "tbody2");
        }
    });
}

function bindRecruitmentList() {
    $.ajax({
        url: "/dailyReport/manager/ajax/recruitmentlist",
        type: "GET",
        success: function (data) {
            printDispatchList(data, "tbody3");
        }
    });
}

function printSummary(data) {
    const ttamount = document.getElementById("ttamount");
    const tncars = document.getElementById("tncars");

    ttamount.innerHTML = "총 운반 금액: " + data.totalTransportationCost.toLocaleString() + "원";
    tncars.innerHTML = "총 운반 대수: " + data.totalTrips.toLocaleString() + "대";
}

function printDispatchList(searchResultData, tbodyId) {
    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector(`#${tbodyId}`);
    tableBody.innerHTML = "";

    searchResultData.forEach((data, index) => {
        const row = document.createElement("tr");

        if (data.carNo !== "") {
            if (data.carNo !== "공고" || tbodyId !== "tbody1") {
                const order = [data.carNo, data.fromsite, data.tosite, data.item, data.qty];
                row.innerHTML = `
                    <td>${order[0]}</td>
                    <td>${order[1]}</td>
                    <td>${order[2]}</td> 
                    <td>${order[3]}</td>
                    <td>${order[4]}</td>
                `;

                if (tbodyId === "tbody2") {
                    row.innerHTML += `
                        <td>
                            <input
                            type="checkbox"
                            class="checkConfirm"
                            ${data.chk2 === true ? 'checked' : ''} disabled>
                        </td>
                    `;
                }
            }
        } else {
            const order = ["미지정", data.fromsite, data.tosite, data.item, data.qty];
            row.innerHTML = `
                <td class="carNoDesign">${order[0]}</td>
                <td>${order[1]}</td>
                <td>${order[2]}</td> 
                <td>${order[3]}</td>
                <td>${order[4]}</td>
            `;

            if (tbodyId === "tbody2") {
                row.innerHTML += `
                    <td>
                        <input
                        type="checkbox"
                        class="checkConfirm"
                        ${data.chk2 === true ? 'checked' : ''} disabled>
                    </td>
                `;
            }
        }

        if (tbodyId === "tbody3") {
            const order = [data.fromsite, data.tosite, data.item, data.qty];
            row.innerHTML = `
                <td>${order[0]}</td>
                <td>${order[1]}</td>
                <td>${order[2]}</td> 
                <td>${order[3]}</td>
            `;
        }

        row.setAttribute("data-writerIdx", data.writerIDX);
        row.setAttribute("data-sheet-id", data.sheetID);

        tableBody.appendChild(row);
    });
}

/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    clickListThAndRedirect();
    clickListThAndRedirect2();
});

/* 리스트의 행 클릭시, 파라미터와 함께 step5로 이동하도록 처리. */

function clickListThAndRedirect() {

    const tableBody1 = document.querySelector("#tbody1");


    tableBody1.addEventListener("click", (event) => {
        const parentRow = event.target.closest("tr");
        console.log(parentRow);
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
                }else
                {
                 alert("기사가 등록한 전표입니다.");

                }

            }




        }
    });



}
function clickListThAndRedirect2() {

    const tableBody2 = document.querySelector("#tbody2");


    tableBody2.addEventListener("click", (event) => {
        const parentRow = event.target.closest("tr");
        console.log(parentRow);
        if (parentRow) {
            const sheetID = parentRow.getAttribute("data-sheet-id");

            if (sheetID === null) {

                return;
            }


                 const url = `/dailyReport/form?sheetID=${sheetID}`;
                 window.location.href = url;



            }





    });



}

