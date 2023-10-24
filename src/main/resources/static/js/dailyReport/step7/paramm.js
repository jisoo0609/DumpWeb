document.addEventListener("DOMContentLoaded", function () {

    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let driveID = params.get("driveID");
    if (driveID !== null) {
        getDriveIDDataByParams(driveID);
    }

    clickListThAndRedirect();
});

function getDriveIDDataByParams(driveID) {
    $.ajax({
        url: "/dailyReport/ajax/details",
        type: "POST",
        data: {driveID: driveID},
        success: function (data) {
            inputDataByParams(data);
        }
    })
}

function inputDataByParams(data) {

    for (const key in data) {

        if (data[key] == null) {
            continue;
        }


        if (key === "drvClub") {
            const itemList = document.querySelectorAll('input[name="drvClub"]');
            itemList[drvClubList[data[key]]].checked = true;
        } else if (typeof data[key] === "boolean") {
            document.getElementById(key).checked = data[key];
        } else {
            document.querySelector('[name=' + key + ']').value = data[key];
        }
    }

    bindList();
}