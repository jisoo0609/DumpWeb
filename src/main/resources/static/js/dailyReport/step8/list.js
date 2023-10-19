//몇번째 radio 버튼이 눌렸는지를 리턴해줌
function changeTableColumnOrder() {
    const searchTypeRadio = document.querySelectorAll('input[name="sortingCriteria"]');
    let checkedNumber;

    for (let i = 0; i < searchTypeRadio.length; i++) {
        if (searchTypeRadio[i].checked) {
            checkedNumber = i;
            break;
        }
    }
    return checkedNumber;
}

function changeHeader() {   //라디오버튼 선택값에 따라 헤더 바꾸는 함수
    const headerRow = document.querySelector("thead tr"); // thead의 첫 번째 행을 선택
    const checkedNumber = changeTableColumnOrder();
    while (headerRow.firstChild) {
        headerRow.removeChild(headerRow.firstChild); // 기존 헤더 제거
    }

    if (checkedNumber === 0) { // 차량 기준 선택
        const headers = ["운행일", "상차지", "하차지", "품목", "차량번호", "대수", "상태", "확인"];
        const widths = ["15%", "15%", "15%", "15%", "15%", "10%", "12%", "12%"];
        for (let i = 0; i < headers.length; i++) {
            const th = document.createElement("th");
            th.textContent = headers[i];
            th.style.width = widths[i];
            headerRow.appendChild(th);
        }
    } else if (checkedNumber === 1 || checkedNumber === 2) { // 운행일 기준 & 품목 기준 선택
        const headers = ["운행일", "상차지", "하차지", "품목", "차량번호", "대수", "운반단가"];
        const widths = ["15%", "15%", "15%", "15%", "15%", "10%", "20%"];
        for (let i = 0; i < headers.length; i++) {
            const th = document.createElement("th");
            th.textContent = headers[i];
            th.style.width = widths[i];
            headerRow.appendChild(th);
        }
    }
}

// 검색 버튼 클릭 이벤트를 처리.
function printList(searchResultData) {
    changeHeader()

    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector("table tbody");
    tableBody.innerHTML = "";
    
    //라디오 선택 값 얻어옴
    const checkedNumber = changeTableColumnOrder();
    let prevCriteria;
    let no = 1;

    // 검색 결과 데이터를 테이블 본문에 추가.
    searchResultData.forEach((data, index) => {
        const row = document.createElement("tr");
        let order = [
            data.date, data.fromsite, // 정렬 기준.
            data.tosite, data.item, data.carNo, data.qty, data.qtyup, data.currStatus, data.chk2
        ];
        if(checkedNumber===0){ //차량기준일 땐 제출처확인-상태 순서로.
            row.innerHTML = ` 
                    <td>${order[0]}</td>
                    <td>${order[1]}</td> 
                    <td>${order[2]}</td>
                    <td>${order[3]}</td> 
                    <td>${order[4]}</td>
                    <td>${order[5]}</td>
                    <td class="currStatus">${order[7]}</td>
                    <td> <input type="checkbox" class="checkConfirm" disabled
                    ${order[8] == '1' ? 'checked' : ''}></td>
                 `;

        }else {   //나머지 기준은 상태 지우고 운반단가가 마지막으로.
        row.innerHTML = ` 
                    
                    <td>${order[0]}</td>
                    <td>${order[1]}</td> 
                    <td>${order[2]}</td>
                    <td>${order[3]}</td> 
                    <td>${order[4]}</td>
                    <td>${order[5]}</td>
                    <td>${order[6].toLocaleString()}</td>
                     `;
        }
        // 라디오 버튼의 선택값에 따라서 현재 기준 값을 설정
        let currentCriteria;

        if (checkedNumber === 0) {
            currentCriteria = order[4]; // 차량 기준
        } else if (checkedNumber === 1) {
            currentCriteria = order[3]; // 품목 기준
        } else if (checkedNumber === 2) {
            currentCriteria = order[0]; // 운행일 기준
        }
        console.log("prevCriteria : " + prevCriteria)

        //빨간 기준선 추가
        if (index > 0 && prevCriteria !== currentCriteria) {
            row.classList.add("red-line-divider");
        }
        prevCriteria = currentCriteria;
        console.log("currentCriteria : " + currentCriteria)

        row.setAttribute("receipt-subID", data.sheetsubID);
        row.setAttribute("receipt-sheetID", data.sheetID);
        row.setAttribute("receipt-writerIDX", data.writerIDX);
        row.setAttribute("receipt-sheetSS2", data.sheetSS2);
        row.setAttribute("receipt-status", data.currStatus);
        /*운반단가기준 & 품목기준에서는 테이블에서 "상태"열을 지워야 하므로
         clickListThAndRedirect()함수에서 상태값을 받기위해 특성지정 */

        tableBody.appendChild(row);
    });

};


//셀렉트 박스 값들 중복 제거
function getUniqueSelectBoxData(data, key) {
    const uniqueValues = new Set();
    data.forEach(function (item) {
        uniqueValues.add(item[key]);
    });
    return Array.from(uniqueValues);
}

