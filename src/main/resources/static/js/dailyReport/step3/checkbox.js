let chk1 = document.getElementById("checkbox");
let chk2 = document.getElementById("chk2");
const CurrStatus = document.getElementById('CurrStatus');

/* 이미 등록된 기록에서 chk정보를 불러와서 그 효과를 위한 함수 */
function showChk1(sign) {
    chk1.checked = sign;
    //console.log("showchk1",sign)
    approved();
}

function showChk2(sign) {
    document.getElementById("chk2").checked = sign;
    //console.log("showchk2",sign)
    mutuallyApproved(sign);
}


/* 결재 체크박스 체크되면 밸류 바꾸기 */
let wasChecked = false;
const mtable = document.getElementById('main-table');
const inputElements = mtable.querySelectorAll('.input');
function approved() {
    if (chk1.checked) {
        wasChecked = true;
    }
    //console.log("1st "+ wasChecked);
    if (chk1.checked) {
        chk1.value = '1';
        // 거래처정보 인풋 readonly로 접근 방지
        inputElements.forEach(function(input) {
            input.readOnly = true;
            if (input.getAttribute("onfocus")) {
              input.removeAttribute("onfocus");
            }
            CurrStatus.disabled = true;
            $('#date').attr("readonly",true);
            $('#date').datepicker('disable').removeAttr('disabled');
            input.style.backgroundColor = "#F2F2F2";
            input.style.color = "black"
        });
        //submitCheck();
    } else {
        chk1.value = '0';
        // 결재 취소하면 다시 활성화
        inputElements.forEach(function(input) {
            input.readOnly = false;
            input.style.backgroundColor = "#fff";
        });
        // 제출상태였다가 해제되는 경우
        CurrStatus.disabled = false;
        //console.log("2nd "+ wasChecked);
        if(wasChecked == true ) {
            CurrStatus.options[2].selected = true;
        }
    }
}

function mutuallyApproved(sign) {
    // chk2를 누르면 chk1 이 자동으로 체크된다.
    if (chk2.checked == true) {
        chk2.value = '1';
        showChk1(sign)
        chk1.disabled = true;
    } else {
        chk2.value = '0';
    }
    $.saveChk2();
}


$.saveChk2 = function(){
    var formData = new FormData($("[name=frm]")[0]);
    $.ajax({
        url : "/dailyReport/workspace/ajax/approval/carsubmit",
        type : "POST",
        data : formData,
        processData: false,
        contentType: false,
        cache: false,
        success : function (data) {
             //console.log("data는?"+data);
            //alert("승인 완료");
        },
        error : function (data) {
            //alert("승인 에러");
        }
    })
}

function submitCheck() {
    CurrStatus.options[3].selected = true;
    //CurrStatus.disabled = true;
}

function submitConfirmation() {
    //console.log("제출하기")
}