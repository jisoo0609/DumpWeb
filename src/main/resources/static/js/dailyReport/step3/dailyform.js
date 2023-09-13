var resultDiv = $("#searchResult");

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
                //$.list();
            } else {
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
            } else {
                alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
        }
    })
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

function displayResults(results) {

    resultDiv.empty(); // 이전 결과 지우기

    // 결과 데이터를 동적으로 추가
    for (var i = 0; i < results.length; i++) {
        var result = results[i];
        var resultHtml =
         '<tr>' +
         '<td>' + result.carSubmit + '</td>' +
         '<td>' + result.salesman + '</td>' +
         '<td>' + result.carSubmitTel + '</td>' +
         '<td>' +
         '<button class="btn addBtn" style="width: 40px; margin-top: 0;" onclick="selectItem(' + i + ');">선택</button>' +
         '</td>' +
         '</tr>';

        resultDiv.append(resultHtml);
    }
}

// 선택 버튼 클릭 시 실행될 함수
function selectItem(index) {
    alert("기능 추가 예정!");
}

$.list = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/list",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
            console.log("test-JJYY");
            console.log(json)
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