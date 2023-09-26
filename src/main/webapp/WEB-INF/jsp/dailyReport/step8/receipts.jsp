<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<%
    //라디오 선택값 가져올 변수 선언
    String searchType = request.getParameter("searchType");
    if (searchType == null) {
        // 기본 선택값 설정 (운행일 기준)
        searchType = "orderByDate";
    }
    System.out.println("searchType 값: " + searchType);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
    <link rel="shortcut icon" href="/resources/image/favicon/favicon.png">

    <!-- Style-->
    <link href="/resources/css/step8/style.css?jsVerType=20230831191239" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loading.css">
    <style>
        .ui-datepicker .ui-datepicker-title select {
            margin: 1px 7px;
        }

        .agreement_container button {
            font-size: 12px;
            line-height: 15px;
            width: 80px;
        }

        .common_btn {
            border: 1px solid #0068b7;
            cursor: pointer;
            background: #fff;
            font-size: 16px;
            color: #0064c1;
            font-weight: 600;
            width: 120px;
            height: 40px;
            line-height: 38px;
        }

        .agreement_container {
            display: flex;
            justify-content: space-between;
            margin: 20px 0px;
            font-size: 12px;
        }

        @media screen and (min-width: 280px) and (max-width: 1024px) {
            .search-form-major label {
                width: initial;
                margin-bottom: 8px;
            }
        }

        .ui-datepicker-trigger {
            display: none;
        }

        @media screen and (min-width: 280px) and (max-width: 1980px) {
            .sub-title {
                padding-bottom: initial;
                border-bottom: initial;
            }

            .search-form {
                margin: 15px 0 10px;
            }

            .table-btn {
                text-align: center;
                float: none;
            }
        }

        .default-tab__ul.cnt8 li {
            width: 12.5%;
        }

        .wp70 {
            width: 70%;
        }

        .wp90 {
            width: 90%;
        }

        @media screen and (min-width: 1025px) {
            .onlyMobileFunction {
                display: none;
            }

        }

        @media screen and (max-width: 1024px) {
            .workplan_select {
                width: 23px;
                position: absolute;
                top: 0;
                right: 0;
                border-left: none;
                padding-left: 0;
            }

            .search-form-details label {
                position: absolute;
                left: 0;
                font-size: 13px;
                width: 35%;
            }

            .search-form-details li {
                width: 100%;
                float: none;
                margin-right: 0;
                position: relative;
                padding-bottom: 10px;
            }

            .search-form-details .input-group {
                width: 100%;
                padding-left: 120px;
            }
        }

        .opacity_0_5 {
            opacity: 0.5;
        }

        .ui-datepicker {
            font-size: 12px;
            width: 250px
        }

        .ui-datepicker select.ui-datepicker-month {
            width: 35%;
            font-size: 11px;
            margin-left: 5%;
            height: 20px
        }

        .ui-datepicker select.ui-datepicker-year {
            width: 35%;
            font-size: 11px;
            height: 20px
        }

        .lineFirstBold:first-line {
            color: #6f1111;
            font-weight: bold;
        }

        @media screen and (max-width: 1024px) {
            .onlyPCFunction {
                display: none;
            }

            .mobile-fw-300 {
                font-weight: 300;
            }
        }

        .pointer {
            cursor: pointer;
        }

        .list-table th.center {
            text-align: center;
        }

        @media screen and (max-width: 280px) {
            .search-form-major .date-wrap {
                margin-top: initial;
                margin-left: initial;
            }

            .list-table {
                table-layout: initial;
            }

            .list-table td {
                padding: 10px 1px;
            }

            .btnWraaper {
                display: inline-flex;
                margin: 0 5px;
                gap: 0 5px;
            }
        }

        @media screen and (max-width: 425px) {
            .list-table th {
                padding: 10px 4px;
            }

            .table-btn {
                width: 60%;
            }
        }

        @media screen and (max-width: 280px) {
            .list-table th {
                padding: 1px 10px;
            }

            .btn {
                margin-bottom: 5px;
            }
        }

        @media screen and (max-width: 1024px) {
            .search-form-major .date-wrap .unit {
                margin-top: 5px;
                margin-left: -1px;
            }

            .search-form-major .date-wrap .fst {
                font-size: 13px;
            }

            .search-form-major .date-wrap .last {
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
<script type="text/javascript"
        src="/resources/js/dailyReport/step8/list.js?jsVerType=2020230831191239"></script>
<script>
    // 달력 옵션 추가 코드
    $(function () {
        //input을 datepicker로 선언
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd", //달력 날짜 형태
            showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            showMonthAfterYear: true, // 월- 년 순서가아닌 년도 - 월 순서
            changeYear: true, //option값 년 선택 가능
            changeMonth: true, //option값  월 선택 가능
            showOn: "both",
            // buttonImage:
            //     "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
            // buttonImageOnly: true,
            // buttonText: "선택",
            yearSuffix: "년",
            monthNamesShort: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월",
            ], //달력의 월 부분 텍스트
            monthNames: [
                "1월",
                "2월",
                "3월",
                "4월",
                "5월",
                "6월",
                "7월",
                "8월",
                "9월",
                "10월",
                "11월",
                "12월",
            ], //달력의 월 부분 Tooltip
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"], //달력의 요일 텍스트
            dayNames: [
                "일요일",
                "월요일",
                "화요일",
                "수요일",
                "목요일",
                "금요일",
                "토요일",
            ],
            minDate: "-5Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            maxDate: "+5y", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });

        $(".datepicker").datepicker("setDate", "today"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });
</script>


<script>
    //총대수 cnt
    var totalQty = 0;
    <c:forEach items="${receiptsList}" var="receipt">
    var qty = parseInt("${receipt.qty}");
    totalQty += qty;
    </c:forEach>
    window.onload = function () {
        var totalQtySpan = document.getElementById("totalQty");
        if (totalQtySpan) {
            totalQtySpan.innerText = totalQty;
        }
    };
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const updateButton = document.getElementById("update-button");
        const startDateInput = document.getElementById("datepicker1");

        // 시작 날짜를 당월 1일로 설정
        const today = new Date();
        const firstDayOfMonth = new Date(
            today.getFullYear(),
            today.getMonth(),
            1
        );
        const formattedFirstDay = firstDayOfMonth
            .toISOString()
            .split("T")[0];
        startDateInput.value = formattedFirstDay;
    });
