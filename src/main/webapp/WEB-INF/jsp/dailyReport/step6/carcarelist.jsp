<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/step6/index.css">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800&display=swap"
    rel="stylesheet"
/>
<link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"
/>
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/icon?family=Material+Icons"
/>

<div class="sub_con_wrapper wp80" id="maxwrap">
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

    <form method="POST" action="/dailyReport/step6/search">
    <input type="hidden" name="carNo" value="" />
        <!-- 조회 양식 -->
        <div class="operating_period content conTop">
            <h1>기간</h1>
            <label class="start-text col" for="start-date">
                <input type="date" id="start-date" name="startDate" />
                <span>~</span>
                <input type="date" id="end-date" name="endDate" />
            </label>
        </div>
        <div class="operating_period content" style="gap: 20px">
            <h1>선택</h1>
            <select class="detailSelect conbox" name="selectOption">
                <option value="주유">주유</option>
                <option value="요소수">요소수</option>
                <option value="엔진오일">엔진오일</option>
                <option value="정비(수리)">정비(수리)</option>
                <option value="기타">기타</option>
            </select>
        </div>

        <!-- 날짜 기준, 품목 기준 radio 버튼 추가 -->
        <div class="inquiry_form section_check">
            <div class="operating_period content conChoice" id="flex_important">
                <label>
                    날짜 기준
                    <input type="radio" name="searchType" value="date" checked />
                </label>
                <label>
                    품목 기준
                    <input type="radio" name="searchType" value="item" />
                </label>
            </div>
        </div>

        <!-- 검색 버튼 -->
        <div class="search_container">
            <button type="submit" class="search_btn common_btn" id="search-button">검색</button>
        </div>
    </form>

    <!-- 다른 내용은 그대로 유지 -->
</div>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="/resources/js/dailyReport/step6/index.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
