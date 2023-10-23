/* DOMContentLoaded */
document.addEventListener("DOMContentLoaded", function () {
    bindDispatchList();
    bindCarRecruitList();
});
document.addEventListener("DOMContentLoaded", function () {
    bindSummary();
    carFindList();
});

window.addEventListener('pageshow', function (event) {
    if (event.persisted || window.performance && window.performance.navigation.type == 2) {
        location.reload();
    }
});

function bindSummary() {
    $.ajax({
        url: "/dailyReport/driver/ajax/total",
        type: "POST",
        data: $("[name=option_frm]").serialize(),
        success: function (data) {
            printbindSummary(data);
        }
    });
}

function bindDispatchList() {
    $.ajax({
        url: "/dailyReport/driver/ajax/submitlist",
        type: "GET",
        success: function (data) {
            printDispatchList(data);
        }
    });
}

//금일 차량 모집 공고
function bindCarRecruitList() {
    $.ajax({
        url: "/dailyReport/driver/ajax/recruitlist",
        type: "GET",
        success: function (data) {
            printCarRecruitmentList(data);
        }
    });
}

function carFindList() {
    $.ajax({
        url: "/dailyReport/driver/ajax/tdrivelist",
        type: "GET",
        success: function (data) {
            printFindList(data);
        }
    });
}

function printbindSummary(data) {
    const boutmoney = document.getElementById("boutmoney");
    const boutcar = document.getElementById("boutcar");
    const boutdate = document.getElementById("boutdate");
    const boutuseamt = document.getElementById("boutuseamt");

    boutmoney.innerHTML = `${data.totalTransportationCost.toLocaleString()}원`;
    boutcar.innerHTML = `${data.totalQty.toLocaleString()}대`;

    if (data.finalDrvDate) {
        // "0000-00-00 00:00:00" 형식을 "00-00-00" 형식으로 변경
        const drvDateParts = data.finalDrvDate.split(" ")[0].split("-");
        const year = drvDateParts[0].slice(2); // 앞의 2자리를 제외한 연도
        const month = drvDateParts[1];
        const day = drvDateParts[2];

        boutdate.innerHTML = `${year}-${month}-${day}`;
    } else {
        // finalDrvDate가 null인 경우 아무것도 표시하지 않음
        boutdate.innerHTML = "없음";
    }

    boutuseamt.innerHTML = `${data.totalUseAmt.toLocaleString()}원`;
}

//대수 합치기
function groupAndSumData(searchResultData) {
    const groupedData = {};

    // 데이터를 그룹화하고 qty 값을 합산
    searchResultData.forEach(data => {
        const key = `${data.carSubmit}-${data.fromsite}-${data.tosite}-${data.item}`;

        if (!groupedData[key]) {
            groupedData[key] = {
                sheetID: data.sheetID,
                sheetSS2: data.sheetSS2,
                currStatus: data.currStatus,
                carSubmit: data.carSubmit,
                fromsite: data.fromsite,
                tosite: data.tosite,
                item: data.item,
                qty: 0,
            };
        }

        groupedData[key].qty += data.qty;
    });

    return Object.values(groupedData);
}

// ...
//금일 차량 배차 현황
function printDispatchList(searchResultData) {
    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector("#menusub");

    // 데이터를 그룹화하고 합산
    const groupedData = groupAndSumData(searchResultData);

    groupedData.sort((a, b) => a.carSubmit.localeCompare(b.carSubmit));
    // 'sheetSS2' 값을 기록할 변수
    let prevSheetSS2 = null;

    // 검색 결과 데이터를 테이블 본문에 추가.
    groupedData.forEach((data, index) => {
        const row = document.createElement("tr");

        // 'CurrStatus'가 '제출'인 경우 배경색 변경
        if (data.currStatus === '제출') {
            row.style.backgroundColor = '#84B8E8'; // 원하는 배경색으로 변경하세요.
        }

        // 현재 'sheetSS2' 값과 이전 값이 다를 때 빨간선 표시
        if (index > 0 && data.sheetSS2 !== prevSheetSS2) {
            row.style.borderTop = '2px solid red'; // 빨간색 상단 경계선
            prevSheetSS2 = data.sheetSS2; // 이전 'sheetSS2' 값 업데이트
        }

        row.innerHTML = `
            <td>${data.carSubmit}</td>
            <td>${data.fromsite}</td>
            <td>${data.tosite}</td>
            <td>${data.item}</td>
            <td>${data.qty}</td>
        `;
        row.setAttribute("data-sheetID", data.sheetID);

        tableBody.appendChild(row);

        prevSheetSS2 = data.sheetSS2;
    });
}


