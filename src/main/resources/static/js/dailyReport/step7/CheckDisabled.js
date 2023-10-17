$(document).ready(function() {
    // DOM 요소를 jQuery로 선택합니다.
    var chk1Checkbox = $("#chk1");
    var allInputs = $("input[type='text'], input[type='number'], textarea");

    // 결재 체크박스의 변경 이벤트를 감지하고 처리합니다.
    chk1Checkbox.change(function() {
        if (chk1Checkbox.is(":checked")) {
            // 결재 체크박스가 체크되었을 때 모든 input 요소를 비활성화합니다.
            allInputs.prop("disabled", true).css("background-color", "#e9e9e9");
            console.log('1'); // 체크됐을 때 1 출력
        } else {
            // 결재 체크박스가 해제되었을 때 모든 input 요소를 활성화합니다.
            allInputs.prop("disabled", false).css("background-color", ""); // 원래 색상으로 복원 (빈 문자열)
            console.log('0'); // 체크 해제됐을 때 0 출력
        }
    });
});

$(document).ready(function() {
    // DOM 요소를 jQuery로 선택합니다.
    var chk67Checkbox = $("#chk67");
    var carNoInput = $("#carNo"); // 차량번호 입력란 ID 수정

    // 결재 체크박스의 변경 이벤트를 감지하고 처리합니다.
    chk67Checkbox.change(function() {
        if (chk67Checkbox.is(":checked")) {
            // 결재 체크박스가 체크되었을 때 모든 input 요소를 비활성화합니다.
            carNoInput.val("공고");
            carNoInput.prop("disabled", true).css("background-color", "#e9e9e9");
            console.log('1'); // 체크됐을 때 1 출력
        } else {
            // 결재 체크박스가 해제되었을 때 모든 input 요소를 활성화합니다.
//            carNoInput.val(""); // 차량번호 입력한 초기화
            carNoInput.prop("disabled", false).css("background-color", ""); // 원래 색상으로 복원 (빈 문자열)
            console.log('0'); // 체크 해제됐을 때 0 출력
        }
    });
});