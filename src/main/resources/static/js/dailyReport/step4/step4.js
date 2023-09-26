// JQuery 달력
$(function() {
    //input을 datepicker로 선언
    $("#datepicker1, #datepicker2").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
    });

    //초기값을 오늘 날짜로 설정해줘야 합니다.
    $("#datepicker2").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

    $("#datepicker1").datepicker('setDate', 'today');
});

// 검색 버튼의 Form 데이터 AJAX POST
function getList(){
    $.ajax({
       url: "/dailyReport/ajax/list",
        type: "POST",
        data: $("[name=data_frm]").serialize(),
        success: function(data){
           printTable(data)//서버에서 받은 데이터 처리할 함수 입력
        }
    });
}

// 테이블 헤더 정렬
function tableSort(){
    // 라디오 버튼, 테이블 헤더 요소
    const searchTypedRadio = document.querySelectorAll('input[name=searchType]:checked');
    const header = Array.from(document.querySelectorAll(".th_header"));

    // 라디오 버튼 idx 구별
    const searchType = searchTypedRadio[0].value.split("-");
    const firstThFlag = parseInt(searchType[0]);

    let order = ["제출처", "운행일", "품목", "상차지", "하차지", "대수", "운반단가"];

    // 배열순서 변경
    insertTitleThInFront(order, firstThFlag);

    // 테이블 헤더에 변경된 배열요소 순서 적용
    for(let i=0; i<header.length; i++)
        header[i].textContent = order[i];

    // 선택된 라디오 버튼 idx 반환
    return firstThFlag;
}

// 배열 요소 위치 변경
function insertTitleThInFront(arr, idx){
    const firstTh = arr.splice(idx, 1)[0];
    arr.splice(0,0,firstTh);
}

// 테이블 데이터 출력 함수
function printTable(datas){
    // 테이블, 데이터 검색 텍스트, 테이블 헤더 정렬 태그 및 플래그
    const tableBody = document.querySelector(".list-table tbody");
    const comment = document.querySelector(".total");
    const totalAmt = document.querySelector(".cashNbtns");
    const firstFlag = tableSort();

    let cost = 0;
    let totalQty = 0;

    // 첫 번째 데이터의 선택된 라디오 버튼 항목 값
    let start = new Array(
        datas[0].carSubmit,
        datas[0].date,
        datas[0].item,
        datas[0].fromsite,
        datas[0].tosite,
        datas[0].Qty,
        datas[0].Qtyup
    )[firstFlag];

    tableBody.innerHTML = "";
    comment.innerHTML = "";

    // 데이터 개수 만큼 반복
    datas.forEach((data, idx) => {
        const row = document.createElement("tr");
        let order = [
            data.carSubmit, data.date,
            data.item, data.fromsite, data.tosite, data.qty, data.qtyup.toLocaleString(),
        ];

        // 데이터 항목, 선택된 라디오 버튼 idx 전달 -> 데이터 항목 순서 변경
        insertTitleThInFront(order, firstFlag);

        // 운반단가 및 총액 계산
        cost += data.qtyup * data.qty;
        totalQty += data.qty;

        // 테이블에 데이터 출력
        row.innerHTML = `
                    <td>${order[0]}</td>
                    <td>${order[1]}</td>
                    <td>${order[2]}</td>
                    <td>${order[3]}</td>
                    <td>${order[4]}</td>
                    <td>${order[5]}</td>
                    <td style="text-align: right;">${order[6]}</td>
        `;

        // 끝 값 설정
        let end = order[0];

        if(start !== end){
            start = end;
            row.classList.add("red-line-divider");
        }

        tableBody.appendChild(row);
    })

    // 텍스트 출력
    comment.innerHTML = `
                    데이터 
                    <span>${datas.length}</span>건(총대수: 
                    <span>${totalQty}</span>대)이 검색되었습니다.
        `;

    totalAmt.innerHTML = `
                    <p>운반금액(원)<br>${cost.toLocaleString()}</p>
                    <input type="button" value="일괄결재">
                    <input type="button" value="일괄취소" id="cancelBtn" onclick="cancelBtn()">
    `
}

// 테이블 데이터 삭제
function cancelBtn(){
    const tbody = document.querySelector(".list-table tbody");

    while (tbody.firstChild)
        tbody.removeChild(tbody.firstElementChild);
}