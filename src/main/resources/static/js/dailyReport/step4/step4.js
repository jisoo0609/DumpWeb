function getList(){
    $.ajax({
       url: "/dailyReport/ajax/list",
        type: "POST",
        data: $("[name=data_frm]").serialize(),
        success: function(data){
           printTable(data)//서버에서 받은 데이터 처리할 함수 입력
        }
    });
}

function printTable(datas){
    const tableBody = document.querySelector(".list-table tbody");
    const totalAmt = document.querySelector(".total");

    tableBody.innerHTML = "";
    totalAmt.innerHTML = "";

    datas.forEach((data, idx) => {
        const row = document.createElement("tr");
        let order = [
            data.carSubmit, data.date,
            data.item, data.fromsite, data.tosite, data.qty, data.qtyup.toLocaleString(),
        ];
        // let cost = `
        //         데이터 <span>${order.length}</span>건(총대수: ${});
        // `

        row.innerHTML = `
                    <td>${order[0]}</td>
                    <td>${order[1]}</td>
                    <td>${order[2]}</td>
                    <td>${order[3]}</td>
                    <td>${order[4]}</td>
                    <td>${order[5]}</td>
                    <td style="text-align: right;">${order[6]}</td>
        `;

        tableBody.appendChild(row);
    })
}