var resultDiv = $("#searchResult");
var results;

/*tSheet, tSheet_sub insert*/
$.save = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/save",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
            console.log("test-JJYY");
            console.log(json)
            if(json.httpCode == 200) {
                alert("저장이 완료되었습니다.");
            } else if(json.httpCode == 100){
                alert("기존에 저장된 정보가 존재합니다.");

                inputData(json.carSubmitTelResult);

                //$.list();
            } else{
                alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
        }
    })
}

/*tSheet만 insert*/
$.saveCarSubmit = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/saveMain",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
            console.log("test-JJYY");
            console.log(json)
            if(json.httpCode == 200) {
                alert("제출처 저장이 완료되었습니다.");
            } else if(json.httpCode == 100){
                alert("기존에 저장된 정보가 존재합니다.");

                inputData(json.carSubmitTelResult);

                $.list();
            } else{
                alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
        }
    })
}

/*기존 제출처 정보 채우기*/
function inputData(carSubmitTelResult){
        $("[name=carSubmit]").val(carSubmitTelResult.carSubmit);
        $("[name=carSubmitTel]").val(carSubmitTelResult.carSubmitTel);
        $("[name=salesman]").val(carSubmitTelResult.salesman);

}


/*제출처 검색*/
$.search = function() {
    var searchText = $("#search-input").val();
    var searchData = {
        carSubmit: searchText,
        carSubmitTel: searchText,
        salesman: searchText
    };
       $.ajax({
           url: "/dailyReport/search",
           type: "GET",
           data: searchData,
           success: function (data) {
               var json = $.parseJSON(data);

               console.log(json)
               if(json.httpCode == 200) {
                   alert("조회에 성공했습니다.");

                   displayResults(json.searchList);
               } else {
                   alert("조회를 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
               }
           }
       })
   }

function displayResults(searchResults) {
    const salesSubmit = document.getElementById('salesSubmit');
    const salesEdit = document.getElementById('salesEdit');
    results = searchResults; // results 변수에 데이터를 설정
    resultDiv.empty(); // 이전 결과 지우기
    // 결과 데이터를 동적으로 추가
    for (var i = 0; i < results.length; i++) {
        var result = results[i];
        var resultHtml =
         '<tr style="width: 80%; scroll-y: auto;">' +
         '<td>' + result.carSubmit + '</td>' +
         '<td>' + result.salesman + '</td>' +
         '<td>' + result.carSubmitTel + '</td>' +
         '<td>' +
         '<button class="btn addBtn" style="width: 40px; margin-top: 0;" onclick="selectItem(' + i + ');">선택</button>' +
         '</td>' +
         '</tr>';

        resultDiv.append(resultHtml);
    }
    salesSubmit.style.display = 'none';
    salesEdit.style.display = 'flex';
}



/*선택 버튼*/
function selectItem(index) {
    var selectedResult = results[index];
    $("[name=date]").val(selectedResult.date);
    $("[name=carSubmit]").val(selectedResult.carSubmit);
    $("[name=carSubmitTel]").val(selectedResult.carSubmitTel);
    $("[name=salesman]").val(selectedResult.salesman);
    closePopSearch();
    console.log(selectedResult.date);
}

$.list = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/list",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
            if(json.httpCode == 200) {
                alert("조회에 성공했습니다.");
            } else {
                alert("조회를 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
        }
    })
}

$.backMove = function () {
    location.href="/dailyReport/list";
}

$.updateData = function (idx) {
    $.ajax({
        url: "/dailyReport/ajax/dataSetting",
        type: "POST",
        data: {idx: idx},
        success: function (data) {
            var json = $.parseJSON(data);

            if(json.httpCode == 200) {
                var setData = json.settingData;
                console.log(setData);

                $("[name=sheetID]").val(setData.sheetID);
                $("[name=CarNo]").val(setData.CarNo);
                $("[name=date]").val(setData.date);
                $("[name=carSubmit]").val(setData.carSubmit);
                $("[name=carSubmitTel]").val(setData.carSubmitTel);
                $("[name=salesman]").val(setData.salesman);
                $("[name=chk1]").val(setData.chk1);
            }
        }
    })
}

$.deleteRow = function() {
    alert("정말 삭제하시겠습니까?")
    document.getElementById('salesEdit').style.display = 'none';
    document.getElementById('salesSubmit').salesEdit.style.display = 'flex';
}