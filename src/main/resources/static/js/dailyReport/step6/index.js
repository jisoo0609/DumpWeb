// 현재 날짜를 가져와서 운행일 입력 상자의 초기 값으로 설정
document.addEventListener("DOMContentLoaded", function () {
  const startDateInput = document.getElementById("start-date");
  const endDateInput = document.getElementById("end-date");

  // 시작 날짜를 당월 1일로 설정
  const today = new Date();
  const firstDayOfMonth = new Date(
    today.getFullYear(),
    today.getMonth(),
    1
  );
  const formattedFirstDay = firstDayOfMonth.toISOString().split("T")[0];
  startDateInput.value = formattedFirstDay;

  // 종료 날짜를 오늘로 설정
  const formattedToday = today.toISOString().split("T")[0];
  endDateInput.value = formattedToday;
});

// 검색 버튼 요소를 가져옵니다.
const searchButton = document.querySelector(".search_btn");

// radio 버튼에 따라 테이블 열 순서 변경 함수
function changeTableColumnOrder() {
  const dateHeader = document.getElementById("date-header");
  const itemHeader = document.getElementById("item-header");
  const searchTypeRadio = document.querySelectorAll('input[name="search-type"]:checked');

  if (searchTypeRadio.length > 0) {
    if (searchTypeRadio[0].value === "date") {
      dateHeader.textContent = "날짜";
      itemHeader.textContent = "품목";
    } else if (searchTypeRadio[0].value === "item") {
      dateHeader.textContent = "품목";
      itemHeader.textContent = "날짜";
    }
  }
}

// 검색 버튼 클릭 이벤트를 처리합니다.
searchButton.addEventListener("click", () => {
  // radio 버튼에 따라 테이블 열 순서 변경
  changeTableColumnOrder();

  // 검색 결과 데이터 (가상 데이터로 가정)
  const searchResultData = [
    {
      차량번호: "ABC 123",
      품목: "박스",
      상차지: "출발지 A",
      하차지: "도착지 B",
      비용금액: "999999999",
      대수: 2,
      진행: "진행 중",
    },
    {
      차량번호: "XYZ 789",
      품목: "가전제품",
      상차지: "출발지 X",
      하차지: "도착지 Y",
      비용금액: "999999999",
      대수: 5,
      진행: "완료",
    },
    {
      차량번호: "XYZ 789",
      품목: "가전제품",
      상차지: "출발지 X",
      하차지: "도착지 Y",
      비용금액: "999999999",
      대수: 1,
      진행: "완료",
    },
  ];

  // 테이블 본문 요소
  const tableBody = document.querySelector("table tbody");

  // 테이블 본문 내용 초기화
  tableBody.innerHTML = "";

  // 검색 결과 데이터를 테이블 본문에 추가합니다.
  searchResultData.forEach((data, index) => {
    const row = document.createElement("tr");
    row.innerHTML = `
    <td>${index + 1}</td>
    <td>${data.차량번호}</td>
    <td>${data.품목}</td>
    <td>${data.비용금액}</td>
    <td>${data.진행}</td>
  `;
    tableBody.appendChild(row);
  });

  // 검색 결과 텍스트 생성
  const dataCount = searchResultData.length;
  const totalCount = searchResultData.reduce(
    (total, data) => total + data.대수,
    0
  );
  const resultText = `데이터 <span class="blue">${dataCount}</span>건 (총대수: <span class="blue">${totalCount}</span>대)가 검색되었습니다.`;

  // 결과를 result_search 요소에 출력
  const resultSearch = document.querySelector(".result_search");
  resultSearch.innerHTML = `<h1>${resultText}</h1>`;
});

// 일괄취소 버튼 요소를 가져옵니다.
const cancelButton = document.querySelector(".common_btn:nth-of-type(2)");

// 일괄취소 버튼 클릭 이벤트를 처리합니다.
cancelButton.addEventListener("click", () => {
  // 테이블 본문 요소를 찾습니다.
  const tableBody = document.querySelector("table tbody");

  // 테이블 본문 내용을 초기화합니다. (데이터 삭제)
  tableBody.innerHTML = "";

  // 검색 결과 텍스트 초기화
  const resultSearch = document.querySelector(".result_search");
  resultSearch.innerHTML = "";
});

// 페이지 로드 시 초기 테이블 열 순서 설정
changeTableColumnOrder();

