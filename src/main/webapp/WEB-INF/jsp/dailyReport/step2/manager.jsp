<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/dailyreport.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript"
        src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>

<style>
    ul.basic-menu {
        display: grid;

        grid-template-columns: repeat(2, 1fr);
        justify-content: center;

        margin-bottom: 5%;
        margin-top: 5%;
        margin-left: 17%;

    }

    #update-button {
        padding: 5px;
        border-radius: 10px;
        position: absolute;
        background-color: #ffffff;
        margin-left: 10px;
        border: 2px solid #0068b7;
    }

    .basic-menu li {
        display: flex;

    }


    .race-write,
    .race-search,
    .car-repair,
    .car-search {
        width: 90px;
        height: 30%;
    }

    .race-registration,
    .race-check,
    .car-registration,
    .car-check {
        padding: 15px;
        border-radius: 15px;
        border: 2px solid #0068b7;
        margin-right: 10px;
        text-align: center;
        white-space: nowrap;
        background-color: #ffffff;
    }

    .management {
        display: flex;

    }

    .car-management {
        margin-left: 15px;

    }

    .management {
        justify-content: center;
    }

    .today-menu th:nth-child(2) {
        border-left: 1px solid;
        border-right: 1px solid;
    }

    .today-menu th:nth-child(4) {
        border-left: 1px solid;
        border-right: 1px solid;
    }

    .today-menu,
    .car-menu {
        background-color: #e0e3e8;
    }

    .today-menu,
    .car-menu {
        height: 30px;
    }

    .car-menu>th {
        border: 1px solid;
    }

    .today-car,
    .car-care,
    .today-recruitment {
        margin-top: 30px;
    }

    .today-car,
    .car-care,
    .today-recruitment {
        font-weight: bold;
    }

    .today-car,
    .car-care,
    .today-recruitment {
        font-weight: bold;
    }

    .today-graph {
        border: 1px solid;
        border-collapse: collapse;
        width: 100%;
    }

    .today-graph,
    .car-graph {
        margin-top: 10px;
    }

    .car-graph {
        border: 1px solid black;
        border-collapse: collapse;
        width: 100%;
    }
</style>


<section style=" background-color: #cce0f7">


    <article class="homescreen">
        <div class="date-container" style="margin-left= 10%;text-align:center; ">
            <div class="date-picker">

                <label class="start-text" for="start-date">운행일
                    <input type="date" id="start-date" />
                    <span>~</span>
                    <input type="date" id="end-date" />
                </label>
                <button id="update-button">조회</button>
                <ul class="basic-menu">
                    <li>
                        총 운반 금액 :
                        <div class="carrying-money" style="margin: 0 0 5% 0">원</div>
                    </li>
                    <li>
                        총 운행대 수 :
                        <div class="carrying-car" style="margin: 0 0 5% 0">대</div>
                    </li>
                    <li>
                        총 비용 금액 :
                        <div class="expense-money">원</div>
                    </li>
                    <li>마지막 등록일 :</li>


                </ul>
            </div>
        </div>

        <section class="management">
            <div style="display: flex; align-items: center">
                <div style="margin-light:5%; text-align:center; font-weight: 600">
                    <div class="race-check">
                        <img class="race-search" src="/resources/image/ico_check.png" alt="일보조회" />
                    </div>

                    <span>일보조회</span>

                </div>

                <div class="car-bundle">
                    <div style=" text-align:center; font-weight: 600">
                        <div class="car-registration">
                            <img class="car-repair" src="/resources/image/ico_carrepair.png" alt="주문배차등록" />
                        </div>
                        <span>주문배차등록</span>
                    </div>
                </div>
                <div style=" text-align:center; font-weight: 600">
                    <div class="car-check">
                        <img class="car-search" src="/resources/image/ico_carcheck.png" alt="" />
                    </div>
                    <span>차량관리</span>
                </div>
        </section>



        <section>
            <p class="today-car">금일 배차 현황</p>
            <table class="today-graph">
                <tr class="today-menu">
                    <th>제출처</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>품목</th>
                    <th>대수</th>
                </tr>
            </table>
            <p class="car-care">제출 받은 일보</p>
            <table class="car-graph">
                <tr class="car-menu">
                    <th>제출처</th>
                    <th>상차지</th>
                    <th>하차지</th>
                    <th>품목</th>
                    <th>대수</th>
                </tr>
            </table>
            <p class="today-recruitment">금일 차량 모집 공고</p>
        </section>
    </article>
    <script>
        // 현재 날짜를 가져와서 운행일 입력 상자의 초기 값으로 설정
        //  const today = new Date().toISOString().split('T')[0];
        //  documnt.getElementById('오늘날').value = today;

        document.addEventListener("DOMContentLoaded", function() {
            const updateButton = document.getElementById("update-button");
            const startDateInput = document.getElementById("start-date");
            const endDateInput = document.getElementById("end-date");

            // 시작 날짜를 당월 1일로 설정
            const today = new Date();
            const firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            const formattedFirstDay = firstDayOfMonth.toISOString().split("T")[0];
            startDateInput.value = formattedFirstDay;

            // 종료 날짜를 오늘로 설정
            const formattedToday = today.toISOString().split("T")[0];
            endDateInput.value = formattedToday;

            updateButton.addEventListener("click", function() {
                const startDate = startDateInput.value;
                const endDate = endDateInput.value;

                console.log("시작 날짜:", startDate);
                console.log("종료 날짜:", endDate);
            });
        });
    </script>
</section>


<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>