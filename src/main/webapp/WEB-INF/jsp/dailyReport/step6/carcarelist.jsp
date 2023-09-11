<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

  <!-- 스타일시트 연결 -->
<link rel="stylesheet" type="text/css" href="/resources/css/step6/index.css">

  <!-- Google Fonts 사전로드 -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
          href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet"
  />
  <!-- flatpickr 라이브러리 -->
  <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
  />

  <!-- 구글 머티리얼 아이콘 -->
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
  />


<!-- 페이지 본문 시작 -->
<div class="sub_con_wrapper wp80" id="maxwrap">
  <!-- 페이지 제목 및 위치 정보 -->
  <div class="subTitle_wrapper">
    <h1>
      차량관리 조회
      <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
    </h1>
    <ul class="location_ul">
      <li><img src="/resources/image/step6/ico_home.png" alt="홈" /></li>
      <li>차량관리 조회</li>
      <img
              src="/resources/image/step6/ico_arrow_right_gray.png"
              alt="화살표"
              class="arrow_right"
      />
    </ul>
  </div>

  <!-- 조회 양식-->
  <div class="inquiry_form">
    <div class="operating_period content">
      <h1>
        운행 기간
        <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
      </h1>
      <label class="start-text col" for="start-date">
                  <input type="date" id="start-date" />
                  <span>~</span>
                  <input type="date" id="end-date" />
                </label>
    </div>
    <div class="operating_period content">
      <h1>
        주유
        <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
      </h1>
      <select class="detailSelect conbox">
        <option value="옵션1">옵션1</option>
        <option value="옵션2">옵션2</option>
        <option value="옵션3">옵션3</option>
      </select>
    </div>
    <div class="operating_period content">
      <h1>
        요소수
        <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
      </h1>
      <select class="detailSelect conbox">
        <option value="옵션1">옵션1</option>
        <option value="옵션2">옵션2</option>
        <option value="옵션3">옵션3</option>
      </select>
    </div>
    <div class="operating_period content">
      <h1>
        정비
        <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
      </h1>
      <select class="detailSelect conbox">
        <option value="옵션1">옵션1</option>
        <option value="옵션2">옵션2</option>
        <option value="옵션3">옵션3</option>
      </select>
    </div>
  </div>
  <div class="inquiry_form section_check">
    <div class="operating_period content" id="flex_important">
      <label>
        기간
        <input type="radio" name="test" checked />
      </label>
      <label>
        주유
        <input type="radio" name="test" />
      </label>
      <label>
        요소수
        <input type="radio" name="test" />
      </label>
      <label>
        정비
        <input type="radio" name="test" />
      </label>
    </div>
  </div>
  <div class="search_container">
    <button class="search_btn common_btn">검색</button>
  </div>
  <div class="result_search">
    <h1></h1>
  </div>
  <div class="agreement_container">
          <button class="common_btn" style="background: #333; color: white; border: none;" >일괄결재</button>
          <button class="common_btn" style="background: #333; color: white; border: none;">취소</button>
        </div>
  <div class="line"></div>
  <div class="table_container">
    <table>
      <thead>
        <tr class="th_title">
        <th>No</th>
        <th>차량번호</th>
        <th>품목</th>
        <th>시간</th>
        <th>진행</th>
      </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>
</div>

<!-- 페이지 본문 종료 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
      // 현재 날짜를 가져와서 운행일 입력 상자의 초기 값으로 설정
      //  const today = new Date().toISOString().split('T')[0];
      //  documnt.getElementById('오늘날').value = today;


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
    </script>
<script src="/resources/js/dailyReport/step6/index.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>