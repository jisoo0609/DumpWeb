let dataArr = [];

let totalDispatch = 0;

document.addEventListener("DOMContentLoaded", function () {
    let clBtn = document.querySelectorAll(".clBtn");
    let opBtn = document.querySelectorAll(".opBtn");
    popupJS(opBtn, clBtn);
});

$(document).ready(function(){
    var agent = navigator.userAgent.toLowerCase(); // 인터넷 익스플로러 체크 후 예외 처리
    if ((navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1) || (agent.indexOf("edge") != -1)) {
        $(".input-group-clear").attr("class", "dis-n");

        $('.input-group > .input-group-clear').each(function(i, e){
            $(this).hide();
        });
    }else{
        $('.input-group > .input-group-clear').on("click", function(){
            var clear_id = $(this).attr("id").split("_clear");

            $("#" + clear_id[0]).val('').focus();
            $(this).hide();
        })

        $('.input-group > input').on("propertychange change keyup paste", function(){
            $('#' + $(this).attr("id") + "_clear").toggle(Boolean($(this).val()))
        })

        $('.input-group > .input-group-clear').each(function(i, e){
            $(this).toggle(Boolean($(this).closest("div").find("input").val()))
        });
    }

//    init();
//    popJS(opBtn,clBtn);

    // /*
    // 2023-09-18 김준형
    // 선택값 자동완성 추가 (추후 스크립트 파일 이동)
    // */
    // $("#carNoFullBox").select2();
});

function popupJS(openBtn, closeBtn) {
    let openTarget;

    openBtn.forEach(function (btn) {
        btn.addEventListener("click", function () {
            openTarget = "#" + this.getAttribute("data-popName");
            document.querySelector(openTarget).classList.add('active');
        });
    });

    closeBtn.forEach(function (btn) {
        btn.addEventListener("click", function () {
            document.querySelector(openTarget).classList.remove("active");
        });
    });
}


/*
    2023-09-18 김준형
    일괄배차 팝업 open, close 함수 추가
 */
function openPopupTest(pop_name) {
    $("#pop-" + pop_name).removeClass("dis-n");
}

function openPopupTest(pop_name, idx) {
    $("#pop-" + pop_name).removeClass("dis-n");
    // $("#parentIdx").val(idx);
    $.ajax({
        url:"/dailyReport/ajax/subInfo",
        type:"GET",
        data: {sheetsubID: idx},
        async:false,
        success: function (data) {
            var json = $.parseJSON(data);
            console.log(json);
            if (json.httpCode == 200) {
                $("#parentIdx").val(json.view.sheetsubID);
                $("#parent-fromsite").text(json.view.fromsite);
                $("#parent-tosite").text(json.view.tosite);
                $("#parent-item").text(json.view.item);
                $("#parent-qty").text(json.view.qty);
            } else {
                $("#parentIdx").val(0);
                $("#parent-fromsite").text('ERROR!');
                $("#parent-tosite").text('ERROR!');
                $("#parent-item").text('ERROR!');
                $("#parent-qty").text('ERROR!');
            }
        }
    })
    popupDataList();
}

function closePopUpTest(e) {
    $(e).closest(".layerMask").addClass("dis-n");
}

function popupDataList() {
    $.ajax({
        url:"/dailyReport/ajax/driverList",
        type:"GET",
        async:false,
        success: function (data) {
            var json = $.parseJSON(data);
            console.log(json);
            if (json.httpCode == 200) {
                    var html = "";
                if (json.driverList.length > 0) {
                    $.each(json.driverList, function (i, t) {
                        html += '<tr>';
                        html += '<td class="a-center"><input type="checkbox" class="selectCarNo" onchange="$.toggleActiveRow(this);"></td>';
                        html += '<td class="a-left">'+ t.carNoKey +'</td>';
                        html += '<td class="a-center dispatchCarNo">'+ t.carNoFull +'</td>';
                        html += '<td class="a-center">'+ t.carNoHp +'</td>';
                        html += '<td class="a-center">'+ t.carNoName +'</td>';
                        html += '<td class="a-center"><input type="text" value="1" class="a-center wp100 dispatchQty" style="background: #ccc; padding: 0;" onfocusout="$.changeQty(this);" disabled></td>';
                        html += '</tr>';
                    })
                        $(".list-driver > tbody").html(html);
                } else {
                    html = '<tr>';
                    html += '<td class="a-center" colspan="6">등록된 기사정보가 존재하지 않습니다.</td>';
                    html += '</tr>';
                    $(".list-driver > tbody").html(html);
                }
            }
        }
    })
}

