<%@ page import="com.dispatch.dump.commonModule.db.dto.DailyReportStep4" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/step4/step4.css" type="text/css">
<script type="text/javascript" src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
<link rel="stylesheet" href="https://code.jquery.com/jquery-1.12.4.jshttps://code.jquery.com/jquery-1.12.4.jshttps://code.jquery.com/jquery-1.12.4.js">

<%
    // 모델로부터 받은 데이터를 변수에 저장
    List<DailyReportStep4> tSheet = (List<DailyReportStep4>) request.getAttribute("tSheet");

%>
<section class="sub-contents-wrap maxwrap">
    <div>
        <h1 class="subtitle" >
            <span style="font-size: 18px;">운행일보 조회</span>
            <img src="/resources/image/icons/ico_que.png" alt="" class="que-dis-mn" onclick="">
        </h1>
    </div>
    <form name="data_frm">
        <div class="search_form">
            <input type="hidden" name="carNo" value="${sessionScope.loginInfo.userId}">
            <div class="data_Area">
                <div>
                    <label style="font-size: 13px; font-weight: 600;">▪운행기간</label>
                    <input class="fromDate" id="datepicker1" name="fromDate" readonly>
                    <span style="font-weight: 600; margin:0 30px 0 30px; padding-top: 9px;">~</span>
                    <input class="toDate" id="datepicker2" name="toDate" readonly>
                </div>
                <button type="button" class="adsearch_btn">상세검색 열기 ▼</button>
                <!--                    상세검색 열고 닫는 스크립트-->
                <script>
                    $(".adsearch_btn").on("click", function (){
                        if ($(this).text() == '상세검색 닫기 ▼'){
                            $(this).text('상세검색 열기 ▼');
                        } else {
                            $(this).text('상세검색 닫기 ▼');
                        }
                        $(".search_ul").toggle();
                    })
                </script>
            </div>
            <ul class="search_ul" hidden>
                <li>
                    <%
                        Set<String> carSubmitValue = new HashSet();

                        for(DailyReportStep4 data : tSheet)
                            carSubmitValue.add(data.getCarSubmit());
                    %>
                    <label for=""></label>
                    <div class="input_select">
                        <input type="text" placeholder="제출처" name="club" class="club_input">
                        <select class="club_slect" id="club_select"
                                onchange="document.querySelector('.club_input').value=
                                    this.options[this.selectedIndex].value"
                        >
                            <option value="전체" selected>전체</option>
                            <c:forEach var="carSubmit" items="<%=carSubmitValue%>">
                                <option value="${carSubmit}">${carSubmit}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <%
                        Set<String> fromSiteValue = new HashSet();

                        for(DailyReportStep4 data : tSheet)
                            fromSiteValue.add(data.getFromsite());
                    %>
                    <label for=""></label>
                    <div class="input_select">
                        <input type="text" placeholder="상차지" name="fromSite" class="fromSite_input">
                        <select class="club_slect"
                                onchange="document.querySelector('.fromSite_input').value =
                                    this.options[this.selectedIndex].value"
                        >
                            <option value="전체" selected>전체</option>
                            <c:forEach var="fromSite" items="<%=fromSiteValue%>">
                                <option value="${fromSite}">${fromSite}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <%
                        Set<String> toSiteValue = new HashSet();

                        for(DailyReportStep4 data : tSheet)
                            toSiteValue.add(data.getTosite());
                    %>
                    <label for=""></label>
                    <div class="input_select">
                        <input type="text" placeholder="하차지" name="toSite" class="toSite_input">
                        <select class="club_slect"
                                onchange="document.querySelector('.toSite_input').value =
                                    this.options[this.selectedIndex].value"
                        >
                            <option value="전체" selected>전체</option>
                            <c:forEach var="toSite" items="<%=toSiteValue%>">
                                <option value="${toSite}">${toSite}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <%
                        Set<String> itemValue = new HashSet();

                        for(DailyReportStep4 data : tSheet)
                            itemValue.add(data.getItem());
                    %>
                    <label for=""></label>
                    <div class="input_select">
                        <input type="text" placeholder="품목" name="item" class="things_input">
                        <select class="club_slect"
                                onchange="document.querySelector('.things_input').value =
                                    this.options[this.selectedIndex].value"
                        >
                            <option value="전체" selected>전체</option>
                            <c:forEach var="item" items="<%=itemValue%>">
                                <option value="${item}">${item}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <%
                        Set<String> carSumitTelValue = new HashSet();

                        for(DailyReportStep4 data : tSheet)
                            carSumitTelValue.add(data.getCarSubmitTel());
                    %>
                    <label for=""></label>
                    <div class="input_select">
                        <input type="tel" placeholder="휴대폰 번호" name="tel" class="tel_input">
                        <select class="club_slect"
                                onchange="document.querySelector('.tel_input').value=
                                    this.options[this.selectedIndex].value"
                        >
                            <option value="전체" selected>전체</option>
                            <c:forEach var="carSubmitTel" items="<%=carSumitTelValue%>">
                                <option value="${carSubmitTel}">${carSubmitTel}</option>
                            </c:forEach>
                        </select>
                    </div>
                </li>
                <li>
                    <label for=""></label>
                    <div class="input_select">
                        <input type="text" placeholder="진행상태" name="state" class="state_input">
                        <select class="club_slect"
                                onchange="document.querySelector('.state_input').value =
                                    this.options[this.selectedIndex].value"
                        >
                            <option value="전체" selected>전체</option>
                            <option value="배차">배차</option>
                            <option value="제출">제출</option>
                            <option value="취소">취소</option>
                        </select>
                    </div>
                </li>
            </ul>
        </div>
        <div class="search_form_bottom_detail">
            <div style="width: 50%; float: left;">
                <label>
                    <input type="radio" name="searchType" value="0-submit" checked>
                    제출처 기준
                </label>
                <br>
                <label>
                    <input type="radio" name="searchType" value="1-date">
                    운행일 기준
                </label>
                <br>
                <label>
                    <input type="radio" name="searchType" value="4-item">
                    품목 기준
                </label>
            </div>
            <div style="margin-left: 50%;">
                <label>
                    <input type="radio" name="searchType" value="2-fromSite">
                    상차지 기준
                </label>
                <br>
                <label>
                    <input type="radio" name="searchType" value="3-toSite">
                    하차지 기준
                </label>
            </div>
        </div>
        <div class="btn_area">
            <input type="button" value="검색" onclick="getList()">
        </div>
    </form>
    <div class="bottom_table">
        <div class="table_top" style="margin: 10px 0;">
            <p class="total">
                데이터
                <span>0</span>건(총대수:
                <span>
                    0
                </span>대)이 검색되었습니다.
            </p>
        </div>
        <div class="cashNbtns">
            <p>운반금액(원)<br>0</p>
            <input type="button" value="일괄결재" onclick="submitBtn()">
            <input type="button" value="일괄취소" id="cancelBtn" onclick="cancelBtn()">
            <input type="button" value="이전화면" id="backBtn" onclick="history.go(-1)">
        </div>
        <div>
            <table class="list-table">
                <colgroup>
                    <col width="16%">
                    <col width="18%">
                    <col width="20%">
                    <col width="21%">
                    <col width="20%">
                    <col width="10%">
                    <col class="lastCol" width="18%">
                </colgroup>
                <thead>
                    <tr>
                        <th class="th_header">제출처</th>
                        <th class="th_header">운행일</th>
                        <th class="th_header">상차지</th>
                        <th class="th_header">하차지</th>
                        <th class="th_header">품목</th>
                        <th class="th_header">대수</th>
                        <th class="th_header">진행</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>

<script src="/resources/js/dailyReport/step4/step4.js"></script>
<script src="/resources/js/dailyReport/step4/calendar.js"></script>
<script src="/resources/js/dailyReport/step4/AJAX.js"></script>
<script src="/resources/js/dailyReport/step4/DOMContentLoaded.js"></script>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
