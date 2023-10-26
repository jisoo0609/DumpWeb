const canvas = document.getElementById("canvas");
const popup = document.getElementById('popup');
const chk = document.getElementById('checkbox');
var openable1 = false;
var openable2 = false;
var openable3 = false;
var openable4 = true; //기본적으로 오늘 날자를 세팅해 놓으므로 true로 둠


function pageGoBack() {
    window.location.href = document.referrer;
}


/* DDDDDD-DATE-EEEEEE */
const dateInput = document.getElementById('date');
const thisDay = new Date();
/* function: 오늘 날자로 인풋 자동 채우기 */
dateInput.value = thisDay.toISOString().slice(0, 10);

$(document).ready(function() {
            // Initialize datepicker on the date input
    $("#date").datepicker({
            dateFormat: 'yy-mm-dd', // Date format
            showOtherMonths: true,
            showMonthAfterYear: true,
            changeYear: true,
            changeMonth: true,
            yearSuffix: '년'
            ,monthNamesShort: MONTH_FORMAT
            ,monthNames: MONTH_NAME_FORMAT
            ,dayNamesMin: DAY_FORMAT
            ,dayNames: DAY_FORMAT
            ,yearRange: '-5:+1'
    });


    let currentDate = $("#date").datepicker("getDate");
    // Button to set the date to the previous day
    $("#prevDay").click(function() {
        currentDate.setDate(currentDate.getDate() - 1);
        $("#date").datepicker("setDate", currentDate);
        listData();
    });

    // Button to set the date to the next day
    $("#nextDay").click(function() {
        currentDate.setDate(currentDate.getDate() + 1);
        $("#date").datepicker("setDate", currentDate);
        listData();
    });
});


/* function : onfocus시 자동으로 010을 채워준다*/
var phoneNumberPattern = /^010[0-9]{8}$/;
const telInput = document.getElementById('carSubmitTel');
function fill010() {
    if (phoneNumberPattern.test(telInput.value)) {
        openable3 = true;
    } if(telInput.value.length <=3) {
        telInput.value = "010";
    }
}

let openValue1;
function validateInput1(input) {
    const carSubmit = input.value
    openValue1 = carSubmit;
    if(!carSubmit) {
        openable1 = false;
    } else {
        openable1 = true;
    }
}

let openValue2;
function validateInput2(input) {
    const salesman = input.value;
    openValue2 =salesman
    if(!salesman) {
        openable2 = false;
    } else {
        openable2 = true;
    }
}

/* function : oninput 인풋이 바르지 않으면 보더컬러를 red로 바꿈 */
function validateInput3(tel) {
    if (phoneNumberPattern.test(tel)) {
        telInput.style.borderColor = '';
        telInput.style.borderColor = '';
        openable3 = true;
    } else {
        telInput.style.borderColor = 'red';
        openable3 = false;
    }


}


function loadInputValues() {
    const sales1 = document.getElementById('carSubmit');
    const sales2 = document.getElementById('salesman');
    const sales3 = document.getElementById('carSubmitTel');

    if (sales1.value !== null) {
        openable1 = true;
    }
    if (sales2.value !== null) {
        openable2 = true;
    }
    if (sales3.value !== null) {
        openable3 = true;
    }

    searchByCarsubmitTel(sales3);
}



/* function : open popup */
function openPop() {
    if(position == "driver") {
        if(dateInput === '') { // 데이트 기록이 없으면 운송정보를 추가할 수 없다.
            openable4 = false;
        } else {
            openable4 = true;
        }
        validateInput3(telInput.value)
        if(chk.value === '0') {
            if(openable1 & openable2 & openable3 & openable4 === true) {
                popup.style.display = 'flex';
                updateTotalAmount();
                saved.forEach(function(elem){
                    elem.classList.add('hidden');
                })
                unsaved.forEach(function(elem) {
                    initialize(elem)
                });
            } else {
                $.inputInvalid();
            }
        } else {
            $.checkedAlert();
        }
    } else {
        popup.style.display = 'flex';
        updateTotalAmount();
        saved.forEach(function(elem){
            elem.classList.add('hidden');
        })
        unsaved.forEach(function(elem) {
            initialize(elem)
        });
    }

}

const saved = popup.querySelectorAll('.saved')
const unsaved = popup.querySelectorAll('.unsaved') //신규저장

function initialize(element) {
    if (element.classList.contains('hidden')) {
        element.classList.remove('hidden');
    }
}

