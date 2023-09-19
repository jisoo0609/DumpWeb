<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<script src="/resources/js/dailyReport/step5/popup.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/step5/import.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/form.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>
<script type="text/javascript"  src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />



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



<section class="DrvSection">
    <h2>차량관리 차계부 등록</h2> <span></span>
    <form action="result" method="post">
        <fieldset>
            <input type="radio" name="drvClub" id="rdOli" value="주유">
            <label for="rdOli" class="active">주유</label>

            <input type="radio" name="drvClub" id="rdDEF" value="요소수">
            <label for="rdDEF">요소수</label>

            <input type="radio" name="drvClub" id="rdEngOil" value="엔진오일">
            <label for="rdEngOil">엔진오일</label>

            <input type="radio" name="drvClub" id="rdFix" value="정비(수리)">
            <label for="rdFix">정비(수리)</label>

            <input type="radio" name="drvClub" id="rdNote" value="기타">
            <label for="rdNote">기타</label>

            <ul class="CarUl">
                <li>
                    <label class="drvLabel" for="datepicker1">날짜</label>
                    <span class="drvInputSpan"><input id="datepicker1" inputmode="none" name="drvDate"></span>
                    <label class="chk2" for="chk2">결재</label> <!--? 결제 체크박스 클릭시 수정 불가 -->
                    <input id="chk2" type="checkbox">
                </li>
                <li>
                    <label class="drvLabel" for="lastKm">최종 주행거리 km</label>
                    <span class="drvInputSpan"><input id="lastKm" name="lastKm" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="차량계기판의 최종 주행거리"></span>
                </li>
                <li>
                    <label class="drvLabel" for="useAmt">사용금액</label>
                    <span class="drvInputSpan"><input id="useAmt" name="useAmt" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="사용금액"></span>
                </li>
                <li>
                    <label class="drvLabel" for="useOil">주유량 L</label>
                    <span class="drvInputSpan"><input id="useOil" name="useOil" type="number" pattern="[0-9]*" inputmode="numeric" placeholder="주유량"></span>
                </li>
                <li>
                    <label class="drvLabel" for="drvRem">기타(설명) <span><img class="drvVoiceImg" src="/resources/image/step5/ico_mic.png" alt="음성인식 버튼"></span> </label>
                    <span class="drvInputSpan"><textarea placeholder="주유소 및 정비소와 수리내용" id="drvRem voiceNotification" name="drvRem" class="voice-notification" cols="30" rows="2"></textarea></span>
                </li>
                <li class="tabBtn" data-tab="hiddenPart" >
                    <label for="showHideCheckbox">다음 교환 주기 입력</label>
                    <span class="drvInputSpan2"><input checked id="showHideCheckbox" type="checkbox"></input></span>
                </li>
            </ul>
            <ul class="bdnUl" id="hiddenPart">
                <li>
                    <label class="drvLabel" for="datepicker2">교환 예정일</label>
                    <span class="drvInputSpan"><input id="datepicker2" inputmode="none" name="datepicker2"></span>
                </li>
                <li>
                    <label class="drvLabel" for="nextlastkm">교환 주행거리</label>
                    <span class="drvInputSpan"><input name="repaddkm" id="nextlastkm" type="number" pattern=”\d*” placeholder="다음 차량계기판의 최종 주행거리"></span>
                </li>
                <li>
                     <label for="ChangeConf">교환 확인</label>
                     <span class="drvInputSpan3"><input id="ChangeConf" type="checkbox" name="rependchk"></span>
                </li>
            </ul>
        </fieldset>
    </form>
    <script src="/resources/js/dailyReport/step5/tabpage.js"></script>
    <script src="/resources/js/dailyReport/step5/voice.js"></script>

    <div>
        <button class="openBtn" data-popName="drvpop1">삭제</button> <button class="openBtn" data-popName="drvpop2">저장</button> <button class="openBtn" data-popName="drvpop3">이전화면</button>
    </div>

    <div id="drvpop1" class="drvPopup1">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>정말 삭제하시겠습니까?</p>
            <input type="button" value="확인">
        </div>
    </div>

    <div id="drvpop2" class="drvPopup2">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>저장 하시겠습니까?</p>
            <input type="button" value="확인" onclick="saveData()">
        </div>
    </div>

    <div id="drvpop3" class="drvPopup3">
        <div>
            <span class="material-symbols-outlined closeBtn">close</span>
            <p>이전 화면으로 돌아가시겠습니까?</p>
            <input type="button" value="확인" onClick="history.go(-1)">
        </div>
    </div>
