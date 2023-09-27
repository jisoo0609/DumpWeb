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
    <link href="/resources/css/step8/style.css?" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/resources/css/loading.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/step8/index.css">

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
                               name="carNo" id="CarNo" value="${!empty view ? view.CarNo : ''}"
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
                        type="radio" name="sortingCriteria" value="0-date" checked/>운행일 기준</label>
            </div>
            <div style="width: 50%;  float: left;">
                <label style="display:none"><input
                        type="radio" name="sortingCriteria" value="1-t"/></label>
            </div>
            <div style="display:none">
                <label style="display:none"><input
                        type="radio" name="sortingCriteria" value="2-t"/></label>
            </div>
            <div style="margin-left: 50%;">
                <label style="display: inline-flex;align-items: center; justify-content: flex-start;width: 155px;"><input
                        type="radio" name="sortingCriteria" value="3-carNo"/>차량 기준</label>
            </div>
            <div style="margin-left: 50%;">
                <label style="display: inline-flex;align-items: center; justify-content: flex-start;width: 155px;"><input
                        type="radio" name="sortingCriteria" value="4-item"/>품목 기준</label>
            </div>
            <div style="margin-left: 50%;">
                <label style="display: inline-flex;align-items: center; justify-content: flex-start;width: 155px;"><input
                        type="radio" name="sortingCriteria" value="5-qtyup"/>운반비 기준</label>
            </div>
            <div style="display:none">
                <label style="display: inline-flex;align-items: center;justify-content: flex-start;"><input
                        type="radio" name="sortingCriteria" value="6-t"/></label>
            </div>
        </div>
    </form>

    <div class="btn-area erpSearchBtn">
        <input type="button" class="search_btn" value="검색" onClick="bindList()">
    </div>

    <div id="tableshow">
        <div class="table-top" style="height: auto; display:  block; text-align: center">
            <p class="total">
                <span>데이터</span> <span class="cnt default-blue" id="receiptsCnt"></span>
                <span class="cnt default-blue" id="total"></span>
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

            <table class="list-table" id="tableOrderByDate">
                <colgroup>
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                    <col style="width: 13%">
                </colgroup>
                <thead>
                <tr>
                    <th>No</th>
                    <th class="th_header">운행일</th>
                    <th class="th_header">상차지</th>
                    <th class="th_header">하차지</th>
                    <th class="th_header">차량번호</th>
                    <th class="th_header">품목</th>
                    <th class="th_header">대수</th>
                    <th class="th_header">운반비</th>
                    <th class="th_header">진행</th>
                </tr>
                </thead>
                <tbody>

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

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>

<script type="text/javascript" src="/resources/js/dailyReport/step8/list.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/step8/index.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/step8/datepicker.js"></script>
<script src="/resources/js/dailyReport/step8/click.js"></script>
<script src="/resources/js/dailyReport/step8/DOMContentLoaded.js"></script>


</html>