function closePop() {
    $.emptyRow();
    if(clickedRow) {
        clickedRow.classList.remove('selected-row');
    }
    popup.style.display = 'none';
    saved.forEach(function(elem) {
        initialize(elem)
    });
    unsaved.forEach(function(elem) {
        initialize(elem)
    });
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
    const Qty = parseFloat(QtyInput.value);
    const unitPrice = parseFloat(QtyupInput.value);

    //<!--값이 유효한 경우에만 합계 계산 및 표시-->
    if (!isNaN(Qty) && !isNaN(unitPrice)) {
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
const savedState = localStorage.getItem('checkboxState');

function recoverState() {
    if (savedState === "on") {
        popCheckbox.checked = true;
    } else {
        popCheckbox.checked = false;
    }
    //searchByCarsubmitTel()

    showOrHide();
    updateTotalAmount();
}


function showOrHide() {
    if (popCheckbox.checked) {
        hiddenPart.style.display = "block";
        checkboxLabel.style.color = "#333";
        localStorage.setItem('checkboxState', "on");
    } else {
        hiddenPart.style.display = "none";
        checkboxLabel.style.color = "#aaa";
        localStorage.setItem('checkboxState', "off");
    }
}

/* 전체 삭제 버튼 누르면 인풋 비우기*/
function clearInputs() {
    const inputs = canvas.getElementsByTagName("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].value = ""; // Set the value of each input field to an empty string
    }
    chk.checked = false;
    approved();
    list();
}


/* 결재 체크박스 체크되면 밸류 바꾸기 */
/* 결재 체크박스 체크되면 인풋 수정 불가 */
function approved() {
    const mtable = document.getElementById('main-table');
    const inputElements = mtable.querySelectorAll('.input');
    if (chk.checked) {
        chk.value = '1';

        // 거래처정보 인풋 비활성화
        inputElements.forEach(function(input) {
            //input.disabled = true;
            input.style.backgroundColor = "#F2F2F2";
            input.style.color = "black"
        });
    } else {
        chk.value = '0';
        // 결재 취소하면 다시 활성화
        inputElements.forEach(function(input) {
            input.disabled = false;
            input.style.backgroundColor = "#fff";
        });
    }
}


/* 제출하기 버튼을 클릭하면 결재 체크되고 제출체크가 체크하면되 결재도 체크됨*/
function submitCheck() {
    //const chk1 = document.getElementById('checkbox')
    //chk.checked = true;
    //chk.disabled = true;
    CurrStatus.options[3].selected = true;
    CurrStatus.disabled = true;
    approved();
}


/* fillPop으로 인풋팝업이 뜰때는 버튼이 바뀌어야 한다. */
let clickedRow;
const filledInput = document.querySelectorAll('.filledInput');
const newInput = document.querySelectorAll('.emptyInput');
function fillPop(event) {
    var clicked = event.currentTarget.id;
    clickedRow = document.getElementById(clicked);
    clickedRow.classList.add('selected-row');
    var td1 = clickedRow.querySelector('td:nth-child(1)').textContent;
    var td2 = clickedRow.querySelector('td:nth-child(2)').textContent;
    var td3 = clickedRow.querySelector('td:nth-child(3)').textContent;
    var td4 = clickedRow.querySelector('td:nth-child(4)').textContent;
    var td5 = clickedRow.querySelector('td:nth-child(5)').textContent;
    var td6 = clickedRow.querySelector('td:nth-child(6)').textContent;
    var td7 = clickedRow.querySelector('td:nth-child(7)').textContent;

    // Fill the input fields in the popup with these values
    document.getElementById('fromsite').value = td1;
    document.getElementById('tosite').value = td2;
    document.getElementById('item').value = td3;
    document.getElementById('Qty').value = td4;
    document.getElementById('Rem').value = td5;
    document.getElementById('sheetsubID').value = td6;
    if (td7 !== "0") {
        document.getElementById('Qtyup').value = td7;
    }


    // Open the popup
    openPop();
    unsaved.forEach(function(elem){
        elem.classList.add('hidden');
    })
    saved.forEach(function(elem) {
        initialize(elem)
    });
}


function listData() {
    // 조회는 날자와 폰 번호 기준을 되므로 이 두 인풋이 차있으면 보여주도록 한다.
    if(openable3 & openable4 === true) {
        $.list();
    }
}



function checkInputs() {
    // 거래처정보가 저장되거나 수정 될 때는 모든 인onAutoSearch()풋이 차있어야 한다.
    return openable1 & openable2 & openable3 & openable4;
}

