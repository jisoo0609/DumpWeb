function printList(searchResultData) {
    // 테이블 본문 내용 초기화
    const tableBody = document.querySelector("table tbody");
    tableBody.innerHTML = "";

    // 검색 결과 데이터를 테이블 본문에 추가.
    searchResultData.forEach((data, index) => {
        const row = document.createElement("tr");
        let order = [
            data.drvDate, data.drvClub, // 정렬 기준.
            data.lastKm.toLocaleString(), data.useAmt.toLocaleString(), data.drvRem, (data.rependchk === true ? 'x' : 'o'),
            data.chk2, data.useOil, data.rependdate, data.repaddkm // hidden data
        ];

        row.innerHTML = ` 
                    <td>${order[0]}</td>
                    <td style="width: 55px;">${order[1]}</td>
                    <td class="Drvtd2" style="text-align: right">${order[2]}</td>
                    <td style="text-align: right">${order[3]}</td>
                    <td>${order[4]}</td>
                    <td>${order[5]}</td>
                    <td style="display: none">${order[6]}</td>
                    <td style="display: none">${order[7]}</td>
                    <td style="display: none">${order[8]}</td>
                    <td style="display: none">${order[9]}</td>
                 `;

        row.setAttribute("data-drive-id", data.driveID);
        tableBody.appendChild(row);
    });

};
