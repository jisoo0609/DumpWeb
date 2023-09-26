var resultDiv = $("#searchResult");
var results;

/*제출처, 운송정보 저장*/
$.save = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/save",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            alert("저장이 완료되었습니다.");

            //$.list();

            const popup = document.getElementById("popup");
            const popinputs = popup.querySelectorAll('.input');
            for (let i = 0; i < popinputs.length; i++) {
                popinputs[i].value = ""; // Set the value of each input field to an empty string
            }
        },
        error: function(xhr, status, error) {
             alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
         }
    })
}

$.list = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/list",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            showTransportList(data);
        },
        error: function(xhr, status, error) {
             alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
         }
    })
}


function showTransportList(data){
        // 서버에서 반환된 데이터를 이용하여 테이블 형태로 생성
        var html = '<table>';
        for (var i = 0; i < data.dailyReportStep3SubList.length; i++) {
            var subData = data.dailyReportStep3SubList[i];
            var rowId = 'row' + i;
            html += '<tr id="' + rowId + '" onclick="fillPop(event)">';
            html += '   <td>' + subData.fromsite + '</td>';
            html += '   <td>' + subData.tosite + '</td>';
            html += '   <td>' + subData.item + '</td>';
            html += '   <td>' + subData.qty + '</td>';
            html += '   <td>' + subData.rem + '</td>';
            html += '   <td style="display: none;">' + subData.sheetsubID + '</td>';
            //sheetsubID = subData.sheetsubID;
            html += '</tr>';

        }
        html += '</table>';
        //document.getElementById('sheetsubID').value = subData.sheetsubID;

        // 데이터를 표시할 위치에 추가
        $('#transportContainer').html(html);
}




//카테고리 생성용 1,2,3
function searchByCarsubmit(inputData) {
    var carSubmit = $("#carSubmit").val();

    $.ajax({
        url: "/dailyReport/search/carSubmit",
        method: "GET",
        data: { "carSubmit": carSubmit },
        success: function(data) {

            console.log('Ajax 요청 성공:', data);
            //data가져오는데 성공했어요. console에서 확인가능합니다.
            //카테고리 생성해주세요.
        },
        error: function(error) {
            console.error('Ajax 요청 실패:', error);
        }
   });
}

function searchBySalesman(inputData) {
    var salesman = $("#salesman").val();

    $.ajax({
        url: "/dailyReport/search/salesman",
        method: "GET",
        data: { "salesman": salesman },
        success: function(data) {

            console.log('Ajax 요청 성공:', data);

        },
        error: function(error) {
            console.error('Ajax 요청 실패:', error);
        }
   });
}

function searchByCarsubmitTel(inputData) {
    var carSubmitTel = $("#carSubmitTel").val();

    $.ajax({
        url: "/dailyReport/search/carSubmitTel",
        method: "GET",
        data: { "carSubmitTel": carSubmitTel },
        success: function(data) {

            console.log('Ajax 요청 성공:', data);

        },
        error: function(error) {
            console.error('Ajax 요청 실패:', error);
        }
   });
}



/*tSheet만 insert*/
$.saveCarSubmit = function() {
    $.ajax({
        url: "/dailyReport/workspace/ajax/saveMain",
        type: "POST",
        data: $("[name=frm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
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
    console.log("ㄱㄷㅁ초");
   var sheetsubID = $("#sheetsubID").val();
   console.log("sheetsubID는?"+sheetsubID);
      $.ajax({
          url: "/dailyReport/workspace/ajax/delete",
          type: "GET",
          data: { sheetsubID: sheetsubID },
          success: function (data) {
              var json = $.parseJSON(data);

              console.log(json)
              if(json.httpCode == 200) {
                  alert("삭제에 성공했습니다.");

                  displayResults(json.searchList);
              } else {
                  alert("삭제를 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
              }
          }
      })

}

