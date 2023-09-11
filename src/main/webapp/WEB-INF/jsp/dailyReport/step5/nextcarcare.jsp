<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<script src="/resources/js/dailyReport/step5/popup.js"></script>
<link rel="stylesheet" href="/resources/css/step5/import.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/form.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>
<script type="text/javascript"
        src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script>
    function dvFristbtn(){
        $('#droildiv').css('color: rgb(0, 203, 230)', 'border-color: rgb(0, 203, 230)');
    }
</script>

<script>  // 달력 옵션 추가 코드
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
       $('#datepicker1, #datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   });
</script>

<!-- <header>
<div>
<span>
<img src="images/ico-call.png" alt="01037177406" onclick="document.location.href='tel:01037177406'">
</span>
<div>
<span>7777</span>
</div>
<div>
<ul>
<li>로그아웃</li>
<li>메뉴</li>
</ul>
</div>
</div>
</header> -->

<section class="DrvSection">
    <h2>차량관리 차계부 등록</h2> <span></span>
    <form method="post">
        <fieldset>
            <input type="radio" name="radioGroup" id="rdOli">
            <label for="rdOli" class="active">주유</label>

            <input type="radio" name="radioGroup" id="rdDEF">
            <label for="rdDEF">요소수</label>

            <input type="radio" name="radioGroup" id="rdEngOil">
            <label for="rdEngOil">엔진오일</label>

            <input type="radio" name="radioGroup" id="rdFix">
            <label for="rdFix">정비(수리)</label>

            <input type="radio" name="radioGroup" id="rdNote">
            <label for="rdNote">기타</label>
            <ul>
                <li>
                    <label class="drvLabel" for="datepicker1">날짜</label>
                    <span class="drvInputSpan"><input id="datepicker1"></span>
                    <label for="chk2">결재</label> <!--? 결제 체크박스 클릭시 수정 불가 -->
                    <input id="chk2" type="checkbox">
                </li>
                <li>
                    <label class="drvLabel" for="lastKm">최종 주행거리</label>
                    <span class="drvInputSpan"><input id="lastKm" type="number" pattern=”\d*” placeholder="최종 주행거리"></span>
                </li>
                <li>
                    <label class="drvLabel" for="useAmt">사용금액</label>
                    <span class="drvInputSpan"><input id="useAmt" type="number" pattern=”\d*” placeholder="사용금액"></span>
                </li>
                <li>
                    <label class="drvLabel" for="useOil">주유량</label>
                    <span class="drvInputSpan"><input id="useOil" type="number" pattern=”\d*” placeholder="주유량"></span>
                </li>
                <li>
                    <label class="drvLabel" for="drvRem">기타(설명) <span><img class="drvVoiceImg" src="/resources/image/step5/ico_mic.png" alt=""></span> </label>
                    <span class="drvInputSpan"><textarea id="drvRem voiceNotification" class="voice-notification" cols="30" rows="2"></textarea></span>
                </li>
                <li>
                    <label class="drvLabel" for="datepicker2">교환 예정일</label>
                    <span class="drvInputSpan"><input id="datepicker2"></span>
                </li>
                <li>
                    <label class="drvLabel" for="nextlastkm">교환 주행거리</label>
                    <span class="drvInputSpan"><input id="nextlastkm" type="number" pattern=”\d*” placeholder="교환 주행거리"></span>
                </li>
                <li>
                    <label for="ChangeConf">교환 확인</label>
                    <span class="drvInputSpan2"><input id="ChangeConf" type="checkbox" value=""></span>
                </li>
            </ul>
        </fieldset>
    </form>
    <script src="/resources/js/dailyReport/step5/voice.js"></script>

    <div>
        <button class="openBtn" data-popName="drvpop1">삭제</button> <button class="openBtn" data-popName="drvpop2">저장</button> <button class="openBtn" data-popName="drvpop3">이전화면</button>
    </div>

    <div id="drvpop1" class="drvPopup1 closeBtn">
        <div>
            <span class="material-symbols-outlined">close</span>
            <p>정말 삭제하시겠습니까?</p>
            <input type="button" value="확인">
        </div>
    </div>

    <div id="drvpop2" class="drvPopup2 closeBtn">
        <div>
            <span class="material-symbols-outlined">close</span>
            <p>저장 하시겠습니까?</p>
            <input type="button" value="확인">
        </div>
    </div>

    <div id="drvpop3" class="drvPopup3 closeBtn">
        <div>
            <span class="material-symbols-outlined">close</span>
            <p>이전 화면으로 돌아가시겠습니까?</p>
            <input type="button" value="확인" onClick="history.go(-1)">
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>분류</th>
            <th class="Drvth2">최종주행거리</th>
            <th class="Drvth2">사용금액</th>
            <th>기타(설명)</th>
            <th>교환 주기</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>정비(수리)</td>
            <td class="Drvtd2" >100,000</td>
            <td class="Drvtd2" >100,000</td>
            <td></td>
            <td>X</td>
        </tr>
        </tbody>
    </table>


</section>



<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
