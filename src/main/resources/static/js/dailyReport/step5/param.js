document.addEventListener("DOMContentLoaded", function () {
    const queryString = window.location.search;
    const params = new URLSearchParams(queryString);

    let driveID = params.get("driveID");

    if (driveID !== null) {
        getDriveIDDataByParams(driveID);
    }

});

function getDriveIDDataByParams(driveID) {
    $.ajax({
        url: "/dailyReport/carcareform/ajax/details",
        type: "POST",
        data: {driveID: driveID},
        success: function (data) {
            inputDataByParams(data);
        }
    })
}

function inputDataByParams(data) {

    for (const key in data) {

        console.log(key,data[key]);

        if (data[key] == null) {
            continue;
        }

        if (key === "drvClub") {
            const itemList = document.querySelectorAll('input[name="drvClub"]');

            itemList.forEach((item) => {
                if (item.value === data[key]) {
                    item.checked = true;
                    return false;
                }
            });
        } else if(data[key] === true || data[key] === false){
            document.getElementById(key).checked = data[key];
        }
        else {
            document.querySelector('[name=' + key + ']').value = data[key];
        }
    }

    bindList();
}