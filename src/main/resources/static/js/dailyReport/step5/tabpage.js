const popCheckbox = document.getElementById("showHideCheckbox");
const hiddenPart = document.getElementById("hiddenPart");


// 다음 교환 주기 입력 display on, off 체크박스
popCheckbox.addEventListener("change", function() {
    if (popCheckbox.checked) {
        hiddenPart.style.display = "block";
    } else {
        hiddenPart.style.display = "none";
    }
});