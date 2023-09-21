var resultDiv = $("#searchResult");
var results;

function clearSubInputs() {
    const popup = document.getElementById("popup");
    const popinputs = popup.querySelectorAll('.input');
    for (let i = 0; i < popinputs.length; i++) {
        popinputs[i].value = ""; // Set the value of each input field to an empty string
    }
}
/*tSheet, tSheet_sub insert*/
$.save = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/save",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
            if(json.httpCode == 200) {

                alert("저장이 완료되었습니다.");
                $.list();
                const popup = document.getElementById("popup");
                const popinputs = popup.querySelectorAll('.input');
                for (let i = 0; i < popinputs.length; i++) {
                    popinputs[i].value = ""; // Set the value of each input field to an empty string
                }

            } else{
                alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
        }
    })
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
                // 서버에서 반환된 데이터를 이용하여 테이블 형태로 생성
                var html = '<table>';
                for (var i = 0; i < json.DailyReportList.dailyReportStep3SubList.length; i++) {
                    var subData = json.DailyReportList.dailyReportStep3SubList[i];
                    html += '<tr>';
                    html += '<td>' + subData.fromsite + '</td>';
                    html += '<td>' + subData.tosite + '</td>';
                    html += '<td>' + subData.item + '</td>';
                    html += '<td>' + subData.qty + '</td>';
                    html += '<td>' + subData.rem + '</td>';
                    html += '</tr>';
                }
                html += '</table>';

                // 데이터를 표시할 위치에 추가
                $('#subListContainer').html(html);
            } else {
                alert("조회를 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
            }
        }
    })
}

function displayResults(searchResults) {

    // 결과 데이터를 동적으로 추가
    for (var i = 0; i < results.length; i++) {
        var result = results[i];
        var resultHtml =
         '<tr style="width: 80%; scroll-y: auto;">' +
         '<td>' + result.fromsite + '</td>' +
         '<td>' + result.tosite + '</td>' +
         '<td>' + result.item + '</td>' +
         '<td>' + result.Qty + '</td>' +
         '<td>' + result.Rem + '</td>' +
         '<td>' +
         '</tr>';

        resultDiv.append(resultHtml);
    }
    salesSubmit.style.display = 'none';
    salesEdit.style.display = 'flex';
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
                $.list();
            } else{
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