// 중복이 제거된 값을 <option>으로 추가
function populateSelectOptions(selectElement, values) {
    values.forEach(function (value) {
        const option = document.createElement("option");
        option.value = value;
        option.textContent = value;
        selectElement.appendChild(option);
    });
}

//셀렉트 박스 데이터 얻어오고 화면에 출력
function getSelectBoxData() {
    $.ajax({
        url: "/dailyReport/receipts/ajax/selectboxlist",
        type: "POST",
        success: function (data) {

            const uniqueFromsiteValues = getUniqueSelectBoxData(data, "fromsite");
            const uniqueTositeValues = getUniqueSelectBoxData(data, "tosite");
            const uniqueItemValues = getUniqueSelectBoxData(data, "item");
            const uniqueCarNoValues = getUniqueSelectBoxData(data, "carNo");

            // 각 필드에 대한 <select> 요소를 선택
            const fromsiteSelect = document.getElementById("fromsiteBox");
            const tositeSelect = document.getElementById("tositeBox");
            const itemSelect = document.getElementById("itemBox");
            const carNoSelect = document.getElementById("CarNoBox");

            // 각 필드에 대한 <select> 요소에 중복이 제거된 값들을 추가
            populateSelectOptions(fromsiteSelect, uniqueFromsiteValues);
            populateSelectOptions(tositeSelect, uniqueTositeValues);
            populateSelectOptions(itemSelect, uniqueItemValues);
            populateSelectOptions(carNoSelect, uniqueCarNoValues);
        }
    });
}

function printSummary(searchResultData) {
    // 검색 결과 텍스트 생성
    const dataCount = searchResultData.length;
    const totalCount = searchResultData.reduce((total, data) => total + (data.qty * data.qtyup), 0);

    //비용금액 버튼 내용 변경
    const costButton = document.querySelector(".agreement_container .transportCost");
    costButton.innerHTML = `${totalCount.toLocaleString()}`;

    // 결과를 result_search 요소에 출력
    const resultSearch = document.querySelector("#total");
    resultSearch.innerHTML = `<h1 style="color:#333">데이터 <span class="blue" style="color:#0068b7">${dataCount}</span>건이 검색되었습니다.</h1>`;
}

//라디오 정렬값에 따라 테이블 헤더&바디 순서 변경하는 코드 -> 후에 대표님 요청사항이 또 바뀌면 그때 사용하기
// function insertTitleThInFront(arr, idx) {
//     //삭제 -> 삽입하여 header td를 제일 앞으로 옮김.
//     const firstTh = arr.splice(idx, 1)[0];
//     arr.splice(0, 0, firstTh);
// }
//
// // radio 버튼에 따라 테이블 열 순서 변경 함수
// function changeTableColumnOrder() {
//     const searchTypeRadio = document.querySelectorAll('input[name="sortingCriteria"]');
//     const header = Array.from(document.querySelectorAll(".th_header"));
//
//     let firstThFlag;
//
//     for (let i = 0; i < searchTypeRadio.length; i++) {
//         if (searchTypeRadio[i].checked) {
//             firstThFlag = i;
//             break;
//         }
//     }
//
//     let order = ["운행일", "차량", "품목", "운반비"];
//     insertTitleThInFront(order, firstThFlag);
//
//     for (let i = 0; i < header.length; i++) {
//         header[i].textContent = order[i];
//     }
//
//     return firstThFlag;
// }
//
// // 검색 버튼 클릭 이벤트를 처리.
// function printList(searchResultData) {
//     // 테이블 본문 내용 초기화
//     const tableBody = document.querySelector("table tbody");
//     tableBody.innerHTML = "";
//
//     // radio 버튼에 따라 테이블 열 순서 변경
//     const firstThFlag = changeTableColumnOrder();
//
//     let start = new Array(searchResultData[0].date
//         , searchResultData[0].carNo
//         , searchResultData[0].item
//         , searchResultData[0].qtyup)[firstThFlag];
//
//     let no = 1;
//
//     let orderMap = {
//         0: 0,
//         1: 3,
//         2: 4,
//         3: 6
//     };
//
//     // 검색 결과 데이터를 테이블 본문에 추가.
//     searchResultData.forEach((data, index) => {
//         const row = document.createElement("tr");
//         let order = [
//             data.date, data.fromsite, // 정렬 기준.
//             data.tosite, data.carNo, data.item, data.qty, data.qtyup
//         ];
//
//         insertTitleThInFront(order, orderMap[firstThFlag]);
//
//         row.innerHTML = `
//                     <td>${no}</td>
//                     <td>${orderMap[firstThFlag] === 6 ? order[0].toLocaleString() : order[0]}</td>
//                     <td>${order[1]}</td>
//                     <td>${order[2]}</td>
//                     <td>${order[3]}</td>
//                     <td>${order[4]}</td>
//                     <td>${order[5]}</td>
//                     <td>${order[6].toLocaleString()}</td>
//                  `;
//
//         no++;
//
//         let end = order[0];
//
//         //빨간 기준선 추가.
//         if (start !== end) {
//             start = end;
//             row.classList.add("red-line-divider")
//         }
//
//         row.setAttribute("data-drive-id", data.sheetsubID);
//         tableBody.appendChild(row);
//     });
//
// };

