
document.addEventListener("DOMContentLoaded", function () {
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let sheetID = params.get("sheetID");
    console.log(sheetID);

    if (sheetID !== null) {
        getSheetIDDataByParams(sheetID);
    }
    //clickListThAndRedirect();//step4에 있음
});

function getSheetIDDataByParams(sheetID) {
    $.ajax({
        url: "/dailyReport/form/ajax/details",
        type: "POST",
        data: {sheetID: sheetID},
        success: function (data) {
            //이 부분 추후 정리할 것
            document.getElementById('carSubmit').value=data.carSubmit;
            document.getElementById('carSubmitTel').value=data.carSubmitTel;
            document.getElementById('salesman').value=data.salesman;
            document.getElementById('date').value=data.date;
            $.list();
        }
    })
}

$.emptyRow = function() {
    const popup = document.getElementById("popup");
    const popinputs = popup.querySelectorAll('.input');
    for (let i = 0; i < popinputs.length; i++) {
        popinputs[i].value = ""; // Set the value of each input field to an empty string
    }
}

/*제출처, 운송정보 저장*/
$.save = function() {
    var formData = new FormData($("[name=frm]")[0]);
    $.ajax({
        url: "/dailyReport/workspace/ajax/save",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
            alert("저장이 완료되었습니다.");
            $.list();
            $.emptyRow();
        },
        error: function(xhr, status, error) {
             alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
         }
    })
}


$.list = function() {
    var formData = new FormData($("[name=frm]")[0]);
    $.ajax({
        url: "/dailyReport/workspace/ajax/list",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {
            if(undefined!==data.sheetID){
                $.saveSheetID(data);
            }
            $.showChk1(data);
            showTransportList(data);
                 },
        error: function(xhr, status, error) {
            alert("요청을 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
        }
    })
}
//chk정보를 불러오기 위한 함수
$.showChk1 = function(data) {
    //to. 지영 : 값이 채워질때, input이 비활성화 되도록해주세요.
    if (data.chk1 == 1) {
        document.getElementById("checkbox").checked = 1;
    }
}

//제출처 정보 수정을 위한 sheetID 저장
$.saveSheetID = function(data){
    document.getElementById("sheetID").value=data.sheetID;
}

function showTransportList(data){
    var html;
    if (!data) {
        html = '   <td colspan="5" style="text-align: center;">저장된 운송 정보가 없습니다</td>';
    } else {
        // 서버에서 반환된 데이터를 이용하여 테이블 형태로 생성
        html = '<table>';
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
            html += '   <td style="display: none;">' + subData. qtyup + '</td>';
            html += '</tr>';
        }
        html += '</table>';
    }
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
               if(json.httpCode == 200) {
                   alert("조회에 성공했습니다.");
                   displayResults(json.searchList);
               } else {
                   alert("조회를 처리하는 도중 에러가 발생하였습니다. 관리자에게 문의 부탁드립니다.");
               }
           }
       })
   }

$.backMove = function () {
    location.href="/dailyReport/list";
}

/*수정*/
$.editRow = function() {
    var formData = new FormData($("[name=frm]")[0]);
    var sheetsubID = $("#sheetsubID").val();

    formData.append("sheetsubID", sheetsubID);
    $.ajax({
        url: "/dailyReport/workspace/ajax/edit",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (data) {
            var json = $.parseJSON(data);
            if(json.httpCode == 422){
                //문구는 추후 수정
                alert("test 용 : 수정 실패");
            }else{
                alert("test 용 : 수정 성공");
                $.list();
            }
        },
        error: function(error) {
            console.error('수정 실패:', error);
        }
    });
}

/*삭제*/
$.deleteRow = function() {
   alert("정말 삭제하시겠습니까?")
   var sheetsubID = $("#sheetsubID").val();
  $.ajax({
      url: "/dailyReport/workspace/ajax/delete",
      type: "GET",
      data: { sheetsubID: sheetsubID },
      success: function (data) {
        var json = $.parseJSON(data);
        if(json.httpCode == 422){
            //문구는 추후 수정
            alert("test 용 : 삭제 실패");
        }else{
            $.emptyRow();
            $.list();
        }

      },
      error: function(error) {
         console.error('삭제 실패:', error);
      }
  })
}

$.editSales = function(){
    var sheetID = $("#sheetID").val();
    var salesman = $("#salesman").val();
    var carSubmit = $("#carSubmit").val();
    var carSubmitTel = $("#carSubmitTel").val();
    $.ajax({
        url:"/dailyReport/workspace/ajax/edit/carSubmit",
        type:"POST",
        data:{
            "sheetID":sheetID,
            "salesman":salesman,
            "carSubmit":carSubmit,
            "carSubmitTel":carSubmitTel
        },
        success : function (data) {
            var json = $.parseJSON(data);
            if(json.httpCode == 200){
                //문구는 추후 수정
                alert("test 용 : 수정 성공");
                location.href="/dailyReport/driver";
            }else{
                alert("test 용 : 수정 실패");
            }
        },
        error: function(error) {
             console.error('수정 실패:', error);
        }
    })
}

