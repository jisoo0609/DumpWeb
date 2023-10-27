$.inputInvalid = function() {
    modal({
        title: '주의',
        type: 'alert',
        text: '입력된 제출처 정보를 다시 확인해주세요.'
    });
}

$.checkedAlert = function() {
    modal({
        title: '주의',
        type: 'alert',
        text: '결재된 상태로 추가수정삭제 불가.<br>결재 체크 해제 후 시도해주세요.'
    });
}

$.successEdit = function() {
    modal({
        title: '알림메시지',
        type: 'confirm',
        text: '수정 성공, 메인페이지로 이동하시겠습니까?',
        callback: function(result) {
            if (result == true) {
                location.href = "/dailyReport/driver";
            }
        }
    });
}

$.successRowEdit = function() {
    modal({
        title: '알림메시지',
        type: 'alert',
        text: '수정 성공'
    });
    closePop();
}

$.failEdit = function() {
    modal({
        title: '알림메시지',
        type: 'alert',
        text: '저장 실패'
    });
}

$.successSave = function() {
    modal({
        title: '알림메시지',
        type: 'alert',
        text: '저장이 완료되었습니다.'
    });
}

$.Error = function() {
    modal({
        title: '알림메시지',
        type: 'alert',
        text: '요청을 처리하는 도중 에러가 발생하였습니다.<br>관리자에게 문의 부탁드립니다.'
    });
}

$.successSearch = function() {
    modal({
        title: '알림메시지',
        type: 'alert',
        text: '조회에 성공했습니다.'
    });
}

$.confirmRemoval = function() {
    modal({
        title: '알림메시지',
        type: 'confirm',
        text: '정말 삭제하시겠습니까?',
        callback : function(result){
            if (result == true) {
                $.deleteRow();
            }
        }
    });
}

$.confirmTotalRemoval = function() {
    modal({
        title: '알림메시지',
        type: 'confirm',
        text: '당일 이 거래처에 대한 운송기록이 다 삭제됩니다.<br> 정말 삭제하시겠습니까?',
        callback : function(result){
            if (result == true) {
                $.deleteAll();
            }
        }
    });
}

$.failRemoval = function() {
    modal({
        title: '주의',
        type: 'alert',
        text: '삭제실패'
    });
}

$.successRemoval = function() {
    modal({
        title: '알림',
        type: 'alert',
        text: '삭제성공'
    });
    closePop();
}

$.notMember = function() {
    modal({
        title: '주의',
        type: 'alert',
        text: '제출처가 가입된 회원이 아니므로 제출 할 수 없습니다.<br/>제출처를 초대해 주세요.'
    });
}

$.failSubmit = function() {
    modal({
        title: '주의',
        type: 'alert',
        text: '제출 실패'
    });
}

$.successSubmit = function() {
    modal({
        title: '알림',
        type: 'alert',
        text: '제출 성공'
    });
    closePop();
}