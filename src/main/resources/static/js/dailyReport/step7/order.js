/* 삭제 버튼 클릭 이벤트를 처리 */
document.querySelector(".opBtn[data-popName='golPop1']").addEventListener("click", () => {
  // 테이블 본문 요소를 찾습니다.
  const tableBody = document.querySelector("table tbody");

  // 테이블 본문 내용을 초기화합니다.
  tableBody.innerHTML = "";

  // 검색 결과 텍스트 초기화
  // const resultSearch = document.querySelector(".result_search");
  // resultSearch.innerHTML = "";
});

// 저장 버튼 클릭 이벤트 처리
document.querySelector(".opBtn[data-popName='golPop3']").addEventListener("click", () => {
  // 팝업 창을 띄우는 코드
  const golPop3 = document.querySelector("#golPop3");
  golPop3.style.display = "block";
});

/* js에서 confirmBtn(확인)이 눌릴 수 있도록 처리 */
function clickConfirmButton(){
  const confirmButton = document.querySelector("#golPop3 input[value='확인']");
  bindList();
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {
  $.ajax({
      url: "/dailyReport/ajax/orderform",
      type: "POST",
      data: $("[name=golForm]").serialize(),
      success: function (data) {
          addTableRow(data);
      }
  })
}

function bindList() {
    $.ajax({
        url: "/dailyReport/orderform/ajax/datelist",
        type: "POST",
        data: {date : $("#datepicker").val()},
        success: function (data) {
            printList(data);
        }
    })
}


function insertFirstHeader(arr,idx) {
  //삭제 -> 삽입하여 header td를 제일 앞으로 옮김.
  const firstHeader = arr.splice(idx,1)[0];
  arr.splice(0,0,firstHeader);
}

// 저장 버튼 클릭 이벤트를 처리합니다.
function addTableRow(tableBody, data, isUndefined, rowNumber) {
  const newRow = document.createElement("tr");

//  let rowNumber = 2;

  if (isUndefined) {
    newRow.innerHTML = `
          <td>${rowNumber}</td>
          <td>${data.loadPoint}</td>
          <td>${data.unloadPoint}</td>
          <td>${data.golItems}</td>
          <td>${data.golCount}</td>
          <td><button class="undefined-button">미지정</button></td>
      `;
  } else {
      newRow.innerHTML = `
          <td>${rowNumber}</td>
          <td>${data.loadPoint}</td>
          <td>${data.unloadPoint}</td>
          <td>${data.golItems}</td>
          <td>${data.golCount}</td>
          <td>${data.carNumb}</td>
      `;
  }

  let end = order[0];

  if (start !== end) {
      start = end;
      row.classList.add("red-line-divider")
  }

  tableBody.appendChild(row);
}

// 데이터를 가져와서 테이블에 표시
function fetchAndDisplayData() {
  // ...
  let rowNumber = 1;
  dataArray.forEach((data) => {
      if (!data.carNumb || data.carNumb === "미지정") {
          addTableRow(tableBody, data, true, rowNumber);
      } else {
          addTableRow(tableBody, data, false, rowNumber);
      }
      rowNumber++;
  });
}