<script>
     // "확인" 버튼을 클릭하면 실행되는 함수
     function saveData() {
        // 선택된 라디오 버튼의 ID를 저장할 변수
        var selectedRadioId = '';

        // 라디오 버튼 그룹의 이름
        var radioGroupName = 'radioGroup';

        // 선택된 라디오 버튼을 찾아서 ID를 가져오기
        var selectedRadio = document.querySelector('input[name="' + radioGroupName + '"]:checked');

        // 선택된 라디오 버튼이 있을 때만 ID 값을 가져오기
        if (selectedRadio) {
            selectedRadioId = selectedRadio.id;
        }

        // 나머지 폼 데이터 수집
        var form = document.querySelector('form');
        var formData = new FormData(form);

        // 데이터 객체 생성 및 선택된 라디오 버튼의 ID 추가
        formData.append('selectedRadioId', selectedRadioId);

        // FormData 객체를 JavaScript 객체로 변환
        var dataObject = {};
        formData.forEach(function(value, key) {
            dataObject[key] = value;
        });

        // JavaScript 객체를 JSON 문자열로 변환
        var jsonData = JSON.stringify(dataObject);
        console.log(jsonData);
        // AJAX 요청을 위한 설정
        var url = 'carcare/ajax/save';

        fetch(url, {
            method: 'POST',
            body: jsonData, // JSON 형식의 데이터를 전송 데이터로 사용
            headers: {
                'Content-Type': 'application/json', // JSON 데이터임을 명시
                // 필요한 헤더 추가 (예: 인증 토큰)
                'Authorization': 'Bearer YourAuthToken',
            },
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('네트워크 오류');
            }
            return response.json(); // 서버에서의 응답을 JSON 형식으로 파싱
        })
        .then(data => {
            // 성공적으로 서버에서 응답을 받았을 때의 처리
            console.log('서버 응답:', data);
        })
        .catch(error => {
            // 오류 처리
            console.error('오류:', error);
        });
     }

</script>

    <table>
        <thead>
        <tr>
            <th>분류</th>
            <th class="Drvth2">최종</br>주행거리</th>
            <th class="Drvth2">사용금액</th>
            <th>기타(설명)</th>
            <th>교환 주기</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>주유</td>
            <td class="Drvtd2">1,000,000</td>
            <td class="Drvtd2">1,000,000</td>
            <td>We be riding, we be riding
                We be riding for the crew
                Yeah loyalty is royalty and thats just how we do
                H1GHR mobbing causing problems
                All thе while we getting loot</td>
            <td>X</td>
        </tr>

        <tr>
            <td>요소수</td>
            <td class="Drvtd2">1,000,000</td>
            <td class="Drvtd2">1,000,000</td>
            <td>We be riding, we be riding
                We be riding for the crew
                Yeah loyalty is royalty and thats just how we do
                H1GHR mobbing causing problems
                All thе while we getting loot</td>
            <td>X</td>
        </tr>
        <tr>
            <td>엔진오일</td>
            <td class="Drvtd2">1,000,000</td>
            <td class="Drvtd2">1,000,000</td>
            <td>We be riding, we be riding
                We be riding for the crew
                Yeah loyalty is royalty and thats just how we do
                H1GHR mobbing causing problems
                All thе while we getting loot</td>
            <td>X</td>
        </tr>
        <tr>
            <td>정비(수리)</td>
            <td class="Drvtd2">1,000,000</td>
            <td class="Drvtd2">1,000,000</td>
            <td>We be riding, we be riding
                We be riding for the crew
                Yeah loyalty is royalty and thats just how we do
                H1GHR mobbing causing problems
                All thе while we getting loot</td>
            <td>X</td>
        </tr>
        <tr>
            <td>기타</td>
            <td class="Drvtd2">1,000,000</td>
            <td class="Drvtd2">1,000,000</td>
            <td>We be riding, we be riding
                We be riding for the crew
                Yeah loyalty is royalty and thats just how we do
                H1GHR mobbing causing problems
                All thе while we getting loot</td>
            <td>X</td>
        </tr>
        </tbody>
    </table>
</section>


<!-- <footer>
<h1>
<img src="images/logo.png" alt="Logo Icon">
<a href="http://www.kiwontech.com">http://www.kiwontech.com</a>
</h1>
<p>
<span>(주)기원테크</span> <span>서울특별시 구로구 디지털로31길 53 이앤씨벤처드림타워5차 509호</span> <span>대표전화: 010-3717-7406</span> <span> e-mail:100@kiwontech.com</span>
</p>
</footer> -->




<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>