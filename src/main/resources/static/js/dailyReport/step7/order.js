//function delete() {
//  $.ajax({
//    url: "/dailyReprot/ajax/orderDelete",
//    type: "POST",
//    data: $("[name=golForm]").serialize(),
//    async : false,
//    success: function (data) {
//
//    }
//  })
//}


function getCheckParam(id){
    const checkBox = document.getElementById(id);
    return  "&" + id + "=" + checkBox.checked;
}

function cancel() {
  // 팝업 창을 숨기는 코드
  const golPop2 = document.querySelector("#golPop2");
  golPop2.classList.remove("active");
  emptyRow();
}

function save() {
   $("#fromsite").prop("disabled", false);
   $("#tosite").prop("disabled", false);
   $("#item").prop("disabled", false);
   $("#Qty").prop("disabled", false);
   $("#carNo").prop("disabled", false);
   $("#Qtyup").prop("disabled", false);

//   console.log($("[name=golForm]").serialize());

    //fetch 코드도 고민해볼 것.
    const checkBoxID = ["chk1"];

    let checkData = "";

    checkBoxID.forEach(id => checkData += getCheckParam(id));
    const formData = $("[name=golForm]").serialize() + checkData;

    console.log(formData);

  $.ajax({
      url: "/dailyReport/ajax/orderSave",
      type: "POST",
      data: formData,
      async : false,
      success: function (data) {
       console.log("저장완료");
//          alert("저장이 완료되었습니다.");
          bindList();
      }
  })
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {
  $.ajax({
      url: "/dailyReport/ajax/orderList",
      type: "POST",
      data: $("[name=golForm]").serialize(),
      success: function (data) {
        console.log(data);
        // 팝업 창을 숨기는 코드
        const golPop3 = document.querySelector("#golPop3");
        golPop3.classList.remove("active");
        // 필드 값 초기화
        emptyRow();
        // 표에 새 행을 추가
        addTableRow(data);
      }
  })
}

/* 저장&확인 버튼을 눌렀을 때, input 필드에 있는 값 초기화 */
function emptyRow() {
  const fromsiteInput = document.querySelector("#fromsite");
  const tositeInput = document.querySelector("#tosite");
  const itemInput = document.querySelector("#item");
  const QtyInput = document.querySelector("#Qty");
  const carNoInput = document.querySelector("#carNo");
  const QtyupInput = document.querySelector("#Qtyup");

  fromsiteInput.value = "";
  tositeInput.value = "";
  itemInput.value = "";
  QtyInput.value = "";
  carNoInput.value = "";
  QtyupInput.value = "";
}

/* 표에 새 행을 추가 */
function addTableRow(data) {
  var html;
  if (!data) {
    html = '<tr><td colspan="6" style="text-align: center;">입력된 정보가 없습니다.</td></tr>';
  } else {
    // html = '<table>';
    html = '';
      console.log(data.length);
    for (var i = 0; i < data.length; i++) {
      var subData = data[i];
      var rowId = i+1;
      html += '<tr>';
      html += '<td>' + rowId + '</td>';
      html += '<td>' + subData.fromsite + '</td>';
      html += '<td>' + subData.tosite + '</td>';
      html += '<td>' + subData.item + '</td>';
      html += '<td>' + subData.qty + '</td>';
//      html += '<td>' + subData.carNo + '</td>';

      // Check if carNo is empty or "미지정"
      if (subData.carNo === "" || subData.carNo === "미지정") {
        html += '<td><button type="button" class="miJeongButton" onclick="openPopupTest(\'dispatchform\', '+ subData.sheetsubID +');">미지정</button></td>';
      } else if (subData.carNo === "공고" || subData.carNo === "모집공고") {
        html += '<td><button class="miJeongButton">공고</button></td>';
      } else {
        html += '<td>' + subData.carNo + '</td>';
      }

//      html += '<td>' + subData.Qtyup + '</td>';

      html += '</tr>';
    }
    console.log(html);
    // html += '</table>';
  }
    // 데이터를 표시할 위치에 추가
    $('#tBody').html(html);

    row.setAttribute("receipt-subID", data.sheetsubID);
    row.setAttribute("receipt-sheetID", data.sheetID);
    row.setAttribute("receipt-writerIDX", data.writerIDX);
    row.setAttribute("receipt-sheetSS2", data.sheetSS2);
    tableBody.appendChild(row);
}


document.addEventListener("DOMContentLoaded", function () {
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let sheetsubID = params.get("subID");
    let sheetID = params.get("sheetID")
    console.log("sheetsubId :" + sheetsubID);

    if (sheetsubID !== null) {
        getSheetsubIDDataByParams(sheetsubID, sheetID);
    }
    // clickListThAndRedirect();
});


function getSheetsubIDDataByParams(sheetsubID, sheetID) {
    $.ajax({
        url: "/dailyReport/ajax/details",
        type: "POST",
        data: {sheetsubID: sheetsubID , sheetID: sheetID},
        success: function (data) {
            document.getElementById('date').value=data.date;
            document.getElementById('fromsite').value=data.fromsite;
            document.getElementById('tosite').value=data.tosite;
            document.getElementById('item').value=data.item;
            document.getElementById('Qty').value=data.qty;
            document.getElementById('carNo').value=data.carNo;
            document.getElementById('Qtyup').value=data.qtyup;
        }
    })
}

/* 리스트의 행 클릭시, 상태값에 따라 파라미터와 함께 step3 or step7로 이동하도록 처리. */
function clickListThAndRedirect(){
    const listRow = document.querySelector("table tbody");

    listRow.addEventListener("click", (event) => {
        const currStatus = event.target.parentElement.querySelector(".currStatus"); // 상태 열

        if (currStatus) {
            const status = currStatus.textContent;
            console.log("Clicked Status:", status);
            let subID = event.target.parentElement.getAttribute("receipt-subID")
            let sheetID = event.target.parentElement.getAttribute("receipt-sheetID")
            let writerIDX = event.target.parentElement.getAttribute("receipt-writerIDX") //작성자구별은 추후 구현
            let sheetSS2 = event.target.parentElement.getAttribute("receipt-sheetSS2")
            console.log("writerIDX?" + writerIDX)
            console.log("sheetSS2?" + sheetSS2)


            window.location.href = "/dailyReport/orderform" + "?subID=" +  subID + "&sheetID=" + sheetID;
        }
    });
}