</script>

<section class="sub-contents-wrap maxwrap">

    <div class="sub-title">
        <h1 class="sub-title__h1">
            <span class="v-mid">
                        제출처 전표 조회
            </span>
            <img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-mn"
                 onclick="$.openLayerHelpMsgPopUp(this, 'W05');">
        </h1>

        <ul class="location__ul">
            <li><span class="offscreen">홈</span></li>
            <li>
               <span>

                               제출처 전표 조회

               </span>
            </li>
        </ul>
    </div>

    <form name="listfrm" method="post">
        <input type="hidden" name="pageNo" value="1"/>
        <input type="hidden" name="searchStartDate" value="2023-08-31"/>
        <input type="hidden" name="searchEndDate" value="2023-08-31"/>
        <input type="hidden" name="carNo" value="임창운"/>
        <input type="hidden" name="fromsite" value=""/>
        <input type="hidden" name="tosite" value=""/>
        <input type="hidden" name="item" value=""/>
        <input type="hidden" name="currStatus" value=""/>
        <input type="hidden" name="sheetID"/>
        <%--        <input type="hidden" name="searchType" value="car"/>--%>
        <input type="hidden" name="searchDetailChk" value="0">
    </form>

    <form name="pagefrm" method="post">
        <input type="hidden" name="pageNo" value="1"/>
        <input type="hidden" name="searchStartDate" value="2023-08-31"/>
        <input type="hidden" name="searchEndDate" value="2023-08-31"/>
        <input type="hidden" name="carNo" value="임창운"/>
        <input type="hidden" name="fromsite" value=""/>
        <input type="hidden" name="tosite" value=""/>
        <input type="hidden" name="item" value=""/>
        <%--        <input type="hidden" name="searchType" value="car"/>--%>
        <input type="hidden" name="club" value=""/>
        <input type="hidden" name="CarNo" value=""/>
        <input type="hidden" name="allChk2Result" value="0">
        <input type="hidden" name="searchDetailChk" value="0">
        <input type="hidden" name="sscode" value="">
        <input type="hidden" name="autoSSChk" value="false">

    </form>

    <form name="searchfrm" method="post">
        <input type="hidden" name="pageNo" value="1"/>
        <input type="hidden" id="searchDetailChk" name="searchDetailChk" value="0">
        <input type="hidden" name="sheetID" value="${!empty view ? view.sheetID : 0}">
        <div class="search-form">
            <div class="search-form-major" id="dateArea">
                <label>운행기간</label>
                <div class="date-wrap dis-ib dis-b-t">
                    <input type="text" class="fst datepicker"
                           name="searchStartDate" readonly autocomplete="off"><span class="unit">~</span>
                    <input type="text" class="last datepicker" name="searchEndDate"
                           readonly autocomplete="off">
                </div>

                <button type="button" id="advsearch" class="btn btn-details">상세검색 열기 ▼</button>
            </div>

            <ul class="search-form-details dis-n searchArea">
                <li>
                    <label>구분</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 clubAutocomplete trn" placeholder="구분" name="club" id="club"
                               value="${!empty view ? view.club : ''}"
                               autocomplete="off">
                        <select class="club " id="clubBox" onchange="$.selectBoxChange(this.value, 'club')">
                            <option value="전체">전체</option>
                            <option value="운반">운반</option>
                        </select>
                    </div>
                </li>
                <li>
                    <label>상차지</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 fromsiteAutocomplete trn" placeholder="상차지" name="fromsite"
                               id="fromsite" autocomplete="off" value="${!empty view ? view.fromsite : ''}">
                        <select class="fromsite " id="fromsiteBox" onchange="$.selectBoxChange(this.value, 'fromsite')">
                            <option value="">전체</option>
                            <option value="구디">구디</option>
                            <c:forEach items="${receiptsList}" var="receipt">
                                <c:set var="fromsite" value="${receipt.fromsite}" />

                                <script>   //옵션에 중복값 제거
                                if (!document.querySelector('#fromsiteBox option[value="${fromsite}"]')) {
                                    var option = document.createElement('option');
                                    option.value = "${fromsite}";
                                    option.text = "${fromsite}";
                                    document.querySelector('#fromsiteBox').appendChild(option);
                                }
                                </script>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <label>하차지</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 tositeAuto complete trn" placeholder="하차지" name="tosite"
                               id="tosite" autocomplete="off" value="${!empty view ? view.tosite : ''}">
                        <select class="tosite " id="tositeBox" onchange="$.selectBoxChange(this.value, 'tosite')">
                            <option value="">전체</option>
                            <option value="지밸리">지밸리</option>
                            <c:forEach items="${receiptsList}" var="receipt">
                                <c:set var="tosite" value="${receipt.tosite}" />

                                <script>   //옵션에 중복값 제거
                                if (!document.querySelector('#tositeBox option[value="${tosite}"]')) {
                                    var option = document.createElement('option');
                                    option.value = "${tosite}";
                                    option.text = "${tosite}";
                                    document.querySelector('#tositeBox').appendChild(option);
                                }
                                </script>
                            </c:forEach>
    </select>
                    </div>
                </li>
                <li>
                    <label>품목</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 itemAuto complete trn" placeholder="품목" name="item" id="item"
                               value="${!empty view ? view.item : ''}" autocomplete="off">
                        <select class="item " id="itemBox" onchange="$.selectBoxChange(this.value, 'item')">
                            <option value="">전체</option>
                            <option value="출퇴근">출퇴근</option>

                            <c:forEach items="${receiptsList}" var="receipt">
                                <c:set var="item" value="${receipt.item}" />
                                <script>   //옵션에 중복값 제거
                                if (!document.querySelector('#itemBox option[value="${item}"]')) {
                                    var option = document.createElement('option');
                                    option.value = "${item}";
                                    option.text = "${item}";
                                    document.querySelector('#itemBox').appendChild(option);
                                }
                                </script>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <label>차량번호</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 CarNoAuto complete trn" placeholder="차량번호"
                               name="CarNo" id="CarNo" value="${!empty view ? view.CarNo : ''}"
                               autocomplete="off">
                        <select class="CarNo " id="CarNoBox" onchange="$.selectBoxChange(this.value, 'CarNo')">
                            <option value="">전체</option>
                            <option value="자차">자차</option>
                            <c:forEach items="${receiptsList}" var="receipt">
                                <c:set var="carNo" value="${receipt.carNo}" />
                                <script>   //옵션에 중복값 제거
                                    if (!document.querySelector('#CarNoBox option[value="${carNo}"]')) {
                                        var option = document.createElement('option');
                                        option.value = "${carNo}";
                                        option.text = "${carNo}";
                                        document.querySelector('#CarNoBox').appendChild(option);
                                    }
                                </script>
                            </c:forEach>
                        </select>
                    </div>
                </li>
            </ul>
        </div>


        <div style="text-align: center;padding-top: 30px;border: 1px solid #ddd;padding-bottom: 30px; margin: 0 0 10px;">
            <div style="width: 50%;  float: left;">
                <label style="display: inline-flex;align-items: center;justify-content: flex-start;"><input
                        type="radio" name="searchType" value="orderByDate" checked/>운행일 기준</label>
            </div>
            <div style="margin-left: 50%;">
                <label style="display: inline-flex;align-items: center; justify-content: flex-start;width: 155px;"><input
                        type="radio" name="searchType" value="orderByCarNo"/>차량 기준</label>
            </div>
        </div>
    </form>

    <div class="btn-area erpSearchBtn">
        <input type="button" class="btn btn-search btn-search__line" value="검색" onClick="$.search()"
               onkeydown="if(event.keyCode == 13) return false;">
    </div>

    <div id="tableshow">
        <div class="table-top" style="height: auto; display:  block; text-align: center">
            <p class="total">
                <span>데이터</span> <span class="cnt default-blue" id="receiptsCnt">${fn:length(receiptsList)}</span>
                <span>건 (총대수 : <span class="cnt default-blue"><span id="totalQty"></span> </span> 대)가 검색되었습니다.</span>
            </p>
        </div>

        <div style="width: 100%; overflow-x: auto; overflow-y: hidden;">
            <div class="agreement_container">
                <button class="common_btn" style="width: 110px;">운반금액<br><span class="resultPrice">50,000</span>
                </button>
                <div class="btnWraaper">
                    <button class="common_btn" onclick="$.allChkChange(1);">일괄결재</button>
                    <button class="common_btn" onclick="$.allChkChange(0);">일괄취소</button>
                </div>
            </div>

            <table class="list-table" id="tableOrderByDate" style="display:<%= "orderByDate".equals(searchType) ? "block" : "none" %>">
                <colgroup>
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 7%">
                    <col style="width: 5%">
                    <col style="width: 4%">
                </colgroup>
                <thead>
                <tr>
                    <th>No</th>
                    <th>운행일</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>품목</th>
                    <th>차량번호</th>
                    <th>대수</th>
                    <th>진행</th>
                </tr>
                </thead>
                <tbody id="receiptsResultBodyOrderByDate">
                <tr>
                    <td>1</td>
                    <td>09.01</td>
                    <td>구디</td>
                    <td>지밸리</td>
                    <td>모래</td>
                    <td>37우2598</td>
                    <td>1</td>
                    <td><span style="color: #000080; font-weight: bold;">하차</span></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>09.01</td>
                    <td>구디</td>
                    <td>지밸리</td>
                    <td>자갈</td>
                    <td>더미데이터</td>
                    <td>1</td>
                    <td><span style="color: #000080; font-weight: bold;">하차</span></td>
                </tr>
                <c:forEach items="${receiptsList}" var="receipt" varStatus="No">
                    <tr>
                        <td>${No.index + 1}</td>
                        <td>${receipt.date}</td>
                        <td>${receipt.fromsite}</td>
                        <td>${receipt.tosite}</td>
                        <td>${receipt.item}</td>
                        <td>${receipt.carNo}</td>
                        <td>${receipt.qty}</td>
                        <td>
                        <span style="color: #000080; font-weight: bold;">
                                ${receipt.qty}
                        </span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <table class="list-table" id="tableOrderByCarNo" style="display:<%= "orderByCarNo".equals(searchType) ? "block" : "none" %>">
                <colgroup>
                    <col style="width: 3%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 7%">
                    <col style="width: 4%">
                    <col style="width: 4%">
                </colgroup>
                <thead>
                <tr>
                    <th>No</th>
                    <th>차량번호</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>품목</th>
                    <th>운행일</th>
                    <th>대수</th>
                    <th>진행</th>
                </tr>
                </thead>
                <tbody id="receiptsResultBodyOrderByCarNo">
                <tr>
                    <td>1</td>
                    <td>37우2598</td>
                    <td>구디</td>
                    <td>지밸리</td>
                    <td>모래</td>
                    <td>09.09</td>
                    <td>1</td>
                    <td><span style="color: #000080; font-weight: bold;">하차</span></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>더미데이터</td>
                    <td>구디</td>
                    <td>지밸리</td>
                    <td>자갈</td>
                    <td>09.10</td>
                    <td>1</td>
                    <td><span style="color: #000080; font-weight: bold;">하차</span></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div>
            <section class="paging">
                <ul class="paging__ul" id="page-div">

                    <li><a style="cursor: pointer;" onclick="$.valuePg(1)"><img
                            src="/resources/image/icons/ico_prev.png" alt="이전"></a></li>

                    <li class="pageNum">


                        <a style="cursor: pointer;"
                           onclick="$.valuePg(1)"
                           class="active" @media screen and (min-width: 280px) and (max-width: 1024px) {>1</a>


                    </li>

                    <li><a style="cursor: pointer;" onclick="$.valuePg(1);"><img
                            src="/resources/image/icons/ico_next.png" alt="다음"></a></li>
                </ul>
            </section>
        </div>
    </div>
</section>


<style>
    .popSearch-listWrap {
        border-top: none;
        max-height: inherit;
        padding-top: 10px;
    }
</style>


<script>
    //메인 테이블 빨간줄 긋는 함수
    function highlightRows() {
        var table = document.getElementById("tableOrderByDate"); // 테이블 가져오기
        var rows = table.getElementsByTagName("tr"); // 모든 행 (tr) 가져오기
        var prevDate = rows[1].cells[1].innerText;

        for (var i = 2; i < rows.length; i++) { // 첫 번째 행은 thead니까 무시하고 두 번째 행부터 첫 번째 행이랑 비교하도록
            var currentRow = rows[i];
            currentRow.style.borderBottom = 'none';

            var currentDateCell = currentRow.cells[1]; // 운행일이 있는 셀 (두 번째 셀)
            var currentDate = currentDateCell.innerText;

            console.log("prevDate?" + prevDate)
            console.log("currentDate?" + currentDate)

            if (currentDate !== prevDate) {
                currentRow.style.borderTop = "2px solid red";
            }else {
                currentRow.style.borderTop = "none";
            }
            prevDate = currentDate;
        }
    }
    // 페이지 로드 시 빨간색 줄 추가 함수 호출
    highlightRows();
</script>

<div class="layerMask dis-n pop-wrap" id="pop-integrateform" tabindex="0">
    <div class="layerMask__inner" style="height: auto; width: 90%">


        <section class="layer-popup" style="height: 100%;">
            <div class="popSearch-listWrap integrateFromArea">

            </div>

        </section>
    </div>
</div>

<button class="screen_top up-btn">
    <img src="/resources/image/icons/ico-top.png" style="width: 40px; height: 40px;">
</button>
</body>
</html>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>