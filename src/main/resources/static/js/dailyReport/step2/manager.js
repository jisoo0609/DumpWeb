function bindSummary() {
    $.ajax({
        url: "/dailyReport/manager/ajax/summary",
        type: "POST",
        data: $("[name=option_frm]").serialize(),
        success: function (data) {
            printSummary(data);
        }
    });
}

function printSummary(data) {

    const ttamount = document.getElementById("ttamount");
    const tncars = document.getElementById("tncars");

    ttamount.innerHTML = data.totalTransportationCost.toLocaleString();
    tncars.innerHTML = data.totalTrips.toLocaleString();
}