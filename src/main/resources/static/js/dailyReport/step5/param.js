document.addEventListener("DOMContentLoaded", function () {
  const queryString = window.location.search;
  const params = new URLSearchParams(queryString);

  let driveID = params.get("driveID");

  if(driveID !== null){
    getDriveIDDataByParams(driveID);
  }

});

function getDriveIDDataByParams(driveID){
  $.ajax({
    url: "/dailyReport/carcareform/ajax/getDriveIDForm",
    type: "POST",
    data: {driveID : driveID},
    success: function (data) {
      inputDataByParams(data);
    }
  })
}

function inputDataByParams(data){

  for (const key in data) {
    console.log(data[key]);

    if(data[key] != null){
    document.querySelector('[name=' + key + ']').value = data[key] ;
    }
  }

  bindList();
}