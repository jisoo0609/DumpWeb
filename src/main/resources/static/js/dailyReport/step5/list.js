function formatDate(date) {
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');

    return `${year}-${month}-${day}`;
}

function printList(searchResultData) {

    const tableBody = document.querySelector("table tbody");
    tableBody.innerHTML = "";

     const queryString = window.location.search;
     const params = new URLSearchParams(queryString);
     let paramDriveID = params.get("driveID");

    console.log(paramDriveID);
    console.log(searchResultData);

    if(paramDriveID !== null){
    let firstRowIdx;

    for(let i=0; i < searchResultData.length; i++){
        if(searchResultData[i].driveID === parseInt(paramDriveID)){
            firstRowIdx = i;
            break;
        }
    }

    console.log(firstRowIdx);

    const firstRow = searchResultData.splice(firstRowIdx, 1)[0];
    searchResultData.splice(0, 0, firstRow);
    }

    console.log(searchResultData);

    // 검색 결과 데이터를 테이블 본문에 추가.
    searchResultData.slice(0, 10).forEach((data, index) => {
        const row = document.createElement("tr");

         let order = [
             data.drvDate, data.drvClub,
             data.lastKm.toLocaleString(), data.useAmt.toLocaleString(), data.drvRem,
             (data.rependchk === true ? 'X' : ((data.rependdate !== '' || data.repaddkm !== null) ? 'O' : 'X')),
             data.chk2, data.useOil, data.rependdate, data.repaddkm
         ];

        row.innerHTML = `
            <td>${order[0]}</td>
            <td style="width: 55px;">${order[1]}</td>
            <td class="Drvtd2" style="text-align: right">${order[2]}</td>
            <td style="text-align: right">${order[3]}</td>
            <td><span>${order[4]}</span></td>
            <td>${order[5]}</td>
            <td style="display: none">${order[6]}</td>
            <td style="display: none">${order[7]}</td>
            <td style="display: none">${order[8]}</td>
            <td style="display: none">${order[9]}</td>
        `;

        row.setAttribute("data-drive-id", data.driveID);
        tableBody.appendChild(row);

        if (data.driveID === parseInt(paramDriveID)) {
            row.classList.add("red-line-divider");
         }
    });
};