function saveCarData() {
    // alert("개발 중 입니다.");
    $.ajax({
        url: "/dailyReport/ajax/saveCarData",
        type: "POST",
        data: $("[name=cardatafrm]").serialize(),
        success: function (data) {
            var json = $.parseJSON(data);
            if (json.httpCode == 200) {
                alert("차량등록이 완료되었습니다.");
                location.reload();
            } else {
                alert("요청을 처리하는 도중 오류가 발생하였습니다. 관리자에게 문의부탁드립니다.");
                return false;
            }

        },
        error: function () {
            alert("서버와의 통신에 실패하였습니다.");
        }
    })
}

/*
    2023-09-18 김준형
    선택값 자동입력함수 생성 (추후 스크립트 파일 이동)
 */
$.selectBoxChange = function (data, moveid) {
    $('input[name=' + moveid + ']').val(data);
    $('#' + moveid + '_clear').show();
}

/*
    2023-10-17 김준형
    미지정 배차등록 함수 생성
 */
/*
    FUNCTION :: 차량번호 선택
 */
$.toggleActiveRow = function (obj) {
    var tr = $(obj).parents("tr");
    console.log(tr.html());
    console.log($(obj).is(":checked"));
    var index = dataArr.findIndex(data => data.carNoFull == $(tr).find(".dispatchCarNo").text());
    if($(obj).is(":checked")) {
        tr.find(".dispatchQty").prop('disabled', false);
        tr.find(".dispatchQty").css('background', '#fff');
        if (index == -1) {
            var dispatchData = {carNoFull: $(tr).find(".dispatchCarNo").text(), carQty: Number($(tr).find(".dispatchQty").val())};
            dataArr.push(dispatchData);
            index = dataArr.findIndex(data => data.carNoFull == $(tr).find(".dispatchCarNo").text());
        }

    } else {
        tr.find(".dispatchQty").prop('disabled', true);
        tr.find(".dispatchQty").css('background', '#ccc');
        if(index > -1) {
            dataArr.splice(index, 1);
        }
    }

    var qty = 0;
    $.each(dataArr, (i, t) => {
       qty += t.carQty;
    })

    totalDispatch = qty;
    if (qty > Number($("#parent-qty").text())) {
        alert("주문배차대수 이상으로 배차할 수 없습니다.");
        $(obj).prop("checked", false);
        $.toggleActiveRow(obj);
    }


    console.log(totalDispatch);

    $("#view-count").text(totalDispatch);
}

$.changeQty = function (obj) {
    var tr = $(obj).parents("tr");
    var index = dataArr.findIndex(data => data.carNoFull == $(tr).find(".dispatchCarNo").text());
    var temp = dataArr[index].carQty;


    dataArr[index].carQty = Number($(obj).val());

    var qty = 0;
    $.each(dataArr, (i, t) => {
        qty += t.carQty;
    });

    if (qty  > Number($("#parent-qty").text())) {
        alert("주문배차대수 이상으로 배차할 수 없습니다.");
        $(obj).val(temp);

        console.log($(obj).val());
        $.changeQty(obj);

        return;
    }

    totalDispatch = qty;

    console.log(totalDispatch);

    $("#view-count").text(totalDispatch);
}

$.dispatchData = function () {
    var parentID = $("#parentIdx").val();
    $.ajax({
        url: "/dailyReport/ajax/saveDispatchData",
        type: "POST",
        data: {parentID: parentID, dispatchDataList: JSON.stringify(dataArr)},
        async: false,
        success: function (data) {
            var json = $.parseJSON(data);
            console.log(json)
            if (json.httpCode == 200) {
                alert("일괄배차가 완료되었습니다.");
                location.reload();
            }

        }
    })


}