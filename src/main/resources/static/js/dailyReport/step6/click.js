
/* 일괄취소 버튼 클릭 이벤트를 처리 */
document.querySelector(".common_btn:nth-of-type(2)").addEventListener("click", () => {

   const costButton = document.querySelector(".agreement_container .resultPrice");
   costButton.innerHTML = "0";
    
   const tableBody = document.querySelector("table tbody");

    // 테이블 본문 내용을 초기화. (데이터 삭제)
    tableBody.innerHTML = "";

    // 검색 결과 텍스트 초기화.
    const resultSearch = document.querySelector(".result_search");
    resultSearch.innerHTML = "";
});

/* js를 통해 search_btn이 눌릴 수 있도록 처리 */
function clickSearchButton(){
    document.querySelector(".search_btn").onclick();
}

/* 리스트의 행 클릭시, 파라미터와 함께 step5로 이동하도록 처리. */
function clickListThAndRedirect(){
    const listRow = document.querySelector("table tbody");

    listRow.addEventListener("click", (event) => {
        let driveID = event.target.parentElement.getAttribute("data-drive-id")
        let url = "/dailyReport/carcareform" + "?driveID=" + driveID;
        window.location.href = url;
    });
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {

    console.log($("[name=select_frm]").serialize());

    $.ajax({
        url: "/dailyReport/ajax/carcarelist",
        type: "POST",
        data: $("[name=select_frm]").serialize(),
        success: function (data) {
            printList(data);
            printSummary(data);
        }
    })
}
