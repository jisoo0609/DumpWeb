// 일괄취소 버튼 요소를 가져옵니다.
const cancelButton = document.querySelector(".common_btn:nth-of-type(2)");

// 일괄취소 버튼 클릭 이벤트를 처리합니다.
cancelButton.addEventListener("click", () => {
    // 테이블 본문 요소를 찾습니다.
    const tableBody = document.querySelector("table tbody");

    // 테이블 본문 내용을 초기화합니다. (데이터 삭제)
    tableBody.innerHTML = "";

    // 검색 결과 텍스트 초기화
    const resultSearch = document.querySelector(".result_search");
    resultSearch.innerHTML = "";
});

// radio 버튼에 따라 테이블 열 순서 변경 함수
function changeTableColumnOrder() {
    const dateHeader = document.getElementById("date-header");
    const itemHeader = document.getElementById("item-header");
    const searchTypeRadio = document.querySelectorAll('input[name="searchType"]:checked');

    if (searchTypeRadio[0].value === "date") {
        dateHeader.textContent = "날짜";
        itemHeader.textContent = "품목";
        return 1;
    } else if (searchTypeRadio[0].value === "item") {
        dateHeader.textContent = "품목";
        itemHeader.textContent = "날짜"
        return 2;
    }
}

// 검색 버튼 클릭 이벤트를 처리합니다.
function printTableColumnOrder(searchResultData) {
    // radio 버튼에 따라 테이블 열 순서 변경
    let orderFlag = changeTableColumnOrder();

    // 테이블 본문 요소
    const tableBody = document.querySelector("table tbody");

    // 테이블 본문 내용 초기화
    tableBody.innerHTML = "";

    let start = orderFlag === 1 ? searchResultData[0].drvDate : searchResultData[0].drvClub;

    // 검색 결과 데이터를 테이블 본문에 추가합니다.
    searchResultData.forEach((data, index) => {
        const row = document.createElement("tr");
        let orderInfo

        if (orderFlag == 1) {
            orderInfo = [`${data.drvDate}`, `${data.drvClub}`]
        } else if (orderFlag == 2) {
            orderInfo = [`${data.drvClub}`, `${data.drvDate}`]
        }

        const lastKm = data.lastKm.toLocaleString();
        const useAmt = data.useAmt.toLocaleString();
        const rependchk = data.rependchk === true ? 'O' : 'X';

        row.innerHTML = `
                    <tr>
                    <td>${orderInfo[0]}</td>
                    <td>${orderInfo[1]}</td>
                    <td>${lastKm}</td> 
                    <td>${useAmt}</td>
                    <td>${data.drvRem}</td> 
                    <td>${rependchk}</td>
                    </tr>
                 `;

        let end = orderInfo[0];

        if(start !== end){
            start = end;
            row.classList.add("red-line-divider")
        }

        tableBody.appendChild(row);
    });

    // 검색 결과 텍스트 생성
    const dataCount = searchResultData.length;

    const totalCount = searchResultData.reduce((total, data) => total + data.useAmt, 0);

    // 비용금액 버튼 내용 변경
    const costButton = document.querySelector(".agreement_container .resultPrice");
    costButton.innerHTML = `${totalCount.toLocaleString()}원`;
    // ...

    // 결과를 result_search 요소에 출력
    const resultSearch = document.querySelector(".result_search");
    resultSearch.innerHTML = `<h1>데이터 <span class="blue">${dataCount}</span>건이 검색되었습니다.</h1>`;

};


function bindList() {
    $.ajax({
        url: "/dailyReport/ajax/carcarelist",
        type: "POST",
        data: $("[name=select_frm]").serialize(),
        success: function (data) {
            printTableColumnOrder(data);
        }
    })
}

// 현재 날짜를 가져와서 운행일 입력 상자의 초기 값으로 설정
document.addEventListener("DOMContentLoaded", function () {
    // 페이지 로드 시 초기 테이블 열 순서 설정
    changeTableColumnOrder();

    const startDateInput = document.getElementById("start-date");
    const endDateInput = document.getElementById("end-date");

    const today = new Date();
    const firstDayOfMonth = new Date(
        today.getFullYear(),
        today.getMonth(),
        2
    );


    // 시작 날짜를 당월 1일로 설정
    startDateInput.value = firstDayOfMonth.toISOString().split("T")[0];

    // 종료 날짜를 오늘로 설정
    endDateInput.value = today.toISOString().split("T")[0];

    const searchButton = document.querySelector(".search_btn");
    searchButton.onclick();
});