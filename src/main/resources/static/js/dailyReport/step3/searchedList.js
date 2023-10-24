//----------------------------------carsubmit---------------------------------------//
const carsubmitDrop = $('#dropList');
const carSubmitBox = document.getElementById('carSubmitBox');

function showCarSubmitBox() {
    carSubmitBox.style.display = 'block';
}

function hideCarSubmitBox() {
    carSubmitBox.style.display = 'none';
}

function showSearchedList(data) {
    let html;
    if (!data) {
        html = '<div>검색된 기록이 없습니다.</div>';
    } else {
        let amount = data.length;
        html = '<table>';
        if (amount > 0) {
            for (let i = 0; i < amount; i++) {
                let row = data[i]
                let rowId = data[i].sheetID
                html += '<tr id="' + rowId + '">';
                html += '   <td style="color: black;">' + data[i].carSubmit + '</td>'
                html += '   <td>' + data[i].salesman + '</td>'
                html += '   <td>' + data[i].carSubmitTel + '</td>'
                html += '   <td><button type="button" class="addBtn" style="width: 50px;" onclick="selectedByCarSubmit(' + rowId + ')">선택</button></td>'
                html += '</tr>'
            }
        } else {
            html += '<tr><td colspan="4" style="text-align: center;">검색된 결과가 없습니다</td></tr>'
        }

        html += '</table>';
    }
    carsubmitDrop.html(html);
}

function getSheetIDDataBySelection(sheetID) {
    $.ajax({
        url: "/dailyReport/form/ajax/details",
        type: "POST",
        headers: {'Content-Type': 'application/json'},
        data: JSON.stringify({sheetID: sheetID}),
        success: function (data) {
            //이 부분 추후 정리할 것
            document.getElementById('carSubmit').value = data.carSubmit;
            openable1 = true;
            document.getElementById('salesman').value = data.salesman;
            openable2 = true;
            document.getElementById('carSubmitTel').value = data.carSubmitTel;
            openable3 = true;
            searchByCarsubmitTel(data.carSubmitTel);
        }
    })
}

function selectedByCarSubmit(sheetID) {
    getSheetIDDataBySelection(sheetID);
    hideCarSubmitBox();
}

function searchByCarsubmit(inputField) {
    var carSubmit = inputField.value;
    $.ajax({
        url: "/dailyReport/search/carSubmit",
        method: "GET",
        data: {"carSubmit": carSubmit},
        success: function (data) {
            if (carSubmit != "") {
                showCarSubmitBox();
                showSearchedList(data);
            } else {
                hideCarSubmitBox();
                $.list();
            }
        },
        error: function (error) {
            console.error('Ajax 요청 실패:', error);
        }
    });
}

//----------------------------------salesman---------------------------------------//
const salesDrop = $('#salesList');
const salesmanBox = document.getElementById('salesmanBox');

function showSalesmanBox() {
    salesmanBox.style.display = 'block';
}

function hideSalesmanBox() {
    salesmanBox.style.display = 'none';
}

function showSalesList(data) {
    let html;
    if (!data) {
        html = '<div>검색된 기록이 없습니다.</div>';
    } else {
        let amount = data.length;
        html = '<table>';
        if (amount > 0) {
            for (let i = 0; i < amount; i++) {
                let row = data[i]
                let rowId = data[i].sheetID
                html += '<tr id="' + rowId + '">';
                html += '   <td style="color: black;">' + data[i].salesman + '</td>'
                html += '   <td>' + data[i].carSubmit + '</td>'
                html += '   <td>' + data[i].carSubmitTel + '</td>'
                html += '   <td><button type="button" class="addBtn" style="width: 50px;" onclick="selectedBySalesman(' + rowId + ')">선택</button></td>'
                html += '</tr>'
            }
        } else {
            html += '<tr><td colspan="4" style="text-align: center;">검색된 결과가 없습니다</td></tr>'
        }

        html += '</table>';
    }
    salesDrop.html(html);
}

function searchBySalesman(inputData) {
    var salesman = $("#salesman").val();
    $.ajax({
        url: "/dailyReport/search/salesman",
        method: "GET",
        data: {"salesman": salesman},
        success: function (data) {
            if (salesman != "") {
                showSalesmanBox();
                showSalesList(data);
            } else {
                hideSalesmanBox();
                $.list();
            }
        },
        error: function (error) {
            console.error('Ajax 요청 실패:', error);
        }
    });
}

function selectedBySalesman(sheetID) {
    getSheetIDDataBySelection(sheetID);
    hideSalesmanBox();
}

//----------------------------------carsubmitTel---------------------------------------//
const telDrop = $('#telList');
const telBox = document.getElementById('carSubmitTelBox');
const carsubmittel = $('#carSubmitTel');

function showTelBox() {
    telBox.style.display = 'block';
}

function hideTelBox() {
    telBox.style.display = 'none';
}

function showTelList(data) {
    let html;
    if (!data) {
        html = '<div>검색된 기록이 없습니다.</div>';
    } else {
        let amount = data.length;
        html = '<table>';
        if (amount > 0) {
            for (let i = 0; i < amount; i++) {
                let row = data[i]
                let rowId = data[i].sheetID
                html += '<tr id="' + rowId + '">';
                html += '   <td style="color: black;">' + data[i].carSubmitTel + '</td>'
                html += '   <td>' + data[i].carSubmit + '</td>'
                html += '   <td>' + data[i].salesman + '</td>'
                html += '   <td><button type="button" class="addBtn" style="width: 50px;" onclick="selectedByTel(' + rowId + ')">선택</button></td>'
                html += '</tr>'
            }
        } else {
            html += '<tr><td colspan="4" style="text-align: center;">검색된 결과가 없습니다</td></tr>'
        }

        html += '</table>';
    }
    telDrop.html(html);
}

let autoSearch = 0;

function onAutoSearch() {
    autoSearch = 1;
}

function offAutoSearch() {
    autoSearch = 0;
}

let autoCompleteData;

function searchByCarsubmitTel(inputData) {
    const carSubmitTel = carsubmittel.val();
    $.ajax({
        url: "/dailyReport/search/carSubmitTel",
        method: "GET",
        data: {"carSubmitTel": carSubmitTel},
        success: function (data) {
            const isMember = $("#isMember");
            const inviteBtn = $("#inviteBtn");
            if (data.checkData != null) { // 가입된 거래처
                isMember.text("회원");
                $("#inviteBtn").css("margin-left", "5000px");
            } else {
                isMember.text("");
                $("#inviteBtn").css("margin-left", "auto");
            }

            if (autoSearch == 1) { // 직접 타이핑해서 입력 중
                if (carSubmitTel != "" && carSubmitTel != "010" && carSubmitTel.length >= 4) {
                    showTelBox();
                    showTelList(data.list);
                } else {
                    hideTelBox();
                    $.list();
                }
            }
            listData();
        },
        error: function (error) {
            console.error('Ajax 요청 실패:', error);
        }
    });

}

function selectedByTel(sheetID) {
    getSheetIDDataBySelection(sheetID);
    offAutoSearch()
    hideTelBox();
}

