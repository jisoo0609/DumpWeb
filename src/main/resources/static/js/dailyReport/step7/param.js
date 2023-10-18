
document.addEventListener("DOMContentLoaded", function () {
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let sheetsubID = params.get("subID");
    let sheetID = params.get("sheetID")
    console.log("sheetsubId :" + sheetsubID);

    if (sheetsubID !== null) {
        getSheetsubIDDataByParams(sheetsubID, sheetID);
    }
    // clickListThAndRedirect();
});


function getSheetsubIDDataByParams(sheetsubID, sheetID) {
    $.ajax({
        url: "/dailyReport/receipts/ajax/details",
        type: "POST",
        data: {sheetsubID: sheetsubID , sheetID: sheetID},
        success: function (data) {
            document.getElementById('date').value=data.date;
            document.getElementById('fromsite').value=data.fromsite;
            document.getElementById('tosite').value=data.tosite;
            document.getElementById('item').value=data.item;
            document.getElementById('Qty').value=data.qty;
            document.getElementById('carNo').value=data.carNo;
            document.getElementById('Qtyup').value=data.qtyup;
        }
    })
}