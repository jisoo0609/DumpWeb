// 페이지가 로드될 때 실행되는 함수
document.addEventListener("DOMContentLoaded", function () {

    // URL에서 쿼리 문자열을 가져옴
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    // 'driveID' 매개변수를 가져옴
    let driveID = params.get("driveID");
    // 'driveID' 매개변수가 존재하면 해당 매개변수를 사용하여 데이터를 가져오는 함수를 호출
    if (driveID !== null) {
        getDriveIDDataByParams(driveID);
    }

    // 'clickListThAndRedirect' 함수를 호출하여 이벤트 처리를 설정
    clickListThAndRedirect();
});
// 'driveID'를 사용하여 서버에서 데이터를 가져오는 함수
function getDriveIDDataByParams(driveID) {
    $.ajax({
        url: "/dailyReport/carcareform/ajax/details",
        type: "POST",
        data: {driveID: driveID},
        success: function (data) {
            // 데이터를 가져온 후 'inputDataByParams' 함수를 호출하여 데이터를 처리
            inputDataByParams(data);
        }
    })
}

// 'drvClub' 값을 매핑하는 객체
const drvClubList = {
    "주유": 0
    , "요소수": 1
    , "엔진오일": 2
    , "정비(수리)": 3,
    "기타": 4
};

// 서버에서 가져온 데이터를 웹 페이지의 양식 필드에 채우는 함수
function inputDataByParams(data) {
    for (const key in data) {
        // 데이터가 null이면 건너뜀
        if (data[key] == null) {
            continue;
        }


        if (key === "drvClub") {
            // 'drvClub' 값을 찾아서 해당 라디오 버튼을 선택
            const itemList = document.querySelectorAll('input[name="drvClub"]');
            itemList[drvClubList[data[key]]].checked = true;
        } else if (typeof data[key] === "boolean") {
            // 데이터가 부울 값인 경우 해당 체크박스를 선택
            document.getElementById(key).checked = data[key];
        } else {
            // 나머지 경우에는 해당 필드의 값을 설정
            document.querySelector('[name=' + key + ']').value = data[key];
        }
    }
    // 'bindList' 함수를 호출하여 추가적인 처리를 수행
    bindList();
}