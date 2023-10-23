//$(document).ready(function() {
//    // DOM 요소를 jQuery로 선택
//    var chk2Checkbox = $("#chk2");
//    var allInputs = $("input[type='text'], input[type='number'], textarea");
//
//    // 결재 체크박스의 변경 이벤트를 감지하고 처리
//    chk2Checkbox.change(function() {
//        if (chk2Checkbox.is(":checked")) {
//            // 결재 체크박스가 체크되었을 때 모든 input 요소를 비활성화
//            allInputs.prop("disabled", true);
//        } else {
//            // 결재 체크박스가 해제되었을 때 모든 input 요소를 활성화
//            allInputs.prop("disabled", false);
//        }
//    });
//});
$(document).ready(function() {
    // DOM 요소를 jQuery로 선택
    var chk2Checkbox = $("#chk2");
    var allInputs = $("input[type='text'], input[type='number'], input[type='radio'], textarea");
    var regDateInput = $("#reg-date");
    var exchangeDateInput = $("#exchange-date");

    // 결재 체크박스의 변경 이벤트를 감지하고 처리
    chk2Checkbox.change(function() {
        if (chk2Checkbox.is(":checked")) {
            // 결재 체크박스가 체크되었을 때 모든 input 요소를 비활성화
            allInputs.prop("disabled", true);
             regDateInput.prop("disabled", true);
             exchangeDateInput.prop("disabled", true);
        } else {
            // 결재 체크박스가 해제되었을 때 모든 input 요소를 활성화
            allInputs.prop("disabled", false);

            // 특정 input 요소를 재활성화
            regDateInput.prop("disabled", false);
            exchangeDateInput.prop("disabled", false);
        }
    });
});