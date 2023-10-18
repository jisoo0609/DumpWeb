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

/* 조회버튼 클릭 시 주문일에 따라 그 날에 저장된 데이터를 불러온다. */
//function searchDate() {
//  const orderDate = $('#date').val(); // 주문일 입력란의 값을 가져옵니다.
//
//  $.ajax({
//    url: "/dailyReprot/ajax/orderlist",
//    type: "post",
//      data: $("[name=golForm]").serialize(),
//      success: function (data) {
//        console.log(data);
//        emptyRow();
//        addTableRow(data);
//      }
//  })
//}

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
}