/* js에서 gsearchBtn이 눌릴 수 있도록 처리 */
function clickSearchButton(){
  document.querySelector(".gsearchBtn").onclick();
}


/* 리스트의 행 클릭시, 파라미터와 함께 step7의 필드로 이동하도록 처리. */
function clickRowAndRedirect(){
  
  let currentNumber = 2;

  const tableBody = document.querySelector("table tbody");
  listRow.addEventListener("click", (event) => {

      let input = Array.from(event.target.parentElement.getElementsByTagName("td"));
      const confirmButton = document.querySelector("#golPop3 input[value='확인']");

      let newData =
          "?currentNumber=" + input[0].textContent +
          "&loadPoint=" + input[1].textContent +
          "&unloadPoint=" + input[2].textContent +
          "&golItems=" + input[3].textContent +
          "&golCount=" + input[4].textContent +
          "&carNumb=" + input[5].textContent;

      let url = "/dailyReport/orderform" + newData;
      window.location.href = url;
  });
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {
  $.ajax({
      url: "/dailyReport/ajax/carcarelist",
      type: "POST",
      data: $("[name=golForm]").serialize(),
      success: function (data) {
          printTableColumnOrder(data);
      }
  })
}
