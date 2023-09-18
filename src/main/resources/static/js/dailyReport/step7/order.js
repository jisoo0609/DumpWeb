
$(document).ready(function () {

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

                $("[name=datepicker]").val(setData.sheetID);
                $("[name=loadPoint]").val(setData.date);
                $("[name=unloadPoint]").val(setData.startHour);
                $("[name=golItems]").val(setData.carSubmit);
                $("[name=golCount]").val(setData.carSubmitTel);
                $("[name=carNumb]").val(setData.salesman);
            }
        }
    })
}