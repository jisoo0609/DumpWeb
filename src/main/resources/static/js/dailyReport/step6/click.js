
/* 일괄취소 버튼 클릭 이벤트를 처리 */
document.querySelector(".common_btn:nth-of-type(2)").addEventListener("click", () => {
    // 테이블 본문 요소를 찾습니다.
    const tableBody = document.querySelector("table tbody");

    // 테이블 본문 내용을 초기화합니다. (데이터 삭제)
    tableBody.innerHTML = "";

    // 검색 결과 텍스트 초기화
    const resultSearch = document.querySelector(".result_search");
    resultSearch.innerHTML = "";
});

/* js에서 search_btn이 눌릴 수 있도록 처리 */
function clickSearchButton(){
    document.querySelector(".search_btn").onclick();
}

/* 리스트의 행 클릭시, 파라미터와 함께 step5로 이동하도록 처리. */
function clickRowAndRedirect(){

    const listRow = document.querySelector("table tbody");
    listRow.addEventListener("click", (event) => {

        let input = Array.from(event.target.parentElement.getElementsByTagName("td"));
        const searchTypeRadio = document.querySelectorAll('input[name="searchType"]:checked');

        insertFirstHeader(input,parseInt(searchTypeRadio[0].value));

        let rowData =
            "?drvDate=" + input[0].textContent +
            "&drvClub=" + input[1].textContent +
            "&lastKm=" + input[2].textContent +
            "&useAmt=" + input[3].textContent +
            "&drvRem=" + input[4].textContent +
            "&rependchk=" + input[5].textContent +

            "&chk2=" + input[6].textContent +
            "&useOil=" + input[7].textContent +
            "&rependdate=" + input[8].textContent +
            "&repaddkm=" + input[9].textContent;

        let url = "/dailyReport/carcareform" + rowData;
        window.location.href = url;
    });
}

/* 선택한 옵션을 통해 데이터를 받아올 수 있도록 ajax POST 처리. */
function bindList() {
    $.ajax({
        url: "/dailyReport/ajax/carcarelist",
        type: "POST",
        data: $("[name=select_frm]").serialize(),
        success: function (data) {
            printTableColumnOrder(data);
        }
    })
}
