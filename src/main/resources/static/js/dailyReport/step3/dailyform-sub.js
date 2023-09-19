/* function :   open/close search popup */
function openPop() {
    document.getElementById('popup').style.display = 'flex';
}
function closePop() {
    document.getElementById('popup').style.display = 'none';
}
function openPopSearch() {
    document.getElementById('popSearch').style.display = 'flex';
}
function closePopSearch() {
    resultDiv.empty(); // 이전 결과 지우기
    $("#search-input").val(""); //input box 비우기

    document.getElementById('popSearch').style.display = 'none';

}


/* function : 결재버튼을 통해서만 체크박스를 체크하거나 해제할 수 있다.  */
/* function: 오늘 날자로 인풋 자동 채우기 */
const dateInput = document.getElementById('date');
const todayDate = new Date();
dateInput.value = todayDate.toISOString().slice(0, 10);




/* function : onfocus시 자동으로 010을 채워준다*/
function fill010() {
    const telInput = document.getElementById('carSubmitTel');
    telInput.value = "010";
}



/* 비고 사이즈 자동변경 */
const freetext = document.getElementById('Rem');
freetext.oninput = event => {
    const inputValue = event.target;
    freetext.style.height = 0
    freetext.style.height = 22 + inputValue.scrollHeight + 'px';
};


/* 대수, 운반단가로 합계보여주기 */
    //<!-- "대수"와 "운반 단가" 입력 요소 가져오기 -->
const QtyInput = document.getElementById('Qty');
const QtyupInput = document.getElementById('Qtyup');
const totalAmountInput = document.getElementById('totalAmount');

    //<!-- 입력 값이 변경될 때마다 합계 업데이트 함수 호출 -->
QtyInput.addEventListener('input', updateTotalAmount);
QtyupInput.addEventListener('input', updateTotalAmount);

    //<!-- 합계 업데이트 함수 -->
function updateTotalAmount() {
    <!-- "대수"와 "운반 단가" 값을 가져옴 -->
    const Qty = parseFloat(QtyInput.value);
    const unitPrice = parseFloat(QtyupInput.value);

    //<!--값이 유효한 경우에만 합계 계산 및 표시-->
    if (!isNaN(Qty) && !isNaN(unitPrice)) {
        <!-- "대수"와 "운반 단가"를 곱하여 소수점 이하 2자리까지 표시 -->
        totalAmountInput.value = Qty * unitPrice;
    } else {
        //<!-- 값이 유효하지 않은 경우 합계 입력 상자를 비움 -->
        totalAmountInput.value = '';
    }
}

/* 운송 신규등록 금액부분 보여주거나 숨기기 */
const popCheckbox = document.getElementById("showHideCheckbox");
const hiddenPart = document.getElementById("hiddenPart");
const checkboxLabel = document.getElementById("checkboxLabel");

popCheckbox.addEventListener("change", function() {
    if (popCheckbox.checked) {
        hiddenPart.style.display = "block";
        checkboxLabel.style.color = "#333";
    } else {
        hiddenPart.style.display = "none";
        checkboxLabel.style.color = "#aaa";
    }
});

/* 전체 삭제 버튼 누르면 인풋 비우기 */
function clearInputs() {
    const form = document.getElementById("canvas");
    const inputs = form.getElementsByTagName("input");

    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = ""; // Set the value of each input field to an empty string
    }
}


