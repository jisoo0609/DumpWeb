/* driver, manager에 따라 달라지는 효과적용 */

const userPosition = document.getElementById('userPosition');
const driverElem = document.querySelectorAll(".driver");

let position;
function changeByPosition() {
    position = userPosition.value;
    if( position == 'manager') {
        // 제출처의 기능을 제한하기 위해 기사가 이용할 수 있는 요소는 보이지 않게 함
        for (var i = 0; i < driverElem.length; i++) {
              driverElem[i].style.display = "none";
        }

        // 전표사진을 포함해서 제출되었을 때 : 전표사진확인으로 버튼 텍스트가 보임.
        // 미포함시 : 사진확인을 위한 버튼 자체가 없어지게 된다.
        if (capturedPhotoData) {
            cameraBtn.innerText = "전표 사진확인"
        } else {
            cameraBtn.style.display = "none";
        }
    } else {// 기사일때
        // 제출처 결재 접근 금지
        chk2.disabled = true;
    }
}
