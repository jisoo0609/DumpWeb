<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/css/step7/order.css">
<script src="/resources/js/dailyReport/step7/pop.js"></script>
<script src="/resources/js/dailyReport/step7/order.js"></script>
<script src="/resources/js/dailyReport/step7/param.js"></script>
<script type="text/javascript" src="/resources/js/dailyReport/form.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>" ></script>
<script type="text/javascript"
        src="/resources/js/dailyReport/list.js?jsVerType=20<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMddHHmmss"/>"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<script>
        function dvFristbtn() {
            $('#droildiv').css('color: rgb(0, 203, 230)', 'border-color: rgb(0, 203, 230)');
        }
</script>

<script>  // 달력 옵션 추가 코드
    $(function () {
        //input을 datepicker로 선언
        $("#date").datepicker({
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

        //초기값을 오늘 날짜로 설정
        $('#date').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    });
</script>

<section class="GolSection">
<h2>제출처 주문 등록</h2>
    <form method="post" name="golForm" id="golForm">
        <fieldset>
          <ul>
            <li>
              <label class="golLabel" for="date">주문일</label>
              <span class="golInputSpan"><input id="date" name="date"></span>
              <button type="button" class="golSearch searchBtn" onClick="bindList()">조회</button>
              <div class="checkbox1">
                <input id="chk1" type="checkbox">
                <label class="check67" for="chk1">결재</label> <!--? 결제 체크박스 클릭시 수정 불가 -->
              </div>
            </li>
            <li>
              <label class="golLabel" for="fromsite"> 상차지 <span><img class="golVoiceImg" src="/resources/image/step7/ico_mic.png" alt="음성인식 버튼"></span> </label>
              <span class="golInputSpan"><input class="golIn" id="fromsite" name="fromsite" type="text" placeholder="상차지" required></span>
            </li>
            <li>
              <label class="golLabel" for="tosite"> 하차지 <span><img class="golVoiceImg" src="/resources/image/step7/ico_mic.png" alt="음성인식 버튼"></span> </label>
              <span class="golInputSpan"><input class="golIn" id="tosite" name="tosite" type="text" placeholder="하차지" required></span>
            </li>
            <li>
              <label class="golLabel" for="item"> 품목 <span><img class="golVoiceImg" src="/resources/image/step7/ico_mic.png" alt="음성인식 버튼"></span> </label>
              <span class="golInputSpan"><input class="golIn" id="item" name="item" type="text" placeholder="품목" required></span>
            </li>
            <li>
              <label class="golLabel" for="Qty"> 대수 </label>
              <span class="golInputSpan">
                <input class="golIn" id="Qty" name="Qty" type="number" pattern="[0-9]" inputmode="numeric" placeholder="대수" required>
              </span>
            </li>
            <li>
              <label class="golLabel" for="carNo"> 차량번호 <span><img class="golVoiceImg" src="/resources/image/step7/ico_mic.png" alt="음성인식 버튼"></span> </label>
              <span class="golInputSpan"><input class="golIn" id="carNo" name="carNo" type="text" placeholder="미지정 또는 차량번호 또는 모집공고"></span>
<%--              <div class="checkbox2">--%>
<%--                <input id="chk67" type="checkbox">--%>
<%--                <label class="check67" for="chk67">모집공고</label> <!--? 결제 체크박스 클릭시 수정 불가 -->--%>
<%--              </div>--%>
            </li>
            <li>
              <label class="golLabel" for="Qtyup"> 운반비 </label>
              <span class="golInputSpan"><input class="golIn" id="Qtyup" name="Qtyup" type="number" pattern="[0-9]" inputmode="numeric" placeholder="운반비"></span>
            </li>
          </ul>
        </fieldset>
    		</form>
    <script src="/resources/js/dailyReport/step7/voice.js"></script>
    <div>
      <button class="opBtn" data-popName="golPop1">삭제</button>
      <button class="opBtn" data-popName="golPop2">취소</button>
      <button class="opBtn" data-popName="golPop3">저장</button>
      <button class="opBtn" data-popName="golPop4">이전화면</button>
    </div>

		<div id="golPop1" class="golPopup1">
			<div>
				<span class="material-symbols-outlined clBtn">close</span>
				<p>정말 <span style="font-weight: bold;">삭제</span>하시겠습니까?</p>
				<input class="confirmBtn" type="button" value="확인">
				<input class="clBtn" type="button" value="취소">
			</div>
		</div>

		<div id="golPop2" class="golPopup2">
			<div>
				<span class="material-symbols-outlined clBtn">close</span>
				<p>정말 <span style="font-weight: bold;">취소</span>하시겠습니까?</p>
				<input class="confirmBtn" type="button" value="확인" onClick="cancel()">
				<input class="clBtn" type="button" value="취소">
			</div>
		</div>

		<div id="golPop3" class="golPopup3">
			<div>
				<span class="material-symbols-outlined clBtn">close</span>
				<p>정말 <span style="font-weight: bold;">저장</span>하시겠습니까?</p>
				<input class="confirmBtn" type="button" value="확인" onClick="save()">
				<input class="clBtn" type="button" value="취소">
			</div>
		</div>

		<div id="golPop4" class="golPopup4">
			<div>
				<span class="material-symbols-outlined clBtn">close</span>
				<p>정말 <span style="font-weight: bold;">이전화면</span>으로 돌아가시겠습니까?</p>
				<input class="confirmBtn" type="button" value="확인" onClick="history.go(-1)">
				<input class="clBtn" type="button" value="취소">
			</div>
		</div>

    <table>
      <thead>
				<tr>
					<th>No.</th>
					<th>상차지</th>
					<th>하차지</th>
					<th>품목</th>
					<th>대수</th>
					<th>차량번호 <br> <span style="font-weight: normal;">(일괄배차)</span></th>
				</tr>
	  </thead>
      <tbody id="tBody">
      </tbody>
    </table>
</section>

<script src="/resources/js/dailyReport/step7/CheckDisabled.js"></script>

<%@ include file="popup/layer_popup.jsp" %>
<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
