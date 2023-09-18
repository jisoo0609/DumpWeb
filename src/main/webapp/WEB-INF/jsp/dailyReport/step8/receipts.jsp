<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="description" content="">
    <meta name="keyword" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
    <link rel="shortcut icon" href="/resources/image/favicon/favicon.png">

    <!-- Style-->
    <link href="/resources/js/jquery.modal-master/css/jquery.modal.css?version=1.2&20230831191239" type="text/css"
          rel="stylesheet"/>
    <link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-xenon.css?version=1.2&20230831191239"
          type="text/css" rel="stylesheet"/>
    <link href="/resources/js/jquery.modal-master/css/jquery.modal.theme-atlant.css?version=1.2&20230831191239"
          type="text/css" rel="stylesheet"/>

    <link href="/resources/css/step8/style.css?jsVerType=20230831191239" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loading.css">
    <style type="text/css">
        @media screen and (min-width: 280px) and (max-width: 1024px) {
            .search-form-major label {
                width: initial;
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

        .po-re {
            position: relative;
        }

        .po-ab {
            position: absolute;
            top: 0;
            right: 30px;
        }

        .table_text_word {
            word-break: break-all;
            wrap: hard;
        }

        .table_text_word_keep {
            word-break: break-word;
            wrap: hard;
        }

        .pre_text_word {
            white-space: pre-wrap; /* CSS3*/
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-all; /* Internet Explorer 5.5+ */
        }

        .mobile_helpBox_list {
            position: relative;
            z-index: 1
        }

        .opacity_0_5 {
            opacity: 0.5;
        }

        .ui-datepicker {
            font-size: 12px;
            width: 250px
        }

        .ui-datepicker select.ui-datepicker-month {
            width: 30%;
            font-size: 11px;
            margin-left: 5%;
            height: 20px
        }

        .ui-datepicker select.ui-datepicker-year {
            width: 40%;
            font-size: 11px;
            height: 20px
        }

        #banner_wrap {
            margin: 0 auto;
            text-align: center;
        }

        #banner_quick_bg {
            margin: 0 auto;
            text-align: center;
            width: 1000px;
            position: relative;
        }

        #banner_quick {
            position: absolute;
            z-index: 2;
            top: 15px;
            width: 150px;
            height: 30px;
            right: -270px;
            border: 1px solid rgba(51, 86, 123, 0.8);
            border-width: 5px;
            background-color: #002c5a
        }

        #banner_quick a {
            color: white;
        }

        #banner_container {
            position: relative;
        }

        .lineFirstBold:first-line {
            color: #6f1111;
            font-weight: bold;
        }

        .comp-name-mode {
            max-width: 310px;
            position: absolute;
            top: 80%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-weight: 600;
        }

        .comp-name-mode-question {
            max-width: 310px;
            position: absolute;
            top: 80%;
            left: 52%;
            transform: translate(-50%, -50%);
            font-weight: 600;
        }


        @media screen and (max-width: 1024px) {
            .onlyPCFunction {
                display: none;
            }

            .mobile-fw-300 {
                font-weight: 300;
            }
        }

        #graph_donut_title {
            width: 40%;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        .schedule-bg {
            color: rgb(0, 104, 183);
            font-weight: bold;
            border: 1px solid rgb(0, 104, 183);
        }

        /* LINE :: focus mouse change */
        .pointer {
            cursor: pointer;
        }

        /* LINE :: th align center */
        .list-table th.center {
            text-align: center;
        }

        .closeMask {
            position: fixed;
            z-index: 99;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
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
        }

        @media screen and (max-width: 425px) {
            .list-table th {
                padding: 10px 4px;
            }
        }

        @media screen and (max-width: 280px) {
            .list-table th {
                padding: 1px 10px;
            }
        }

        @media screen and (max-width: 1024px) {
            .search-form-major .date-wrap .unit {
                margin-top: 5px;
                margin-left: -1px;
            }
        }

        @media screen and (max-width: 1024px) {
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
<%--<script type="text/javascript"--%>
<%--        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64bdd806e937defb179aa9a2b9cc6c95&libraries=services"></script>--%>
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
        <input type="hidden" name="searchType" value="car"/>
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
        <input type="hidden" name="searchType" value="car"/>
        <input type="hidden" name="club" value=""/>
        <input type="hidden" name="carHost" value=""/>
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
                        <%--                        <span class="input-group-clear dis-n" id="club_clear">x</span>--%>
                        <select class="club " id="clubBox" onchange="$.selectBoxChange(this.value, 'club')">
                            <option value="전체">전체</option>
                            <option value="운반"
                            >운반
                            </option>
                        </select>
                    </div>
                </li>
                <li>
                    <label>상차지</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 fromsiteAutocomplete trn" placeholder="상차지" name="fromsite"
                               id="fromsite" autocomplete="off" value="${!empty view ? view.fromsite : ''}">
                        <%--                        <span class="input-group-clear" id="fromsite_clear">x</span>--%>
                        <select class="fromsite " id="fromsiteBox" onchange="$.selectBoxChange(this.value, 'fromsite')">
                            <option value="">전체</option>

                            <option value="구디"
                            >구디
                            </option>

                        </select>
                    </div>
                </li>
                <li>
                    <label>하차지</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 tositeAuto complete trn" placeholder="하차지" name="tosite"
                               id="tosite" autocomplete="off" value="${!empty view ? view.tosite : ''}">
                        <%--                        <span class="input-group-clear" id="tosite_clear">x</span>--%>
                        <select class="tosite " id="tositeBox" onchange="$.selectBoxChange(this.value, 'tosite')">
                            <option value="">전체</option>

                            <option value="지밸리">지밸리</option>

                        </select>
                    </div>
                </li>
                <li>
                    <label>품목</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 itemAuto complete trn" placeholder="품목" name="item" id="item"
                               value="${!empty view ? view.item : ''}" autocomplete="off">
                        <%--                        <span class="input-group-clear" id="item_clear">x</span>--%>
                        <select class="item " id="itemBox" onchange="$.selectBoxChange(this.value, 'item')">
                            <option value="">전체</option>

                            <option value="출퇴근"
                            >출퇴근
                            </option>

                        </select>
                    </div>
                </li>
                <li>
                    <label>차량번호</label>
                    <div class="input-group select">
                        <input type="text" class="wp100 carHostAuto complete trn" placeholder="차량번호"
                               name="carHost" id="carHost" value="${!empty view ? view.carHost : ''}"
                               autocomplete="off">
                        <%--                        <span class="input-group-clear dis-n" id="carHost_clear">x</span>--%>
                        <select class="carHost " id="carHostBox"
                                onchange="$.selectBoxChange(this.value, 'carHost')">
                            <option value="">전체</option>

                            <option value="자차"
                            >자차
                            </option>
                        </select>
                    </div>
                </li>
            </ul>
        </div>


        <div style="text-align: center;padding-top: 30px;border: 1px solid #ddd;padding-bottom: 30px; margin: 0 0 10px;">
            <div style="width: 50%;  float: left;">
                <label style="display: inline-flex;align-items: center;justify-content: flex-start;"><input
                        type="radio" name="searchType"
                        value="car" checked/>운행일 기준</label>
            </div>
            <div style="margin-left: 50%;">
                <label style="display: inline-flex;align-items: center; justify-content: flex-start;width: 155px;"><input
                        type="radio" name="searchType" value="fromsite"/>차량 기준</label>
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
                <span>데이터</span> <span class="cnt default-blue"><c:out value="${receiptsList[0].totalData}"/></span>
                <span>건 (총대수 : <span class="cnt default-blue"><span id="totalQty"></span> </span> 대)가 검색되었습니다.</span>
            </p>
        </div>

        <div class="btn-area">
            <input type="button" style="background-image: none !important;text-indent: 0px !important;"
                   class="btn btn-search btn-search__line" value="일괄결재" onClick="$.allChkChange(1);"
                   onkeydown="if(event.keyCode == 13) return false;">
            <input type="button" style="background-image: none !important;text-indent: 0px !important;"
                   class="btn btn-search btn-search__line" value="취소" onClick="$.allChkChange(0);"
                   onkeydown="if(event.keyCode == 13) return false;">
        </div>
        <div style="width: 100%; overflow-x: auto; overflow-y: hidden;">
            <table class="list-table">
                <colgroup>
                    <col style="width: 40%">
                    <col style="width: 33%">
                    <col style="width: 33%">
                    <col style="width: 60%">
                    <col style="width: 28%">
                    <col style="width: 28%">
                </colgroup>
                <thead>
                <tr>
                    <th>운행일</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>차량번호</th>
                    <th>대수</th>
                    <th>진행</th>
                </tr>
                </thead>
                <tbody id="receiptsSearchResult">
                <tr>
                    <td>
                        23-09-09
                    </td>
                    <td>
                        구디
                    </td>
                    <td>
                        지밸리
                    </td>
                    <td>
                        37우2598
                    </td>
                    <td>
                        1
                    </td>
                    <td>
                        <span style="color: #000080; font-weight: bold;">하차</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        23-09-10
                    </td>
                    <td>
                        구디
                    </td>
                    <td>
                        지밸리
                    </td>
                    <td>
                        더미데이터
                    </td>
                    <td>
                        1
                    </td>
                    <td>
                        <span style="color: #000080; font-weight: bold;">하차</span>
                    </td>
                </tr>
                <c:forEach items="${receiptsList}" var="receipt">
                    <tr>
                        <td>${receipt.date}</td>
                        <td>${receipt.fromsite}</td>
                        <td>${receipt.tosite}</td>
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
        </div>
        <div>
            <section class="paging">
                <ul class="paging__ul" id="page-div">

                    <li><a style="cursor: pointer;" onclick="$.valuePg(1)"><img
                            src="/resources/image/icons/ico_prev.png" alt="이전"></a></li>

                    <li class="pageNum">


                        <a style="cursor: pointer;"
                           onclick="$.valuePg(1)"
                           class="active">1</a>


                    </li>

                    <li><a style="cursor: pointer;" onclick="$.valuePg(1);"><img
                            src="/resources/image/icons/ico_next.png" alt="다음"></a></li>
                </ul>
            </section>
        </div>
</section>


<style>
    .popSearch-listWrap {
        border-top: none;
        max-height: inherit;
        padding-top: 10px;
    }
</style>

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
