// 일괄취소 버튼 요소를 가져옵니다.
const cancelbutton = document.querySelector(".common_btn:nth-of-type(2)");

// 일괄취소 버튼 클릭 이벤트를 처리합니다.
cancelbutton.addEventListener("click", () => {
    // 테이블 본문 요소를 찾습니다.
    const tableBody = document.querySelector("table tbody");

    // 테이블 본문 내용을 초기화합니다. (데이터 삭제)
    tableBody.innerHTML = "";

    // 검색 결과 텍스트 초기화
    const resultSearch = document.querySelector(".result_search");
    resultSearch.innerHTML = "";
});