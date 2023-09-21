function insertFirstHeader(arr,idx){
    //삭제 -> 삽입하여 header td를 제일 앞으로 옮김.
    const firstHeader = arr.splice(idx,1)[0];
    arr.splice(0,0,firstHeader);
}

// radio 버튼에 따라 테이블 열 순서 변경 함수
function changeTableColumnOrder() {
    const searchTypeRadio = document.querySelectorAll('input[name="searchType"]:checked');
    const header = Array.from(document.querySelectorAll(".th_header"));

    let searchType = searchTypeRadio[0].value.split("-");
    let firstHeaderFlag =  parseInt(searchType[0]);

    let order = ["날짜", "품목"];

    insertFirstHeader(order,firstHeaderFlag);

    for(let i=0; i<header.length; i++){
        header[i].textContent = order[i];
    }

    return firstHeaderFlag;
}

// 검색 버튼 클릭 이벤트를 처리합니다.
function printTableColumnOrder(searchResultData) {
    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector("table tbody");
    tableBody.innerHTML = "";

    // radio 버튼에 따라 테이블 열 순서 변경
    const firstHeaderFlag = changeTableColumnOrder();

    let start = new Array(searchResultData[0].drvDate, searchResultData[0].drvClub)[firstHeaderFlag];

    // 검색 결과 데이터를 테이블 본문에 추가합니다.
    searchResultData.forEach((data, index) => {
        const row = document.createElement("tr");
        let order = [
            data.drvDate, data.drvClub, // 정렬 기준.
            data.lastKm.toLocaleString(),data.useAmt.toLocaleString(),data.drvRem, (data.rependchk === true ? 'O' : 'X'),
            data.chk2,data.useOil,data.rependdate,data.repaddkm // hidden data
        ];

        insertFirstHeader(order,firstHeaderFlag);

        row.innerHTML = ` 
                    <td>${order[0]}</td>
                    <td>${order[1]}</td>
                    <td>${order[2]}</td> 
                    <td>${order[3]}</td>
                    <td>${order[4]}</td> 
                    <td>${order[5]}</td>
                    <td style="display: none">${order[6]}</td>
                    <td style="display: none">${order[7]}</td>
                    <td style="display: none">${order[8]}</td>
                    <td style="display: none">${order[9]}</td>
                 `;

        let end = order[0];

        if (start !== end) {
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
    costButton.innerHTML = `${totalCount.toLocaleString()}`;
    // ...

    // 결과를 result_search 요소에 출력
    const resultSearch = document.querySelector(".result_search");
    resultSearch.innerHTML = `<h1>데이터 <span class="blue">${dataCount}</span>건이 검색되었습니다.</h1>`;

};