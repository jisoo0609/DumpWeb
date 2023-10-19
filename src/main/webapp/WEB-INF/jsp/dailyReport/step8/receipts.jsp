<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="msapplication-TileImage" content="/resources/image/favicon/favicon.png">
    <link rel="shortcut icon" href="/resources/image/favicon/favicon.png">

    <!-- Style-->
    <link href="/resources/css/step8/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loading.css">

</head>

<body>


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


    <form name="search_frm" method="post">
        <input type="hidden" name="pageNo" value="1"/>
        <input type="hidden" id="searchDetailChk" name="searchDetailChk" value="0">
        <input type="hidden" name="sheetID" value="${!empty view ? view.sheetID : 0}">
        <div class="search-form">
            <div class="search-form-major" id="dateArea">
                <label>운행기간</label>
                <div class="date-wrap dis-ib dis-b-t">
                    <input type="text" id="start-date"
                           name="startDate" readonly autocomplete="off"><span class="unit">~</span>
                    <input type="text" id="end-date" name="endDate"
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
                        </select>
                    </div>
                </li>
            </ul>
        </div>
        <div style="text-align: center;padding-top: 30px;border: 1px solid #ddd;padding-bottom: 60px; margin: 0 0 10px;">
            <div style="width: 50%;  float: left;">
                <label style="display: inline-flex;align-items: center;justify-content: flex-start;width: 90px; white-space: nowrap;"><input
                    type="radio" name="sortingCriteria" value="carNo" checked>차량 기준</label> <br>
                <label style="display: inline-flex;align-items: center;margin-top: 15px;justify-content: flex-start;width: 90px;"><input
                        type="radio" name="sortingCriteria" value="item">품목 기준</label>
                <br>
            </div>
            <div style="margin-left: 50%;">
                <label style="display: inline-flex;align-items: center; justify-content: flex-start;width: 155px;"><input
                    type="radio" name="sortingCriteria" value="date">운행일 기준</label>
                <br>
            </div>
        </div>
    </form>

    <div class="btn-area erpSearchBtn">
        <input type="button" class="search_btn" value="검색" onClick="bindList()">
    </div>

    <div id="tableshow">
        <div class="table-top" style="height: auto; display:  block; text-align: center">
            <p class="total">
<%--                <span>데이터</span><span class="cnt default-blue" id="receiptsCnt"></span>--%>
                <span class="cnt default-blue" id="total"></span>
            </p>
        </div>

        <div style="width: 100%; overflow-x: auto; overflow-y: hidden;">
            <div class="agreement_container">
                <button class="common_btn" style="width: 110px;">운반금액(원)<br><span class="transportCost"></span>
                </button>
                <div class="btnWraaper">
                    <button class="common_btn" onclick="approveReceiptsList()">일괄결재</button>
                    <button class="common_btn" onclick="cancelApproval()">일괄취소</button>
                    <button class="common_btn back_btn" onclick="goBack()" style="background:#0068b7; color:white;">이전화면</button>
                </div>
            </div>

            <table class="list-table" id="tableOrderByDate">
                <thead>
                <tr>
                    <th>No</th>
                    <th class="th_header">운행일</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th class="th_header">품목</th>
                    <th class="th_header">차량번호</th>
                    <th>대수</th>
                    <th class="th_header">운반단가</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>


<button class="screen_top up-btn">
    <img src="/resources/image/icons/ico-top.png" style="width: 40px; height: 40px;">
</button>
</body>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>

<script type="text/javascript" src="/resources/js/dailyReport/step8/list.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/step8/index.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/step8/datepicker.js"></script>
<script src="/resources/js/dailyReport/step8/click.js"></script>
<script src="/resources/js/dailyReport/step8/DOMContentLoaded.js"></script>


</html>
