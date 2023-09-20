$(document).ready(function(){
    popupJS($('#rdOli'),$('#rdDEF'),$('#rdEngOil'),$('#rdFix'),$('#rdNote'));
});

let clickTarget;
$(rdOli,rdDEF,rdEngOil,rdFix,rdNote).click(function(){
    clickTarget = "#"+ $(this).attr("data-popName");
    $(clickTarget).addClass('active');
});

$('#droildiv').css('color: rgb(0, 203, 230)', 'border-color: rgb(0, 203, 230)');


function save() {
    // 선택된 라디오 버튼의 ID를 저장할 변수
    let selectedRadioId = '';

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