function formatPhoneNumber(phoneNumber) {
    // 전화번호를 하이픈으로 분리
    const formattedPhoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    return formattedPhoneNumber;
}

//금일 차량 모집 공고
function printCarRecruitmentList(searchResultData) {
    const tableBody = document.querySelector("#recruitment");

    //팝업기능
    const popupContainer = document.getElementById("popup-container");
    const carSubmitSpan = document.querySelector(".car-submit");
    const salesmanSpan = document.querySelector(".car-salesman");
    const carSubmitTelSpan = document.querySelector(".car-submitTel");


//리스트 출력 부분
    searchResultData.forEach(data => {

        const row = document.createElement("tr");

        row.innerHTML = `
                <td>${data.carSubmit}</td>
                <td>${data.fromsite}</td>
                <td>${data.tosite}</td>
                <td>${data.item}</td>
                <td>${data.qty}</td>
            `;
        //팝업기능
        row.addEventListener("click", () => {
            carSubmitSpan.textContent = data.carSubmit; //제출처
            carSubmitTelSpan.textContent = formatPhoneNumber(data.carSubmitTel); //제출처 번호
            carSubmitTelSpan.href = `tel:${data.carSubmitTel}`; // tel: 링크 설정
            salesmanSpan.textContent = data.salesman; //담당자

            popupContainer.style.display = "flex"; // 팝업 보이기
        });

        tableBody.appendChild(row);

    });
}

function printFindList(searchResultData) {
    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector("#carsub");
    tableBody.innerHTML = "";

    // 검색 결과 데이터를 필터링하고 날짜로 정렬.
    const filteredData = searchResultData
        .filter(data => (data.rependdate !== null) && (data.rependchk !== true))
        //교환예정일O,교환 완료 확인X 인 값만 나오게 필터링
        .sort((a, b) => {
            const dateA = new Date(a.rependdate);
            const dateB = new Date(b.rependdate);
            return dateA - dateB;
        });

    // 필터링된 검색 결과 데이터를 테이블 본문에 추가.
    filteredData.forEach((data, index) => {
        const row = document.createElement("tr");
        const rependdate = new Date(data.rependdate);
        // 월과 일을 두 자리 숫자로 표시하기 위해 패딩을 추가
        const month = (rependdate.getMonth() + 1).toString().padStart(2, '0');
        const day = rependdate.getDate().toString().padStart(2, '0');

        // 년도는 뒤의 두 자리만 가져오기
        const year = rependdate.getFullYear().toString().slice(-2);

        // 날짜를 원하는 형식으로 표시
        const formattedDate = `${year}-${month}-${day}`;

        // 주행거리에 콤마를 추가한 값을 얻습니다.
        const formattedRepaddkm = Number(data.repaddkm).toLocaleString();

        row.innerHTML = `
            <td>${data.drvClub}</td>
            <td>${formattedDate}</td>
            <td>${formattedRepaddkm}</td>
            <td>${data.drvRem}</td>
        `;
        row.setAttribute("data-drive-id", data.driveID);
        tableBody.appendChild(row);
    });
}


function clickListStep5Redirect() {
    const tableBody = document.querySelector("#carsub");

    tableBody.addEventListener("click", (event) => {
        // 클릭한 요소가 td 인지 확인
        if (event.target.tagName === 'TD') {
            let driveID = event.target.parentElement.getAttribute("data-drive-id");
            let url = "/dailyReport/carcareform" + "?driveID=" + driveID;
            window.location.href = url;
        }
    });
}

function clickListStep3Redirect() {
    const tableBody = document.querySelector("#menusub");

    tableBody.addEventListener("click", (event) => {
        let sheetID = event.target.parentElement.getAttribute("data-sheetID");
        let url = "/dailyReport/form" + "?sheetID=" + sheetID;
        window.location.href = url;

    });
}

document.addEventListener("DOMContentLoaded", function () {
    // 리다이렉트
    clickListStep5Redirect();
    clickListStep3Redirect();
    /*  chickList();*/
});


const popupContainer = document.getElementById("popup-container");
const closePopupButton = document.getElementById("close-popup");

closePopupButton.addEventListener("click", function () {
    // 이벤트의 기본 동작(여기서는 링크를 클릭할 때의 기본 동작)을 막습니다.
    event.preventDefault();
    // 팝업 창을 숨기기
    popupContainer.style.display = "none";

});


/*function chickList() {
    const tableBody = document.querySelector("#recruitment");
    // 초기에는 팝업을 숨기기
    popupContainer.style.display = "none";

    tableBody.addEventListener("click", (event) => {

        popupContainer.style.display = "flex"


    });

}*/
