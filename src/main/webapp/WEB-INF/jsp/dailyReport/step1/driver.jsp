<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<style>
    .homescreen {
        padding: 5px;
    }
    #datepicker1,
    #datepicker2 {
        width: 100px;
    }
    .ui-datepicker-trigger {
        display: none;
    }
    #update-button {
        padding: 0 3px 0 3px;
        border-radius: 10px;
        position: absolute;
        background-color: #ffffff;
        margin-left: 10px;
        border: 1px solid #0068b7;
        font-size: 14px;
        font-weight: bold;
        width: -webkit-fill-available;
        margin-right: 15px;
    }
    ul.basic-menu {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        margin-bottom: 30px;
        margin-top: 10px;
    }
    .management {
        display: flex;
    }
    .car-management {
        margin-left: 15px;
    }
    .race-text,
    .car-text {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .race-bundle,
    .car-bundle {
        display: inline-flex;
    }
    .race-bundle {
        text-align: center;
    }
    .race-registration,
    .race-check,
    .car-registration,
    .car-check {
        padding: 10px;
        border-radius: 15px;
        border: 2px solid #0068b7;
        margin-right: 10px;
        text-align: center;
        white-space: nowrap;
        background-color: #ffffff;
    }
    .car-search-link {
        margin-left: 10px;
    }
    .race-search-link {
        margin-left: 5px;
    }
    .check-car,
    .registration-car,
    .search-race,
    .write-race {
        color: #000000;
    }
    .race-write,
    .race-search,
    .car-repair,
    .car-search {
        width: 45px;
    }
    .race-management {
        border-right: 1px solid #0068b7;
    }
    .basic-menu li {
        display: flex;
    }

    .today-recruitment-menu, .car-menu, .today-menu{
        font-size : 14px;
        font-weight : 600;
    }
    .today-car,
    .car-care,
    .today-recruitment {
        margin-top: 30px;
    }
    .search-race{
        margin-left : -5px
    }
    .write-race{
        margin-left : -8px
    }
    .check-car, .registration-car{
        margin-left : 6px
    }
    .today-car,
    .car-care,
    .today-recruitment {
        font-weight: bold;
    }
    .today-graph,
    .car-graph, .today-car-recruitment {
        margin-top: 10px;
    }
    .today-menu,
    .car-menu, .today-recruitment-menu {
        background-color: #e0e3e8;
    }
    .car-graph, .today-car-recruitment, .today-graph {
        border: 1px solid;
        border-collapse: collapse;
        width: 100%;
    }
    .today-menu th, .car-menu th, .today-recruitment-menu th{
        border: 1px solid black;
    }
    .today-graph td, .car-graph td, .today-car-recruitment td{
        border: 1px solid black;
        text-align: center;
        font-size: 14px;
    }

    .car-menu th:nth-child(1) {
        width: 110px;
    }
    .car-graph td:nth-child(3) {
        text-align: right;
    }
    .today-graph td:nth-child(6){
        display: none;
    }


    .car-menu th:nth-child(2) {
        border-left: 1px solid;
        border-right: 1px solid;
        width: 120px;
    }
    .car-menu th:nth-child(3) {
        width: 80px;
    }
    .car-menu th:nth-child(4) {
        width: 250px;
    }
    .car-search-link,
    .car-repair-link,
    .race-search-link,
    .race-write-link {
        text-decoration-line: none;
    }
    #popup-container {
        background: rgba(0, 0, 0, 0.5);
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        /*   display: flex;*/
        justify-content: center;
        align-items: center;
        z-index: 1;
    }
    #menusub, #carsub, #recruitment{
        word-break: break-all;
    }
    .popup-content {
        background: #fff;
        padding: 20px;
        border-radius: 5px;
        text-align: center;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }
    #close-popup {
        background: #0068b7;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        margin-top: 10px;
        cursor: pointer;
    }
    .popup-maintext {
        font-size: 20px;
        margin: 15px;
        border-bottom: 2px solid #006b87;
    }
    .popup-company {
        margin-bottom: 10px;
    }
    .popup-company {
        font-weight: bold;
    }

    .popup-company .car-submit,
    .popup-company .car-salesman,
    .popup-company .car-submitTel {
        font-weight: normal;
    }

    @media (min-width: 551px) {
        .start-text {
            font-size: 18px;
            font-weight: bold;
        }
        .management {
            justify-content: center;
        }
        #start-date,
        #end-date {
            font-size: 18px;
        }
        #update-button {
            font-size: 18px;
        }
        .race-text,
        .car-text {
            font-size: 18px;
        }
        .today-car,
        .car-care,
        .today-recruitment {
            font-size: 18px;
        }
        .today-menu,
        .car-menu {
            height: 30px;
        }

        .basic-menu {
            place-items: center;
        }
        .date-container {
            margin-top: 50px;
            position: relative;
            left: 50%;
            transform: translate(-50%, -50%);
            top: 50%;
            text-align: center;
        }
    }
