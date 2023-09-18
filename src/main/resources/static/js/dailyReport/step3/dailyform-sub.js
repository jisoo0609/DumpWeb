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
const dateDisplay = document.getElementById('dateDisplay');
const currentDate = document.getElementById('currentDate');
currentDate.textContent = '연도- 월- 일';

function checkBox() {
     const checkbox = document.getElementById('checkbox');
     checkbox.checked = !checkbox.checked;

     if (checkbox.checked) {
         const today = new Date();
         const year = today.getFullYear();
         const month = String(today.getMonth() + 1).padStart(2, '0');
         const day = String(today.getDate()).padStart(2, '0');
         currentDate.textContent = year % 100 +'-'+month+'-'+day;
         checkbox.disabled = true;
     } else {
         currentDate.textContent = '연도- 월- 일';
     }
}

/* function : onfocus시 자동으로 010을 채워준다*/
function fill010() {
    const telInput = document.getElementById('carSubmitTel');
    telInput.value = "010";
}


/* function: -,+로 날자 조정 */
const dateInput = document.getElementById('date');

function prevday(){
    const currentDate = new Date(dateInput.value);
    currentDate.setDate(currentDate.getDate() - 1);
    const formattedDate = currentDate.toISOString().split('T')[0];
    dateInput.value = formattedDate;
}

function nextday(){
    const currentDate = new Date(dateInput.value);
    currentDate.setDate(currentDate.getDate() + 1);
    const formattedDate = currentDate.toISOString().split('T')[0];
    dateInput.value = formattedDate;
}

/* 비고 사이즈 자동변경 */
const lineheight = 25;
const freetext = document.querySelector('.Rem');

freetext.oninput = event => {
    const $target = event.target;

    $target.style.height = 0
    $target.style.height = lineheight + $target.scrollHeight + 'px';
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