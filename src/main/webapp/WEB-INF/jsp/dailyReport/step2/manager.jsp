<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/resources/css/step2/manager.css">

<section class="sub-contents-wrap maxwrap" style="background-color: #cce0f7">
    <article class="homescreen">
        <div class="date-container">
            <form name="option_frm">
                <input type="hidden" name="sheetSubSS2" value="${sessionScope.loginInfo.uuserID}"/>
                <div class="date-picker">

                    <label class="start-text" for="start-date">운행일
                        <input id="start-date" name="startDate"/>

                        <span>~</span>
                        <input id="end-date" name="endDate"/>


                     </label>
                    <button  id="update-button" type="button" onclick="bindSummary()">조회</button>

                </div>

            </form>

            <ul class="basic-menu">
                <li>
                    총 운반 금액 :
                    <div class="carrying-money">
                        <!-- 값을 표시하기 위한 div -->
                        <div id="ttamount"> 원</div>

                    </div>
                </li>
                <li>
                    총 운행 대수 :
                    <div class="carrying-car" id="tnumber">
                        <!-- 값을 표시하기 위한 div -->
                        <div id="tncars"> 원</div>
                    </div>
                </li>
            </ul>
        </div>
        <section class="management">



                <a href="/dailyReport/receipts">
                   <div>
                        <div class="">
                            <div class="race-check">
                                <img class="race-search" src="/resources/image/ico_check.png" alt="거래처전표조회"/>
                            </div>
                            <span class="btn_middle">거래처전표조회</span>
                        </div>
                    </div>
                </a>
                <a href="/dailyReport/orderform" >
                    <div class="car-bundle">
                        <div>
                            <div class="car-registration">
                                <img class="car-repair" src="/resources/image/ico_carrepair.png" alt="주문배차등록"/>
                            </div>
                            <span class="btn_middle2">주문배차등록</span>
                        </div>
                    </div>
                </a>



        </section>


        <section>
            <p class="today-car">금일 배차 현황</p>
                <table class="today-graph">
                    <thead>
                        <tr class="car-menu">
                            <th>차량번호</th>
                            <th>상차지</th>
                            <th>하차지</th>
                            <th>품목</th>
                            <th>대수</th>
                        </tr>
                    </thead>

                    <tbody id="tbody1">
                    <!-- 작업 -->
                    </tbody>
                </table>

            <p class="car-care">제출 받은 일보</p>
                <table class="car-graph">
                    <thead>
                        <tr class="car-menu">
                            <th>차량번호</th>
                            <th>상차지</th>
                            <th>하차지</th>
                            <th>품목</th>
                            <th>대수</th>
                            <th>확인</th>
                        </tr>
                    </thead>

                    <tbody id="tbody2">
                    <!-- 작업 -->
                    </tbody>
                </table>

            <p class="today-recruitment">금일 차량 모집 공고</p>
               <table class="car-graph">
                   <tr class="car-menu3">
                       <th>상차지</th>
                       <th>하차지</th>
                       <th>품목</th>
                       <th>대수</th>
                   </tr>
               </table>
        </section>
    </article>

</section>

<script src="/resources/js/dailyReport/step2/datepicker.js"></script>
<script src="/resources/js/dailyReport/step2/manager.js"></script>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
<script src="/resources/js/dailyReport/step2/click.js"></script>
<script src="/resources/js/dailyReport/step2/DOMContentLoader.js"></script>