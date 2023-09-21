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



<script>
    $(function() {
        //input을 datepicker로 선언
        $("#datepicker1, #datepicker2").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
            ,changeYear: true //option값 년 선택 가능
            ,changeMonth: true //option값  월 선택 가능
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            ,buttonText: "선택" //버튼 호버 텍스트
            ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
            ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });

        //초기값을 오늘 날짜로 설정해줘야 합니다.
        $("#datepicker2").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

        // datepicker1을 매달 1일로 설정
        $("#datepicker1").datepicker('setDate', new Date(new Date().getFullYear(), new Date().getMonth(), 1));
    });
</script>

<%
    // 모델로부터 받은 데이터를 변수에 저장
    List<DailyReportStep4> tSheet = (List<DailyReportStep4>) request.getAttribute("tSheet");
    List<DailyReportStep4> totalAmount = (List<DailyReportStep4>) request.getAttribute("totalAmount");
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
                    <span style="font-weight: 600; margin:0 30px 0 30px; padding-top: 5px;">~</span>
                    <input class="toDate" id="datepicker2" name="toData" readonly>
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
                            <c:forEach var="carSubmit" items="<%=carSubmitValue%>">
                                <option value="${carSubmit}" selected>${carSubmit}</option>
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
                            <c:forEach var="fromSite" items="<%=fromSiteValue%>">
                                <option value="${fromSite}" selected>${fromSite}</option>
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
                            <c:forEach var="toSite" items="<%=toSiteValue%>">
                                <option value="${toSite}" selected>${toSite}</option>
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
                            <c:forEach var="item" items="<%=itemValue%>">
                                <option value="${item}" selected>${item}</option>
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
                            <c:forEach var="carSubmitTel" items="<%=carSumitTelValue%>">
                                <option value="${carSubmitTel}" selected>${carSubmitTel}</option>
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
                            <option value="true" selected>결재O</option>
                            <option value="false">결재X</option>
                        </select>
                    </div>
                </li>
            </ul>
        </div>
        <div class="search_form_bottom_detail">
            <div style="width: 50%; float: left;">
                <label for="searchType">
                    <input type="radio" name="searchType" value="0" checked>
                    제출처 기준
                </label>
                <br>
                <label for="searchType">
                    <input type="radio" name="searchType" value="1">
                    운행일 기준
                </label>
                <br>
                <label for="searchType">
                    <input type="radio" name="searchType" value="2">
                    상차지 기준
                </label>
            </div>
            <div style="margin-left: 50%;">
                <label for="searchType">
                    <input type="radio" name="searchType" value="3">
                    하차지 기준
                </label>
                <br>
                <label for="searchType">
                    <input type="radio" name="searchType" value="4">
                    품목 기준
                </label>
                <br>
                <label for="searchType">
                    <input type="radio" name="searchType" value="4">
                    운반비 기준
                </label>
            </div>
        </div>
    </form>
        <div class="btn_area">
<%--            <a href="/dailyReport/list" id="link2Get">--%>
                <input type="button" value="검색" onclick="getList()">
<%--            </a>--%>
        </div>
    <div class="bottom_table">
<%--        총 대수를 계산하는 코드--%>
        <%
            int totalQty = 0;
            for(DailyReportStep4 data: tSheet){
                totalQty += data.getQty();
            }
        %>
        <div class="table_top" style="margin: 10px 0;">
            <p class="total">
                데이터
                <span><%= tSheet.size() %></span>건(총대수:
                <span>
                    <%= totalQty %>
                </span>대)이 검색되었습니다.
            </p>
        </div>
        <div class="cashNbtns">
            <%--            금액 단위 표시 스크립트--%>
            <script>
                const elementDiv = document.querySelector('.cashNbtns');
                const totalAmount = ${totalAmount[0]};
                const formattedAmount = new Intl.NumberFormat('ko-KR').format(totalAmount);

                elementDiv.innerHTML = "<p>운반금액(원)<br>" + formattedAmount + "</p>";
            </script>
            <input type="button" value="일괄결재">
            <input type="button" value="취소" id="cancelBtn">
        </div>
        <script>
            $('#cancelBtn').click(() => {
                $('.list-table tbody tr').remove();
            });
        </script>
        <div>
            <table class="list-table">
                <colgroup>
                    <col width="19%">
                    <col width="15%">
                    <col width="15%">
                    <col width="20%">
                    <col width="20%">
                    <col width="10%">
                    <col width="16%">
                </colgroup>
                <thead>
                    <tr>
                        <th>제출처</th>
                        <th>운행일</th>
                        <th>품목</th>
                        <th>상차지</th>
                        <th>하차지</th>
                        <th>대수</th>
                        <th>운반단가</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="listMain" items="${tSheet}">
                <tr>
                    <td>${listMain.carSubmit}</td>
                    <td>${listMain.date}</td>
                    <td>${listMain.item}</td>
                    <td>${listMain.fromsite}</td>
                    <td>${listMain.tosite}</td>
                    <td>${listMain.qty}</td>
                    <td style="text-align: right">
<%--                        운반단가 쉼표 표시 코드--%>
                        <fmt:formatNumber value="${listMain.qtyup}" type="number"/>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>

<script src="/resources/js/step4/step4.js"></script>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>