</style>

<script type="text/javascript"
        src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
<section class="sub-contents-wrap maxwrap" style="background-color: #cce0f7">

    <article class="homescreen">
        <div class="date-container">
            <form name="option_frm">
                <div class="date-picker">
                    <label class="start-text" for="start-date"
                    >운행일
                        <input id="datepicker1" name="startDate" readonly/>
                        <span>~</span>
                        <input id="datepicker2" name="endDate" readonly/>
                    </label>
                    <button id="update-button" type="button" onclick="bindSummary()">조회</button>
                    <ul class="basic-menu">
                        <li>
                            총 운반 금액 :
                            <div class="carrying-money" id="boutmoney">원</div>
                        </li>
                        <li>
                            총 운행 대수 :
                            <div class="carrying-car" id="boutcar"> 대</div>
                        </li>
                        <li>
                            총 비용 금액 :
                            <div class="total-useamt" id="boutuseamt">원</div>
                        </li>
                        <li>마지막 등록일 :
                            <div class="expense-date"  id="boutdate">일</div>
                        </li>
                    </ul>
                </div>
        </div>
        <section class="management">
            <section class="race-management">
                <p class="race-text">운행 일보 관리</p>
                <div class="race-bundle">
                    <a class="race-write-link" href="/dailyReport/form">
                        <div class="race-registration">
                            <img
                                    class="race-write"
                                    src="/resources/image/step1/write.png"
                                    alt="일보등록"
                            />
                        </div>
                        <span class="write-race">일보등록</span>
                    </a>
                    <a class="race-search-link" href="/dailyReport/list">
                        <div class="race-check">
                            <img
                                    class="race-search"
                                    src="/resources/image/step1/check.png"
                                    alt="일보조회"
                            />
                        </div>
                        <span class="search-race">일보조회</span>
                    </a>
                </div>
            </section>
            <section class="car-management">
                <p class="car-text">차량 관리</p>
                <div class="car-bundle">
                    <a
                            class="car-repair-link"
                            href="/dailyReport/carcareform"
                    >
                        <div class="car-registration">
                            <img
                                    class="car-repair"
                                    src="/resources/image/step1/car-repair.png"
                                    alt=""
                            />
                        </div>
                        <span class="registration-car">차계부등록</span>
                    </a>
                    <a
                            class="car-search-link"
                            href="/dailyReport/carcarelist"
                    >
                        <div class="car-check">
                            <img
                                    class="car-search"
                                    src="/resources/image/step1/car-check.png"
                                    alt=""
                            />
                        </div>
                        <span class="check-car">차계부조회</span>
                    </a>
                </div>
            </section>
        </section>
        <section>
            <p class="today-car">금일 배차 현황</p>
            <table class="today-graph">
                <thead>
                <tr class="today-menu">
                    <th>제출처</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>품목</th>
                    <th>대수</th>
                </tr>
                </thead>
                <tbody id="menusub">
                </tbody>
            </table>
            <p class="car-care">차량 관리</p>
            <table class="car-graph">
                <thead>
                <tr class="car-menu">
                    <th>분류</th>
                    <th>교환 예정일</th>
                    <th>교환 km</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody id="carsub">
                </tbody>
            </table>
            <p class="today-recruitment">금일 차량 모집 공고</p>
            <table class="today-car-recruitment">
                <thead>
                <tr class="today-recruitment-menu">
                    <th>제출처</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>품목</th>
                    <th>대수</th>
                </tr>
                </thead>
                <tbody id="recruitment">
                </tbody>

            </table>
        </section>
    </article>
    <div id="popup-container" class="popup">
        <div class="popup-content">
            <div>
                <h2 class="popup-maintext">배차 공고</h2>
            </div>
            <div>
                <p class="popup-company">제출처 : <span class="car-submit"></span></p>
            </div>
            <div>
                <p class="popup-company">담당자 : <span class="car-salesman"></span></p>
            </div>
            <div>
                <p  class="popup-company">전화번호 : <a class="car-submitTel" href="#"></a></p>
            </div>
            <div>
                <button id="close-popup">닫기</button>
            </div>
        </div>
    </div>

</section>

<script>
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

    // start-date을 매달 1일로 설정
    $("#datepicker1").datepicker('setDate', new Date(new Date().getFullYear(), new Date().getMonth(), 1));

    // end-date를 오늘 날짜로 설정
    $("#datepicker2").datepicker('setDate', 'today');
</script>

<script src="/resources/js/dailyReport/step1/join.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>