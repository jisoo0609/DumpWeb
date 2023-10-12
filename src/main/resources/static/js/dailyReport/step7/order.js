function clickSaveBtn(){
  const golPop = document.querySelector("#golPop3");
  golPop.style.display = "flex";
}

function save() {
  $.ajax({
      url: "/dailyReport/ajax/orderform",
      type: "POST",
      data: $("[name=golForm]").serialize(),
      async : false,
      success: function (data) {
       console.log(data);
//          alert("저장이 완료되었습니다.");
          bindList();
      }
  })
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {
  $.ajax({
      url: "/dailyReport/ajax/orderlist",
      type: "POST",
      data: $("[name=golForm]").serialize(),
      success: function (data) {
        console.log(data);
        emptyRow();
        addTableRow(data);
      }
  })
}

/* 조회버튼 클릭 시 주문일에 따라 그 날에 저장된 데이터를 불러온다. */
//function searchDate() {
//  const orderDate = $('#date').val(); // 주문일 입력란의 값을 가져옵니다.
//
//  $.ajax({
//    url: "/dailyReprot/ajax/orderDate",
//    type: "post",
//      data: $("[name=golForm]").serialize(),
//      success: function (data) {
//        console.log(data);
//        emptyRow();
//        addTableRow(data);
//      }k
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

//function cancelBtn() {
//  const golPop2 = document.querySelector("#golPop2");
//  golPop2.style.display = "none";
//
//  emptyRow();
//}

/* js에서 confirmBtn(확인)이 눌릴 수 있도록 처리 */
function clickConfirmButton(){
  // 팝업 창을 숨기는 코드
  const golPop3 = document.querySelector("#golPop3");
  golPop3.style.display = "none";

  save();
  bindList();
}

function addTableRow(data) {
  var html;
  if (!data) {
    html = '<tr><td colspan="6" style="text-align: center;">입력된 정보가 없습니다.</td></tr>';
  } else {
    html = '<table>';
    for (var i = 1; i < data.length; i++) {
      var subData = data[i];
      var rowId = 'row' + i;
      html += '<tr>';
      html += '<td>' + i + '</td>';
      html += '<td>' + subData.fromsite + '</td>';
      html += '<td>' + subData.tosite + '</td>';
      html += '<td>' + subData.item + '</td>';
      html += '<td>' + subData.qty + '</td>';
//      html += '<td>' + subData.carNo + '</td>';

      // Check if carNo is empty or "미지정"
      if (subData.carNo === "" || subData.carNo === "미지정") {
        html += '<td><button class="miJeongButton">미지정</button></td>';
      } else {
        html += '<td>' + subData.carNo + '</td>';
      }

      html += '</tr>';
    }
    html += '</table>';
  }
    // 데이터를 표시할 위치에 추가
    $('#tBody').html(html);

}