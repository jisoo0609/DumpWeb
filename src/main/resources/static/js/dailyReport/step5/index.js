document.addEventListener("DOMContentLoaded", function () {
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    //
    const drvDate = params.get("drvDate");
    const drvClub = params.get("drvClub");
    const lastKm = params.get("lastKm");
    const useAmt = params.get("useAmt");
    const drvRem = params.get("drvRem");
    const rependchk = params.get("rependchk");

    const chk2 = params.get("chk2");
    const useOil = params.get("useOil");
    const rependdate = params.get("rependdate");
    const repaddkm = params.get("repaddkm");

    //
    const drvDateElement = document.getElementById("datepicker1");
    const lastKmElement = document.getElementById("lastKm");
    const useAmtElement = document.getElementById("useAmt");
    const drvRemElement = document.getElementById("drvRem voiceNotification");
    const checkboxElement = document.getElementById("showHideCheckbox");

    const chk2Element = document.getElementById("chk2");
    const useOilElement = document.getElementById("useOil");
    const rependdateElement = document.getElementById("datepicker2");
    const repaddkmElement = document.getElementById("nextlastkm");

    //
    const dateMonthDay = drvDate.split(".");
    console.log(new Date().getFullYear() + '-' + dateMonthDay[0] + '-' + dateMonthDay[1]);
    drvDateElement.value = new Date().getFullYear() + '-' + dateMonthDay[0] + '-' + dateMonthDay[1];
    lastKmElement.value = parseInt(lastKm.replace(/,/g, ''));
    useAmtElement.value = parseInt(useAmt.replace(/,/g, ''));
    drvRemElement.value = drvRem;
    checkboxElement.checked = (rependchk === "O" ? true : false);

    chk2Element.checked = chk2;
    useOilElement.value = parseInt(useOil);
    rependdateElement.value = rependdate.split("T")[0];
    repaddkmElement.value = parseInt(repaddkm);

});
