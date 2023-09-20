document.addEventListener("DOMContentLoaded", function () {
  // 저장 버튼 요소를 가져옵니다.
  const saveAndAddButton = document.querySelector(".opBtn[data-popName='golPop3']");
  
  // "확인" 버튼 요소와 "취소" 버튼 요소를 가져옵니다.
  const confirmButton = document.querySelector("#golPop3 input[value='확인']");

  const cancelButton = document.querySelector("#golPop3 input[value='취소']");
  
  // "golPop3" 요소를 가져옵니다.
  const golPop3 = document.querySelector("#golPop3");
  
  // 테이블의 tbody 요소를 가져옵니다.
  const tableBody = document.querySelector("table tbody");
  
  // 번호를 초기화합니다.
  let currentNumber = 2;
  
  // "확인" 버튼을 클릭할 때 실행될 함수를 정의합니다.
  confirmButton.addEventListener("click", function () {
    // 필드에서 입력한 값을 가져옵니다.
    const loadPoint = document.querySelector("#loadPoint").value;
    const unloadPoint = document.querySelector("#unloadPoint").value;
    const golItems = document.querySelector("#golItems").value;
    const golCount = document.querySelector("#golCount").value;
    const carNumb = document.querySelector("#carNumb").value;
    
    // 테이블에 새로운 행을 추가합니다.
    const newRow = document.createElement("tr");
    newRow.innerHTML = `
      <td>${currentNumber}</td>
      <td>${loadPoint}</td>
      <td>${unloadPoint}</td>
      <td>${golItems}</td>
      <td>${golCount}</td>
      <td>${carNumb}</td>
    `;
    
    // 테이블에 새로운 행을 추가합니다.
    tableBody.appendChild(newRow);
    
    // 필드 값을 초기화합니다.
    document.querySelector("#loadPoint").value = "";
    document.querySelector("#unloadPoint").value = "";
    document.querySelector("#golItems").value = "";
    document.querySelector("#golCount").value = "";
    document.querySelector("#carNumb").value = "";
    
    // 번호를 증가시킵니다.
    currentNumber++;

    // "golPop3" 요소를 숨깁니다.
    golPop3.style.display = "none";
  });

  // "취소" 버튼을 클릭할 때 실행될 함수를 정의합니다.
  cancelButton.addEventListener("click", function () {
    // "golPop3" 요소를 숨깁니다.
    golPop3.style.display = "none";
  });

  // 저장 버튼을 클릭할 때 "golPop3"를 표시합니다.
  saveAndAddButton.addEventListener("click", function () {
    golPop3.style.display = "block";
  });
});