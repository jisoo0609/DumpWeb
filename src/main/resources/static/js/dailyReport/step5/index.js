document.addEventListener("DOMContentLoaded", function () {
  const queryString = window.location.search;
  const params = new URLSearchParams(queryString);

  if(params.get("driveID") !== null){
  inputDataByParams(getDriveIDDataByParams());
  }

});

function getDriveIDDataByParams(){
  $.ajax({
    url: "/dailyReport/ajax/carcarelist",
    type: "POST",
    data: $("[name=select_frm]").serialize(),
    success: function (data) {
      return data;
    }
  })
}

function inputDataByParams(data){
  // step6에 있는 value값을 가지도 옵니다.
  const elementIds = [
    "reg-date",
    "lastKm",
    "useAmt",
    "drvRem voiceNotification",
    "showHideCheckbox",
    "chk2",
    "useOil",
    "exchange-date",
    "nextlastkm"
  ];

  // 객체 초기화
  const elements = {};

  // elementIds 배열에 있는 각 요소 ID를 사용하여 웹 페이지의 DOM 요소를 가져와서 elements 객체에 할당
  elementIds.forEach((id) => {
    elements[id] = document.getElementById(id);
    //elements[id].value = 1;
  });

  // URL의 쿼리 문자열에서 값을 추출한것
  /*const dateMonthDay = params.get("drvDate").split(".");
  elements.datepicker1.value = new Date().getFullYear() + '-' + dateMonthDay[0] + '-' + dateMonthDay[1];
  elements.lastKm.value = parseInt(params.get("lastKm").replace(/,/g, ''));
  elements.useAmt.value = parseInt(params.get("useAmt").replace(/,/g, ''));
  elements["drvRem voiceNotification"].value = params.get("drvRem");
  elements.showHideCheckbox.checked = (params.get("rependchk") === "O");
  elements.chk2.checked = (params.get("chk2") === "true");
  elements.useOil.value = parseInt(params.get("useOil"));
  elements.datepicker2.value = params.get("rependdate").split("T")[0];
  elements.nextlastkm.value = parseInt(params.get("repaddkm"));*/
}