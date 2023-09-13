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
          차량관리 차계부 조회
      <img src="/resources/image/step6/ico_que.png" alt="도움말" class="info" />
    </h1>
    <ul class="location_ul">
      <li><img src="/resources/image/step6/ico_home.png" alt="홈" /></li>
          <li>차량관리 차계부 조회</li>
      <img
              src="/resources/image/step6/ico_arrow_right_gray.png"
              alt="화살표"
              class="arrow_right"
      />
    </ul>
  </div>

       <!-- 조회 양식-->
       <div class="operating_period content conTop">
         <h1>
           기간
         </h1>

         <label class="start-text col" for="start-date">
           <input type="date" id="start-date" />
           <span>~</span>
           <input type="date" id="end-date" />
         </label>
       </div>
       <div class="operating_period content" style="gap: 20px">
         <h1>
           선택
         </h1>
         <select class="detailSelect conbox">
           <option value="옵션1">주유</option>
           <option value="옵션2">요소수</option>
           <option value="옵션3">엔진오일</option>
           <option value="옵션4">정비(수리)</option>
           <option value="옵션5">기타</option>
         </select>
       </div>

      <!-- 날짜 기준, 품목 기준 radio 버튼 추가 -->
      <div class="inquiry_form section_check">
        <div class="operating_period content conChoice" id="flex_important">
          <label>
            날짜 기준
            <input type="radio" name="search-type" value="date" checked />
          </label>
          <label>
            품목 기준
            <input type="radio" name="search-type" value="item" />
          </label>
        </div>
      </div>

      <!-- 검색 버튼 -->
      <div class="search_container">
        <button class="search_btn common_btn" id="search-button">검색</button>
      </div>

      <div class="result_search">
        <h1></h1>
      </div>
      <div class="agreement_container">
        <button class="common_btn">일괄결재</button>
        <button class="common_btn">취소</button>
      </div>
      <div class="line"></div>

            <!-- 결과를 표시할 테이블 -->
            <div class="table_container">
              <table>
                <thead>
                  <tr class="th_title">
                    <th id="date-header">날짜</th>
                    <th id="item-header">품목</th>
                    <th>최종주행</th>
                    <th>사용금액</th>
                    <th>주유량(기타)</th>
                  </tr>
                </thead>
                <tbody id="table-body"></tbody>
              </table>
            </div>
</div>

<!-- 페이지 본문 종료 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script src="/resources/js/dailyReport/step6/index.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>

