<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<script src="/resources/js/dailyReport/step5/popup.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/step8/order.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/form.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>
<script type="text/javascript"
        src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<script>
        function dvFristbtn() {
            $('#droildiv').css('color: rgb(0, 203, 230)', 'border-color: rgb(0, 203, 230)');
        }
    var rdOli = null;
    var rdDEF = null;
    var rdEngOil = null;
    var rdFix = null;
    var rdNote = null;

    $(document).ready(function () {
        init();
        popupJS(rdOli, rdDEF, rdEngOil, rdFix, rdNote);
    });

    function init() {
        rdOli = $('#rdOli');
        rdDEF = $('#rdDEF');
        rdEngOil = $('#rdEngOil');
        rdFix = $('#rdFix');
        rdNote = $('#rdNote');
    }

    function clickJS(rdOli, rdDEF, rdEngOil, rdFix, rdNote) {
        var clickTarget;
        $(rdOli, rdDEF, rdEngOil, rdFix, rdNote).click(function () {
            clickTarget = "#" + $(this).attr("data-popName");
            $(clickTarget).toggleClass('active');
        });

    }
</script>

<script>
    var clBtn = null;
    var opBtn = null;

    $(document).ready(function () {
        init();
        popupJS(opBtn, clBtn);
    });

    function init() {
        clBtn = $(".clBtn");
        opBtn = $(".opBtn");
    }

    function popupJS(opBtn, clBtn) {
        var opTarget;
        $(opBtn).click(function () {
            opTarget = "#" + $(this).attr("data-popName");
            $(opTarget).addClass('active');
        });
        $(clBtn).click(function () {
            $(opTarget).removeClass("active")
        });
    }

</script>

<script>  // 달력 옵션 추가 코드
    $(function () {
        //input을 datepicker로 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd' //달력 날짜 형태
            , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            , showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
            , changeYear: true //option값 년 선택 가능
            , changeMonth: true //option값  월 선택 가능
            , showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
            , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            , buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
            , buttonText: "선택" //버튼 호버 텍스트
            , yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
            , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 텍스트
            , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
            , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 텍스트
            , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 Tooltip
            , minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            , maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        });

        //초기값을 오늘 날짜로 설정해줘야 합니다.
        $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });
</script>

<section class="GolSection">
    <h2>제출처 주문 등록</h2> <span></span>
    <form method="post">
        <fieldset>
            <ul>
                <li>
                    <label class="golLabel" for="datepicker" style="width: 12.3%;">주문일</label>
                    <span class="golInputSpan"><input id="datepicker"></span>
                </li>
                <li>
                    <label class="golLabel" for="lastKm">상차지</label>
                    <span>
                        <img class="golVoiceImg" src="./resources/static/image/icons/ico_mic.png" alt="음성인식 버튼">
                    </span>
                    <span class="golInputSpan"><input id="lastKm" type="number" pattern="[0-9]*" inputmode="numeric"
                            placeholder="상차지"></span>
                </li>
                <li>
                    <label class="golLabel" for="useAmt">하차지</label>
                    <span>
                        <img class="golVoiceImg" src="./resources/static/image/icons/ico_mic.png" alt="음성인식 버튼">
                    </span>
                    <span class="golInputSpan"><input id="useAmt" type="number" pattern="[0-9]*" inputmode="numeric"
                            placeholder="하차지"></span>
                </li>
                <li>
                    <label class="golLabel" for="useOil">품목</label>
                    <span>
                        <img class="golVoiceImg" src="./resources/static/image/icons/ico_mic.png" alt="음성인식 버튼">
                    </span>
                    <span class="golInputSpan"><input id="useOil" type="number" pattern="[0-9]*" inputmode="numeric"
                            placeholder="품목"></span>
                </li>
                <li>
                    <label class="golLabel" for="useOil">대수</label>
                    <span>
                        <img class="golVoiceImg" src="./resources/static/image/icons/ico_mic.png" alt="음성인식 버튼">
                    </span>
                    <span class="golInputSpan"><input id="useOil" type="number" pattern="[0-9]*" inputmode="numeric"
                            placeholder="대수"></span>
                </li>
                <li>
                    <label class="golLabel" for="useOil">차량번호</label>
                    <span>
                        <img class="golVoiceImg" src="./resources/static/image/icons/ico_mic.png" alt="음성인식 버튼">
                    </span>
                    <span class="golInputSpan"><input id="useOil" type="number" pattern="[0-9]*" inputmode="numeric"
                            placeholder="차량번호"></span>
                </li>
                <li>
                    <label for="chk2">결재</label> <!--? 결제 체크박스 클릭시 수정 불가 -->
                    <input id="chk2" type="checkbox">
                </li>
            </ul>
        </fieldset>
    </form>
    <script src="/resources/js/voice.js"></script>
    <div>
        <button class="opBtn" data-popName="golPop1">삭제</button>
        <button class="opBtn" data-popName="golPop2">수정</button>
        <button class="opBtn" data-popName="golPop3">저장+추가</button>
        <button class="opBtn" data-popName="golPop4">이전화면</button>
    </div>

    <div id="golPop1" class="golPopup1">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>정말 삭제하시겠습니까?</p>
            <input type="button" value="확인">
        </div>
    </div>

    <div id="golPop2" class="golPopup2">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>정말 수정하시겠습니까?</p>
            <input type="button" value="확인">
        </div>
    </div>

    <div id="golPop3" class="golPopup3">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>정말 저장하시겠습니까?</p>
            <input type="button" value="확인" onclick="location.href='nextgol'">
            <!-- 위 내용 저장후 새페이지로 데이터값 그대로 적용된 상태에서 이동 -->
        </div>
    </div>

    <div id="golpop4" class="golPopup4">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>이전 화면으로 돌아가시겠습니까?</p>
            <input type="button" value="확인" onClick="history.go(-1)">
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>주문일</th>
                <th>상차지</th>
                <th>하차지</th>
                <th>품목</th>
                <th>대수</th>
                <th>차량번호</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>03.09.11</td>
                <td></td>
                <td></td>
                <td>모래, 자갈</td>
                <td>100</td>
                <td>123가 1234</td>
            </tr>
        </tbody>
    </table>
</section>

<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
